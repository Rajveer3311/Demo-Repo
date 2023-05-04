/**
*  Description     :  Contact_Trigger class
*                     Here we are performing operation on Contact Trigger total Active and inactive contacts acc to status field on contact..
*
*  Created By      :  Rajveer Singh Rawat
*
*  Created Date    :  2 March 2022
*
*  Revision Logs   :  V1.0 - Created - Rajveer Singh Rawat
*                     
*
**/
trigger Contact_Trigger on Contact (before insert, after insert,before update, after update, after delete, after undelete) {
    System.debug('Hii');
    if(Trigger.isBefore){
        if(Trigger.isInsert || Trigger.isUpdate){
            ContactTriggerHelper.duplicateContactPrevent(Trigger.New,Trigger.oldMap);
        }
    }
    // it will go in after case
    if(Trigger.isAfter){
        // it will run in update case
        if(Trigger.isUpdate){
            System.debug('Check Department');
           ContactTriggerHelper.allContactTriggerOperation(Trigger.new,Trigger.oldMap);
           ContactTriggerHelper.checkDepartment(Trigger.new,Trigger.oldMap);
        }
        // it will run in insert case
        if(Trigger.isInsert){
            ContactTriggerHelper.allContactTriggerOperation(Trigger.new,Trigger.oldMap);
            ContactTriggerHelper.sendMailOnContactInsert(Trigger.New);
            ContactTriggerHelper.checkDepartment(Trigger.new,Trigger.oldMap);
        }
        // it will run in delete or undelete case
        if(Trigger.isDelete || Trigger.isunDelete){
            ContactTriggerHelper.allContactTriggerOperation(Trigger.new,Trigger.oldMap);
        }
        
    }
}