public class ContactRecorrdInsertClass {
    public contact c {get;set;}
    
    public ContactRecorrdInsertClass(){
        c = new Contact();
        
    }
    public void saveContact(){
        INSERT c;
    }
}