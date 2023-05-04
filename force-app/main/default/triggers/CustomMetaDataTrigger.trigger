trigger CustomMetaDataTrigger on Contact (before insert, before update, before delete, after insert, after update, after delete) {
    
    
    Trigger_Handlers__mdt metaData = [Select After_Delete__c, After_Insert__c, After_Undelete__c,
                                      After_Update__c, Before_Insert__c, Before_Update__c from 
                                      Trigger_Handlers__mdt WHERE DeveloperName = 'Contact' LIMIT 1];
    
    if(Trigger.isBefore && Trigger.isInsert && metaData.Before_Insert__c == true) {
        //Before Insert
        System.debug('Before Insert');
    }
    if(Trigger.isAfter && Trigger.isInsert && metaData.After_Insert__c == true) {
        //After Insert
        System.debug('After Insert');
    }
    if(Trigger.isBefore && Trigger.isUpdate && metaData.Before_Update__c == true) {
        //Before Update
        System.debug('Before Update');
    }
    if(Trigger.isAfter && Trigger.isUpdate && metaData.After_Update__c == true) {
        //After Update
        System.debug('After Update');
    }
    if(Trigger.isBefore && Trigger.isDelete && metaData.Before_Delete__c == true) {
        //Before Delete
        System.debug('Before Delete');
    }
    if(Trigger.isAfter && Trigger.isDelete && metaData.After_Delete__c == true) {
        //After Delete
        System.debug('After Delete');
    }
    if(Trigger.isAfter && Trigger.isUndelete && metaData.After_Undelete__c == true) {
        //After Undelete
        System.debug('After Undelete');
    }
    
}