trigger ContactTrigger on Contact (After Update,before Update,After Insert,After Delete,After Undelete,before Insert) {
       switch on Trigger.operationType {
        when AFTER_UPDATE {
           // System.debug('After Update');
            //MailingAndOtherAddressSameTriggerClass.onBeforeUpdate(Trigger.New);
           // UpdateOnAmountAcc.afterUpdate(Trigger.New,trigger.oldMap);
           // TestClassForAccount.afterUpdation(Trigger.New,Trigger.old);
                             
        }
        //TotalAmountOnAccount go to this class and check it 
        when AFTER_INSERT {
           // System.debug('After Insert');
          //  TotalAmountOnAccount.onAfterInsert(Trigger.New);
        }
        when AFTER_DELETE  {
         //   System.debug('After Delete');
         //   deleteRecordOnContact.afterDelete(Trigger.old);
        }
           when AFTER_UNDELETE  {
            System.debug('After Undelete');
        //    deleteRecordOnContact.afterUnDelete(Trigger.New);
        }
           when BEFORE_INSERT {
               System.debug('Before Insert');
               ContactTriggerHandler.onBeforeInsert(Trigger.New);
           }
           when BEFORE_UPDATE{
               ContactTriggerHandler.onBeforeUpdate(Trigger.New,Trigger.oldMap); 
           }
        
    }
}