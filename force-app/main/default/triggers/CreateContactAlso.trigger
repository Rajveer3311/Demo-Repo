trigger CreateContactAlso on Account (after insert) {
    switch on trigger.operationType{
        When AFTER_INSERT{
            List<Contact> coList = new List<Contact>();
            for(Account acc : Trigger.new){
            Contact con = new Contact(FirstName = 'Rajveer', AccountId = acc.Id);
            coList.add(con);
            }
            if(coList.size() > 0){
                Insert coList;
            }
       }
    }
}