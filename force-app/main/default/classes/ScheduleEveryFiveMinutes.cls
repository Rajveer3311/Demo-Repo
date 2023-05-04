/**
*  Description     :  Here we are performing operation on scheduler class for calling batch class 
*
*  Created By      :  Rajveer Singh Rawat
*
*  Created Date    :  24 March 2022
*
*  Revision Logs   :  V1.0 - Created - Rajveer Singh Rawat
*                     
*
**/
public class ScheduleEveryFiveMinutes implements Schedulable {
/**
*  Description     :  This method call ContactDuplicatesBatch method ...
*
*  @args           :  SchedulableContext
*
*  @return         :  No
*
*  Revision Logs   :  V1.0 - Created - 24 March 2022 - Rajveer Singh Rawat
*
**/ 
    public void execute(SchedulableContext ctx) {
        // Call batch class ..
        ScheduleEveryFiveMinutesBatch myBatchObject = new ScheduleEveryFiveMinutesBatch();
        Id batchId = Database.executeBatch(myBatchObject);
    }
}