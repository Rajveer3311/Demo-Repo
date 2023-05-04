public with sharing class DynamicObjectAuraController {
    Static String  ObjectApiName ;
    //Use @AuraEnabled to enable client- and server-side access to the method
    @AuraEnabled
    public static String dynamicObject(String objectName) {
        System.debug('**********************objectName'+objectName);
        Map<String,String> apiNamemap = new map<String,String>();
        String objectQuery= 'SELECT Name from '+objectName;
        String listViewQuery = 'Select Name, DeveloperName From ListView Where SobjectType = :objectName';
        List<sObject> listData = Database.query(objectQuery);
        List<ListView>  developerNameListValue = new List<ListView>();
        List<ListView> listViewData = Database.query(listViewQuery);
        for ( Schema.SObjectType o : Schema.getGlobalDescribe().values() )
        {
            Schema.DescribeSObjectResult objResult = o.getDescribe();
            // system.debug( 'Sobject: ' + objResult );
            //system.debug( 'Sobject API Name: ' + objResult.getName() );
            //system.debug( 'Sobject Label Name: ' + objResult.getLabel() ); 
            apiNamemap.put(objResult.getLabel(),objResult.getName());
            
        }
        for(String s : apiNamemap.keySet()){
            if(apiNamemap.containsKey(objectName)){
                ObjectApiName = apiNamemap.get(objectName);
                //System.debug(ObjectApiName);
                break;
            }
        }
        for(ListView s : listViewData){
            developerNameListValue.add(s);
            
        }
        System.debug(developerNameListValue);
        wrapperClass wrapObj = new wrapperClass(ObjectApiName,developerNameListValue);
        System.debug(wrapObj);
       
        return JSON.serialize(wrapObj);
        
        
    }
    // Wrapper Class
    public class wrapperClass{
        String apiName;
        List<ListViewWrapper> wrapperDeveloperNameListValue = new List<ListViewWrapper>();
     //   List<String>  wrapperDeveloperNameListValue = new List<String>();
        public wrapperClass(String apiName, List<ListView> wrapperDeveloperNameListValue){
            
            this.apiName = apiName;
           // this.wrapperDeveloperNameListValue.addAll(wrapperDeveloperNameListValue);
            for(ListView listType : wrapperDeveloperNameListValue){
                this.wrapperDeveloperNameListValue.add(new ListViewWrapper(listType.Name, listType.DeveloperName));
            }
        }        
    }
    class ListViewWrapper{
        String label;
        string value;
        public ListViewWrapper(String label, String value){
            this.label = label;
            this.value = value;
        }
    }
}