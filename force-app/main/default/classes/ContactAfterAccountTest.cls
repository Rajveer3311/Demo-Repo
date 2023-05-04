@isTest
public class ContactAfterAccountTest {
    @isTest
    public static void allDataCheck(){
        Account acc = new Account();
        acc.Name = 'Rj';
        insert acc;
        Contact c = new Contact(Lastname = 'Rj Cont Test', AccountId = acc.Id);
        insert c;
    }
}