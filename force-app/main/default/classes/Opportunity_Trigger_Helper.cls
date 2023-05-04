/*public class Opportunity_Trigger_Helper {
    public static void allStageTrackingOperation(List<Opportunity> newData, Map<Id,Opportunity> oldMap){
        List<String> listOfNonContainsData = New List<string>();
        List<String> listOfStage = new List<String>();
        List<String> listOfPickListValues= new List<String>();
        
        Schema.DescribeFieldResult fieldResult = Opportunity.StageName.getDescribe();
        List<Schema.PicklistEntry> ple = fieldResult.getPicklistValues();
        System.debug(ple);
        for( Schema.PicklistEntry pickListVal : ple){
            listOfPickListValues.add(pickListVal.getValue());
        } 
        
        for(Opportunity oppObj : newData){
            if(oldMap == null || oldMap.get(oppObj.id).StageName != oppObj.StageName){
                
                if(oppObj.Stage_Traking__c != null){
                    List<String> textParts = oppObj.Stage_Traking__c.split(',');
                    for(String trackValue : textParts){
                        listOfStage.add(trackValue);
                    }  
                    listOfStage.add(oppObj.StageName);
                }
                else{
                    listOfStage.add(oppObj.StageName); 
                }
                for(String pickVal : listOfPickListValues){
                    if(!listOfStage.contains(pickVal)){
                        listOfNonContainsData.add(pickVal);   
                    }
                }
                
                for(Integer i =0; i < listOfNonContainsData.size(); i++){
                    String s = listOfNonContainsData[i];
                    Integer indexVal = listOfPickListValues.indexOf(s);
                    listOfPickListValues.remove(indexVal);
                }
                String space = '';
                for(String ss : listOfPickListValues){
                    space = space + ss +',';
                }
                oppObj.Stage_Traking__c = space;
                
                System.debug('listOfStage'+listOfStage);
                System.debug('listOfPickListValues------------>'+listOfPickListValues);
            }
        }
    }
} */

public class Opportunity_Trigger_Helper {
    public static void allStageTrackingOperation(List<Opportunity> newData, Map<Id,Opportunity> oldMap){
        List<String> listOfNonContainsData = New List<string>();
        List<String> listOfPickListValues= new List<String>();
        Map<Integer,String> mapOfStage = new Map<Integer,String>();
        Schema.DescribeFieldResult fieldResult = Opportunity.StageName.getDescribe();
        List<Schema.PicklistEntry> ple = fieldResult.getPicklistValues();
        System.debug(ple);
        for( Schema.PicklistEntry pickListVal : ple){
            listOfPickListValues.add(pickListVal.getValue());
        } 
        
        for(Opportunity oppObj : newData){
            if(oldMap == null || oldMap.get(oppObj.id).StageName != oppObj.StageName){
                
                if(oppObj.Stage_Traking__c != null){
                    List<String> textParts = oppObj.Stage_Traking__c.split(',');
                    textParts.add(oppObj.StageName);
                    for(String trackValue : textParts){
                        if(listOfPickListValues.contains(trackValue)){
                            Integer indexVal = listOfPickListValues.indexOf(trackValue);
                            mapOfStage.put(indexVal,trackValue);
                        }
                    }  
                }
                else{
                    oppObj.Stage_Traking__c = oppObj.StageName;
                }
                System.debug('mapOfStage Keyset'+mapOfStage.keySet());
                if(mapOfStage.size() > 0){
                    String space = '';
                    for(String dataKey : mapOfStage.Values()){
                        space = space + dataKey +',';
                        System.debug('Space'+space);
                    }
                    oppObj.Stage_Traking__c = space;
                }
                
                System.debug('mapOfStage------------>'+mapOfStage);
            }
        }
        
    }
}