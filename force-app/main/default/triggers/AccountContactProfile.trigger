/* 
Pre-Reqs:
Create a field on Contact called Profile, text, 255

Assignment:
When an Account is updated and the Website is filled in, update all the Profile field on all Contacts to:

Profile = Website + ‘/’ + First Letter of First Name + Last Name */

trigger AccountContactProfile on Account (After Update) {
        Set<Id> setOfAccId = new Set<Id>();
        Account accObj = [Select Id, Website from Account  where id in : trigger.new];
        
            if(accObj.Website != null){
                setOfAccId.add(accObj.Id);
                List<Contact> conList = [Select firstName, lastName, Profile__c from Contact where AccountId =:setOfAccId];
                for (Contact conVar : conList) {
                    conVar.Profile__c = accObj.Website + '/' +conVar.lastName;
                }
                update conList;
            }
        
        
}