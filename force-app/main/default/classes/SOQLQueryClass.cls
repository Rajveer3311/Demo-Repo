/**
*  Description     :  Here we will fetch 10 Account record and fetch contact on account and update Account wesite field on Contact to Account Object website field..
*
*  Created By      :  Rajveer Singh Rawat
*
*  Created Date    :  10 Feb 2022
*
*  Revision Logs   :  V1.0 - Created - Rajveer Singh Rawat
*				      
*
**/
public with sharing class SOQLQueryClass {
    
    /*
*  Description     :  In this method we will fetch 10 Account record and fetch contact on account and update Account wesite field on Contact to Account Object website field..
*
*  @args           :  
*
*  @return         :  Void
*
*  Revision Logs   :  V1.0 - Created - 10 feb 2022 - Rajveer Singh Rawat
*				      
*
**/  
    public static void queryMethod(){
        
        Set<Id> setOfAccountId = new Set<Id>();
        // List of Account record
        List<Account> listOfAccount = [Select Name, Website From Account Where ((Name != 'Test') AND (NOT Name Like '%Fexle%')) AND Website != null Limit 10];
        for(Account accObj : listOfAccount){
            // fill set from Account Id
            setOfAccountId.add(accObj.id);
        }
        
        // list of contact record on account
        List<Contact> listOfContact = [Select Name, Account.Website, Account_Website__c From Contact Where AccountId =: setOfAccountId];
        // Updated Contact list by account record
        List<Contact> updatedList = new List<Contact>();
        for(Contact conObj : listOfContact){
            conObj.Account_Website__c = conObj.Account.Website; 
            updatedList.add(conObj);
        }
        
        if(updatedList.size() > 0){
            // update the contact list
            Update updatedList;
        }
    }
    
    /**
*  Description     :  1. Create a new Field on Account: Contact Details (Long Text Area)
*		              2. Populate this field with the all the related Contact information in below format..
*
*  @args           :  List<Id> 
*
*  @return         :  Void
*
*  Revision Logs   :  V1.0 - Created - 14 feb 2022 - Rajveer Singh Rawat
*				      
*
**/  
    public static void inlineSOQLFunction(List<Id> accountIds){
        
        List<Account> listOfAccountAndContact = [ Select Id, Contact_Details__c, (Select FirstName,LastName,Email From Contacts) From Account Where Id IN :accountIds];
        List<Account> updatedAccountList = new List<Account>();
        for(Account accObj : listOfAccountAndContact){
            accObj.Contact_Details__c = '';
            for(Contact conObj : accObj.Contacts){
                accObj.Contact_Details__c += 'FirstName = ' +conObj.FirstName + ', LastName = ' +conObj.LastName + ', Email = ' +conObj.Email + '\n';
                
            }
            updatedAccountList.add(accObj);
        }
        if (updatedAccountList.size() > 0) {
            update updatedAccountList;
        }
    }
    
/**
*  Description     :  1. Create a new Field on Account: Contact Details (Long Text Area)
*		              2. Populate this field with the all the related Contact information in below format..
*
*  @args           :  List<Id> 
*
*  @return         :  Void
*
*  Revision Logs   :  V1.0 - Created - 14 feb 2022 - Rajveer Singh Rawat
*				      
*
**/  

    public static void aggregateSOQLs(){
        
        List<AggregateResult> aResults = [Select Count(Id) totalCount, AccountId, Status__c from Contact Where Status__c != null Group By AccountId, Status__c ];
        Integer activeContact = 0;
        Integer inActiveContact = 0;
        // System.debug(aResults);
        
        Map<Id,Account> mapOfAccount = new Map<Id,Account>();
        for(AggregateResult aR : aResults){
            System.debug('###############'+aR);
            String status = String.valueOf(aR.get('Status__c'));
            String accId = String.valueOf(aR.get('AccountId'));
            //System.debug(accId);
            if(accId!=null){
                if(!mapOfAccount.containsKey(accId)){
                    mapOfAccount.put(accId,new Account(Id=accId,Total_Active_Contacts__c=0,Total_In_Active_Contacts__c=0));
                }
                if(status == 'Active'){
                    activeContact = Integer.valueOf(aR.get('totalCount'));
                    mapOfAccount.get(accId).Total_Active_Contacts__c=activeContact;
                }
                else if(status == 'In Active'){
                    inActiveContact = Integer.valueOf(aR.get('totalCount'));
                    mapOfAccount.get(accId).Total_In_Active_Contacts__c=inActiveContact;
                    
                }
            }  
        }
        
        if(mapOfAccount.size() > 0){
            update mapOfAccount.values();
        } 
    }
}