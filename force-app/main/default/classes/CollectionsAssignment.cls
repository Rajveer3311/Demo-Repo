/**
*  Description     :  Here we will insert values in list, set and map..
*
*  Created By      :  Rajveer Singh Rawat
*
*  Created Date    :  31 jan 2022
*
*  Revision Logs   :  V1.0 - Created - Rajveer Singh Rawat
*				      
*
**/
public class CollectionsAssignment {
    
    /**
*  Description     :  In this method we will insert value in set, map and list by dynamically or at initialization time
*
*  @args           :  
*
*  @return         :  Void
*
*  Revision Logs   :  V1.0 - Created - 31 Jan 2022 - Rajveer Singh Rawat
*				      
*
**/  
    public static void staticValuePopulation(){
        
        //insert values at initialization time
        List<String> strOfList = new List<String>{'Ajmer','Kishangarh','Bhilwara','Nagore','Jaipur','Sikar'};
            Set<String> setOfStr = new Set<String>{'Ajmer','Kishangarh','Bhilwara','Nagore','Jaipur','Sikar'};
                Map<String, String> mapOfStr = new Map<String, String>{'one'=>'Ajmer','two'=>'Kishangarh','three'=>'Bhilwara','four'=>'Nagore','five'=>'Jaipur'};
                    
                    //insert values using the collection methods..
                    List<String> strOfList2 = new List<String>();
        strOfList2.add('Ajmer'); 
        strOfList2.add('Kishangarh');
        strOfList2.add('Bhilwara'); 
        strOfList2.add('Nagore'); 
        strOfList2.add('Jaipur'); 
        strOfList2.add('Sikar');
        
        Set<String> setOfStr2 = new Set<String>();
        setOfStr2.add('Ajmer'); 
        setOfStr2.add('Kishangarh');
        setOfStr2.add('Bhilwara'); 
        setOfStr2.add('Nagore'); 
        setOfStr2.add('Jaipur'); 
        setOfStr2.add('Sikar');
        
        Map<String, String> mapOfStr2 = new Map<String, String>();
        mapOfStr2.put('one','Ajmer');
        mapOfStr2.put('two','Kishangarh');
        mapOfStr2.put('three','Bhilwara');
        mapOfStr2.put('four','Nagore');
        mapOfStr2.put('five','Jaipur');
    }
    
    /**
*  Description     :  In this method we will insert values dynamically by user in set, map and list..
*
*  @args           :  List<String>, Integer
*
*  @return         :  Void
*
*  Revision Logs   :  V1.0 - Created - 31 Jan 2022 - Rajveer Singh Rawat
*				      
*
**/  
    public static void dynamicValuesPopulation(List<String> collectionTypes, Integer totalValues){
        for(String str : collectionTypes){
            
            if(str == 'Set' || str == 'Map' || str == 'List'){
                if(str == 'Set'){
                    // create a set
                    Set<String> setOfStr = new Set<String>();
                    for(Integer i = 1; i <= totalValues; i++){
                        String name = 'Candidate' + i;
                        setOfStr.add(name);
                    }
                    System.debug(setOfStr);
                }
                if(str == 'Map'){
                    // create a map
                    Map<Integer, String> mapOfStr = new Map<Integer, String>(); 
                    for(Integer i = 1; i <= totalValues; i++){
                        String name = 'Candidate' + i;
                        mapOfStr.put(i,name);
                    }
                    System.debug(mapOfStr);
                }
                if(str == 'List'){
                    // create a List
                    List<String> strOfList = new List<String>();
                    for(Integer i = 1; i <= totalValues; i++){
                        String name = 'Candidate' + i;
                        strOfList.add(name);
                    }
                    System.debug(strOfList);
                }
            }
            else{
                System.debug('List Value are not correct😐!'+str);
            }  
            
            
        }
        
    }
}