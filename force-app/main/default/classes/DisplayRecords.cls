public class DisplayRecords {
    public static List<Account> accList{get;set;}
    public static List<Contact> conList{get;set;}
    //public static Contact con{get;set;}
    public static String accId{get;set;}
    public DisplayRecords(){
        methodOne();
    }
    public static void methodOne(){
        accList = new List<Account>(); 
        accList = [SELECT Name , Website FROM Account WHERE Website != NULL LIMIT 10];
        system.debug('account list is'+accList);
    }
    
    public static void methodTwo(){
        System.debug('Testing');
        conList = new List<Contact>(); 
        conList = [SELECT Name FROM Contact WHERE AccountId = :accId ];
        system.debug('account list is'+conList);
    }
    
    
}