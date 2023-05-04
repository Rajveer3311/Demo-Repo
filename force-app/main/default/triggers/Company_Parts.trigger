/* * Design three Object. 
     * Four Object Names are "Company", "Hardware", "Big_Parts", and "Spare_Parts".
     *      Name: "Company{0000}", Hardware{0000}, Big_Parts{0000}, Spare_Parts{0000}
     *      Name - text(255): (on All object). 
     *      Lookup: Big_Parts --> Hardware Lkp and Spare_Parts --> Hardware Lkp
     *              Hardware --> Company Lkp
     *      Company and Hardware ==> IsDeepClone: Checkbox
     *  
     *  Logic:
     *  When we update "Hardware" record with IsDeepClone = true.
     *  --> 1. A new will be created with the same details of "Hardware", 
     *      and if any "Big_Parts" or "Spare_Parts" recrod is present, then clone them too.
     *      New "Big_Parts" or "Spare_Parts" records, 
     *      must be attached to the new "Hardware" record is created.
     *      2. New hardware recrod must be also attached to the same company recrod.
     * 
      **********/
trigger Company_Parts on Hardware__c (after update) {
   // List<Hardware__c> hardList=new List<Hardware__c>();
    List<Hardware__c> hardList1=new List<Hardware__c>();
    List<Big_Part__c> bigPartObjList=new List<Big_Part__c>();
    List<Spare_Part__c> spareList=new List<Spare_Part__c>();
    
    Set<Id> hardwareids = new Set<Id>();
    for(Hardware__c hardObj :trigger.new){
        if(hardObj.isDeepClone__c==true){
            hardwareids.add(hardObj.id);
        }
    }
    
    hardList1=[select id, Name__c,Company__c,
               (select id,Name__c,Hardware__c from Big_Parts__r),
               (select id,Name__c,Hardware__c from Spare_Parts__r) 
               from Hardware__c 
               where isDeepClone__c = true
               AND Id IN: hardwareids];
    
    Map<Integer, List<Big_Part__c>> bigPartsByIndex = new Map<Integer, List<Big_Part__c>>();
    Map<Integer, List<Spare_Part__c>> sparePartsByIndex = new Map<Integer, List<Spare_Part__c>>();
    Map<Integer, Hardware__c> hardwareByIndex = new Map<Integer, Hardware__c>();
    
    Integer i =0;
    for(Hardware__c hardObj :hardList1){
        bigPartObjList=new List<Big_Part__c>();
        spareList=new List<Spare_Part__c>();
        
        Hardware__c hardwareObj=new Hardware__c();
        hardwareObj.Company__c = hardObj.Company__c;
        hardwareObj.Name__c=hardObj.Name__c;
        //hardList.add(hardwareObj);
        hardwareByIndex.put(i, hardwareObj);
        
        //INSERT hardwareObj;
        //Id hardId=hardwareObj.Id;
        
        // for big parts
        for(Big_Part__c bigPart :hardObj.Big_Parts__r){
            Big_Part__c cloneBigObj = new Big_Part__c();
            //cloneBigObj.Hardware__c = hardwareObj.Id;
            cloneBigObj.Name__c = bigPart.Name__c;
            bigPartObjList.add(cloneBigObj);
        }
        bigPartsByIndex.put(i, bigPartObjList);
        
        // for spare part
        
        for(Spare_Part__c sparePart :hardObj.Spare_Parts__r){
            Spare_Part__c cloneSpareObj = new Spare_Part__c();
           // cloneSpareObj.Hardware__c = hardwareObj.Id;
            cloneSpareObj.Name__c= sparePart.Name__c;
            spareList.add(cloneSpareObj);
        } 
        sparePartsByIndex.put(i, spareList);
        i++;
    }
    if(hardwareByIndex.Size() > 0){
        INSERT hardwareByIndex.values();
    }
    
    if(bigPartsByIndex.size() > 0){
        List<Big_Part__c> tempBigPartObjList =new List<Big_Part__c>();
        
        for(Integer index :bigPartsByIndex.keySet()){
            HardWare__c harwareObj = hardwareByIndex.get(index);
            for(Big_Part__c bigParts :bigPartsByIndex.get(index)){
                bigParts.Hardware__c = harwareObj.Id;
                tempBigPartObjList.add(bigParts);
            }
        }
        if(tempBigPartObjList.size() > 0){
            INSERT tempBigPartObjList;
        }
        if(bigPartsByIndex.size() > 0){
        List<Spare_Part__c> tempSparePartObjList =new List<Spare_Part__c>();
        
        for(Integer index :bigPartsByIndex.keySet()){
            HardWare__c harwareObj = hardwareByIndex.get(index);
            for(Spare_Part__c spareParts :sparePartsByIndex.get(index)){
                spareParts.Hardware__c = harwareObj.Id;
                tempSparePartObjList.add(spareParts);
            }
        }
        if(tempSparePartObjList.size() > 0){
            INSERT tempSparePartObjList;
        }
    }
}        
}