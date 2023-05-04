public class ReduceBeglyCode {
    public static void changeContactOwner(List<Contact> listNewValues) {
        
        Map<Id, Id> accountOwnerMap = New Map<Id, Id>();
        Set<Id> setAccountId = New Set<Id>();
        for (Contact cnt : listNewValues) {
            setAccountId.add(cnt.AccountId);
            
        }
        for (Account acc : [Select Id, OwnerId from Account where Id in :setAccountId]){
            If (!(accountOwnerMap.containskey(acc.Id))){
                accountOwnerMap.put(acc.Id, acc.OwnerId);
            }
        }
        for (Contact cnt : listNewValues) {
            if (accountOwnerMap.get(cnt.AccountId) != null) {
                cnt.OwnerId = AccountOwnerMap.get(cnt.AccountId);
            }
        }
    }
}