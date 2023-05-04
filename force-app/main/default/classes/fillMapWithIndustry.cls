/*Do a SOQL to get all accounts and group them by industry. Your final outcome will be Map<Industry,List<Account>>*/
public class fillMapWithIndustry{
public fillMapWithIndustry(){
       Map<String,List<Account>>  accountListByIndustry = new Map<String,List<Account>>(); // Map<Country, List<Account>>
       for(Account a : [SELECT Name, Industry FROM Account WHERE Industry != null] ){
           if(accountListByIndustry.containsKey(a.Industry)){ // Country Already Exist
               accountListByIndustry.get(a.Industry).add(a);
           }else{
               accountListByIndustry.put(a.Industry,new List<Account> {a});
           }
       }
       for(String indust : accountListByIndustry.keySet()){
           System.debug('#####> Country ' + indust + ' Total Accounts ' + accountListByIndustry.get(indust).size());
       }
       System.debug('#########> accountListByCountry ' + accountListByIndustry);
   }
    
}