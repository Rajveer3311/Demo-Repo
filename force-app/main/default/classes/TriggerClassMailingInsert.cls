public class TriggerClassMailingInsert {
        public static void onBeforeInsert(List<Contact> newList){
        MailingAndOtherAddressSameTriggerClass.onBeforeUpdate(newList);
      }
}