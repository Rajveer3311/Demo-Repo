/**
*  Description     :  Here we will insert 5 record on Account and insert 5 contact on each Account ....
*
*  Created By      :  Rajveer Singh Rawat
*
*  Created Date    :  6 Feb 2022
*
*  Revision Logs   :  V1.0 - Created - Rajveer Singh Rawat
*				      
*
**/
public with sharing class MyFirstDMLClass {

    /**
    *  Description     :  In this method we will insert Account record and Contact on each Account....
    *
    *  @args           :  
    *
    *  @return         :  Void
    *
    *  Revision Logs   :  V1.0 - Created - 6 feb 2022 - Rajveer Singh Rawat
    *				      
    *
    **/ 

    public Static void staticDMLs() {

        // Create List Of Account
        List<Account> listOfAccount = new List<Account>();
        listOfAccount.add(new Account(Name='Ram-2'));
        listOfAccount.add(new Account(Name='Arjun-2'));
        listOfAccount.add(new Account(Name='Karan-2'));
        listOfAccount.add(new Account(Name='Laxman-2'));
        listOfAccount.add(new Account(Name='Ravan-2'));
        insert listOfAccount;
        
        // Create List Of Contact
        List<Contact> conList1 = new List<Contact>();
        
        conList1.add(new Contact(FirstName='A',LastName='Smith',Department='Finance',AccountId=listOfAccount.get(0).id));
        conList1.add(new Contact(FirstName='B',LastName='kor',Department='Finance',AccountId=listOfAccount.get(0).id));
        conList1.add(new Contact(FirstName='C',LastName='Roth',Department='Technology',AccountId=listOfAccount.get(0).id));
        conList1.add(new Contact(FirstName='D',LastName='oraz',Department='Sales',AccountId=listOfAccount.get(0).id));
        conList1.add(new Contact(FirstName='E',LastName='Sami',Department='Manager',AccountId=listOfAccount.get(0).id));
        

        conList1.add(new Contact(FirstName='A',LastName='Smith',Department='Finance',AccountId=listOfAccount.get(1).id));
        conList1.add(new Contact(FirstName='B',LastName='kor',Department='Finance',AccountId=listOfAccount.get(1).id));
        conList1.add(new Contact(FirstName='C',LastName='Roth',Department='Technology',AccountId=listOfAccount.get(1).id));
        conList1.add(new Contact(FirstName='D',LastName='oraz',Department='Sales',AccountId=listOfAccount.get(1).id));
        conList1.add(new Contact(FirstName='E',LastName='Sami',Department='Manager',AccountId=listOfAccount.get(1).id));
        

        conList1.add(new Contact(FirstName='A',LastName='Smith',Department='Finance',AccountId=listOfAccount.get(2).id));
        conList1.add(new Contact(FirstName='B',LastName='kor',Department='Finance',AccountId=listOfAccount.get(2).id));
        conList1.add(new Contact(FirstName='C',LastName='Roth',Department='Technology',AccountId=listOfAccount.get(2).id));
        conList1.add(new Contact(FirstName='D',LastName='oraz',Department='Sales',AccountId=listOfAccount.get(2).id));
        conList1.add(new Contact(FirstName='E',LastName='Sami',Department='Manager',AccountId=listOfAccount.get(2).id));
        
        conList1.add(new Contact(FirstName='A',LastName='Smith',Department='Finance',AccountId=listOfAccount.get(3).id));
        conList1.add(new Contact(FirstName='B',LastName='kor',Department='Finance',AccountId=listOfAccount.get(3).id));
        conList1.add(new Contact(FirstName='C',LastName='Roth',Department='Technology',AccountId=listOfAccount.get(3).id));
        conList1.add(new Contact(FirstName='D',LastName='oraz',Department='Sales',AccountId=listOfAccount.get(3).id));
        conList1.add(new Contact(FirstName='E',LastName='Sami',Department='Manager',AccountId=listOfAccount.get(3).id));
        
        conList1.add(new Contact(FirstName='A',LastName='Smith',Department='Finance',AccountId=listOfAccount.get(4).id));
        conList1.add(new Contact(FirstName='B',LastName='kor',Department='Finance',AccountId=listOfAccount.get(4).id));
        conList1.add(new Contact(FirstName='C',LastName='Roth',Department='Technology',AccountId=listOfAccount.get(4).id));
        conList1.add(new Contact(FirstName='D',LastName='oraz',Department='Sales',AccountId=listOfAccount.get(4).id));
        conList1.add(new Contact(FirstName='E',LastName='Sami',Department='Manager',AccountId=listOfAccount.get(4).id));
        insert conList1;
    }
    
    /**
    *  Description     :  In this method we will insert Account record and Contact on each Account dynamically....
    *
    *  @args           :  Integer
    *
    *  @return         :  Void
    *
    *  Revision Logs   :  V1.0 - Created - 6 feb 2022 - Rajveer Singh Rawat
    *				      
    *
    **/ 
    
    public Static void dynamicDMLs(Integer noOfValue){
        List<Account> accList = new List<Account>();
        for(Integer i=1;i<=noOfValue;i++){
            String s='Mobile Team'+i;
            accList.add(new Account(Name=s));
        }
        if(accList.size() > 0){
           insert accList;
        }
        
        
        List<Contact> conList = new List<Contact>();
        for(Account acc : accList){
            
            for(Integer j = 1; j<=noOfValue;j++){
                Contact con = new Contact();
                con.LastName = 'Dell Inspiron' + j;
                con.AccountId = acc.Id;
                conList.add(con); 
            }
           }  
        if(conList.size() > 0){
           insert conList;
        }
    }
}