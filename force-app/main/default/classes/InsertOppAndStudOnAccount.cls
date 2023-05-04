// Insert account record then for that account insert 5 opportunities record and then for each opportunity insert 2 student record 

/**
*  Description     :  Here we will insert One account and 5 opportunity related to account and each opp have 2 student record..
*
*  Created By      :  Rajveer Singh Rawat
*
*  Created Date    :  9 Feb 2022
*
*  Revision Logs   :  V1.0 - Created - Rajveer Singh Rawat
*				      
*
**/
public class InsertOppAndStudOnAccount {
    
     /**
    *  Description     :  In this method we will insert Account Child record
    *
    *  @args           :  
    *
    *  @return         :  Void
    *
    *  Revision Logs   :  V1.0 - Created - 9 feb 2022 - Rajveer Singh Rawat
    *				      
    *
    **/  
    
    public Static Void insertRecord(){
        
        Account accObj = new Account(Name='Neeraj Nawal');
        insert accObj;
        
        // List of opportunity
        List<Opportunity> listOfOpp = new List<Opportunity>();
        Date myDate = Date.newInstance(2022, 2, 23);
        for(Integer i = 1; i <= 5; i++){
            String nameOfOpp = 'Masoor '+i;
            Opportunity oppObj = new Opportunity(Name = nameOfOpp, AccountId = accObj.Id,stageName='Prospecting', closeDate=myDate);
            listOfOpp.add(oppObj);
        }
        if(listOfOpp.size() > 0){
          insert listOfOpp;  
        }
        
        // list of Student
        List<Student__c> listOfStudent = new List<Student__c>();
        Integer ageOfStud = 20; 
        for(Opportunity oppItem : listOfOpp){
            for(Integer i = 1; i <= 2; i++){
                String nameOfOpp = 'Arjit Singh '+i;
                ageOfStud+=i;
                Student__c studObj = new Student__c(Student_s_Name__c = nameOfOpp, age__c = ageOfStud, Opportunity_Name__c = oppItem.Id );
                listOfStudent.add(studObj);
            }
        }
        if(listOfStudent.size() > 0){
         insert listOfStudent;   
        }
        
        
    }
}