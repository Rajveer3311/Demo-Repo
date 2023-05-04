public class ContactOnAccountController {
    
    public static void calculateContact(List<Contact> newList, Map<Id,Contact> oldMap){
        List<Account> accList = new List<Account>();
        for(Contact conObj : newList){
            if(conObj.AccountId != oldMap.get(conObj.Id).AccountId){
                AggregateResult ar = [select count(Id) TotalContact from Contact where AccountId = :conObj.AccountId Group By AccountId];
                Integer id = (Integer)ar.get('TotalContact');
                System.debug(id);
                Account accObj = new Account(id = conObj.AccountId);
                Account accObj2 = new Account(id = oldMap.get(conObj.Id).AccountId);
                AggregateResult ar2 = [select count(Id) TotalContact from Contact where AccountId = :accObj2.id Group By AccountId];
                Integer oldId = (Integer)ar2.get('TotalContact');
                System.debug(oldId);
                accObj.Total_Contact__c = id;
                accObj2.Total_Contact__c = oldId;
                accList.add(accObj);
                accList.add(accObj2);
            }
       }
        update accList;
    }
}