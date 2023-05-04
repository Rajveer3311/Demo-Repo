public class SearchContactController {
  
   public SearchContactController(){}
   @AuraEnabled(cacheable=true)
   public static List<sObject> getContact(String contactName){
       System.debug('Yaha tk aa rah ahe');
     String name = '%'+contactName+'%';
     String dynamicQuery = 'SELECT ID, NAME, PHONE FROM CONTACT WHERE NAME LIKE :name';
     return Database.query(dynamicQuery);
   }
}