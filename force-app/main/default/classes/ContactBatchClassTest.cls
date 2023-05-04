@isTest
public class ContactBatchClassTest {
    @testSetup
    static void setup(){
    List<Contact> contacts = new List<Contact>(); 
    // insert Account
   Contact c = new Contact();
        c.FirstName='Salesforce';
        c.LastName='Sales';
        insert c;
        insert contacts;
    
    	test.startTest();
        ContactBatchClass conBatch = new ContactBatchClass();
        Id batchId = Database.executeBatch(conBatch);
        test.stopTest();
        Contact con = [Select Description from Contact where id = :c.id];
        System.assertEquals('Initials of the first name and last name are same', con.Description);
     }
    
    @isTest public static void testUnit(){}
}