trigger CreateContactOnAccount on Account (After insert) {
  switch on Trigger.operationType{
        When AFTER_INSERT{
            system.debug('Chal gaya');
            List<Contact> conList = new List<Contact>();
            for(Account acc : Trigger.New) {
                Contact c = new Contact(LastName = 'Tony Kakar' , AccountId = acc.Id);
                conList.add(c);
            }
            insert conList;
        }
    }
}