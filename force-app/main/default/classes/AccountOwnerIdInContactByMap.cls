/*****************************************************************************************************************
* Name         : AccountOwnerIdInContactByMap                                                                     *
* @author      : Rajveer Singh Rawat                                                                              *
* @date        : July 12, 2021                                                                                    *
* @description : Query all contact records and create a Map where the key is contact Id and value is Account owner Id.                                  *
******************************************************************************************************************/
public class AccountOwnerIdInContactByMap {
    public AccountOwnerIdInContactByMap(){
        Map<ID,ID> conAccId = new Map<ID,ID>();   // Contact Id, Account Id
        for(Contact conObj : [Select AccountId,Id,Account.OwnerId from Contact where AccountId != null]){
            conAccId.put(conObj.Id,conObj.Account.OwnerId);
        }
      //  System.debug(conAccId);
        for(Id getVal : conAccId.keySet()){
            System.debug('Contact Id-->' + getVal + 'Account owner Id -->' + conAccId.get(getVal));
        }
    }
}