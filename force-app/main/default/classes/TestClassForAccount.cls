public class TestClassForAccount {
    public static void AfterUpdation(List<Contact> newList,Map<Id,Contact> OldMap){
        List<sObject> IdList = new List<sObject>();
        Set<Id> accId = new set<Id>();
        for(Contact accObj : newList){
            accId.add(accObj.AccountId);
        }
        for(AggregateResult conRes : [Select AccountId, Sum(Amount_x__c)totalAmountx,Sum(Amount_y__c)totalAmounty from contact 
                                      Where  AccountId =:accId Group By AccountId]){ 
                                          Account acc = new Account( Id = (Id)conRes.get('AccountId'));
                                          Decimal totAmountX= (Decimal)conRes.get('totalAmountx');
                                          Decimal totAmountY= (Decimal)conRes.get('totalAmounty');
                                          acc.Total_Amount_X__c = totAmountX;
                                          acc.Total_Amount_Y__c = totAmountY;
                                          IdList.add(acc);
                                          System.debug(conRes);
                                      }
        if(IdList.Size() > 0){
            update IdList; 
        }
    }
}