trigger LeadTrigger on Lead (before insert,After Update,After Insert,After Delete,After Undelete,before update) {
    switch on Trigger.operationType {
   
        When BEFORE_INSERT {
            System.debug('Before Insert');
            LeadTriggerClass.beforeInsert(Trigger.New);
        }
        
        when AFTER_INSERT {
            //System.debug('After Insert');
            
            
        }
        when BEFORE_UPDATE {
            LeadTriggerClass.beforeUpdate(Trigger.New);
        }
    }
}