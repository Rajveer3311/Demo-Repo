//SOBJECTS
public class sObjectUpdateValue{
    public Account accObj{get;set;}
    public Decimal count{get;set;}
    public List<Account> accountList{get;set;}
    
    public sObjectUpdateValue(){
        count=0;
        accObj = new Account();
        /*accObj.Name = 'Test ';
        accObj.Phone = '1231231234';
        accObj.SLAExpirationDate__c =System.today();
        */
        accObj = [
            SELECT Id, Name, Phone, SLAExpirationDate__c
            FROM Account 
            Where Name = 'University of Arizona edited 2'
            LIMIT 1
        ];
        
        accountList = [
            SELECT Id, BillingCity, Name, Phone,SLAExpirationDate__c,(SELECT Name,Email,Phone FROM Contacts) 
            FROM Account
            LIMIT 10
        ];
    }
    
    public void updateAccountDetails(){
        System.debug('accObj.Name' + accObj.Name);
        System.debug('accObj.Phone' + accObj.Phone);
        System.debug('accObj.SLA' + accObj.SLAExpirationDate__c);
        
        UPDATE accObj;
    }
}