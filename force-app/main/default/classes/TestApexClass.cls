public with sharing class TestApexClass {
    @AuraEnabled(Cacheable=true)
    public static void methodName(Integer n){
        Integer b = n;
        
    }
    
}