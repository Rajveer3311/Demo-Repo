public with sharing class ContactOnAccountAuraController {

    //Use @AuraEnabled to enable client- and server-side access to the method
    @AuraEnabled
    public static List<Account> getAccounts() {
        return [SELECT Id,Name, (Select FirstName, LastName from contacts) FROM Account limit 10];
    }
}