/******************************************************************************
* RecordTypePicklistController -- This RecordTypePicklistController is used to get record type based value of multiselect picklist  
*                    
* @Author: Rajveer Singh Rawat
* @Date: 01/03/2023 
*  
******************************************************************************/
public class RecordTypePicklistController {
    /* Making callout to the UI API to get the list of available picklist values based on the selected recordtype  */
    @AuraEnabled
    public static string[] getPicklistValues(string recordTypeId, string ObjectApiName,string fieldApiName){
        
        string[] piclistValues=new string[]{};
            string BaseUrl=system.Url.getOrgDomainUrl().toExternalForm();
        
        httprequest request=new httprequest();
        request.setMethod('GET');
        request.setEndpoint(BaseUrl+'/services/data/v44.0/ui-api/object-info/'+ObjectApiName+'/picklist-values/'+recordTypeId+'/'+fieldApiName);
        request.setHeader('Authorization', 'Bearer ' + getSessionIdFromVfPage());
        request.setHeader('Content-Type','application/json; charset=UTF-8');
        request.setHeader('Accept','application/json');
        
        http http = new http();
        httpresponse response=http.send(request);
        picklistWrapper obj=new picklistWrapper();
        obj=(picklistWrapper)JSON.deserialize(response.getBody(), picklistWrapper.class);
        
        for(piclistValues pickVal:obj.values){
            piclistValues.add(pickVal.value.unescapeHtml4());
            system.debug('picklist value--> '+ pickVal.value);
        }
        return piclistValues;
    }
    
    //Getting the session Id from the VF page to make the callouts
    private static string getSessionIdFromVfPage(){
        PageReference visualforcePage = Page.SessionIdPage;
        String content;
        try{
            content = visualforcePage.getContent().toString();
        }
        catch(VisualforceException e){
            content='STARTSESSIONID'+userinfo.getSessionId()+'ENDSESSIONID';
        }
        Integer s = content.indexOf('STARTSESSIONID') + 'STARTSESSIONID'.length();
        Integer e = content.indexOf('ENDSESSIONID');
        
        return content.substring(s, e);
    }
    
    //Wrapper class to handle the JSON response
    public class picklistWrapper{
		@AuraEnabled public piclistValues[] values;
	}
    //Wrapper class to handle the JSON response
    public class piclistValues {
        @AuraEnabled public String label;	
		@AuraEnabled public String value;
    }
}