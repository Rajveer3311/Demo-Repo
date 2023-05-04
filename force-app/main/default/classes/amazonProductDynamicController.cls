public with sharing class amazonProductDynamicController {
    @AuraEnabled(cacheable=true)
    public static List<Product_Images__c> getProductImages(String recId) {
      
       List<Product_Images__c> productList = [SELECT Position__c, Image_Url__c FROM Product_Images__c Where Product_Name__c = :recId ORDER BY Position__c ];
       return productList;
     }  
    
}