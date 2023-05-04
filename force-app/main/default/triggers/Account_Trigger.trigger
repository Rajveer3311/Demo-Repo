/**
*  Description     :  Here we are performing operation on Account Rating and populate Account Number field ..
*
*  Created By      :  Rajveer Singh Rawat
*
*  Created Date    :  1 March 2022
*
*  Revision Logs   :  V1.0 - Created - Rajveer Singh Rawat
*                     
*
**/

trigger Account_Trigger on Account (before insert,after insert,before update, after update,before delete) {
    // Calling AccountTriggerHelper class method validateRecord
 /*   if(Trigger.isBefore){
        if(Trigger.isInsert || Trigger.isUpdate){  
            AccountTriggerHelper.allValidateRecordsOperation(Trigger.new,Trigger.oldMap);
            AccountTriggerHelper.allCheckInActiveReasonOperation(Trigger.new,Trigger.oldMap);
        }
        if(Trigger.isDelete){
            AccountTriggerClass.deleteRecycleBinRecord(Trigger.oldMap);
        }
    }  
    
    if(Trigger.isAfter){
        if(Trigger.isInsert || Trigger.isUpdate){  
            AccountTriggerHelper.allContactDetailsOperation(Trigger.new,Trigger.oldMap);
        }
        
    }*/
}