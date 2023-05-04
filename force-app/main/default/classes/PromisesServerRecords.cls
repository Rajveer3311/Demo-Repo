public class PromisesServerRecords {
    
    @AuraEnabled(cacheable=true)
    public static List<Contact> getAccountContactRecord(){
        return [Select Id, Name from Contact Where AccountId = '0015g00000DNnWOAA1'];
    }
    @AuraEnabled(cacheable=true)
    public static List<Opportunity> getAccountoppRecord(){
        System.debug('hii');
        return [Select Id, Name from Opportunity Where AccountId = '0015g00000DNnWOAA1'];
    }
    @AuraEnabled(cacheable=true)
    public static List<Case> getAccountCaseRecord(){
        return [Select Id, CaseNumber from Case Where AccountId = '0015g00000DNnWOAA1'];
    }

}