public with sharing class CallApexControllerClass {
     @AuraEnabled(cacheable=true)
 public static String getValue(){
     return 'Virat kohli';
 }
 @AuraEnabled(cacheable=true)
    public static List<Contact> getContactList() {
        return [
            SELECT Id, Name, Title, Phone, Email
            FROM Contact
            LIMIT 10
        ];
    }
}