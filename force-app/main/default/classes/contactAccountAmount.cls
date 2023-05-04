public class contactAccountAmount {
    public contactAccountAmount() {
        List<Contact> contList=new List<Contact>();
        List<String> accList1=new List<String>();
        contList=[select accountId from contact];
        for(Contact contVal:contList){
            accList1.add(contVal.accountId);
        }
        
        
    }
}