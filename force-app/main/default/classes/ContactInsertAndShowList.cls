public class ContactInsertAndShowList {
    public Contact b{get;set;}
    public List<Contact> conList{get;set;}
    public List<Contact> lastWeekList{get;set;}
    public List<Contact> thisWeekList{get;set;}
    
    public ContactInsertAndShowList(){
        b = new Contact();
        conList = new List<Contact>(); 
        
        lastWeekList =[Select firstName,lastName,email from Contact where CreatedDate > LAST_WEEK Limit 5];
        thisWeekList=[Select firstName,lastName,email from Contact where CreatedDate > THIS_WEEK Limit 5];
    }
    public void saveAccount(){
        Insert b;
        
        conList.add(b);
      //  conList =[SELECT firstName,lastName,email FROM Contact WHERE CreatedDate > TODAY];
        system.debug('###########'+conList);
        b = new Contact();
    }
}