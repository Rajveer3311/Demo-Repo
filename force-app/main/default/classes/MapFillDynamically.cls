public class MapFillDynamically {
    public static void fillMap(){
        
        Map<Map<String, Map<String,Account>>,Map<String,Map<Account,Map<Account,List<Contact>>>>> grandNestedMap = new Map<Map<String, Map<String,Account>>,Map<String,Map<Account,Map<Account,List<Contact>>>>>(); 
        
        Map<String,Account> mapOfKeyVal = new Map<String,Account>();
        Map<String, Map<String,Account>> mapOfKey = new Map<String, Map<String,Account>>();
        Map<Account,List<Contact>> mapOfAccountContact = new Map<Account,List<Contact>>();
        Map<Account,Map<Account,List<Contact>>> mapOfAccountOfAccountContact = new Map<Account,Map<Account,List<Contact>>>();
        Map<String,Map<Account,Map<Account,List<Contact>>>> mapOfValueStringOfAccountContact = new Map<String,Map<Account,Map<Account,List<Contact>>>>();
        
        List<Account> listOfAccountAndContact = [Select Name, (Select Name from Contacts) From Account Limit 1];
        for(Account accObj : listOfAccountAndContact){ 
            
            mapOfKeyVal.put(accObj.Name,accObj);
            mapOfKey.put(accObj.Name,mapOfKeyVal);
            mapOfAccountContact.put(accObj,accObj.Contacts);
            mapOfAccountOfAccountContact.put(accObj,mapOfAccountContact);
            mapOfValueStringOfAccountContact.put(accObj.Name,mapOfAccountOfAccountContact);
            grandNestedMap.put(mapOfKey,mapOfValueStringOfAccountContact);
            System.debug(grandNestedMap);
        }
        
    }
}