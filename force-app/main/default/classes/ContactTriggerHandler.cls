public class ContactTriggerHandler {
    public static void onBeforeDelete(List<Contact> oldList){
        for(Contact a : oldList){
            if(!a.Can_be_Deleted__c){ 
                a.addError('You can not delete account record.');    
            }
        }
    } 
    public static void onBeforeInsert(List<Contact> newList){
           Set<String> nameSet = new Set<String>();
           
        ContactHelperClass.NoSameNameContact(newList,null);
    }
    public static void onBeforeUpdate(List<Contact> newList,Map<Id,Contact> oldMap){
           Set<String> nameSet = new Set<String>();
           ContactHelperClass.NoSameNameContact(newList,oldMap);
    }
    

}