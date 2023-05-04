/*public class ContactBatchClass implements Database.Batchable<sObject> {
    public List<Contact> start(Database.BatchableContext bc) {
        return ([Select firstName, lastName from Contact Where firstName != null AND lastName!= null]);
    }
    public void execute(Database.BatchableContext bc, List<Contact> conRecords){
        // process each batch of records
        List<Contact> conList = new List<Contact>();
        for (Contact conObj : conRecords) {
            
            String firstNameCharOne=conObj.firstName.substring(0,1);
            String lastNameCharOne=conObj.lastName.substring(0,1);
            
            if(firstNameCharOne.equals(lastNameCharOne)){
                conObj.Description = 'Initials of the first name and last name are same';
                conList.add(conObj);
                System.debug(conObj);
            }
        }
        update conList;
    }
    public void finish(Database.BatchableContext bc){
        // execute any post-processing operations
        System.debug('Bhai Ho Gaya Tumhara kaam');
    }
} */
public class ContactBatchClass implements Database.Batchable<sObject> {
    public Database.QueryLocator start(Database.BatchableContext bc) {
        String s= 'Select firstName, lastName from Contact Where firstName != null AND lastName!= null';
        //return Database.getQueryLocator('Select firstName, lastName from Contact Where firstName != null AND lastName!= null');
    return Database.getQueryLocator(s);
    }
    public void execute(Database.BatchableContext bc, List<Contact> conRecords){
        // process each batch of records
        System.debug(bc);
        List<Contact> conList = new List<Contact>();
        for (Contact conObj : conRecords) {
            
            String firstNameCharOne=conObj.firstName.substring(0,1);
            String lastNameCharOne=conObj.lastName.substring(0,1);
            
            if(firstNameCharOne.equals(lastNameCharOne)){
                conObj.Description = 'Initials of the first name and last name are same';
               // conList.add(conObj);
                //System.debug(conObj);
            }
        }+
        System.debug(conRecords);
        update conRecords;
    }
    public void finish(Database.BatchableContext bc){
        // execute any post-processing operations
        System.debug('Bhai Ho Gaya Tumhara kaam');
    }
}