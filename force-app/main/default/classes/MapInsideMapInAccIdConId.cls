/*****************************************************************************************************************
* Name         : MapInsideMapInAccIdConId                                                                     
* @author      : Rajveer Singh Rawat                                                                             
* @date        : July 12, 2021                                                                                   
* @description : Create a Map<Id,Map<Id,Contact>>, group all contacts as Map by the accountId.
*                Map<accountId, Map<ContactId,Contact>>                                    
******************************************************************************************************************/
public class MapInsideMapInAccIdConId {
    public MapInsideMapInAccIdConId(){
        Map<Id,Map<Id,Contact>> AccConMap = new Map<Id,Map<Id,Contact>>(); // Map<accountId, Map<ContactId,Contact>>  
        
        for(Account accObj : [Select Id , (select Id,Name from Contacts ) from Account]){
            Map<Id,Contact> ConMap = new Map<Id,Contact>();
            for(Contact conObj : accObj.Contacts){
                ConMap.put(conObj.Id,conObj);
                AccConMap.put(accObj.Id,ConMap);
            }
        }
        System.debug(AccConMap);
        for(Id getVal : AccConMap.keySet()){
            System.debug('AccId' + getVal + 'Con Id' + AccConMap.get(getVal));
        }
        
    }
}