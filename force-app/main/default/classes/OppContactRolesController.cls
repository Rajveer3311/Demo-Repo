public class OppContactRolesController {
   // public List<opportunity> oppList{get;set;}
    public List<opportunityContactRole> oppContRoleList{get;set;}
    public OppContactRolesController(){}
    public OppContactRolesController(ApexPages.StandardController sc){
       // oppList = [SELECT Name, Owner.Name, amount, closeDate, AccountId, StageName, leadSource, TotalOpportunityQuantity, probability from Opportunity Limit 1];
        oppContRoleList = [SELECT Contact.id, Role FROM OpportunityContactRole Limit 1	];
    }
}