/*Add validation using trigger to validate that no contact with same name exist under an account*/
/*public class ContactHelperClass {
    
    public Static Void NoSameNameContact (List<Contact> newList, Map<Id,Contact> oldMap) {
        String name ;
        String newListSal;
        Set<String> setforSalutation = new Set<String>();
        
        Set<String> nameSet = new Set<String>();
        for(Contact conName : newList){
            boolean isNewOrNameChanged = oldMap == null || conName.Name != oldMap.get(conName.Id).Name;
            if(setforSalutation.Contains((conName.Salutation != null? conName.Salutation+' ' : '') + conName.Name)){
                conName.addError('You are trying to insert same name which is already present in record ! Duplicate contact 😮');
            }
            if(conName.FirstName == Null){
                newListSal = conName.salutation + ' ' + conName.LastName; 
                setforSalutation.add(newListSal);
                  nameSet.add(conName.LastName); 
            }
            else if(conName.FirstName == Null && conName.Salutation == Null){
                name = conName.LastName;
                setforSalutation.add(name);   
                nameSet.add(name);    
            }
            else if(conName.Salutation == Null){
                newListSal = conName.FirstName + ' ' + conName.LastName;
                nameSet.add(newListSal);
                setforSalutation.add(newListSal);   
            }
            else {
                name = conName.FirstName + ' ' + conName.LastName;
                newListSal = conName.Salutation + ' ' +conName.FirstName + ' ' + conName.LastName;
                setforSalutation.add(newListSal);
                nameSet.add(name);    
            }
            
        }
        System.debug(nameSet);
        List<Contact> conList = [Select AccountId,Salutation, Name from Contact where Name in :nameSet];
        System.debug(conList);
        Map<String,Contact> ContactByName = new Map<String,Contact>();
        for(Contact conQueryValue : conList){
            
            if(conQueryValue.Salutation == Null ){
                String salName = conQueryValue.Name;
                System.debug('salName----------->'+salName);
                ContactByName.put(salName, conQueryValue);
            }
            else{
                String salName = conQueryValue.Salutation + ' ' + conQueryValue.Name;
                System.debug('salName----------->'+salName);
                ContactByName.put(salName, conQueryValue);
            }
            
            
        }
        for(Contact newListValue : newList){
            if(newListValue.Salutation == Null && newListValue.FirstName  == Null){
                newListSal = newListValue.LastName; 
                if(ContactByName.ContainsKey(newListSal)){
                    newListValue.addError('You are trying to insert same name which is already present in record ! Duplicate contact 😮');
                    
                }
            }
            else If(newListValue.FirstName  == Null){
                newListSal = newListValue.Salutation + ' ' + newListValue.LastName; 
                if(ContactByName.ContainsKey(newListSal)){
                    newListValue.addError('You are trying to insert same name which is already present in record ! Duplicate contact 😮');
                    
                } 
                
            }
            else{
                newListSal = newListValue.Salutation + ' ' + newListValue.FirstName + ' ' + newListValue.LastName;
                if(ContactByName.ContainsKey(newListSal)){
                    newListValue.addError('You are trying to insert same name which is already present in record ! Duplicate contact 😮');
                    
                } 
            }
        }
        
    }
}
*/


public class ContactHelperClass {
    
    public Static Void NoSameNameContact (List<Contact> newList, Map<Id,Contact> oldMap) {
        String name ;
        String newListSal;
        Set<String> setforSalutation = new Set<String>();
        Set<String> nameSet = new Set<String>();
        Set<String> OldNameSet = new Set<String>();
        for(Contact conName : newList){
            boolean isNewOrNameChanged = oldMap == null || conName.Salutation != oldMap.get(conName.Id).Salutation
                                        || conName.FirstName != oldMap.get(conName.Id).FirstName
                                        || conName.LastName != oldMap.get(conName.Id).LastName;
            if(isNewOrNameChanged){
                if(setforSalutation.Contains((conName.Salutation != null ? conName.Salutation+' ' : '') + conName.Name)){
                    conName.addError('You are trying to insert same name which is already present in record ! Duplicate contact 😮');
                }
                if(conName.FirstName == Null){
                    newListSal = conName.salutation + ' ' + conName.LastName; 
                    setforSalutation.add(newListSal);
                    nameSet.add(conName.LastName); 
                }
                else if(conName.FirstName == Null && conName.Salutation == Null){
                    name = conName.LastName;
                    setforSalutation.add(name);   
                    nameSet.add(name);    
                }
                else if(conName.Salutation == Null){
                    newListSal = conName.FirstName + ' ' + conName.LastName;
                    nameSet.add(newListSal);
                    setforSalutation.add(newListSal);   
                }
                else {
                    name = conName.FirstName + ' ' + conName.LastName;
                    newListSal = conName.Salutation + ' ' +conName.FirstName + ' ' + conName.LastName;
                    setforSalutation.add(newListSal);
                    nameSet.add(name);    
                }
               
            } 
            else{
                conName.addError('You are trying to insert same name which is already present in record ! Duplicate contact 😮');
            }
        }
        System.debug(nameSet);
        List<Contact> conList = [Select AccountId,Salutation, Name from Contact where Name in :nameSet];
        System.debug(conList);
        Map<String,Contact> ContactByName = new Map<String,Contact>();
        for(Contact conQueryValue : conList){
            
            if(conQueryValue.Salutation == Null ){
                String salName = conQueryValue.Name;
                System.debug('salName----------->'+salName);
                ContactByName.put(salName, conQueryValue);
            }
            else{
                String salName = conQueryValue.Salutation + ' ' + conQueryValue.Name;
                System.debug('salName----------->'+salName);
                ContactByName.put(salName, conQueryValue);
            }
            
            
        }
        for(Contact newListValue : newList){
            if(newListValue.Salutation == Null && newListValue.FirstName  == Null){
                newListSal = newListValue.LastName; 
                if(ContactByName.ContainsKey(newListSal)){
                    newListValue.addError('You are trying to insert same name which is already present in record ! Duplicate contact 😮');
                    
                }
            }
            else If(newListValue.FirstName  == Null){
                newListSal = newListValue.Salutation + ' ' + newListValue.LastName; 
                if(ContactByName.ContainsKey(newListSal)){
                    newListValue.addError('You are trying to insert same name which is already present in record ! Duplicate contact 😮');
                    
                } 
                
            }
            else{
                newListSal = newListValue.Salutation + ' ' + newListValue.FirstName + ' ' + newListValue.LastName;
                if(ContactByName.ContainsKey(newListSal)){
                    newListValue.addError('You are trying to insert same name which is already present in record ! Duplicate contact 😮');
                    
                } 
            }
        }
        
    }
}

//(conName.FirstName + ' ' + conName.LastName != oldMap.get(conName.Id).FirstName + ' ' + oldMap.get(conName.Id).LastName)
        //                                                                                                 && (conName.Salutation != oldMap.get(conName.Id).Salutation)