trigger MailingAndOtherAddressSameTrigger on Contact (before Update,before Insert) {
    switch on Trigger.operationType {
        when BEFORE_UPDATE {
            System.debug('Before Update');
            MailingAndOtherAddressSameTriggerClass.onBeforeUpdate(Trigger.New);
        }
        when BEFORE_INSERT {
            System.debug('Before Insert');
            TriggerClassMailingInsert.onBeforeInsert(Trigger.new);
        }
        
        
    }
}