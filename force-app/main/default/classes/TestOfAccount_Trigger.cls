@isTest
private class TestOfAccount_Trigger {
    @testSetup static void setup() {
        
        List<Account> listOfInsertingAccount = new List<Account>();
        Account acc = new Account();
        acc.Name = 'Vicky Kumar';
        acc.Rating = 'Hot';
        acc.Active__c = 'False';
        acc.In_Active_Reason__c = 'Hii i am Rajveer..';
        listOfInsertingAccount.add(acc);
        
        Account acc1 = new Account();
        acc1.Name = 'Raj Kumar';
        acc1.Rating = 'Cold';
        listOfInsertingAccount.add(acc1);
        
        Account acc2 = new Account();
        acc2.Name = 'Vicky Kumar';
        listOfInsertingAccount.add(acc2);
        
        Account acc3 = new Account();
        acc3.Name = 'Vicky Kumar';
        acc3.Rating = 'Hot';
        listOfInsertingAccount.add(acc3);
        
        Account acc4 = new Account();
        acc4.Name = 'Vicky Kumar';
        acc4.Rating = 'Cold';
        listOfInsertingAccount.add(acc4);
        
        if(listOfInsertingAccount.size() > 0){
            insert listOfInsertingAccount;
        }
    }
    
     static testMethod void call_Account_Trigger(){
         //Fetch Inserted record
         List<Account> listOfAccount = [Select Name, Active__c, AccountNumber, Rating from Account];
         // For insert assert
         System.assertEquals('1',listOfAccount[0].AccountNumber);
         System.assertEquals('1234',listOfAccount[1].AccountNumber);
         System.assertEquals('0',listOfAccount[2].AccountNumber);
         System.assertEquals('1',listOfAccount[3].AccountNumber);
         
         // For Update operation
         listOfAccount[0].Rating = 'Cold';
         listOfAccount[0].Active__c = 'True';
         listOfAccount[0].In_Active_Reason__c = 'Raaj';
         listOfAccount[1].Rating = 'Hot';
         listOfAccount[2].Name = 'RK';
         listOfAccount[3].Rating = null;
         listOfAccount[4].Rating = 'Warm';
         update listOfAccount;
         
         // Fetch Updated list
         List<Account> listOfAccount2 = [Select Name, AccountNumber, Rating from Account];
         System.assertEquals('1234',listOfAccount2[0].AccountNumber);
         System.assertEquals('1',listOfAccount2[1].AccountNumber);
         System.assertEquals('0',listOfAccount2[3].AccountNumber);
         System.assertEquals(null,listOfAccount2[4].AccountNumber);
         
         // For error generate case
         try{
         Account accObj = new Account();
         accObj.In_Active_Reason__c = null;
         accObj.Active__c = 'False';
         insert accObj;
         }
         catch(DmlException e){
             Boolean expectedExceptionThrown =  e.getMessage().contains('Please select In Active Reason for the Account') ? true : false;
             System.assertEquals(true,expectedExceptionThrown);
         }
       
    }
    static testMethod void For_Insert_ContactDetails(){
        Test.startTest();
       // List<Account> listOfAccount = new List<Account>{new Account(Name='Test1',Contact_Details__c = 'FirstName = Aksh2, LastName = Meg, Email = aksh@gmail.com'),new Account(Name='Test2',Contact_Details__c = 'FirstName = Aksh3, LastName = Meg, Email = aksh@gmail.com',Contact_Details_1__c = 'FirstName = Aksh5, LastName = Meg5, Email = aksh@gmail.com'),new Account(Name='Rj')};
        List<account> listOfAccount = new List<Account>();
        List<Contact> listOfContact = new List<Contact>();
        Account acc = new Account(Name='Test1',Contact_Details__c = 'FirstName = Aksh2, LastName = Meg, Email = aksh@gmail.com');
        //listOfAccount.add(acc);
        insert acc;
        Account acc2 = new Account(Name='Test2',Contact_Details__c = 'FirstName = Aksh3, LastName = Meg2, Email = aksh2@gmail.com',Contact_Details_1__c = 'FirstName = Aksh5, LastName = Meg5, Email = aksh5@gmail.com');
       // listOfAccount.add(acc2);
        insert acc2;
        Contact con = new Contact(LastName='Rj',AccountId=acc2.Id);
        insert con;
        List<Account> listOfFetchAccount = [Select Name, (Select FirstName,Lastname from Contacts) from Account Where Name Like '%Test%'];
        System.debug(listOfFetchAccount);
        // For_Insert_ContactDetails Contact
        System.assertEquals(1,listOfFetchAccount[0].Contacts.size());
        // For_Insert_ContactDetails and ContactDetails 1 Contact
        System.assertEquals(3,listOfFetchAccount[1].Contacts.size());
        
        //For Move to Contact same Value in current account then it update to move to account
        listOfFetchAccount[1].Move_To_Contacts__c = 'FirstName = Aksh3, LastName = Meg2, Email = aksh2@gmail.com';
        listOfFetchAccount[1].Move_To_Account__c = listOfFetchAccount[0].Id;
        update listOfFetchAccount;
        
        List<Account> listOfFetchAccount2 = [Select Name, (Select FirstName,Lastname,Previous_Account__c from Contacts) from Account Where Name Like '%Test%'];
        //Delete previous account blank
        System.assertEquals(2,listOfFetchAccount2[1].Contacts.size());
        System.assertEquals(listOfFetchAccount2[1].Id,listOfFetchAccount2[0].contacts[0].Previous_Account__c);
        
        //If Someone change move to account then move all the contacts those are mentioned in "Move To Contacts" field from previous Move To Account to new Move TO Account.
        Account acc3 = new Account(Name='Test3');
        insert acc3;
        //change Move to account
        listOfFetchAccount2[1].Move_To_Account__c=acc3.Id;
        update listOfFetchAccount2;
        List<Account> listOfFetchAccount3 = [Select Name, (Select FirstName,Lastname,Previous_Account__c from Contacts) from Account Where Name Like '%Test%'];
        System.debug(listOfFetchAccount3[2].Contacts);
        System.assertEquals(listOfFetchAccount3[0].Id,listOfFetchAccount3[2].contacts[0].Previous_Account__c);
        //Remove contact from move to contact
        listOfFetchAccount3[1].Move_To_Contacts__c = 'FirstName = Aksh5, LastName = Meg5, Email = aksh5@gmail.com';
        update listOfFetchAccount3;
        List<Account> listOfFetchAccount4 = [Select Name, (Select FirstName,Lastname,Previous_Account__c from Contacts) from Account Where Name Like '%Test%'];
        System.assertEquals(1,listOfFetchAccount4[2].Contacts.size());
        System.assertEquals(listOfFetchAccount4[2].Id,listOfFetchAccount4[1].Contacts[1].Previous_Account__c);
        // When we get the value of contact details and 1 is invalid then it will not insert that value in database
        Account accForInvalidContact = new Account(Name='Test4',Contact_Details__c = 'FirstName = Aksh2, LastName = Meg');
        insert accForInvalidContact;
        List<Account> listOfFetchAccount5 = [Select Name, (Select FirstName,Lastname,Previous_Account__c from Contacts) from Account Where Id = :accForInvalidContact.Id];
        System.assertEquals(0, listOfFetchAccount5[0].Contacts.size());
        
        // Delete all value from move to contact retrieve back to move to account
        Account acct = new Account(Name='Avi',Contact_Details__c = 'FirstName = Aksh3, LastName = Meg2, Email = aksh2@gmail.com',Contact_Details_1__c = 'FirstName = Aksh5, LastName = Meg5, Email = aksh5@gmail.com');
        insert acct;
        Account acct2 = new Account(Name='Avi2');
        insert acct2;
        List<Account> listOfBlankContact = [Select Name, (Select FirstName,Lastname,Previous_Account__c from Contacts) from Account Where Name Like '%Avi%'];
        listOfBlankContact[0].Move_To_Contacts__c = 'FirstName = Aksh3, LastName = Meg2, Email = aksh2@gmail.com';
        listOfBlankContact[0].Move_To_Account__c = listOfFetchAccount[1].Id;
        update listOfBlankContact;
        List<Account> listOfBlankContact2 = [Select Name, (Select FirstName,Lastname,Previous_Account__c from Contacts) from Account Where Name Like '%Avi%'];
        listOfBlankContact2[0].Move_To_Contacts__c = null;
        update listOfBlankContact2;
        List<Account> listOfBlankContact3 = [Select Name, (Select FirstName,Lastname,Previous_Account__c from Contacts) from Account Where Name Like '%Avi%'];
        System.assertEquals(2, listOfBlankContact3[0].contacts.size());
        Test.stopTest();
    }
}