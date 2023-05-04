/*****************************************************************************************************************
* Name         : AccountTriggerClass
* @author      : Rj-Rajveer3311
* @date        : Sept 09, 2020
* @description : Account ownership is private then billing country not null...
******************************************************************************************************************/
public class AccountTriggerClass {
 /*   public static void onBeforeUpdate(List<Account> accList){
        for(Account accObj : accList){
            //Account ownership is private then billing country not null...
            if(accObj.Ownership == 'Private' && accObj.BillingCountry == Null){
                accObj.addError('BillingCountry for Private Ownership of account cannot be null.');
            }
        } 
    }
    
    public static void deleteRecycleBinRecord(Map<Id,Account> oldMap){
        List<Account> listOfDeletedId = new List<Account>();
        for(Account i : oldMap.values()){
            listOfDeletedId.add(i);
        }
        System.debug('Yes-1');
        if(listOfDeletedId.size() > 0){
            delete listOfDeletedId;
            System.debug('Yes-2');
            //Database.emptyRecycleBin(listOfDeletedId);
            System.debug('Database.emptyRecycleBin '+Database.emptyRecycleBin(listOfDeletedId));
        }
    }*/
    
    public static void deleteContact(List<Account> accList, Map<Id,Account> oldMap){
        System.debug('After Update ####');
        if(accList.size() > 0)
        {
            List<Test_Platform_Event__e> platformEventList = new List<Test_Platform_Event__e>();
            for(Account acc : accList){
                if((oldMap.get(acc.Id).Active__c != acc.Active__c) && (acc.Active__c == 'False'))
                {
                    Test_Platform_Event__e event = new Test_Platform_Event__e();
                    event.Record_Id__c = acc.Id;
                    platformEventList.add(event);
                }
            }
            EventBus.publish(platformEventList);
        }
    }
}