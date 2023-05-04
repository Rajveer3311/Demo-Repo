trigger EventTrigger on Event (before insert,After Insert) {
        switch on Trigger.OperationType{
        when AFTER_INSERT{
            EventTriggerHandlerClass.onAfterInsert(Trigger.New);
        }
     }
}