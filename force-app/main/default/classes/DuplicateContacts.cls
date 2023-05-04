/**
*  Description     :  Contact_Trigger Helper class
                      Prevent Duplicate contact from email or phone ...
*
*  Created By      :  Rajveer Singh Rawat
*
*  Created Date    :  24 March 2022
*
*  Revision Logs   :  V1.0 - Created - Rajveer Singh Rawat
*				      
*
**/
public class DuplicateContacts {
    public static void duplicateContactPrevent(List<Contact> newData){
        System.debug('Hii--1');
        Set<String> setOfEmail = new Set<String>();
        Set<String> setOfPhone = new Set<String>();
        Set<String> setOfExistEmail = new Set<String>();
        Set<String> setOfExistPhone= new Set<String>();
        for(Contact conObj : newData){
            setOfEmail.add(conObj.Email);
            setOfEmail.add(conObj.Phone);
        }
        System.debug('Hii--2');
        List<Contact> listOfContact = [Select Name,Email,Phone from Contact Where Email IN:setOfEmail OR Phone IN:setOfPhone];
        for(Contact existCon : listOfContact){
            setOfExistEmail.add(existCon.Email);
            setOfExistPhone.add(existCon.Phone);
        }
        System.debug('Hii--3');
        for(Contact con : newData){
            System.debug(setOfExistEmail.contains(con.Email));
            if(setOfExistEmail.contains(con.Email) || setOfExistPhone.contains(con.Phone)){
                con.addError('Duplicate Email or Phone !!');
            }
         }
    }
}