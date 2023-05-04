/*****************************************************************************************************************
* Name         : LatestOpportunityOnAccountBYMap                                                                     
* @author      : Rajveer Singh Rawat                                                                             
* @date        : July 12, 2021                                                                                   
* @description : Fetch total Opportunity on the basis of last modified date                                    
******************************************************************************************************************/
public class LatestOpportunityOnAccountBYMap {
    public LatestOpportunityOnAccountBYMap(){
        Map<Id,Object> LastModifiedOppMap = new Map<Id,Object>();// AccountId,Last modified Opportunity
        for(AggregateResult oppVal : [select AccountId,Max(LastModifiedById) LatestOpportunity from opportunity GROUP BY AccountId]){
            
            LastModifiedOppMap.put((Id)oppVal.get('AccountId') , oppVal );
        }
        System.debug(LastModifiedOppMap);
        
        for(Id agrResult : LastModifiedOppMap.keySet()){
            System.debug('Account Id '+agrResult+'##>' + LastModifiedOppMap.get(agrResult));
        }
    }
}