/**
*  Description     :   Create/Delete the contacts under the Account according to the value in the Contact Details field.
*
*  Created By      :  Rajveer Singh Rawat
*
*  Created Date    :  16 Feb 2022
*
*  Revision Logs   :  V1.0 - Created - Rajveer Singh Rawat
*				      
*
**/
public class CreateContactsUnderAccount {
    /**
*  Description     :  In this method we will fetch 10 Account record and fetch contact on account and update Account wesite field on Contact to Account Object website field..
*
*  @args           :  
*
*  @return         :  Void
*
*  Revision Logs   :  V1.0 - Created - 10 feb 2022 - Rajveer Singh Rawat
*
**/ 
 /*   public static void validateContactsUnderAccount(List<Id> accId){
        List<Contact> listOfContact = [Select Id, FirstName, Email, LastName, Account.Contact_Details__c From Contact Where AccountId IN : accId];
        //  System.debug(listOfContact[0].Account.Contact_Details__c);
        System.debug('***********'+listOfContact); 
        //  List<String> parts = listOfContact[0].Account.Contact_Details__c.split('\n');
        //  String delimiter = '/n';
        
        String input = listOfContact[0].Account.Contact_Details__c;
        List<String> s = new List<String>();
        List<Contact> listInsertContact = new List<Contact>();
        Set<Contact> setOfInsertContact = new Set<Contact>();
        Set<Contact> setOfSameContactData = new Set<Contact>();
        Set<Id> setOfDeleteRemainingContact = new Set<Id>();
        
        while(input != ''){
            String s2 =  input.substringBefore('\n');
            //System.debug('$$$$$$$'+s2);
            String fName = s2.substringBetween('FirstName =',',');
            String LName = s2.substringBetween('LastName =',',');
            String fieldEmail = s2.substringAfterLast('=');
            String removeSpaceFirstName = fName.trim();
            String removeSpaceLastName = lName.trim();
            String removeSpaceFieldEmail = fieldEmail.trim();
            
            for(Contact conObj : listOfContact){
                Contact con = new Contact(AccountId=conObj.AccountId, FirstName=fName, LastName=lName, Email = fieldEmail);
                System.debug('ConObj'+conObj);
                if(!(conObj.FirstName == removeSpaceFirstName && conObj.LastName == removeSpaceLastName && conObj.Email == removeSpaceFieldEmail)){
                    if(!setOfSameContactData.contains(con)){
                        setOfInsertContact.add(con);//vikrant
                        System.debug('For Insert '+con);
                    }
                }
                else{
                    if(setOfInsertContact.contains(con)){
                        setOfInsertContact.remove(con);
                    }
                    setOfSameContactData.add(con);//sachin
                }
               // System.debug('@@@@@@@@'+setOfInsertContact);
            }
            input = input.substringAfter('\n'); 
        }
        
        Set<Contact> setConDelete = new Set<Contact>();
        List<Contact> listConDelete = new List<Contact>();
        for(Contact con : listOfContact){
             if(!setOfSameContactData.contains(con)){
                setConDelete.add(con);
            }
         }  
        //System.debug('&&&&&&&&&&'+setConDelete);
        listConDelete.addAll(setConDelete);
        if(listConDelete.size() > 0){
            System.debug('&&&&&&&&&&'+listConDelete);
           // delete listConDelete;
        }
        
        listInsertContact.addAll(setOfInsertContact);
        if(listInsertContact.size() > 0){
            //insert listInsertContact;
            System.debug('~~~~~~~~~'+listInsertContact);
        }
        
        
    }  */
    
    public static void validateContactsUnderAccountMethodSecond(List<Id> accId){
        
        // List of Acccount and contact on particular account Id
        List<Account> listOfAccount = [Select Name, Contact_Details__c , (Select Account.Name, FirstName, LastName, Email From Contacts) From Account Where Id IN : accId];
        // Map of (AccountId,(String,Contact))
        Map<Id, Map<String,Contact>> mapOfIdStringContact = new Map<Id, Map<String,Contact>>();
        // this list Store the contact who will go for the insertion
        List<Contact> listOfInsertingContact = new List<Contact>();
        //this list store the deletd data
        List<Contact> listOfDeletedContact = new List<Contact>();
        
        // Filling map data from listOfAccount SOQL to  
        for(Account acc : listOfAccount){ 
            // Map of (String,Contact)
            Map<String,Contact> mapOfStringContact = new Map<String,Contact>();
            for(Contact con : acc.Contacts){
                String validateData = 'FirstName = '+ con.FirstName +', LastName = ' +con.LastName +', Email = '+ con.Email;
                System.debug(validateData);
                mapOfStringContact.put(validateData,con); 
            }
            mapOfIdStringContact.put(acc.Id,mapOfStringContact); 
        }
        
        // validate contactDetails field to mapOfIdStringContact
        for(Account acc : listOfAccount){
            for(String contactDetails : acc.contact_Details__c.split('\n')){ 
                //System.debug(contactDetails);
                System.debug('======'+mapOfIdStringContact.get(acc.Id).keySet());
                if(mapOfIdStringContact.get(acc.Id).containsKey(contactDetails.trim())){
                    mapOfIdStringContact.get(acc.Id).remove(contactDetails);
                }
                else{
                    //splitting the value from individual substring
                    String fName = contactDetails.substringBetween('FirstName =',',');
                    String LName = contactDetails.substringBetween('LastName =',',');
                    String fieldEmail = contactDetails.substringAfterLast('=');
                    listOfInsertingContact.add(new Contact(AccountId=acc.Id,FirstName=fName,LastName=lname,Email=fieldEmail)); 
                }
            }  
        }
        
        // Here we will store the remaining mapOfIdStringContact data in listOfDeletedContact for insert
        for(Account accObj : listOfAccount){
            for(String str : mapOfIdStringContact.get(accObj.Id).keySet()){
                listOfDeletedContact.add(mapOfIdStringContact.get(accObj.Id).get(str));
                //System.debug('!!!!!!!!!!!!!'+mapOfIdStringContact.get(accObj.Id).get(str));
            }
        }
        
        //delete remaining contact which is not match on contact details contact
        if(listOfDeletedContact.size() > 0){
            //delete listOfDeletedContact; 
        }
        
        // Insert data which is new on contact details
        if(listOfInsertingContact.size() > 0){ 
            //System.debug('listOfInsertingContact'+listOfInsertingContact);
            System.debug('mapOfIdStringContact'+mapOfIdStringContact);
            //insert listOfInsertingContact; 
        }
        
        
        
    } 
}