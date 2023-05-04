public class ShowContactOnAccount {
    @AuraEnabled(cacheable=true)
    public static List<Contact> getAllContact(String accId){
                System.debug([Select Id, Name from Contact Where AccountId = :accId]);

        return [Select Id, Name from Contact Where AccountId = :accId];
    }
}