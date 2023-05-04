/*
Main Trigger
After INSERT
new list, collect AccoutIds
pass account ids to the Do Rollup method

After Update
new List and old Map, collect account ids
if Account Id updated
a) Collect Current AccountId
b) Collect Old AccountId
If Amount X/Y changed
pass account ids to the Do Rollup method

After Delete
old List, collect account ids
pass account ids to the Do Rollup method

After Undelete
new list, collect AccoutIds
pass account ids to the Do Rollup method


Do Rollup
static method to update the account
Param = AccountIds
*/

public class TotalAmountOnAccount {
 /*  public static void onAfterInsert(List<Contact> newList,Map<Id,contact> oldMap){
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
        
    } */
   
       public static void onAfterUpdate(Id oldAccId){
           List<sObject> IdList = new List<sObject>();
        for(AggregateResult conRes : [Select AccountId, Sum(Amount_x__c)totalAmountx,Sum(Amount_y__c)totalAmounty from contact 
                                      Where  AccountId = :oldAccId Group By AccountId]){
                                          Account accObj = new Account(Id = (Id)conRes.get('AccountId'));
                                          Decimal totAmountX= (Decimal)conRes.get('totalAmountx');
                                          Decimal totAmountY= (Decimal)conRes.get('totalAmounty');
                                          accObj.Total_Amount_X__c = totAmountX;
                                          accObj.Total_Amount_Y__c = totAmountY;
                                          IdList.add(accObj);
        }
           if(IdList.Size() > 0){
            update IdList; 
        } 
    }

}