@isTest
public with sharing class TestAccountContactProfile {
    @isTest
    public static void validateData() {
        
     //   Account accObj = [Select Id, Website from Account  where id = '0015g00000cGBtzAAG'];
        Account accObj = new Account(Name='TestRjData',Website='www.rjData.com');
        Insert accObj;
        List<Contact> conList = [Select firstName, lastName, Profile__c from Contact where AccountId =:accObj.Id];
        if(accObj.Website != null){
            
            for (Contact conVar : conList) {
                conVar.Profile__c = accObj.Website + '/' +conVar.lastName;
            }
            update conList;
        }
    }
}