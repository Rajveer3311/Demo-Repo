public class Function {
    public List<Account> accList{get;set;}
    public Function(){
        accList = [Select Id, Name from Account limit 10];
    }
}