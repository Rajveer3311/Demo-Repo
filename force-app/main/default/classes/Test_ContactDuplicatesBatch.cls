/**
*  Description     :  Test Class for ContactDuplicatesBatch
*
*  Created By      :  Rajveer Singh Rawat
*
*  Created Date    :  25 March 2022
*
*  Revision Logs   :  V1.0 - Created - Rajveer Singh Rawat
*                     
*
**/
@istest
public class Test_ContactDuplicatesBatch {
    
    @testSetup static void setUpData(){
        
        List<Contact> listOfContacts = new List<Contact>();
        Contact con1 = new Contact();
        con1.lastName = 'Ranveer Kapoor';
        con1.Email = 'rs2405199@gmail.com';
        listOfContacts.add(con1);
        
        Contact con2 = new Contact();
        con2.lastName = 'Ranveer Kapoor';
        con2.Email = 'rs2405199@gmail.com';
        listOfContacts.add(con2);
        
        insert listOfContacts;
    }
    static testmethod void testScheduledJob() {
        Test.startTest();
        // Schedule the test job
        ContactDuplicatesScheduler scheduleJob = new ContactDuplicatesScheduler();
        String sch = '0 15 14 27 3 ?';
        String jobID = system.schedule('Duplicate contact', sch, scheduleJob);
        Test.stopTest();
    }
    static testMethod void checkContactDuplicateBatch(){
        
       
        List<Contact> listOfContactsData = [Select LastName, Email, Original_Contact__c, Is_Duplicate__c from Contact];
        System.assertEquals(false,listOfContactsData[0].Is_Duplicate__c);
        System.assertEquals(null,listOfContactsData[0].Original_Contact__c);
        System.assertEquals(true,listOfContactsData[1].Is_Duplicate__c);
        System.assertEquals(listOfContactsData[0].Id,listOfContactsData[1].Original_Contact__c);
    }
}