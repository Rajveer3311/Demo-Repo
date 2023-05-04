/*Create a datetime field on the Opportunity, Last Activity Date (Datetime)
Update this field with the most recent activity on the Opportunity, Activities 
includes Log a call, email, task etc.*/
public class EventTriggerHandlerClass {
    public static void onAfterInsert(List<Event> newList){
        set<Id> opportunityId = new Set<Id>();
        for(Event oppIds : newList ){
            String oppId = String.valueof(oppIds.WhatID);
            if(oppId.startsWith('006')){
                Opportunity oppObj = new Opportunity(Id =oppIds.WhatID); 
                oppObj.Last_Activity_Date_Time__c = System.now(); 
                Update oppObj;
            }
            
          //  System.debug(oppId);
        }
    }
}