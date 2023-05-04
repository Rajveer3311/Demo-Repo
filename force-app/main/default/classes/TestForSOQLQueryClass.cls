@isTest
private class TestForSOQLQueryClass {
    
    @testSetup static void setUpMethod(){
        Account acc = new Account(Name='Test Data',Website='www.google.com');
        //insert account
        insert acc;
        
        Contact con = new Contact(AccountId=acc.Id,FirstName='Testing',LastName='Purpose',Status__c='In Active');
        //insert con;
        insert con;
        
        Contact con1 = new Contact(AccountId=acc.Id,FirstName='Testing1',LastName='Purpose1',Status__c ='Active');
        //insert con;
        insert con1;
        
        
    }
    
    // For queryMethod 
    static testMethod void testMethod1(){
        
        List<Account> listOfAccount = [Select Id, Name from Account ];
        Id accountId = listOfAccount[0].Id;
        List<Contact> listOfContact = [Select Name, Account.Website, Account_Website__c From Contact Where AccountId = :accountId];        
        // Updated Contact list by account record
        List<Contact> updatedList = new List<Contact>();
        for(Contact conObj : listOfContact){
            conObj.Account_Website__c = conObj.Account.Website;    
            updatedList.add(conObj);
        }
        //update updated list
        update updatedList;
        
        for(Contact con1 : listOfContact){
            System.assert(con1.Account_Website__c == null); 
        }
        
        // here call soqlQueryClass queryMethod
        SOQLQueryClass.queryMethod();
        List<Account> listOfAccount2 = [Select Id, Name from Account ];
        Id accountId2 = listOfAccount2[0].Id;
        List<Contact> listOfContact1 = [Select Name, Account.Website, Account_Website__c From Contact Where AccountId = :accountId2]; 
       // System.assert(String.isNotEmpty(listOfContact1[0].Account_Website__c)); 
        for(Contact con : listOfContact1){
            System.assertEquals(con.Account.Website, con.Account_Website__c);
        }
        
    }  
    
    // For inlineSOQLFunction
    static testMethod void testMethod2(){
        
        List<Account> listOfAccount = [Select Id,Contact_Details__c, Name from Account ];
        Id accountId = listOfAccount[0].Id;
        List<Id> listOfId = new List<Id>{accountId};
        for(Account acc : listOfAccount){
          System.assert(String.isEmpty(acc.Contact_Details__c));    
        }    
        
        // here call soqlQueryClass inlineSOQLFunction
        SOQLQueryClass.inlineSOQLFunction(listOfId);
        List<Account> listOfAccount1 = [Select Id, Contact_Details__c,Name from Account ];
        System.assert(listOfAccount1[0].Contact_Details__c != null);
        for(Account acc1 : listOfAccount1){
          System.assert(acc1.Contact_Details__c != null);
        }    
    }
    
    // For aggregateSoql Function
    static testMethod void testMethod3(){
        
        Account acc1 = new Account(Name='Test Data11',Website='www.googles.com');
        //insert account
        insert acc1;
        
        Contact con2 = new Contact(AccountId=acc1.Id,FirstName='Testing2',LastName='Purpose2',Status__c='Active');
        //insert con;
        insert con2;
        
        Contact con3 = new Contact(AccountId=acc1.Id,FirstName='Testing3',LastName='Purpose3',Status__c ='Active');
        //insert con;
        insert con3;
        List<Account> listOfAccount = [Select Name, Total_Active_Contacts__c,Total_In_Active_Contacts__c from Account];
        System.assert(listOfAccount[0].Total_Active_Contacts__c == null);
        System.assert(listOfAccount[0].Total_In_Active_Contacts__c == null);
        System.assert(listOfAccount[1].Total_Active_Contacts__c == null);
        System.assert(listOfAccount[1].Total_In_Active_Contacts__c == null);
        //call aggregate function
        SOQLQueryClass.aggregateSOQLs();
        List<Account> listOfAccount1 = [Select Name, Total_Active_Contacts__c,Total_In_Active_Contacts__c from Account];
        System.assert(listOfAccount1[0].Total_Active_Contacts__c == 1);
        System.assert(listOfAccount1[0].Total_In_Active_Contacts__c == 1);
        System.assert(listOfAccount1[1].Total_Active_Contacts__c == 2);
        System.assert(listOfAccount1[1].Total_In_Active_Contacts__c == 0);
        
    }
}