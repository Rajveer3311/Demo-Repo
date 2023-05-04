public with sharing class testApexDataController {
        @AuraEnabled(cacheable=true)
        public static List<Contact> getContacts() {
            return [
                SELECT firstName, lastName, Phone, Email
                FROM Contact LIMIT 10
            ];
        }
    }