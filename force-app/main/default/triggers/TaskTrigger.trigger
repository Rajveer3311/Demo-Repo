/*Create a datetime field on the Opportunity, Last Activity Date (Datetime)
Update this field with the most recent activity on the Opportunity, Activities 
includes Log a call, email, task etc.*/
trigger TaskTrigger on Task (After Update,After Insert,After Delete,After Undelete,before Insert) {
    switch on Trigger.OperationType{
        when AFTER_INSERT{
            TaskTriggerHandlerClass.onAfterInsert(Trigger.New,Trigger.oldMap);
        }
    }
}