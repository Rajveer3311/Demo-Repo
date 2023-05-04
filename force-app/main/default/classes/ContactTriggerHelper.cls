/**
*  Description     :  Contact_Trigger Helper class
*                     Here we are performing all operation in single function on Account total Active and inactive contacts ..
*
*  Created By      :  Rajveer Singh Rawat
*
*  Created Date    :  2 March 2022
*
*  Revision Logs   :  V1.0 - Created - Rajveer Singh Rawat
*                     
*
**/
public class ContactTriggerHelper {
    
/**
*  Description     :  It will run in all Cases Here populate Total Active Contact and Total In Active Contacts field with the total Active and inactive contacts under the Account.
*
*  @args           :  List<Contact>, Map<Id,Contact>
*
*  @return         :  No
*
*  Revision Logs   :  V1.0 - Created - 2 March 2022 - Rajveer Singh Rawat
*
**/    
    //Method 1st
    public static void allContactTriggerOperation(List<Contact> newData, Map<Id,Contact> oldMap){
        // It store Account Id and object
        Map<Id,Account> mapOfAccount = new Map<Id,Account>();
        // temporary variable to store activeContact , inActiveContact
        Integer activeContact = 0;
        Integer inActiveContact = 0;
        // it store the account id on contact..
        Set<Id> setOfAccountId = new Set<Id>();
        for(Contact acc : newData != null ? newData : oldMap.Values()){
            if((oldMap != null) && (acc.AccountId != oldMap.get(acc.Id).AccountId)){
                setOfAccountId.add(acc.AccountId);
                setOfAccountId.add(oldMap.get(acc.Id).AccountId);
                System.debug('acc.AccountId'+acc.AccountId);
            }
            else if((oldMap == null) || acc.Status__c != oldMap.get(acc.Id).Status__c || newData == null){
                setOfAccountId.add(acc.AccountId);
                System.debug('Inside');
            }
        }
        
        if(setOfAccountId.size() > 0){
            // List for particular setOfAccountId
            List<aggregateResult> listOfStatusAggregateContact= [Select Count(Id) totalCount, AccountId, Status__c from Contact 
                                                                 Where Status__c != null AND AccountId IN : setOfAccountId Group By AccountId, Status__c];
            //Check listOfStatusAggregateContact size  
            if(listOfStatusAggregateContact.size() > 0){
                for(AggregateResult aR : listOfStatusAggregateContact){
                    String status = String.valueOf(aR.get('Status__c'));
                    String accId = String.valueOf(aR.get('AccountId'));
                    //Check this account id contains or not in this Map
                    if(!mapOfAccount.containsKey(accId)){
                        mapOfAccount.put(accId,new Account(Id=accId,Total_Active_Contacts__c=0,Total_In_Active_Contacts__c=0));
                    }
                    //System.debug('mapOfAccount'+mapOfAccount);
                    if(status == 'Active'){
                        activeContact = Integer.valueOf(aR.get('totalCount'));
                        //System.debug('activeContact'+activeContact);
                        mapOfAccount.get(accId).Total_Active_Contacts__c = activeContact;
                    }
                    else if(status == 'In Active'){
                        inActiveContact = Integer.valueOf(aR.get('totalCount'));
                        //System.debug('inActiveContact'+inActiveContact);
                        mapOfAccount.get(accId).Total_In_Active_Contacts__c = inActiveContact;
                        
                    }
                }
            }
        }
        
        // those Account have no Contact it will update here..
        for(Id accIdOfSet : setOfAccountId){
            if(!mapOfAccount.containsKey(accIdOfSet)){
                // If there is no record on account then Total_Active_Contacts__c equal 0 and Total_In_Active_Contacts__c equal 0 
                mapOfAccount.put(accIdOfSet,new Account(Id=accIdOfSet,Total_Active_Contacts__c=0,Total_In_Active_Contacts__c=0));
                System.debug('@@@@@@@@accIdOfSet'+accIdOfSet);
            }
        }   
        // Check map size is greater than 0 or not
        if(mapOfAccount.size() > 0){
            update mapOfAccount.values();
        } 
    }
    
    
    // Method 2nd
    public static void allContactTriggerOperation2(List<Contact> newData, Map<Id,Contact> oldMap){
        // It store Account Id and object
        Map<Id,Account> mapOfAccount = new Map<Id,Account>();
        // temporary variable to store activeContact , inActiveContact
        Integer activeContact = 0;
        Integer inActiveContact = 0;
        for(Contact acc : newData != null ? newData : oldMap.Values()){
            if((oldMap != null) && (acc.AccountId != oldMap.get(acc.Id).AccountId)){
                mapOfAccount.put(acc.AccountId,new Account(Id=acc.AccountId,Total_Active_Contacts__c=0,Total_In_Active_Contacts__c=0));
                mapOfAccount.put(oldMap.get(acc.Id).AccountId,new Account(Id=oldMap.get(acc.Id).AccountId,Total_Active_Contacts__c=0,Total_In_Active_Contacts__c=0));
                System.debug('acc.AccountId'+acc.AccountId);
            }
            else if((oldMap == null) || acc.Status__c != oldMap.get(acc.Id).Status__c || newData == null){
                mapOfAccount.put(acc.AccountId,new Account(Id=acc.AccountId,Total_Active_Contacts__c=0,Total_In_Active_Contacts__c=0));
                System.debug('Inside');
            }
        }
        
        // List for particular setOfAccountId
        List<aggregateResult> listOfStatusAggregateContact= [Select Count(Id) totalCount, AccountId, Status__c from Contact 
                                                             Where Status__c != null AND AccountId IN : mapOfAccount.keySet() Group By AccountId, Status__c];
        System.debug('listOfStatusAggregateContact'+listOfStatusAggregateContact);
        //Check listOfStatusAggregateContact size  
        if(listOfStatusAggregateContact.size() > 0){
            for(AggregateResult aR : listOfStatusAggregateContact){
                String status = String.valueOf(aR.get('Status__c'));
                String accId = String.valueOf(aR.get('AccountId'));
                if(status == 'Active'){
                    activeContact = Integer.valueOf(aR.get('totalCount'));
                    //System.debug('activeContact'+activeContact);
                    mapOfAccount.get(accId).Total_Active_Contacts__c = activeContact;
                }
                else if(status == 'In Active'){
                    inActiveContact = Integer.valueOf(aR.get('totalCount'));
                    //System.debug('inActiveContact'+inActiveContact);
                    mapOfAccount.get(accId).Total_In_Active_Contacts__c = inActiveContact;
                }
            }
        }
        
        // Check map size is greater than 0 or not
        if(mapOfAccount.size() > 0){
            update mapOfAccount.values();
        } 
    } 
    
