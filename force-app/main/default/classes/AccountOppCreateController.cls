public class AccountOppCreateController {
public Account acc{get;set;}
   public Opportunity opp{get;set;}
   public boolean createOpportunity {get;set;}
   
   
   // Constructor
   public AccountOppCreateController(){
       acc = new Account();
       opp = new Opportunity();
       createOpportunity = false;
   }
   
   public pagereference save(){
       INSERT acc;
       if(createOpportunity){
           opp.AccountId = acc.Id;
           INSERT opp;
       }
       return new Pagereference('/'+acc.Id);
       
   }
   public void toggleCreateOpportunity(){
       System.debug('###########> createOpportunity ' + createOpportunity);
       //createOpportunity = !createOpportunity;
   }
}