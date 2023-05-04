/*****************************************************************************************************************
* Name         : AccountTrigger
* @author      : Rj-Rajveer
* @date        : July 15, 2021
* @description : Account ownership is private then billing country not null...
******************************************************************************************************************/
trigger AccountTrigger on Account (before update,before insert,before delete,after update) {
    switch on Trigger.operationType {
        when BEFORE_UPDATE {
            //System.debug('Before Update');
            //AccountTriggerClass.onBeforeUpdate(Trigger.New);
        }
        when BEFORE_INSERT {
            //System.debug('Before Insert');
            //TriggerClassMailingInsert.onBeforeInsert(Trigger.new);
        }
        when before_DELETE {
            //AccountTriggerClass.deleteRecycleBinRecord(Trigger.oldMap);
        } 
        when after_UPDATE{
          //  AccountTriggerClass.deleteRecycleBinRecord(Trigger.oldMap);
          AccountTriggerClass.deleteContact(Trigger.new, Trigger.oldMap);
        }
    }
}