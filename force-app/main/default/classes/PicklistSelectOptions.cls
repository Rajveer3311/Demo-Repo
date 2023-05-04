public without sharing class PicklistSelectOptions 
{    
    @AuraEnabled
    public String label { get; set; }
    
    @AuraEnabled
    public String value { get; set; }
    
    public PicklistSelectOptions(String value, String label) 
    {
        this.value = value;
        this.label = label;
    }
}