    public static void duplicateContactPrevent(List<Contact> listOfnewData,Map<Id,Contact> mapOfOldContact){
        System.debug('Hii--1');
        Set<String> setOfEmail = new Set<String>();
        Set<String> setOfPhone = new Set<String>();
        Set<String> setOfExistEmail = new Set<String>();
        Set<String> setOfExistPhone= new Set<String>();
        for(Contact conObj : listOfnewData){
            if(mapOfOldContact == null || (mapOfOldContact != null) && (mapOfOldContact.get(conObj.Id).Email != conObj.Email || mapOfOldContact.get(conObj.Id).Phone != conObj.Phone)){
                setOfEmail.add(conObj.Email);
                setOfPhone.add(conObj.Phone);
            }
        }
        if(setOfEmail.size() > 0 || setOfPhone.size() > 0){
            List<Contact> listOfContact = [Select Name,Email,Phone from Contact Where Email IN:setOfEmail OR Phone IN:setOfPhone];
            for(Contact existCon : listOfContact){
                if(String.isNotBlank(existCon.Email)){
                    setOfExistEmail.add(existCon.Email);
                }
                if(String.isNotBlank(existCon.Phone)){
                    setOfExistPhone.add(existCon.Phone);
                }
            }
            System.debug('Hii--3');
            for(Contact con : listOfnewData){
                System.debug(setOfExistEmail.contains(con.Email));
                if(setOfExistEmail.size() > 0 || setOfExistPhone.size() > 0){
                    if(setOfExistEmail.contains(con.Email) || setOfExistPhone.contains(con.Phone)){
                        con.addError('Duplicate Email or Phone !!');
                    }
                }
            }
        }
    }

/**
*  Description     :  It will run update,Insert case lastModified time contact department name + contact name populate on his Account name
*
*  @args           :  List<Contact>, Map<Id,Contact>
*
*  @return         :  No
*
*  Revision Logs   :  V1.0 - Created - 5 April 2022 - Rajveer Singh Rawat
*
**/      
    public static void checkDepartment(List<Contact> listOfNewContact, Map<Id,Contact> mapOfOldContact){
        System.debug('Check Inside'+listOfNewContact);
        List<Contact> listOfContact = new List<Contact>();
        Map<Id,Account> mapOfUpdateAccountName = new Map<Id,Account>();
        Set<Id> setOfContactId = new Set<Id>();
        for(Contact con : listOfNewContact){
            if(mapOfOldContact == null || con.Department != mapOfOldContact.get(con.Id).Department){ 
                setOfContactId.add(con.Id);
                System.debug(con.LastModifiedDate);
            }
        }
        if(setOfContactId.size() > 0){
            List<Contact> listOfContacts = [Select Account.Id, Account.Name, Department, Name from Contact Where Id IN :setOfContactId];
            System.debug(listOfContacts);
            if(listOfContacts.size() > 0){
                for(Contact conObj : listOfContacts){
                    System.debug('Before');
                    conObj.Account.Name = conObj.Name + '_' +conObj.Department;
                    System.debug(conObj.Account.Name);
                    mapOfUpdateAccountName.put(conObj.Account.Id,new Account(Id=conObj.Account.Id,Name=conObj.Account.Name));
                    listOfContact.add(conObj);
                }
                System.debug(mapOfUpdateAccountName);
                if(mapOfUpdateAccountName.size() > 0){
                    update mapOfUpdateAccountName.values();
                }
            }
        }
    }
    
