public class ChangeAccountNameByContact {
    public static void checkDepartment(List<Contact> listOfNewContact, Map<Id,Contact> mapOfOldContact){
        List<Contact> listOfContact = new List<Contact>();
        for(Contact conObj : listOfNewContact){
            if(conObj.Department != mapOfOldContact.get(conObj.Id).Department){
                System.debug('Before');
                conObj.Account.Name = conObj.Name + '_' +conObj.Department;
              //  listOfContact.add(conObj);
                System.debug('Changed');
            }
        }
        if(listOfContact.size() > 0){
         //   update listOfContact;
        }
    }
}