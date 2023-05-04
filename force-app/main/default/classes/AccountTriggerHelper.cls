/**
*  Description     :  Account_Trigger Helper class
Here we are performing operation on Account Rating and populate Account Number field ..
*
*  Created By      :  Rajveer Singh Rawat
*
*  Created Date    :  1 March 2022
*
*  Revision Logs   :  V1.0 - Created - Rajveer Singh Rawat
*				      
*
**/
public class AccountTriggerHelper {
    /**
*  Description     :  This is for all Account_Trigger Operation
Throw an exception if Active is False and "In-Active Reason" field is blank. Message: "Please select In Active Reason for the Account".
*
*  @args           :  List<Account>
*
*  @return         :  No
*
*  Revision Logs   :  V1.0 - Created - 1 March 2022 - Rajveer Singh Rawat
*
**/     
    public static void allCheckInActiveReasonOperation(List<Account> newData, Map<Id,Account> oldMap){
        for(Account acc : newData){
            if(oldMap == null || ((acc.Active__c != oldMap.get(acc.Id).Active__c) || (acc.In_Active_Reason__c != oldMap.get(acc.Id).In_Active_Reason__c))){
                if(acc.Active__c == 'False' && String.isBlank(acc.In_Active_Reason__c)){
                    acc.addError('Please select In Active Reason for the Account');
                }
            }
        }
    }  
    
    /**
*  Description     :  It's works on all operation
If Account Rating is Cold than set AccountNumber to 1234
If Account Rating is HOT than set AccountNumber to 1
If Account Rating is blank/null than set AccountNumber to 0
*
*  @args           :  List<Account> , Map<Id,Account>
*
*  @return         :  No
*
*  Revision Logs   :  V1.0 - Created - 1 March 2022 - Rajveer Singh Rawat
*
**/
    public static void allValidateRecordsOperation(List<Account> accountData, Map<Id,Account> oldMap){
        for(Account acc : accountData){
            if(oldMap == null || (acc.Rating != oldMap.get(acc.Id).Rating)){
                if(acc.Rating != 'Warm'){
                    if(acc.Rating == 'Cold'){
                        acc.AccountNumber = '1234';
                    }
                    else If(acc.Rating == 'Hot'){
                        acc.AccountNumber = '1';
                    }
                    else If(String.isBlank(acc.Rating)){
                        acc.AccountNumber = '0';
                    }
                }
                else{
                    acc.AccountNumber = null;
                }
            }
        }
    }   
    