    public static void updateActiveAndInactiveCase(List<Contact> newContact, Map<Id,Contact> oldContact){
        
        //here we will call insert method for insertion those record whose id changed on update operation.. 
        ContactTriggerHelper.allContactTriggerOperation(newContact,oldContact);
        Set<Id> setOfContactAccountId = new Set<Id>();
        // this list store inserting contact whose account id changed on record 
        List<Contact> listOfChangingContactAccountId = new List<Contact>();
        Id accountIdForNonContact;
        // In update case it will both update and insert operation perform
        for(Contact con : newContact){
            if(con.AccountId != oldContact.get(con.Id).AccountId){
                setOfContactAccountId.add(oldContact.get(con.Id).AccountId); 
                accountIdForNonContact = oldContact.get(con.Id).AccountId;
                System.debug(accountIdForNonContact);
                listOfChangingContactAccountId.add(con);
            }
            else{
                setOfContactAccountId.add(con.AccountId); 
            }
        }
        System.debug(setOfContactAccountId);
        
        if(setOfContactAccountId.size() > 0){        
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
            }   
        } 
        
    }  
    
    public static void insertActiveAndInactiveCase(List<Contact> newData){
        // Calling helper class
        ContactTriggerHelper.allContactTriggerOperation(newData,null);
        
        System.debug('@@@@@@@@@@@@@-It is inside in insert method');
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
        }   
    }
    
    public static void sendMailOnContactInsert(List<Contact> newData){
        List<Contact> listOfInsertedContact = new List<Contact>();
        for(Contact conObj : newData){
            EmailTemplate et = [SELECT Id FROM EmailTemplate WHERE Name = 'On Contact Insert Email Send'];
            System.debug(et);
            List<string> toAddress = new List<string>();
            toAddress.add(conObj.Email);
            Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
            mail.setTemplateId(et.Id);
            mail.setToAddresses(toAddress);
            mail.setTargetObjectId(conObj.Id);
            mail.setWhatId(conObj.Id);
            mail.setSaveAsActivity(false);
            mail.setUseSignature(false);
            List<Messaging.SingleEmailMessage> allmsg = new List<Messaging.SingleEmailMessage>();
            allmsg.add(mail);
            
            try {
                Messaging.sendEmail(allmsg,false);
                return;
            } catch (Exception e) {
                System.debug(e.getMessage());
            }
        }
    }
    
    public static void deletActiveAndInactiveCase(Map<Id,Contact> deleteContact){
        
        // Calling helper class
        ContactTriggerHelper.allContactTriggerOperation(null,deleteContact);
        
        // set will store old contact account Id
        Set<Id> setOfOldContactAccountId = new Set<Id>();
        Id accountIdForNonContact;
        for(Contact oldCon : deleteContact.values()){
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
        }  
    }
    
    public static void undeletActiveAndInactiveCase(List<Contact> unDeleteContact){
        // list will store undelete contact
        List<Contact> listOfUndeleteContact = new List<Contact>();
        for(Contact con : unDeleteContact){
            listOfUndeleteContact.add(con);
        }
        // call insert method for inserting undeleting
        ContactTriggerHandler2.isAfterInsert(listOfUndeleteContact);  
        // Calling helper class
        ContactTriggerHelper.allContactTriggerOperation(unDeleteContact,null);
    }
    
}