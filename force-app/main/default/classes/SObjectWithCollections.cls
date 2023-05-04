/**
*  Description     :  Here we will insert sObject values in list, set and map..
*
*  Created By      :  Rajveer Singh Rawat
*
*  Created Date    :  4 Feb 2022
*
*  Revision Logs   :  V1.0 - Created - Rajveer Singh Rawat
*				      
*
**/
public with sharing class SObjectWithCollections {
  
    /**
    *  Description     :  In this method we will insert sObject value in set, map and list by static
    *
    *  @args           :  
    *
    *  @return         :  Void
    *
    *  Revision Logs   :  V1.0 - Created - 4 feb 2022 - Rajveer Singh Rawat
    *				      
    *
    **/  
        public Static void staticSobjectsWithCollection() {
    
            List<List<List<Account>>> threeListOfAccount = new List<List<List<Account>>>();
    
            List<Account> listOfAccount1 = new List<Account>{new Account(Name='Rj'), new Account(Name='Amit'), new Account(Name='Amar'), new Account(Name='Anshul'), new Account(Name='Aamir')};
            
            List<List<Account>> listOfListOfAccount1 = new List<List<Account>>();
            listOfListOfAccount1.add(listOfAccount1);
            listOfListOfAccount1.add(listOfAccount1);
            listOfListOfAccount1.add(listOfAccount1);
            listOfListOfAccount1.add(listOfAccount1);
            listOfListOfAccount1.add(listOfAccount1);
    
            // All List Fill
            threeListOfAccount.add(listOfListOfAccount1);
            threeListOfAccount.add(listOfListOfAccount1);
            threeListOfAccount.add(listOfListOfAccount1);
            threeListOfAccount.add(listOfListOfAccount1);
            threeListOfAccount.add(listOfListOfAccount1);
    
    
            List<List<Contact>> listOfListOfContact = new List<List<Contact>>();
            List<Contact> listOfContact1 = new List<Contact>{new Contact(lastName = 'Contact 1'),new Contact(lastName = 'Contact 2'),new Contact(lastName = 'Contact 3'),new Contact(lastName = 'Contact 4'),new Contact(lastName = 'Contact 5')};
            
            // All Contact List Fill
            listOfListOfContact.add(listOfContact1);
            listOfListOfContact.add(listOfContact1);
            listOfListOfContact.add(listOfContact1);
            listOfListOfContact.add(listOfContact1);
            listOfListOfContact.add(listOfContact1);
    
    
            Map<String, Account> mapOfAccount = new Map<String, Account>();
            mapOfAccount.put('Candidate1',new Account(Name='a'));
            mapOfAccount.put('Candidate2',new Account(Name='b'));
            mapOfAccount.put('Candidate3',new Account(Name='c'));
            mapOfAccount.put('Candidate4',new Account(Name='d'));
            mapOfAccount.put('Candidate5',new Account(Name='e'));
    
            Map<Account, Account> mapOfAccount2 = new Map<Account, Account>();
            mapOfAccount2.put(new Account(Name='one'),new Account(Name='a'));
            mapOfAccount2.put(new Account(Name='two'),new Account(Name='b'));
            mapOfAccount2.put(new Account(Name='three'),new Account(Name='c'));
            mapOfAccount2.put(new Account(Name='four'),new Account(Name='d'));
            mapOfAccount2.put(new Account(Name='five'),new Account(Name='e'));
    
            Map<Account, Contact> mapofAccountContact = new Map<Account, Contact>();
            mapofAccountContact.put(new Account(Name='Ajmer'),new Contact(LastName='Test1'));
            mapofAccountContact.put(new Account(Name='Kishangarh'),new Contact(LastName='Test2'));
            mapofAccountContact.put(new Account(Name='Bhilwarwa'),new Contact(LastName='Test3'));
            mapofAccountContact.put(new Account(Name='Naasik'),new Contact(LastName='Test4'));
            mapofAccountContact.put(new Account(Name='Ludhiyana'),new Contact(LastName='Test5'));
            
            Map<String, List<Account>> mapOfListOfAccount = new Map<String, List<Account>>();
            mapOfListOfAccount.put('key1',listOfAccount1);
            mapOfListOfAccount.put('key2',listOfAccount1);
            mapOfListOfAccount.put('key3',listOfAccount1);
            mapOfListOfAccount.put('key4',listOfAccount1);
            mapOfListOfAccount.put('key5',listOfAccount1);
    
            Map<String, Set<Contact>> mapOfSetOfContact = new Map<String, Set<Contact>>();
            Set<Contact> setOfContact1 = new Set<Contact>{new Contact(lastName = 'Contact 111'),new Contact(lastName = 'Contact 211'),new Contact(lastName = 'Contact 311'),new Contact(lastName = 'Contact 411'),new Contact(lastName = 'Contact 511')};
    
            mapOfSetOfContact.put('key1',setOfContact1);
            mapOfSetOfContact.put('key2',setOfContact1);
            mapOfSetOfContact.put('key3',setOfContact1);
            mapOfSetOfContact.put('key4',setOfContact1);
            mapOfSetOfContact.put('key5',setOfContact1);
           
    
            Map<String, Map<Account, Contact>> mapofmapofAccountContact = new Map<String, Map<Account, Contact>>();
    
            mapofmapofAccountContact.put('AccountContact1',mapofAccountContact);
            mapofmapofAccountContact.put('AccountContact2',mapofAccountContact);
            mapofmapofAccountContact.put('AccountContact3',mapofAccountContact);
            mapofmapofAccountContact.put('AccountContact4',mapofAccountContact);
            mapofmapofAccountContact.put('AccountContact5',mapofAccountContact);
        
            
            Map<Map<String, Account>, Map<String, Map<Account, Account>>>  mapOfThreeAccount = new Map<Map<String, Account>, Map<String, Map<Account, Account>>>();
            Map<String, Account> mapOfAccounts1 = new Map<String, Account>();
            mapOfAccount.put('Candidate1',new Account(Name='a'));
            mapOfAccount.put('Candidate2',new Account(Name='b'));
            mapOfAccount.put('Candidate3',new Account(Name='c'));
            mapOfAccount.put('Candidate4',new Account(Name='d'));
            mapOfAccount.put('Candidate5',new Account(Name='e'));
    
            Map<String, Account> mapOfAccounts2 = new Map<String, Account>();
            mapOfAccount.put('Candidate1',new Account(Name='a'));
            mapOfAccount.put('Candidate2',new Account(Name='b'));
            mapOfAccount.put('Candidate3',new Account(Name='c'));
            mapOfAccount.put('Candidate4',new Account(Name='d'));
            mapOfAccount.put('Candidate5',new Account(Name='e'));
    
            Map<String, Account> mapOfAccounts3 = new Map<String, Account>();
            mapOfAccount.put('Candidate1',new Account(Name='a'));
            mapOfAccount.put('Candidate2',new Account(Name='b'));
            mapOfAccount.put('Candidate3',new Account(Name='c'));
            mapOfAccount.put('Candidate4',new Account(Name='d'));
            mapOfAccount.put('Candidate5',new Account(Name='e'));
    
            Map<String, Account> mapOfAccounts4 = new Map<String, Account>();
            mapOfAccount.put('Candidate1',new Account(Name='a'));
            mapOfAccount.put('Candidate2',new Account(Name='b'));
            mapOfAccount.put('Candidate3',new Account(Name='c'));
            mapOfAccount.put('Candidate4',new Account(Name='d'));
            mapOfAccount.put('Candidate5',new Account(Name='e'));
    
            Map<String, Account> mapOfAccounts5 = new Map<String, Account>();
            mapOfAccount.put('Candidate1',new Account(Name='a'));
            mapOfAccount.put('Candidate2',new Account(Name='b'));
            mapOfAccount.put('Candidate3',new Account(Name='c'));
            mapOfAccount.put('Candidate4',new Account(Name='d'));
            mapOfAccount.put('Candidate5',new Account(Name='e'));
        
            Map<String, Map<Account, Account>> mapOfAccountofAccount = new Map<String, Map<Account, Account>>();
            mapOfAccountofAccount.put('key11',mapOfAccount2);
            mapOfAccountofAccount.put('key12',mapOfAccount2);
            mapOfAccountofAccount.put('key13',mapOfAccount2);
            mapOfAccountofAccount.put('key14',mapOfAccount2);
            mapOfAccountofAccount.put('key15',mapOfAccount2);
    
            // Fill all map
            mapOfThreeAccount.put(mapOfAccounts1,mapOfAccountofAccount);
            mapOfThreeAccount.put(mapOfAccounts2,mapOfAccountofAccount);
            mapOfThreeAccount.put(mapOfAccounts3,mapOfAccountofAccount);
            mapOfThreeAccount.put(mapOfAccounts4,mapOfAccountofAccount);
            mapOfThreeAccount.put(mapOfAccounts5,mapOfAccountofAccount);
         
    
            Map<Map<String, Map<String,Account>>, Map<String, Map<Account, Map<Account, List<Contact>>>>> mapOfSixMap = new Map<Map<String, Map<String,Account>>, Map<String, Map<Account, Map<Account, List<Contact>>>>>();
            Map<String, Map<String,Account>> mapofStringMapAccount1 = new Map<String, Map<String,Account>>();
            mapofStringMapAccount1.put('1',mapOfAccount);
            
            Map<String, Map<String,Account>> mapofStringMapAccount2 = new Map<String, Map<String,Account>>();
            mapofStringMapAccount2.put('2',mapOfAccount);
            
            Map<String, Map<String,Account>> mapofStringMapAccounts3 = new Map<String, Map<String,Account>>();
            mapofStringMapAccounts3.put('3',mapOfAccount);
    
            Map<String, Map<String,Account>> mapofStringMapAccount4 = new Map<String, Map<String,Account>>();
            mapofStringMapAccount4.put('4',mapOfAccount);
    
            Map<String, Map<String,Account>> mapofStringMapAccount5 = new Map<String, Map<String,Account>>();
            mapofStringMapAccount5.put('5',mapOfAccount);
    
            Map<String, Map<Account, Map<Account, List<Contact>>>> mapOfMapOfListValue = new Map<String, Map<Account, Map<Account, List<Contact>>>>();
            Map<Account, List<Contact>> mapOfAccountList = new Map<Account, List<Contact>>();
            mapOfAccountList.put(new Account(Name='MapTest1'),listOfContact1);
            mapOfAccountList.put(new Account(Name='MapTest2'),listOfContact1);
            mapOfAccountList.put(new Account(Name='MapTest3'),listOfContact1);
            mapOfAccountList.put(new Account(Name='MapTest4'),listOfContact1);
            mapOfAccountList.put(new Account(Name='MapTest5'),listOfContact1);
    
            Map<Account, Map<Account, List<Contact>>> mapOfAccountofAccountList= new Map<Account, Map<Account, List<Contact>>>();
            mapOfAccountofAccountList.put(new Account(Name='MapTest1'),mapOfAccountList);
            mapOfAccountofAccountList.put(new Account(Name='MapTest2'),mapOfAccountList);
            mapOfAccountofAccountList.put(new Account(Name='MapTest3'),mapOfAccountList);
            mapOfAccountofAccountList.put(new Account(Name='MapTest4'),mapOfAccountList);
            mapOfAccountofAccountList.put(new Account(Name='MapTest5'),mapOfAccountList);
            
            Map<String, Map<Account, Map<Account, List<Contact>>>> mapofStringMapAccount3 = new Map<String, Map<Account, Map<Account, List<Contact>>>>();
            mapofStringMapAccount3.put('Tokyo',mapOfAccountofAccountList);    
            mapofStringMapAccount3.put('China',mapOfAccountofAccountList);
            mapofStringMapAccount3.put('US',mapOfAccountofAccountList);
            mapofStringMapAccount3.put('Africa',mapOfAccountofAccountList);
            mapofStringMapAccount3.put('Dubai',mapOfAccountofAccountList);
    
            mapOfSixMap.put(mapofStringMapAccount1,mapofStringMapAccount3);
            mapOfSixMap.put(mapofStringMapAccount2,mapofStringMapAccount3);
            mapOfSixMap.put(mapofStringMapAccounts3,mapofStringMapAccount3);
            mapOfSixMap.put(mapofStringMapAccount4,mapofStringMapAccount3);
            mapOfSixMap.put(mapofStringMapAccount5,mapofStringMapAccount3);
        }
        
    /**
    *  Description     :  In this method we will insert sObject value in set, map and list by Dynamic and insert value according to parameter
    *
    *  @args           :  Integer
    *
    *  @return         :  Void
    *
    *  Revision Logs   :  V1.0 - Created - 4 feb 2022 - Rajveer Singh Rawat
    *				      
    *
    **/ 
        public Static void dynamicSobjectsWithCollection(Integer noOfValue){
            
            List<Account> listOfAccount1 = new List<Account>();
            
            for(Integer i=1; i<=noOfValue; i++){
                String s = 'Candidate'+i;
                listOfAccount1.add(new Account(Name=s));
            }
    
            List<List<Contact>> listOfListOfContact = new List<List<Contact>>();
            for(Integer i=1; i<=noOfValue; i++){
                List<Contact> listOfContact1 = new List<Contact>();
                for(Integer j=1; j<=noOfValue; j++){
                    String s = 'Candidate'+i;
                    listOfContact1.add(new Contact(lastName = s));
                }
                listOfListOfContact.add(listOfContact1);
            }
    
            // Map<String, Account>
            Map<String, Account> mapOfAccount = new Map<String, Account>();
            for(Integer i=1; i<=noOfValue;i++){
                String s = 'Candidate'+i;
                String accName = 'Test'+i;
                mapOfAccount.put(s,new Account(Name=accName));
            }
            
            // Map<Account, Account>
            Map<Account, Account> mapOfAccount2 = new Map<Account, Account>();
            for(Integer i=1; i<=noOfValue;i++){
                String s = 'Candidate'+i;
                String accName = 'Test'+i;
                mapOfAccount2.put(new Account(Name=s), new Account(Name=accName));
            }
           
            // Map<Account, Contact>
            Map<Account, Contact> mapofAccountContact = new Map<Account, Contact>();
            for(Integer i=1; i<=noOfValue;i++){
                String s = 'Candidate'+i;
                String accName = 'Test'+i;
                mapofAccountContact.put(new Account(Name=s), new Contact(LastName=accName));
            }
            
            // Map<String, List<Account>>
            Map<String, List<Account>> mapOfListOfAccount = new Map<String, List<Account>>();
            for(Integer i=1; i<=noOfValue;i++){
                String s = 'Candidate'+i;
                mapOfListOfAccount.put(s,listOfAccount1);        
            }
            
            // Map<String, Set<Contact>>
            Map<String, Set<Contact>> mapOfSetOfContact = new Map<String, Set<Contact>>();
            Set<Contact> setOfContact = new Set<Contact>();
            for(Integer i=1; i<=noOfValue;i++){
                String s = 'Candidate'+i;
                setOfContact.add(new Contact(LastName=s));        
            }
            
            for(Integer i=1; i<=noOfValue;i++){
                String s = 'Candidate'+i;
                mapOfSetOfContact.put(s,setOfContact);        
            }
            
            // Map<String, Map<Account, Contact>>
            Map<String, Map<Account, Contact>> mapofmapofAccountContact = new Map<String, Map<Account, Contact>>();
            for(Integer i=1; i<=noOfValue;i++){
                String s = 'Candidate'+i;
                mapofmapofAccountContact.put(s,mapofAccountContact);        
            }
            
            // Map<Map<String, Account>, Map<String, Map<Account, Account>>>
            Map<Map<String, Account>, Map<String, Map<Account, Account>>>  mapOfThreeAccount = new Map<Map<String, Account>, Map<String, Map<Account, Account>>>();
            Map<String, Map<Account, Account>> mapOfAccountofAccount = new Map<String, Map<Account, Account>>();
            for(Integer i=1; i<=noOfValue;i++){
                String s = 'Candidate'+i;
                mapOfAccountofAccount.put(s,mapOfAccount2);  
            }
            
            for(Integer j=1; j<= noOfValue; j++){
                Map<String, Account> mapOfAccounts1 = new Map<String, Account>();
                for(Integer i=1; i<=noOfValue;i++){
                    String s = 'Candidate'+i;
                    String accName = 'Test'+i;
                    mapOfAccounts1.put(s,new Account(Name=accName));        
                }
                mapOfThreeAccount.put(mapOfAccounts1,mapOfAccountofAccount);
            }
            
            // Map<Map<String, Map<String,Account>, Map<String, Map<Account, Map<Account, List<Contact>>>>
            Map<Map<String, Map<String,Account>>, Map<String, Map<Account, Map<Account, List<Contact>>>>> mapOfSixMap = new Map<Map<String, Map<String,Account>>, Map<String, Map<Account, Map<Account, List<Contact>>>>>();
            Map<String, Map<Account, Map<Account, List<Contact>>>> mapOfMapOfListValue = new Map<String, Map<Account, Map<Account, List<Contact>>>>();
            List<Contact> listOfContact1 = new List<Contact>();
            for(Integer i=1; i<=noOfValue;i++){
                    String s = 'Candidate'+i;
                    listOfContact1.add(new Contact(LastName=s));        
             }
            
            Map<Account, List<Contact>> mapOfAccountList = new Map<Account, List<Contact>>();
             for(Integer i=1; i<=noOfValue;i++){
                    String s = 'Candidate'+i;
                    mapOfAccountList.put(new Account(Name=s),listOfContact1);        
             }
            
            Map<Account, Map<Account, List<Contact>>> mapOfAccountofAccountList= new Map<Account, Map<Account, List<Contact>>>();
            for(Integer i=1; i<=noOfValue;i++){
                    String s = 'Candidate'+i;
                    mapOfAccountofAccountList.put(new Account(Name=s),mapOfAccountList);        
             }
            
            Map<String, Map<Account, Map<Account, List<Contact>>>> mapofStringMapAccount3 = new Map<String, Map<Account, Map<Account, List<Contact>>>>();
            for(Integer i=1; i<=noOfValue;i++){
                    String s = 'Candidate'+i;
                    mapofStringMapAccount3.put(s,mapOfAccountofAccountList);        
             }
           
            for(Integer j=1; j<= noOfValue; j++){
                Map<String, Map<String,Account>> mapofStringMapAccount1 = new Map<String, Map<String,Account>>();
                for(Integer i=1; i<=noOfValue;i++){
                    String s = 'Candidate'+i;
                    mapofStringMapAccount1.put(s,mapOfAccount);        
                }
                mapOfSixMap.put(mapofStringMapAccount1,mapofStringMapAccount3);
            }
            
        }
    }