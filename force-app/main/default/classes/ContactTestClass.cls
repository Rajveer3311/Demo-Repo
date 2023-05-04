@isTest
public class ContactTestClass {
    @isTest
    public static void checkData(){
        Contact cObj = new Contact(LastName = 'Rj Test Class',Phone = '8999988889');
        insert cObj;
        cObj.Phone = '8890979672';
        update cObj;
    }
}