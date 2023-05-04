@isTest
public class CaseOriginTestClass {
    @isTest
    public static void allDataCheck(){
        Case c = new Case();
        c.Origin = 'Email';
        c.Status = 'New';
        c.priority = 'Medium';
        
        insert c;
        
        
    }
}