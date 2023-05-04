public class ContactTest {
    public static void testMethods(){
        List<Contact> conObj = [Select Id, Name, phone from Contact Limit 10];
        List<Contact> conObj2 = new List<Contact>();
        System.debug(conObj);
        for(Contact c : conObj){
            c.phone = '9829273311';
            conObj2.add(c);
            if(conObj.size() > 0){
                Update conObj2;
                System.debug(conObj2);
            }
            else{
                System.debug('List is Empty!');
            }
            
        }
    }
}