public class TaskTriggerHelperClass {
    public Static void AllTriggerEvent(List<Task> newList,map<Id,Task> oldMap){
        set<Id> opportunityId = new Set<Id>();
        for(Task oppIds : newList ){
            System.debug(oppIds);
            Boolean isChangeOrNot = oldMap == Null || oppIds != oldMap.get(oppIds.Id);
            String oppId = String.valueof(oppIds.WhatID);
            System.debug(oppId);
            if(isChangeOrNot){
                
                if(oppId.startsWith('006')){
                    Opportunity oppObj = new Opportunity(Id =oppIds.WhatID); 
                    oppObj.Last_Activity_Date_Time__c = System.now(); 
                    Update oppObj;
                }
                
            }     
            System.debug(oppId);
        }
    }
}