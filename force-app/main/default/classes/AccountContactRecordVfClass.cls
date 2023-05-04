public class AccountContactRecordVfClass {
   public List<Account> accountList{get;set;}
    public AccountContactRecordVfClass(){
        accountList = [
            SELECT Id, BillingCity, Name, Phone,SLAExpirationDate__c,(SELECT Name,Email,Phone FROM Contacts) 
            FROM Account
            LIMIT 10
        ];
    }
}