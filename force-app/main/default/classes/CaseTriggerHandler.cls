/*On account we need count of Closed cases, New Cases, Working Cases and Escalated cases
  Either create separate field for each status count or put the count of all cases in a text 
  area field/rich text area field*/
public class CaseTriggerHandler {
    public static void onAfterInsert(List<Case> newList,Map<Id,Contact> oldMap){
        Map<Id,Map<String,Integer>> bigMap = new Map<Id,Map<String,Integer>>();
        Map<String,Integer> statusMap = new Map<String,Integer>();
        
        set<Id> idSet = new set<Id>();
        for(Case caseObj : newList){
            if(caseObj.AccountId!=null){                    
                idSet.add(caseObj.AccountId);
            }
        }
        List<Case> CaseList = [select accountId,status from case where AccountId In :idSet];         
        for(Case caseObj2 : CaseList){
            if(bigMap.ContainsKey(caseObj2.AccountId)){  
                statusMap = bigMap.get(caseObj2.AccountId);
                if(statusMap.containsKey(caseObj2.status)){
                    
                    Integer getValue = statusMap.get(caseObj2.status)+1;
                    statusMap.put(caseObj2.status,getValue);
                    bigMap.put(caseObj2.AccountId,statusMap);
                }
                else{
                    statusMap.put(caseObj2.status,1);
                    bigMap.put(caseObj2.AccountId,statusMap);
                    // bigMap.get(caseObj2.AccountId).put(statusMap);
                    
                }
                
            }
            else{
                statusMap = new Map<String,Integer>();
                statusMap.put(caseObj2.status,1);
                bigMap.put(caseObj2.AccountId,statusMap);
                
            }
        }
        List<Account> d = new List<Account>();
       
        for(Id caseObj3 : bigMap.keySet()){
           Account acc = new Account(Id = caseObj3);
            for(String c : bigMap.get(caseObj3).keySet()){
                if(c == 'Escalated'){
                  
                    acc.Escalated_Cases__c = bigMap.get(caseObj3).get(c);
                  
                }
                else If(c == 'New'){
                  
                    acc.New_Cases__c = bigMap.get(caseObj3).get(c);
                   
                }
                else If(c == 'Working'){
                  
                    acc.Working_Cases__c = bigMap.get(caseObj3).get(c);
                   
                }
                else {
                   
                    acc.Closed_Cases__c = bigMap.get(caseObj3).get(c);
                   
                }
            }
            d.add(acc) ;
            System.debug(d);
            
        }
       update d;       
    }
}