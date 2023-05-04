public class TestPlatformEventTriggerHelper {
    public static void deleteContacts(List<Test_Platform_Event__e> newList, Map<Id,Test_Platform_Event__e> oldMap){
        Set<Id> SetOfAccountsIds = new Set<Id>();
        for(Test_Platform_Event__e event : newList)
        {
            SetOfAccountsIds.add(event.Record_Id__c);
        }
        System.debug('***********TestPlatformEventTriggerHelper**************');
        if(SetOfAccountsIds.size() > 0)
        {
            List<Contact> listOfDeletedContacts = [Select Id, Name From Contact Where AccountId IN :SetOfAccountsIds];
            if(listOfDeletedContacts.size() > 0){
                delete listOfDeletedContacts;
            }
        }
    }
}