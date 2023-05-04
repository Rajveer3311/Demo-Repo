trigger Opportunity_Trigger on Opportunity (before insert, before update) {
    if(Trigger.isBefore){
        if(Trigger.isInsert){
            Opportunity_Trigger_Handler.isBeforeInsert(Trigger.new, null);
        }
        if(Trigger.isUpdate){
            Opportunity_Trigger_Handler.isBeforeUpdate(Trigger.new, Trigger.oldMap);
        }
    }
}