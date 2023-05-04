public class MailingAndOtherAddressSameTriggerClass {
    public static void onBeforeUpdate(List<Contact> newList){
        for(Contact a : newList){
            if( a.Mailing_and_Other_Address_Same__c){
                a.OtherStreet = a.MailingStreet; 
                a.OtherCity = a.MailingCity;
                a.OtherCountry = a.MailingCountry;
                a.OtherPostalCode = a.MailingPostalCode ;
                a.OtherState = a .MailingState;
            }
            if(a.MailingAddress == a.OtherAddress){
               
            }
        }
        
    }
}