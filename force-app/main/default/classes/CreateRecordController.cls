public class CreateRecordController {
 @AuraEnabled
    public static void createContact(Contact conObj){
        System.debug('###########################'+conObj);
        insert conObj;
        
    } 
     @AuraEnabled
    public static List<Contact> retrieveContact(){
        return [Select FirstName, LastName from Contact Limit 10];
    } 
}