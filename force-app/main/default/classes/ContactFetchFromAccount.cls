public class ContactFetchFromAccount {
    set<Id> idSet = new set<Id>();
    public ContactFetchFromAccount(){
        for(Contact accObj : [select AccountId,Account.Name,Account.Rating from contact where AccountId != null]){
            System.debug(accObj.AccountId);
            idSet.add(accObj.AccountId);
            Account acc = [Select Name from Account Where Id = :accObj.AccountId];
           // for()
            
        }
    }
}