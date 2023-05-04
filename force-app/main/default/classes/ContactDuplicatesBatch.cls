/**
*  Description     :  Check the Duplicate Contacts in the System and mark those as duplicate.
*
*  Created By      :  Rajveer Singh Rawat
*
*  Created Date    :  24 March 2022
*
*  Revision Logs   :  V1.0 - Created - Rajveer Singh Rawat
*                     
*
**/
public class ContactDuplicatesBatch implements Database.Batchable<sObject> {
    
 /**
*  Description     :  This method call ContactDuplicatesBatch method and it retrieve all data from org...
*
*  @args           :  Database.BatchableContext
*
*  @return         :  Database.QueryLocator
*
*  Revision Logs   :  V1.0 - Created - 24 March 2022 - Rajveer Singh Rawat
*
**/ 
    public Database.QueryLocator start(Database.BatchableContext bc) {
        return Database.getQueryLocator('Select FirstName, LastName, Email from Contact Where Email != null AND Is_Duplicate__c != true Order By createdDate asc');
    }
 /**
*  Description     :  This method execute chunks of data for processing...
*
*  @args           :  Database.BatchableContext , List<Contact>
*
*  @return         :  No
*
*  Revision Logs   :  V1.0 - Created - 24 March 2022 - Rajveer Singh Rawat
*
**/     
    public void execute(Database.BatchableContext bc, List<Contact> listOfContactData){
        
        // List for updating contact those who are duplicates
        List<Contact> listOfUpdatedContacts = new List<Contact>();
        // Map which store key as a (lastname + Email) and Value as a Contact
        Map<String,Contact> mapOfStringContact = new Map<String,Contact>();
        
        for(Contact existCon : listOfContactData){
            if(!mapOfStringContact.ContainsKey(existCon.LastName+existCon.Email)){
                mapOfStringContact.put(existCon.LastName+existCon.Email,existCon);
            }
            else{
                // Update only those Contact which is not present in map..
                if(!(mapOfStringContact.get(existCon.LastName+existCon.Email) == existCon)){
                    existCon.Original_Contact__c = mapOfStringContact.get(existCon.LastName+existCon.Email).Id;
                    existCon.Is_Duplicate__c = true;
                    listOfUpdatedContacts.add(existCon);
                }
            }
        }
        System.debug(mapOfStringContact);
        System.debug(listOfUpdatedContacts);
        // listOfUpdatedContacts size is greater than 0 or not
        if(listOfUpdatedContacts.size() > 0){
            update listOfUpdatedContacts;
        }
    } 
 /**
*  Description     :  This method run once after all execution to perform some action ...
*
*  @args           :  Database.BatchableContext
*
*  @return         :  No
*
*  Revision Logs   :  V1.0 - Created - 24 March 2022 - Rajveer Singh Rawat
*
**/     
    public void finish(Database.BatchableContext bc){
        // Fetch total record processed and error records
        AsyncApexJob a = [Select Id, Status,ExtendedStatus,NumberOfErrors, JobItemsProcessed,TotalJobItems, CreatedBy.Email 
                          from AsyncApexJob where Id =:bc.getJobId()];
        System.debug(a);
        // Send mail to to the owner of record created 
        Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
        String[] toAddresses = new String[] {a.CreatedBy.Email};
        mail.setToAddresses(toAddresses);
        mail.setSubject('Scheduled Contact Record ' + a.Status);
        mail.setPlainTextBody('records processed ' + a.TotalJobItems +   'with '+ a.NumberOfErrors + ' failures.');
        Messaging.sendEmail(new Messaging.SingleEmailMessage[] { mail });
    }
    
}