public class AccountTriggerUpdateContactClass {
    public static void onAfterUpdate(List<Account> accList, Map<Id,Account> oldList){
       // Map<Id,Account> acMap = new Map<Id,Account>();
            for(Account accObj : accList){
                List<Contact> conList = new List<Contact>();
                for(Contact conObj : [select Id from Contact Where AccountId = :accObj.Id]){
                    if(accObj.Ownership == 'Private'){
                        Account acc = oldList.get(accObj.Id);
                        conObj.MailingCity = acc.BillingCity;
                        conObj.MailingState = acc.BillingState;
                        conObj.MailingPostalCode = acc.BillingPostalCode;
                        
                    }
                    conList.add(conObj);
                }	
                if(conList.Size()>0){
                    Update conList;
                }
            }
    }
}