/**
*  Description     :  Contact_Trigger Handler class
*                     Here we are performing operation on Account total Active and inactive contacts ..
*
*  Created By      :  Rajveer Singh Rawat
*
*  Created Date    :  2 March 2022
*
*  Revision Logs   :  V1.0 - Created - Rajveer Singh Rawat
*				      
*
**/
public class ContactTriggerHandler2 {
    
/**
*  Description     :  It will run in After Insert Case
                      Here populate Total Active Contact and Total In Active Contacts field with the total Active and inactive contacts under the Account.
*
*  @args           :  List<Contact>
*
*  @return         :  No
*
*  Revision Logs   :  V1.0 - Created - 2 March 2022 - Rajveer Singh Rawat
*
**/      
    public static void isAfterInsert(List<Contact> newData){
           // Calling helper class
           ContactTriggerHelper.allContactTriggerOperation(newData,null);
        
/*         System.debug('@@@@@@@@@@@@@-It is inside in insert method');
        // it store the account id on contact..
        Set<Id> setOfAccountId = new Set<Id>();
        for(Contact acc : newData){
            setOfAccountId.add(acc.AccountId);
        }
        List<Id> listOfAccountId = new List<Id>();
        listOfAccountId.addAll(setOfAccountId);
        
        
       Map<Id,Account> mapOfAccount = new Map<Id,Account>();
        // List for particular this account 
        List<aggregateResult> listOfStatusAggregateContact= [Select Count(Id) totalCount, AccountId, Status__c from Contact 
                                                             Where Status__c != null AND AccountId IN : setOfAccountId Group By AccountId, Status__c];
        Integer activeContact = 0;
        Integer inActiveContact = 0;
        for(AggregateResult aR : listOfStatusAggregateContact){
            String status = String.valueOf(aR.get('Status__c'));
            String accId = String.valueOf(aR.get('AccountId'));
            if(!mapOfAccount.containsKey(accId)){
                mapOfAccount.put(accId,new Account(Id=accId,Total_Active_Contacts__c=0,Total_In_Active_Contacts__c=0));
            }
            if(status == 'Active'){
                activeContact = Integer.valueOf(aR.get('totalCount'));
                mapOfAccount.get(accId).Total_Active_Contacts__c = activeContact;
            }
            else if(status == 'In Active'){
                inActiveContact = Integer.valueOf(aR.get('totalCount'));
                mapOfAccount.get(accId).Total_In_Active_Contacts__c = inActiveContact;
                
            }
        }
        // Check map size is greater than 0 or not
        if(mapOfAccount.size() > 0){
            update mapOfAccount.values();
        }   */
    }

/**
*  Description     :  It will run in after update case..
                      Here populate Total Active Contact and Total In Active Contacts field with the total Active and inactive contacts under the Account.
*
*  @args           :  List<Contact>, Map<Id,Contact>
*
*  @return         :  No
*
*  Revision Logs   :  V1.0 - Created - 2 March 2022 - Rajveer Singh Rawat
*
**/  
    
    public static void isAfterUpdate(List<Contact> newContact, Map<Id,Contact> oldContact){
        
        //here we will call insert method for insertion those record whose id changed on update operation.. 
        ContactTriggerHelper.allContactTriggerOperation(newContact,oldContact);
        
        
/*         Set<Id> setOfContactAccountId = new Set<Id>();
        // this list store inserting contact whose account id changed on record 
        List<Contact> listOfChangingContactAccountId = new List<Contact>();
        Id accountIdForNonContact;
        // In update case it will both update and insert operation perform
        for(Contact con : newContact){
            if(con.AccountId != oldContact.get(con.Id).AccountId){
                setOfContactAccountId.add(oldContact.get(con.Id).AccountId); 
                accountIdForNonContact = oldContact.get(con.Id).AccountId;
                listOfChangingContactAccountId.add(con);
            }
            else{
                setOfContactAccountId.add(con.AccountId); 
            }
        }
        
        
        
        // It stored Id and Account 
       Map<Id,Account> mapOfAccount = new Map<Id,Account>();
        List<aggregateResult> listOfStatusAggregateContact= [Select Count(Id) totalCount, AccountId, Status__c from Contact
                                                              Where Status__c != null AND AccountId IN : setOfContactAccountId Group By AccountId, Status__c];
        System.debug('################'+listOfStatusAggregateContact);
        Integer activeContact = 0;
        Integer inActiveContact = 0;
        // check listOfStatusAggregateContact list is more than 0 or not
        if(listOfStatusAggregateContact.size() > 0){
            for(AggregateResult aR : listOfStatusAggregateContact){
                String status = String.valueOf(aR.get('Status__c'));
                String accId = String.valueOf(aR.get('AccountId'));
                
                if(!mapOfAccount.containsKey(accId)){
                    mapOfAccount.put(accId,new Account(Id=accId,Total_Active_Contacts__c=0,Total_In_Active_Contacts__c=0));
                }
                if(status == 'Active'){
                    activeContact = Integer.valueOf(aR.get('totalCount'));
                    mapOfAccount.get(accId).Total_Active_Contacts__c = activeContact;
                }
                else if(status == 'In Active'){
                    inActiveContact = Integer.valueOf(aR.get('totalCount'));
                    mapOfAccount.get(accId).Total_In_Active_Contacts__c = inActiveContact;
                    
                }
            }
        }
        else{
            // If there is no record on account then Total_Active_Contacts__c equal 0 and Total_In_Active_Contacts__c 0 
            mapOfAccount.put(accountIdForNonContact,new Account(Id=accountIdForNonContact,Total_Active_Contacts__c=0,Total_In_Active_Contacts__c=0));
        }
        // Check map size is greater than 0 or not
        if(mapOfAccount.size() > 0){
            update mapOfAccount.values();
        }   */
        
        
    }  
    
    
/**
*  Description     :  It will run in after Delete case..
                      Here populate Total Active Contact and Total In Active Contacts field with the total Active and inactive contacts under the Account.
*
*  @args           :  List<Contact>
*
*  @return         :  No
*
*  Revision Logs   :  V1.0 - Created - 2 March 2022 - Rajveer Singh Rawat
*
**/  
    
