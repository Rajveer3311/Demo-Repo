trigger ContactDelete on Contact (before DELETE) {
      switch on Trigger.operationType {
           when BEFORE_DELETE {
            System.debug('Before Delete');
            ContactTriggerHandler.onBeforeDelete(Trigger.old);
        }

      }
}