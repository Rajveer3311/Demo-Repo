public class SeprateContactNameScheduler {
    public static void mailContact(){
        List<Contact> listOfUpdatedContact = new List<Contact>();
        List<String> listOfAlphabet = new List<String>{'A','B'};
        Map<String,List<Contact>> mapOfListOfContact = new Map<String,List<Contact>>();
        List<Contact> listOfContact = [Select Name from Contact Order By Name asc];
        Integer index = 0;
        for(Contact con : listOfContact){
            String firstElement = con.Name.substring(0,1);
            if(!mapOfListOfContact.containsKey(firstElement)){
                List<Contact> listOfExistContact = new List<Contact>();
                listOfExistContact.add(con);
                mapOfListOfContact.put(firstElement,listOfExistContact);
            }
            else{
                mapOfListOfContact.get(firstElement).add(con);
            }
        }
        
        
        String ss = listOfAlphabet[index];
        for(Contact conData : mapOfListOfContact.get(ss)){
            conData.Phone = '9829273311';
            listOfUpdatedContact.add(conData);
        }
        index++;
        if(index == 27){
            index = 0;
        }
        if(listOfUpdatedContact.size() > 0){
            update listOfUpdatedContact;
        }
        
        
    }
}