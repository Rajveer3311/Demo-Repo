/*****************************************************************************************************************
* Name         : AllOppOnCloseDateByMap                                                                     *
* @author      : Rajveer Singh Rawat                                                                             *
* @date        : July 12, 2021                                                                                   *
* @description : Fetch total Opportunity on the basis of close DAte                                    *
******************************************************************************************************************/
public class AllOppOnCloseDateByMap {
    public AllOppOnCloseDateByMap(){
        Map<Date,List<Opportunity>> closeDateOppMap = new Map<Date,List<Opportunity>>();// AccountId,Last modified Opportunity
        
        for(Opportunity oppVal : [select AccountId,CloseDate from opportunity CloseDate]){
            if(closeDateOppMap.containsKey(oppVal.CloseDate)){
             
                closeDateOppMap.get(oppVal.CloseDate).add(oppVal);
            }
            else{
                closeDateOppMap.put(oppVal.CloseDate,new List<Opportunity>{oppVal});
            }
            
        }
        
        System.debug(closeDateOppMap);
        
        
    }
}