public with sharing class DisplayOrdersOnAccountCtrl {

    //Use @AuraEnabled to enable client- and server-side access to the method
    @AuraEnabled
    public static List<Account> displayOrderRecord(Id recordId) {
        return [Select Id , (Select ContractId FROM Orders) FROM Account ];
    }
}