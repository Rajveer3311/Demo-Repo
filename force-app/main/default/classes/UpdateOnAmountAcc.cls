public class UpdateOnAmountAcc {
    public Static void afterUpdate(List<Contact> newList,Map<Id,Contact> oldMap){
        System.debug('check');
        for(Contact conObj : newList){
            if(conObj.AccountId != oldMap.get(conObj.Id).AccountId){
                Id oldId = oldMap.get(conObj.Id).AccountId;
                
                TotalAmountOnAccount.onAfterUpdate(oldId); 
            }
            TotalAmountOnAccount.onAfterUpdate(conObj.AccountId);
        }
        
    }
    
}