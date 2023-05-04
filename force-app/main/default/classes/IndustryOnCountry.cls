public class IndustryOnCountry {
    public IndustryOnCountry (){
          List<Account> accObj=[select BillingCountry,industry from Account where BillingCountry!=null AND industry!=null];
          Map<String,Integer> countMap=new Map<String,Integer>();
          for(Account accVal:accObj){
              if(countMap.containsKey(accVal.BillingCountry)){
                  Integer getValue=countMap.get(accVal.BillingCountry)+1;
                  countMap.put(accVal.BillingCountry, getValue);
              }
              else{
                  countMap.put(accVal.BillingCountry, 1);
              }
          }
        system.debug(countMap);
        for(String a : countMap.keySet()){
            System.debug('Country--> '+a +'     '+'Total Industry-->'+countMap.get(a));
        }
    }
}