    public static void isAfterDelete(Map<Id,Contact> deleteContact){
        
        // Calling helper class
        ContactTriggerHelper.allContactTriggerOperation(null,deleteContact);
        
 /*       // set will store old contact account Id
        Set<Id> setOfOldContactAccountId = new Set<Id>();
        Id accountIdForNonContact;
        for(Contact oldCon : deleteContact){
            setOfOldContactAccountId.add(oldCon.AccountId);
            accountIdForNonContact = oldCon.AccountId;
        }
        Map<Id,Account> mapOfAccount = new Map<Id,Account>();
        // It will fetch remaining contact after delete
        List<aggregateResult> listOfStatusAggregateContact= [Select Count(Id) totalCount, AccountId, Status__c from Contact 
                                                             Where Status__c != null AND AccountId IN : setOfOldContactAccountId Group By AccountId, Status__c];
        Integer activeContact = 0;
        Integer inActiveContact = 0;
        // check listOfStatusAggregateContact list is more than 0 or not
        if(listOfStatusAggregateContact.size() > 0){
            for(AggregateResult aR : listOfStatusAggregateContact){
                String status = String.valueOf(aR.get('Status__c'));
                String accId = String.valueOf(aR.get('AccountId'));
                // check this id is contains or not in map
                if(!mapOfAccount.containsKey(accId)){
                    mapOfAccount.put(accId,new Account(Id=accId,Total_Active_Contacts__c=0,Total_In_Active_Contacts__c=0));
                }
                if(status == 'Active'){
                    activeContact = Integer.valueOf(aR.get('totalCount'));
                    mapOfAccount.get(accId).Total_Active_Contacts__c = activeContact;
                }
                else if(status == 'In Active'){
                    inActiveContact = Integer.valueOf(aR.get('totalCount'));
                    mapOfAccount.get(accId).Total_In_Active_Contacts__c = inActiveContact;
                    
                }
            }
        }
        // If there is no record on account then Total_Active_Contacts__c equal 0 and Total_In_Active_Contacts__c 0 
        else{
            mapOfAccount.put(accountIdForNonContact,new Account(Id=accountIdForNonContact,Total_Active_Contacts__c=0,Total_In_Active_Contacts__c=0));
        }
        // Check map size is greater than 0 or not
        if(mapOfAccount.size() > 0){
            update mapOfAccount.values();
        }  */
    }

/**
*  Description     :  It will run in after UnDelete case..
                      Here populate Total Active Contact and Total In Active Contacts field with the total Active and inactive contacts under the Account.
*
*  @args           :  List<Contact>
*
*  @return         :  No
*
*  Revision Logs   :  V1.0 - Created - 2 March 2022 - Rajveer Singh Rawat
*
**/  
    
    public static void isAfterUnDelete(List<Contact> unDeleteContact){
        // list will store undelete contact
 /*       List<Contact> listOfUndeleteContact = new List<Contact>();
        for(Contact con : unDeleteContact){
            listOfUndeleteContact.add(con);
        }
        // call insert method for inserting undeleting
        ContactTriggerHandler2.isAfterInsert(listOfUndeleteContact);  */
        // Calling helper class
           ContactTriggerHelper.allContactTriggerOperation(unDeleteContact,null);
    }
}