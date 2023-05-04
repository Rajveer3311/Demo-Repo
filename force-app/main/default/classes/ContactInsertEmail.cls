public class ContactInsertEmail {
    public static void sendMailOnContactInsert(List<Contact> newData){
        List<Contact> listOfInsertedContact = new List<Contact>();
        for(Contact conObj : newData){
            EmailTemplate et = [SELECT Id FROM EmailTemplate WHERE Name = 'On Contact Insert Email Send'];
            System.debug(et);
            List<string> toAddress = new List<string>();
            toAddress.add(conObj.Email);
            Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
            mail.setTemplateId(et.Id);
            mail.setToAddresses(toAddress);
            mail.setTargetObjectId(conObj.Id);
            mail.setWhatId(conObj.Id);
            mail.setSaveAsActivity(false);
            mail.setUseSignature(false);
            List<Messaging.SingleEmailMessage> allmsg = new List<Messaging.SingleEmailMessage>();
            allmsg.add(mail);
            
            try {
                Messaging.sendEmail(allmsg,false);
                return;
            } catch (Exception e) {
                System.debug(e.getMessage());
            }
        }
    }
}