trigger CaseTrigger on Case (before insert,After Update,After Insert,After Delete,After Undelete,before update) {
    switch on Trigger.operationType{
        when AFTER_INSERT{
            // CaseTriggerHandler.onAfterInsert(Trigger.New,Trigger.old);
        }
    }
}