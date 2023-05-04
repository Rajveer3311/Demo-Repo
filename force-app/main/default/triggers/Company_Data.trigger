/*trigger Company_Data on Company__c (After update) {
List<Company__c> compList=new List<Company__c>();
List<Hardware__c> HardwareList=new List<Hardware__c>();
Set<Id> companyids = new Set<Id>();
for(Company__c compIdObj :trigger.new){
if(compIdObj.isDeepClone__c==true){
companyids.add(compIdObj.id);
}
}
compList=[select id, Name__c,(select id,Name__c,Company__c from Hardwares__r)  
from Company__c 
where isDeepClone__c = true
AND Id IN: companyids];

Map<Integer, Company__c> companyByIndex = new Map<Integer, Company__c>();
Map<Integer, List<Hardware__c>> hardwarePartObjIndex = new Map<Integer, List<Hardware__c>>();
Integer i =0;
for(Company__c compObj:compList){
Company__c companyObj=new Company__c();
companyObj.Name__c=compObj.Name__c;
companyByIndex.put(i,companyObj);

// for hardware
for(Hardware__c Hardwareobj :compObj.Hardwares__r){
Hardware__c cloneHardwareObj = new Hardware__c();
cloneHardwareObj.Name__c = Hardwareobj.Name__c;
HardwareList.add(cloneHardwareObj);
}
hardwarePartObjIndex.put(i, HardwareList);
i++;
}
if(companyByIndex.Size() > 0){
System.debug(companyByIndex);
INSERT companyByIndex.values();
}
if(hardwarePartObjIndex.size() > 0){
List<Hardware__c> tempHardwarePartObjList =new List<Hardware__c>();

for(Integer index :hardwarePartObjIndex.keySet()){
Company__c companyObj = companyByIndex.get(index);
for(Hardware__c hardwareParts :hardwarePartObjIndex.get(index)){
hardwareParts.Company__c = companyObj.Id;
tempHardwarePartObjList.add(hardwareParts);
}
}
if(tempHardwarePartObjList.size() > 0){
INSERT tempHardwarePartObjList;
}
}
} */


trigger Company_Data on Company__c (After update) {
    List<Company__c> compList=new List<Company__c>();
    List<Hardware__c> HardwareList=new List<Hardware__c>();
    List<Hardware__c> HardwareList2=new List<Hardware__c>();
    List<Hardware__c> HardwareList3=new List<Hardware__c>();
    Set<Id> companyids = new Set<Id>();
    for(Company__c compIdObj :trigger.new){
        if(compIdObj.isDeepClone__c==true){
            companyids.add(compIdObj.id);
        }
    }
    Set<Id> hardwareids = new Set<Id>();
    System.debug('companyids## >' + companyids);
    compList=[select id, Name__c,(select id,Name__c,Company__c from Hardwares__r)  
              from Company__c 
              where Id IN: companyids];
    System.debug('compList##>' + compList);
    for(Company__c com : compList){
        for(Hardware__c hardObj : com.Hardwares__r){
            hardwareids.add(hardObj.Id);
        }
    }
    
    HardwareList2=[select id, Name__c,Company__c,
                   (select id,Name__c,Hardware__c from Big_Parts__r),
                   (select id,Name__c,Hardware__c from Spare_Parts__r) 
                   from Hardware__c 
                   where Id IN: hardwareids];
    System.debug('HardwareList2#>' + HardwareList2);
    Map<Integer, Company__c> companyByIndex = new Map<Integer, Company__c>();
    Map<Integer, List<Hardware__c>> hardwarePartObjIndex = new Map<Integer, List<Hardware__c>>();
    Map<Id, List<Hardware__c>> hardwaresbyCompId = new Map<Id, List<Hardware__c>>();
    Integer i =0;
    for(Hardware__c hardwareObj : HardwareList2){
        
        if(hardwaresbyCompId.containsKey(hardwareObj.Company__c)){
            hardwaresbyCompId.get(hardwareObj.Company__c).add(hardwareObj);
        }else{
            hardwaresbyCompId.put(hardwareObj.Company__c, new List<Hardware__c>{hardwareObj});
           //List<Hardware__c> hardwares = new List<Hardware__c>();
            //hardwares.add(hardwareObj);
            //hardwaresbyCompId.put(hardwareObj.Company__c, hardwares);
        }
    }
    
    System.debug('hardwaresbyCompId##>' + hardwaresbyCompId);
    for(Company__c compObj : compList){
        System.debug('hardwaresbyCompId.get(compObj.Id)##>' + hardwaresbyCompId.get(compObj.Id));
        List<Hardware__c> hardwares = hardwaresbyCompId.get(compObj.Id);
        
        Company__c companyObj=new Company__c();
        companyObj.Name__c=compObj.Name__c;
        companyByIndex.put(i,companyObj);
        // testing purpose
      /*  for(Hardware__c Hardwareobj :compObj.Hardwares__r){
            Hardware__c cloneHardwareObj = new Hardware__c();
            cloneHardwareObj.Name__c = Hardwareobj.Name__c;
            HardwareList.add(cloneHardwareObj);
        }
        hardwarePartObjIndex.put(i, HardwareList);*/
        hardwarePartObjIndex.put(i, hardwares);
        System.debug(hardwarePartObjIndex);
        
        i++;
    }
    if(companyByIndex.Size() > 0){
        System.debug(companyByIndex);
        INSERT companyByIndex.values();
    }
    if(hardwarePartObjIndex.size() > 0){
        List<Hardware__c> tempHardwarePartObjList =new List<Hardware__c>();
        
        for(Integer index :hardwarePartObjIndex.keySet()){
            Company__c companyObj = companyByIndex.get(index);
            for(Hardware__c hardwarePart : hardwarePartObjIndex.get(index)){
                System.debug(hardwarePartObjIndex);
                hardwarePart.Id = null;
                hardwarePart.Company__c = companyObj.Id;
                tempHardwarePartObjList.add(hardwarePart);
                
            }
        }
        List<Big_Part__c> bigPartObjList =new List<Big_Part__c>();
        List<Spare_Part__c> sparePartObjList =new List<Spare_Part__c>();
        if(tempHardwarePartObjList.size() > 0){
            INSERT tempHardwarePartObjList;
            for(Hardware__c hardwarePart : tempHardwarePartObjList){
                for(Big_Part__c bp : hardwarePart.Big_Parts__r){
                    bp.Id = null;
                    bp.Hardware__c = hardwarePart.Id;
                    bigPartObjList.add(bp);
                }
                for(Spare_Part__c sp : hardwarePart.Spare_Parts__r){ 
                    sp.Id = null;
                    sp.Hardware__c = hardwarePart.Id;
                    sparePartObjList.add(sp);
                }
            }
            System.Debug('bigPartObjList##>' + bigPartObjList);
            System.Debug('sparePartObjList##>' + sparePartObjList);
            INSERT bigPartObjList;
            INSERT sparePartObjList;
        }
    }
}