    /**
*  Description     :  It's works on all operation
If Account Rating is Cold than set AccountNumber to 1234
If Account Rating is HOT than set AccountNumber to 1
If Account Rating is blank/null than set AccountNumber to 0
*
*  @args           :  List<Account> , Map<Id,Account>
*
*  @return         :  No
*
*  Revision Logs   :  V1.0 - Created - 9 March 2022 - Rajveer Singh Rawat
*
**/
    public static void allContactDetailsOperation(List<Account> accountData, Map<Id,Account> oldMap){// listOfNewAccounts,mapOfOldAccounts
        
        // this list Store the contact who will go for the insertion
        List<Contact> listOfInsertingContact = new List<Contact>();
        //this list store the deletd data
        List<Contact> listOfDeletedContact = new List<Contact>();
        List<String> listOfMoveToContact = new List<String>();
        //Set of Move Account Id
        Set<Id> setOfMoveAccountId = new Set<Id>();
        Set<Id> setOfNewMoveAccountId = new Set<Id>();
        Map<Id,Id> mapOfMoveAndCurrentId = new Map<Id,Id>();
        Map<String,Contact> mapOfData = new Map<String,Contact>();
        Map<String,Contact> mapOfRemoveData = new Map<String,Contact>();
        // List for update matching data from move to Contact..
        List<Contact> listOfUpdatingContact = new List<Contact>();
        //Set of Account Id
        Set<Id> setOfAccountId = new Set<Id>();
        
        for(Account accId : accountData){
            if(oldMap == null || (oldMap.get(accId.Id).Contact_Details__c != accId.Contact_Details__c) || (oldMap.get(accId.Id).Contact_Details_1__c != accId.Contact_Details_1__c) || (oldMap.get(accId.Id).Move_To_Contacts__c != accId.Move_To_Contacts__c) || (oldMap.get(accId.Id).Move_To_Account__c != accId.Move_To_Account__c) ||  (oldMap.get(accId.Id).Move_To_Contacts__c != accId.Move_To_Contacts__c) && (oldMap.get(accId.Id).Move_To_Account__c != accId.Move_To_Account__c)){
                setOfAccountId.add(accId.Id);
                // setOfMoveAccountId this store old Move_To_Account__c value for update case 
                if(oldMap != null){
                    setOfMoveAccountId.add(oldMap.get(accId.Id).Move_To_Account__c);
                }
            }
        }
        // List of Acccount and contact on particular account Id
        List<Contact> listOfContact = [Select Id, FirstName,LastName,Email,Previous_Account__c,Account.Name,AccountId from Contact Where AccountId = :setOfMoveAccountId];
        if(setOfAccountId.size() > 0){
            // store current record data..
            List<Account> listOfAccountContacts = [Select Name, Contact_Details__c ,Contact_Details_1__c, Move_To_Contacts__c, Move_To_Account__c, (Select Account.Name,AccountId, FirstName, LastName, Previous_Account__c, Email From Contacts) 
                                                   From Account Where Id IN : setOfAccountId];
            //System.debug('Inside');
            // Map of (AccountId,(String,Contact))
            Map<Id, Map<String,Contact>> mapOfIdStringContact = new Map<Id, Map<String,Contact>>();
            // Map of (AccountId,(String,Contact))
            Map<Id, Map<String,Contact>> mapOfIdStringContactValues = new Map<Id, Map<String,Contact>>();
            // Filling map data from listOfAccount SOQL to  
            for(Account acc : listOfAccountContacts){
                // List for store contact details data
                List<String> listOfContactDetails = new List<String>();
                //List for store contact details1 data
                List<String> listOfContactDetails1 = new List<String>();
                // set to store both listOfContactDetails,listOfContactDetails1 value in unique format
                Set<String> setOfContactDetailsAnd1 = new Set<String>();
                if(oldMap == null || (acc.Contact_Details_1__c != oldMap.get(acc.Id).Contact_Details_1__c) || (acc.contact_Details__c != oldMap.get(acc.Id).contact_Details__c)){
                    if(String.isNotBlank(acc.contact_Details__c)){
                        listOfContactDetails = acc.contact_Details__c.split('\n'); 
                        System.debug(listOfContactDetails);
                        for(String s : listOfContactDetails){
                            setOfContactDetailsAnd1.add(s.trim());
                        }
                    }
                    if(String.isNotBlank(acc.Contact_Details_1__c)){
                        listOfContactDetails1 = acc.Contact_Details_1__c.split('\n');  
                        for(String s : listOfContactDetails1){
                            setOfContactDetailsAnd1.add(s.trim());
                        }
                    }
                    if(setOfContactDetailsAnd1.size() > 0){
                        // Map of (String,Contact)
                        Map<String,Contact> mapOfExistingContact = new Map<String,Contact>();
                        for(Contact con : acc.Contacts){
                            String validateData = 'FirstName = '+ con.FirstName +', LastName = ' +con.LastName +', Email = '+ con.Email;
                            mapOfExistingContact.put(validateData,con); 
                        }
                        //System.debug('mapOfExistingContact'+mapOfExistingContact.size());
                        mapOfIdStringContact.put(acc.Id,mapOfExistingContact);
                    }
                    // validate contactDetails field to mapOfIdStringContact
                    for(String contactDetails : setOfContactDetailsAnd1){ 
                        System.debug('Hii');
                        if(mapOfIdStringContact.containsKey(acc.Id)){ 
                            if(mapOfIdStringContact.get(acc.Id).containsKey(contactDetails.trim())){
                                mapOfIdStringContact.get(acc.Id).remove(contactDetails.trim());
                                System.debug('contactDetails.trim'+contactDetails.trim());
                            }
                            else{
                                //splitting the value from individual substring
                                System.debug('contactDetails####'+contactDetails);
                                String fName = contactDetails.substringBetween('FirstName =',',');
                                String LName = contactDetails.substringBetween('LastName =',',');
                                String fieldEmail = contactDetails.substringAfterLast('=');
                                if((String.isNotBlank(fName)) && (String.isNotBlank(LName)) && (String.isNotBlank(fieldEmail))){
                                    listOfInsertingContact.add(new Contact(AccountId=acc.Id,FirstName=fName,LastName=lname,Email=fieldEmail)); 
                                    System.debug(listOfInsertingContact);
                                }
                            }
                        }
                    }
                }
                
                // 1.2: If there is any additional contact under the Account then delete that Only delete if Previous Account field is blank
                if(mapOfIdStringContact.size() > 0){
                    for(String str : mapOfIdStringContact.get(acc.Id).keySet()){
                        if(String.isBlank(mapOfIdStringContact.get(acc.Id).get(str).Previous_Account__c)){
                            listOfDeletedContact.add(mapOfIdStringContact.get(acc.Id).get(str.trim()));
                        }
                    }
                    System.debug(listOfDeletedContact);
                }
            
            
            // for 2.1 
            Map<String,Contact> mapOfContactId = new Map<String,Contact>();
            // map of existing move account record id
            Map<String,Contact> mapOfExistMoveAccountRecord = new Map<String,Contact>();
            
                // 2.1,2.3 fill existing records map for check move to contact data present or not in current record
                System.debug('Enter-1');
                if(((oldMap == null) && (String.isNotBlank(acc.Move_To_Contacts__c) && String.isNotBlank(acc.Move_To_Account__c))) 
                   || ((oldMap != null) && (String.isNotBlank(oldMap.get(acc.id).Move_To_Contacts__c)) && (acc.Move_To_Contacts__c != oldMap.get(acc.Id).Move_To_Contacts__c))
                   || (((oldMap != null) && ((String.isNotBlank(acc.Move_To_Contacts__c))) && ((String.isBlank(oldMap.get(acc.Id).Move_To_Account__c)) && (acc.Move_To_Account__c) != oldMap.get(acc.Id).Move_To_Account__c))) 
                   || (((oldMap != null) && (String.isNotBlank(acc.Move_To_Account__c)) && (acc.Move_To_Contacts__c != oldMap.get(acc.Id).Move_To_Contacts__c)))
                  ){
                      Map<String,Contact> mapOfExistingContact2 = new Map<String,Contact>();
                      System.debug('Inside It Date 1');
                      for(Contact con : acc.Contacts){
                          String validateData2 = 'FirstName = '+ con.FirstName +', LastName = ' +con.LastName +', Email = '+ con.Email;
                          //System.debug(validateData);
                          mapOfExistingContact2.put(validateData2,con); 
                      }
                      mapOfIdStringContactValues.put(acc.Id,mapOfExistingContact2);
                      System.debug('Enter-2');
                      for(Contact oldMoveAccountData : listOfContact){
                          String moveToAccData = 'FirstName = '+oldMoveAccountData.FirstName +', LastName = '+oldMoveAccountData.LastName +', Email = '+oldMoveAccountData.Email;
                          mapOfExistMoveAccountRecord.put(moveToAccData.trim(),oldMoveAccountData);
                      }
                      System.debug('mapOfIdStringContactValues'+mapOfIdStringContactValues);
                      // Check record is present or not..
                      if(String.isNotBlank(acc.Move_To_Contacts__c)){ 
                          for(String moveCon : acc.Move_To_Contacts__c.split('\n')){
                              //override same value map
                              if(mapOfIdStringContactValues.get(acc.Id).containsKey(moveCon.trim()) && !mapOfExistMoveAccountRecord.containsKey(moveCon.trim())){
                                  mapOfIdStringContactValues.get(acc.Id).get(moveCon.trim()).Previous_Account__c = acc.Id;
                                  mapOfIdStringContactValues.get(acc.Id).get(moveCon.trim()).AccountId = acc.Move_To_Account__c;
                                  listOfUpdatingContact.add(mapOfIdStringContactValues.get(acc.Id).get(moveCon.trim()));
                              }
                          }
                          System.debug('listOfUpdatingContact'+listOfUpdatingContact);
                      }
                      // 2.3 remove case
                      if(oldMap!= null){
                          if(String.isNotBlank(acc.Move_To_Contacts__c)){
                              if((acc.Move_To_Contacts__c != oldMap.get(acc.id).Move_To_Contacts__c) ){
                                  if(oldMap.get(acc.Id).Move_To_Contacts__c != null){
                                      Map<String,String> mapOfString = new Map<String,String>();
                                      List<String> listOfPresentMoveToContacts = acc.Move_To_Contacts__c.split('\n');
                                      List<String> listOfMoveToOldContacts = oldMap.get(acc.Id).Move_To_Contacts__c.split('\n');
                                      for(String s : listOfPresentMoveToContacts){
                                          mapOfString.put(s.trim(),s);
                                      }
                                      System.debug('listOfMoveToOldContacts'+listOfMoveToOldContacts);
                                      if(listOfMoveToOldContacts.size() > 0){ 
                                          System.debug('!!!!!!!!!mapOfString'+mapOfString);
                                          for(String oldMoveCon : listOfMoveToOldContacts) { 
                                              System.debug(oldMoveCon);
                                              System.debug('oldMoveCon'+mapOfString.containsKey(oldMoveCon.trim()));
                                              if(!mapOfString.containsKey(oldMoveCon.trim())){ 
                                                  System.debug(mapOfExistMoveAccountRecord.get(oldMoveCon.trim()));
                                                  System.debug('oldMoveCon'+oldMoveCon);
                                                  mapOfExistMoveAccountRecord.get(oldMoveCon.trim()).Previous_Account__c = mapOfExistMoveAccountRecord.get(oldMoveCon.trim()).AccountId;
                                                  mapOfExistMoveAccountRecord.get(oldMoveCon.trim()).AccountId = acc.Id;
                                                  listOfUpdatingContact.add(mapOfExistMoveAccountRecord.get(oldMoveCon.trim()));
                                              }
                                          }
                                      }   
                                  }
                              }
                          }
                          else{
                              if(String.isNotBlank(oldMap.get(acc.Id).Move_To_Contacts__c)){
                                  for(String oldMoveCon : oldMap.get(acc.Id).Move_To_Contacts__c.split('\n')) { 
                                      mapOfExistMoveAccountRecord.get(oldMoveCon.trim()).Previous_Account__c = mapOfExistMoveAccountRecord.get(oldMoveCon.trim()).AccountId;
                                      mapOfExistMoveAccountRecord.get(oldMoveCon.trim()).AccountId = acc.Id;
                                      listOfUpdatingContact.add(mapOfExistMoveAccountRecord.get(oldMoveCon.trim()));
                                  }
                                  System.debug(listOfUpdatingContact);
                              }
                          }
                      } 
                  }   
                // 2.2 if If someone change the Move to Account, then move all the contacts those are mentioned in "Move To Contacts" field from previous Move To Account to new Move TO Account.
                if(oldMap != null){
                    if((String.isNotBlank(oldMap.get(acc.Id).Move_To_Account__c)) && (oldMap.get(acc.Id).Move_To_Account__c != acc.Move_To_Account__c)){
                        if(oldMap.get(acc.Id).Move_To_Contacts__c != null){
                            List<String> listOfMoveToContacts = oldMap.get(acc.Id).Move_To_Contacts__c.split('\n');
                            if(listOfMoveToContacts.size() > 0){ 
                                System.debug('Inside-3');
                                for(Contact prevAccCont : listOfContact) {
                                    String existData = 'FirstName = '+ prevAccCont.FirstName +', LastName = ' +prevAccCont.LastName +', Email = '+ prevAccCont.Email;
                                    mapOfContactId.put(existData,prevAccCont);
                                }
                                System.debug('mapOfContactId before'+mapOfContactId);
                                System.debug('Inside-4');
                                for(String moveToContact : listOfMoveToContacts){
                                    System.debug('moveToContact'+moveToContact);
                                    if(mapOfContactId.containskey(moveToContact.trim())){
                                        String previousAccountId = mapOfContactId.get(moveToContact.trim()).AccountId;
                                        System.debug('&&&&&&'+previousAccountId);
                                        mapOfContactId.get(moveToContact.trim()).Previous_Account__c = previousAccountId;
                                        mapOfContactId.get(moveToContact.trim()).AccountId=acc.Move_To_Account__c;
                                        listOfUpdatingContact.add(mapOfContactId.get(moveToContact.trim()));
                                    }
                                    System.debug('listOfUpdatingContact'+listOfUpdatingContact);
                                }
                            }
                        }
                    }
                }
            }
        }
        // Update those move to contact which is present in current account..
        if(listOfUpdatingContact.size() > 0){
            update listOfUpdatingContact;
        }
        // list of inserting contact from contact details and contact details1
        if(listOfInsertingContact.size() > 0){
            insert listOfInsertingContact;
        }
        // delete whose account have previous account is blank..
        if(listOfDeletedContact.size() > 0){
            delete listOfDeletedContact;
        }
    }
}