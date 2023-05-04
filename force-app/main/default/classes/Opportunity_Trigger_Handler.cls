public class Opportunity_Trigger_Handler {
    public static void isBeforeInsert(List<Opportunity> newData, Map<Id,Opportunity> oldMap){
        Opportunity_Trigger_Helper.allStageTrackingOperation(newData, oldMap);
    }
    
    public static void isBeforeUpdate(List<Opportunity> newData, Map<Id,Opportunity> oldMap){
        Opportunity_Trigger_Helper.allStageTrackingOperation(newData, oldMap);
    }
}