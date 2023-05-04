/*****************************************************************************************************************
* Name         : MonthNameByMap                                                                     
* @author      : Rajveer Singh Rawat                                                                             
* @date        : July 12, 2021                                                                                   
* @description : Create a method that takes month name and return its numeric value for example 
For January => 1, For May => 5.                                   
******************************************************************************************************************/
public class MonthNameByMap {
    Static Map<String,Integer> monthMap = new Map<String,Integer>(); // month Name ,month number

    public static void monthName(String month){
    List<String> monthNameList = new List<String>{'january','february','march','april','may','june','july','august','september','october','november','december'};

            Integer i = 1;
        for(String monName : monthNameList){
            monthMap.put(monName,i);
            i++;
        }   
        if(monthMap.containsKey(month)){
            System.debug(monthMap.get(month)); 
        }
}
    public static void datePara(String dat){
        Integer mondate ; 
        String delimiters = ' ';
        String firstSplit = dat.substringBefore(delimiters);
        String lowerCaseString = firstSplit.toLowercase();
        
        if(monthMap.containsKey(lowerCaseString)){
          mondate = monthMap.get(lowerCaseString);
        }
        
        String lastSplits = dat.substringAfter(delimiters);
        String lastFirstSplit = lastSplits.substringBefore(delimiters);
        String AfterLastSplits = lastSplits.substringAfter(delimiters);
        String dateValue = mondate + '/' + lastFirstSplit + '/' + AfterLastSplits;
        Date convertDate = date.parse(dateValue);//Date.valueOf(dateValue);
        System.debug('String is convert in date #########>'+convertDate);
     //   System.debug(lowerCaseString);
       // System.debug(monthMap.values());
    }
}