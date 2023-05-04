/*Do a SOQL to get all accounts where the website is not null and fill them in a map 
  where key will be account Id and value will be website.*/
public class AccountFetchBySoql {
    public AccountFetchBySoql(){
        Map<Id,String> storeWebsite=new Map<Id,String>();
        List<Account> accountList=new List<Account>();
        accountList=[select Id, Name, website from Account where website != null];
        for(Account key:accountList){
            storeWebsite.put(key.Id,key.Website);
        }
        System.debug('storeWebsite-------->'+storeWebsite);
    }
}