trigger ContactEmailValidate on Contact (before insert) {
    for(Contact c : Trigger.New){
        List<Contact> cObjList =[Select Email from Contact where Email = :c.Email limit 1];
        
        for(Contact cObj :cObjList){
            if(c.Email == cObj.Email){
                System.debug('This Contact is Already Present Via This Email');
            }
            else{
                insert c;
            }
        }
    }
}