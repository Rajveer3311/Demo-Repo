/*****************************************************************************************************************
* Name         : TotalOpportunityAmountByMap                                                                     *
* @author      : Rajveer Singh Rawat                                                                             *
* @date        : July 12, 2021                                                                                   *
* @description : Fetch total Opportunity amount on the basis of Account Id..                                     *
******************************************************************************************************************/
public class TotalOpportunityAmountByMap {
    public TotalOpportunityAmountByMap(){
        Map<Id,Decimal> TotalOpportunityMap=new Map<Id,Decimal>();// AccountId,TotalOpportunityAmount
      
        for(AggregateResult oppVal : [select AccountId,Sum(Amount) TotalOpportunityAmount from opportunity GROUP BY AccountId]){
            Decimal v=(Decimal)oppVal.get('TotalOpportunityAmount');
            TotalOpportunityMap.put((Id)oppVal.get('AccountId') , v );
        }
        System.debug(TotalOpportunityMap.Values());
        for(Id agrResult : TotalOpportunityMap.keySet()){
            System.debug('Account Id '+agrResult+'##>'+TotalOpportunityMap.get(agrResult));
        }
        
    }
}