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
public class BatchAccountContactCsvFile implements Database.Batchable<sObject>, Database.Stateful {
    String finalstr = 'Record Id, Account Name, Contact Id, Contact Name \n';
    public Integer recordsProcessed = 0;
 /**
*  Description     :  This method load all data...
*
*  @args           :  Database.BatchableContext
*
*  @return         :  Database.QueryLocator
*
*  Revision Logs   :  V1.0 - Created - 17 April 2022 - Rajveer Singh Rawat
*
**/      
    public Database.QueryLocator start(Database.BatchableContext bc) {
        String query = 'SELECT Id,Name,(SELECT Id, Name FROM Contacts Limit 5) FROM Account Limit 5';
        return Database.getQueryLocator(query);
    }
/**
*  Description     :  This method execute chunks of data for processing...
*
*  @args           :  Database.BatchableContext , List<Account>
*
*  @return         :  No
*
*  Revision Logs   :  V1.0 - Created - 17 Account 2022 - Rajveer Singh Rawat
*
**/   
    public void execute(Database.BatchableContext bc, List<Account> listOfAccountContact){
        //Set of AccountId
        Set<Id> setOfAccountId = new Set<Id>();
        // process each batch of records
        for(Account accountObj : listOfAccountContact) {
            string recordString = accountObj.id +','+accountObj.Name + ',';
            finalstr = finalstr + recordString;
            if(!accountObj.Contacts.isEmpty()){
                Integer i = 0;
                for(Contact contactObj : accountObj.Contacts){
                    String contactString = contactObj.Id + ',' + contactObj.Name + '\n';
                    if(i==0){
                        finalstr = finalstr + contactString;  
                        i++;
                    }
                    else{
                        finalstr = finalstr + ',' + ',' + contactString;
                    }
                }
            }
            else{
                System.debug('Hii');
                finalstr = finalstr + '\n'; 
            }
            
        }
    }
 /**
*  Description     :  This method run once after all execution to perform some action ...
*
*  @args           :  Database.BatchableContext
*
*  @return         :  No
*
*  Revision Logs   :  V1.0 - Created - 17 April 2022 - Rajveer Singh Rawat
*
**/     
    
    public void finish(Database.BatchableContext bc){
        System.debug(recordsProcessed + ' records processed. Shazam!');
        AsyncApexJob job = [SELECT Id, Status, NumberOfErrors,
                            JobItemsProcessed,
                            TotalJobItems, CreatedBy.Email
                            FROM AsyncApexJob
                            WHERE Id = :bc.getJobId()];
        // call some utility to send email
        Messaging.EmailFileAttachment csvAttc = new Messaging.EmailFileAttachment();
        blob csvBlob = Blob.valueOf(finalstr);
        string csvname= 'Account.csv';
        csvAttc.setFileName(csvname);
        csvAttc.setBody(csvBlob);
        Messaging.SingleEmailMessage email = new Messaging.SingleEmailMessage();
        String[] toAddresses = new list<string> {job.CreatedBy.Email};
            String subject ='Account CSV';
        email.setSubject(subject);
        email.setToAddresses( toAddresses );
        email.setPlainTextBody('Account CSV ');
        email.setFileAttachments(new Messaging.EmailFileAttachment[]{csvAttc});
        Messaging.SendEmailResult [] r = Messaging.sendEmail(new Messaging.SingleEmailMessage[] {email});
    }
}