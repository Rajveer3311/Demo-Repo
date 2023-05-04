/*First fetch account then case
Map<accountId, Map<caseStatus,Case Count>>
Map<Id, Map<String,Integer>>()
Map<contactId, Map<caseStatus,Case Count>>
*/
public class CaseStatusonAccount {
    public CaseStatusonAccount(){
        Map<Id, Map<String,Integer>> accountIdMap=new Map<Id, Map<String,Integer>>();
        List<Account> accList=[select name,(select AccountId,status from cases ) from Account];
        Map<String,Integer> statusMap=new Map<String,Integer>();
        for(Account accObj:accList){
            statusMap=new Map<String,Integer>();
            for(case caseObj:accObj.cases){
                if(statusMap.containsKey(caseObj.status)){
                    Integer getValue= statusMap.get(caseObj.status)+1;
                    statusMap.put(caseObj.status,getValue);
                }
                else{
                    statusMap.put(caseObj.status,1);
                }
            }
            
            
            
            accountIdMap.put(accObj.Id,statusMap);
        }
        //isko mt dekhna
     //   System.debug('Id  ##> '+accountIdMap);
      //  for(Id a : accountIdMap.keySet()){
            //System.debug('Id '+a+'##> '+accountIdMap);
      //  }
    }
}