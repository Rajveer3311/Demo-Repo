//Trigger to ensure that on Lead object we don't have any duplicate email.
public class LeadTriggerClass {
    public static void beforeInsert(List<Lead> newList){
        List<Lead> leadList = new List<Lead>();
        leadList = [select email,Name from Lead Where email != Null ];
        System.debug('############# leadList'+leadList);	
        for(Lead leadObj : newList){
            for(Lead leadObj1 : leadList){
                if(leadObj1.email == leadObj.email){
                    leadObj.addError('this email is already exist duplicate email.🤢');
                }
                // System.debug('############# leadList'+leadObj.email); 
            }
        }
    }
    public static void beforeUpdate (List<Lead> newList){
        List<Lead> leadList = new List<Lead>();
        Set<String> emailSet = new Set<String>();
        leadList = [select email from Lead Where email != Null ];
        for(Lead oldLeadObj : leadList){
            emailSet.add(oldLeadObj.email);
        }
        for(Lead leadObj : newList){
                     if(emailSet.contains(leadObj.email))
                     {
                        leadObj.addError('You Cant update'); 
                     }
              //  if(leadObj.Email == oldLeadObj.Email){
                 //   leadObj.addEwrror('You Cant update');
               // }
            }
        
    }
}