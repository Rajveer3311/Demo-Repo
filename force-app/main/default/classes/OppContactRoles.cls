public class OppContactRoles {
    public List<opportunity> oppList{get;set;}
    public List<opportunityContactRole> oppContRoleList{get;set;}
    public OppContactRoles(){
        oppList = [SELECT Name, Owner.Name, amount, closeDate, AccountId, StageName, leadSource, TotalOpportunityQuantity, probability from Opportunity];
        oppContRoleList = [SELECT Contact.id, Role FROM OpportunityContactRole];
    }
}