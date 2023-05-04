// when a  account is inserted at most 1 contact insert
/*public class AccountCreateController {
    public Account a{get;set;}
    public Contact b{get;set;}
    public Contact c{get;set;}
    public Contact d{get;set;}
    public List<Contact> conList{get;set;}
    public List<Contact> insertCon{get;set;}
    public AccountCreateController(){
        a = new Account();
        b = new Contact();
        c = new Contact();
        d = new Contact();
        
    }
    public List<Contact> contactAccountId(Id accId){
        System.debug('#############Contact' +accId );
        conList = new List<Contact>();
        b.AccountId = accId;
        c.AccountId = accId;
        d.AccountId = accId;
        if((b.LastName != null) || (d.LastName != null) ||  (c.LastName != null)){
            if(b.LastName != null){
                conList.add(b);  
            }
            if(c.LastName != null){
                conList.add(c);  
            }
            if(d.LastName != null){
                conList.add(d);  
            }
        }
        else{
            ApexPages.addmessage(new ApexPages.message(ApexPages.severity.ERROR,'At Least one Contact is mandatory!😲'));
        }
        return(conList);
    }
    
    public void saveAccount(){
        try{
            System.debug('##########> Account ' + a.Id);
            if(a.Phone == null && a.Website == null){
                ApexPages.addmessage(new ApexPages.message(ApexPages.severity.ERROR,'Please enter either phone or website'));
                
            }
            boolean isUpdate = a.Id != null;
            Insert  a;
            insertCon = contactAccountId(a.Id);
            System.debug('################### insertCon'+insertCon.size());
            if(insertCon.size() >= 1){
                insert insertCon;
            } 
            ApexPages.addmessage(new ApexPages.message(ApexPages.severity.INFO,'Account and contact is inserted😊'));
            system.debug(insertCon);
            a = new Account();
            b = new Contact();
            c = new Contact();
            d = new Contact(); 
            
            // return new Pagereference('/'+a.Id); it reach On Account Page`
            
        }catch(Exception e){
            ApexPages.addmessage(new ApexPages.message(ApexPages.severity.ERROR,e.getMessage()));
        }
        //  return null;
    }
    
}  */

public class AccountCreateController {
    public Account a{get;set;}
    public Contact b{get;set;}
    public Contact c{get;set;}
    public Contact d{get;set;}
    public List<Contact> conList{get;set;}
    public List<Contact> insertCon{get;set;}
    public AccountCreateController(){
        a = new Account();
        b = new Contact();
        c = new Contact();
        d = new Contact();
        
    }
    public List<Contact> contactAccountId(Id accId){
        System.debug('#############Contact' +accId );
        conList = new List<Contact>();
        b.AccountId = accId;
        c.AccountId = accId;
        d.AccountId = accId;
        if((b.LastName != null) || (d.LastName != null) ||  (c.LastName != null)){
            if(b.LastName != null){
                conList.add(b);  
            }
            if(c.LastName != null){
                conList.add(c);  
            }
            if(d.LastName != null){
                conList.add(d);  
            }
        }
        else{
            ApexPages.addmessage(new ApexPages.message(ApexPages.severity.ERROR,'At Least one Contact is mandatory!😲'));
        }
        return(conList);
    }   
    public void saveAccount(){
        try{
            System.debug('##########> Account ' + a.Id);
            boolean isUpdate = a.Id != null;
            Insert  a;
            insertCon = contactAccountId(a.Id);
            System.debug('################### insertCon'+insertCon.size());
            if(insertCon.size() >= 1){
                insert insertCon;
            } 
            ApexPages.addmessage(new ApexPages.message(ApexPages.severity.INFO,'Account and contact is inserted😊'));
            system.debug(insertCon);
            a = new Account();
            b = new Contact();
            c = new Contact();
            d = new Contact(); 
            
            // return new Pagereference('/'+a.Id); it reach On Account Page`
            
        }catch(Exception e){
            ApexPages.addmessage(new ApexPages.message(ApexPages.severity.ERROR,e.getMessage()));
        }
        //  return null;
    }
    
}