/*Create a Map from list of integers Map should have 2 keys ‘even’, ‘odd’ Map<String,List<Integer>>Extra try for Prime numbers*/
public class EvenOddWithMap {
    public EvenOddWithMap(){
        List<Integer> evenOddList=new List<Integer>{2,3,4,5,6,9,12,14,17,19,98,123,67,93};
        Map<String,List<Integer>> evenOddMap=new Map<String,List<Integer>>();
        evenOddMap.put('Even', new List<Integer>{});    
            evenOddMap.put('Odd', new List<Integer>{});
            evenOddMap.put('Prime', new List<Integer>{});
        for(Integer listValues=0;listValues<evenOddList.size();listValues++){
            Integer listItem=evenOddList[listValues];
           // System.debug(listItem);
            System.debug(listItem^1);
            
            if(evenOddMap.containsKey('Even')||evenOddMap.containsKey('Odd')) {
                //  boolean modVar=math.mod(listItem,0);
                if ((listItem ^ 1) == listItem + 1){
                
                   evenOddMap.get('Even').add(listItem);
                }
                else{
                   evenOddMap.get('Odd').add(listItem); 
                    if(listItem >1 ){ 
                      evenOddMap.get('Prime').add(listItem);
                    }
                }
            }  
            else{
      //wrong code yaha se time mile toh sahi kariyo bhai pakka--          evenOddMap.put('Even',new List<Integer>());
            }
        }
        System.debug('Map values---->'+evenOddMap);
            
    }
}