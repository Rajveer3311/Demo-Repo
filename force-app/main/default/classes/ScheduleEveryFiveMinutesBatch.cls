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
public class ScheduleEveryFiveMinutesBatch implements Database.Batchable<sObject> {
    
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
        return Database.getQueryLocator('Select Name from Contact Limit 1');
    }
    /**
*  Description     :  This method execute chunks of data for processing...
*
*  @args           :  Database.BatchableContext , List<Contact>
*
*  @return         :  No
*
*  Revision Logs   :  V1.0 - Created - 29 March 2022 - Rajveer Singh Rawat
*
**/     
    public void execute(Database.BatchableContext bc, List<Contact> listOfContactData){
        System.debug(System.now());
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
        DateTime dt = system.now().addMinutes(5);
        String day = string.ValueOf(dt.day());
        String year = string.ValueOf(system.now().year());
        String month = string.ValueOf(dt.month());
        String hour = string.ValueOf(dt.hour());
        String minute = string.ValueOf(dt.minute());
        String second = '00';
        String strJobName = 'ScheduleEveryFiveMinutes-' + year + '-' + day + ' ' + hour + ':' + minute + ':' + second;
        String schCronExp = '00 ' +minute + ' ' +hour + ' ' +day + ' ' +month + ' ?';
        ScheduleEveryFiveMinutes sch = new ScheduleEveryFiveMinutes();
        //String jobID = System.schedule(strJobName, schCronExp, sch);
    }
    
}