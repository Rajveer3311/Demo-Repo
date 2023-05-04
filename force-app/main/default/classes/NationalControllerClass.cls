// myPage.vfp 
public class NationalControllerClass {
    
    public List<DataWrapper> ownerDataList {get;set;}
    public Boolean showData {get;set;}
    public String dat {get;set;} 
    public String dat2 {get;set;}
    
    public NationalControllerClass(){
        showData= false;
    }
    public void getDateValue(){
        
        Date sDate = Date.valueOf(dat);
        Date eDate = Date.valueOf(dat2);
        Integer noOfDays = sDate.daysBetween( eDate );
        
        Map<Id,Integer> leadCountByOwnerId = new Map<Id,Integer>();
        Map<Id,AggregateResult> opportunityAggregateResultByOwnerId = new Map<Id,AggregateResult>();
        Map<Id,String> ownerNameById = new Map<Id,String>();
        
        if((sDate < eDate) &&(noOfDays < 31)){
            ownerDataList = new List<DataWrapper>();
            showData = true;
            
            for(AggregateResult lObj : [select owner.Id OwnId, count(id) totalLead
                                        from lead Where 
                                        createdDate <= :eDate AND createdDate >= :sDate group by owner.Id]){
                                            Integer tLead = (Integer)lObj.get('totalLead');
                                            Id leadOwnerId = (Id)lObj.get('OwnId');
                                            leadCountByOwnerId.put(leadOwnerId, tLead);
                                            ownerNameById.put(leadOwnerId,null);
                                        }
            for(AggregateResult oObj : [select  owner.Id OwnerId, count(id) totalOpp, max(CreatedDate) maxRecentDate from Opportunity 
                                        Where StageName = 'Closed Won' group by owner.Id]){
                                            
                                            Id oppOwnerId = (Id)oObj.get('OwnerId');
                                            opportunityAggregateResultByOwnerId.put(oppOwnerId, oObj);
                                            ownerNameById.put(oppOwnerId,null);
            }
            for(User u : [SELECT id, Name FROM User WHERE Id IN :ownerNameById.keySet() ]){
                ownerNameById.put(u.Id, u.Name);
            }
            // Filling the data in wrapper 
            for(Id ownerId : ownerNameById.keySet()){
                DataWrapper ownerData = new DataWrapper();
                ownerData.ownerName = ownerNameById.get(ownerId);
                ownerData.leadCount = leadCountByOwnerId.get(ownerId);
                
                AggregateResult opportunityAggregateResult = opportunityAggregateResultByOwnerId.get(ownerId);
                if(opportunityAggregateResult != null){
                    ownerData.oppCount = (Integer)(opportunityAggregateResult.get('totalOpp') == null ? 0 :opportunityAggregateResult.get('totalOpp'));
                    ownerData.maxCreatedDate = (datetime)opportunityAggregateResult.get('maxRecentDate');
                }
                
                ownerData.conversionRate = 100.00;
                ownerDataList.add(ownerData);
            }
        }
        else{
            System.debug('Date should be less than 31 !');
        }
    }
    // Wrapper Class
    public class DataWrapper{
        public String ownerName {get;set;}
        public Integer leadCount {get;set;}
        public Integer oppCount {get;set;}
        public Datetime maxCreatedDate {get;set;}
        public Decimal conversionRate {get;set;}
    }
}