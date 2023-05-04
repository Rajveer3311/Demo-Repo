/**
*  Description     :  Contact_Trigger Test class
*
*  Created By      :  Rajveer Singh Rawat
*
*  Created Date    :  2 March 2022
*
*  Revision Logs   :  V1.0 - Created - Rajveer Singh Rawat
*				      
*
**/
@isTest
private class TestForContact_Trigger {
    // Test Setup Data
    @testSetUp static void setUpMethod(){
        List<Account> listOfAccounts = new List<Account>();
        List<Contact> listOfContacts = new List<Contact>();
        
        Account acc1 = new Account();
        acc1.Name = 'First Account';
        listOfAccounts.add(acc1);
        
        if(listOfAccounts.size() > 0){
            insert listOfAccounts;
        }
        
        Contact con1 = new Contact();
        con1.lastName = 'Ranveer Kapoor';
        con1.Status__c = 'Active';
        con1.AccountId = acc1.Id;
        listOfContacts.add(con1);
        
        Contact con2 = new Contact();
        con2.lastName = 'Ranveer Singh';
        con2.Status__c = 'In Active';
        con2.AccountId = acc1.Id;
        listOfContacts.add(con2);
        
        if(listOfContacts.size() > 0){
            insert listOfContacts;
        }
    }
    // test for Insert Case
    public static testMethod void checkAllAssertForInsertCase(){
        List<Contact> listOfContact = [Select AccountId, Account.Total_Active_Contacts__c, Account.Total_In_Active_Contacts__c, Name from Contact];
        System.assertEquals(1,listOfContact[0].Account.Total_Active_Contacts__c);
        System.assertEquals(1,listOfContact[0].Account.Total_In_Active_Contacts__c);
    }  
    // test for Update Case
    public static testMethod void checkAllAssertForUpdateCase(){
        List<Contact> listOfContact = [Select AccountId, Account.Total_Active_Contacts__c,Account.Total_In_Active_Contacts__c, Name from Contact];
        Account acc2 = new Account();
        acc2.Name = 'Raj Kapoor';
        insert acc2;
        // After Update Account Id
        listOfContact[0].AccountId = acc2.Id;
        update listOfContact;
        List<Contact> listOfContact2 = [Select AccountId, Account.Total_Active_Contacts__c, Account.Total_In_Active_Contacts__c, Name from Contact Where AccountId =: acc2.Id];
        System.assertEquals(1,listOfContact2[0].Account.Total_Active_Contacts__c);
        System.assertEquals(0,listOfContact2[0].Account.Total_In_Active_Contacts__c);
    }   
    // test for Delete Case
    public static testMethod void checkAllAssertForDeleteCase(){
        
        Account acc = new Account();
        acc.Name = 'Rj';
        insert acc;
        
        Contact con = new Contact();
        con.LastName = 'Rawat';
        con.AccountId = acc.Id;
        insert con;
        // Before Delete contact
        List<AggregateResult> aR = [Select count(Id) totalContacts from Contact Where AccountId = :acc.Id Group By  AccountId];
        System.assertEquals('1', String.ValueOf(aR[0].get('totalContacts')));
        
        delete con;
        //After Delete Contact
        List<AggregateResult> aR2 = [Select count(Id) totalContacts from Contact Where AccountId = :acc.Id Group By  AccountId];
        Integer sizeOfList = aR2.size();
        System.assertEquals(0,sizeOfList);
        
        // After Undelete case
        undelete con;
        List<AggregateResult> aR3 = [Select count(Id) totalContacts from Contact Where AccountId = :acc.Id Group By  AccountId];
        Integer listSize = aR3.size();
        System.assertEquals(1,listSize);
    }  
}