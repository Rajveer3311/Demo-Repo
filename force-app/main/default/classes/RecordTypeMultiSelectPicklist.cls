/******************************************************************************
* RecordTypeMultiSelectPicklist -- RecordTypeMultiSelectPicklist class are calling from customMultiSelectPicklist 
*                                  LWC component to get multiselect picklist value based on recordType.
*                    
* @Author: Rajveer Singh Rawat
* @Date: 01/03/2023 
*  
******************************************************************************/
global with sharing class RecordTypeMultiSelectPicklist 
{  
    @AuraEnabled(cacheable=false)
    public static List<PicklistSelectOptions> traverseAllFields(String recordTypeId, String objectName, String fieldName) 
    {
        //Calling DependentPicklistController class method to get picklist value
        List<String> listOfAvailableAudiencePicklist = RecordTypePicklistController.getPicklistValues(recordTypeId,objectName,fieldName);
        List<PicklistSelectOptions> listOfAvailableOptions = new List<PicklistSelectOptions>();
        
        for(String op : listOfAvailableAudiencePicklist) 
        {
            listOfAvailableOptions.add(new PicklistSelectOptions(op, op));
        }
        return listOfAvailableOptions;    
    }
}