public class Soql_Queries {
    public static void Soql_Query(){
        List<Contact> conList=new List<Contact>([select FirstName,LastName from Contact where phone='785241-6200'or LastName='%t']);
        
    }
}