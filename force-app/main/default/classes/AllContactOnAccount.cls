public class AllContactOnAccount {
    public static void childDetails(){
        Map<id,sObject> conMap = new Map<id,sObject>();
        List<Contact> conList = new List<Contact>();
        List<Contact> childDetails = [Select Account.Id, Id ,Name from Contact];
        for(Contact accObj : childDetails){
            conMap.put(accObj.Id,accObj);
        }
    }
}