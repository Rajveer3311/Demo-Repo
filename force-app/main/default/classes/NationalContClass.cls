public with sharing class NationalContClass {
    @AuraEnabled(cacheable=true)
    public AggregateResult getLeadData() {
        return [select owner.name , count(id) from lead group by owner.name];
    }
}