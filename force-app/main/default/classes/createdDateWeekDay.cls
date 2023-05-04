/*Do a SOQL to get all accounts and group them by their createdDate’s weekdayEEE
String weekDay = a.createdDate.format('EEEE');*/
public class createdDateWeekDay {
    public createdDateWeekDay(){
        
        Map<String,List<Account>>  createdDateMap = new Map<String,List<Account>>();
        List<Account> accList=new List<Account>();
        accList=[select Name,createdDate from Account where createdDate!=null  ];   //Account list
        for(Account accObj:accList){
            String dayOfWeek = accObj.createdDate.format('EEEE');
            
            if(createdDateMap.containsKey(dayOfWeek)){ 
                createdDateMap.get(dayOfWeek).add(accObj);
            }else{
                createdDateMap.put(dayOfWeek,new List<Account> {accObj});
            }
        }
        
        for(String days : createdDateMap.keySet()){
            System.debug('#####> days ' + days + ' Total Accounts ' + createdDateMap.get(days).size());
        }
        System.debug('#########> createdDateMap ' + createdDateMap);
    }
}