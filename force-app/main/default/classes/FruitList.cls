public class FruitList {
    public static void fruitListing(){
        List<String> fruitList=new List<String>{'Mango', 'Banana', 'Strawberry', 'Orange', 'Papaya', 'Pineapple', 'Apple'};
            List<String> fruitList2=new List<String>();
            
            fruitList.sort();
         for(integer listKey=0;listKey<fruitList.size();listKey++)
         {
             
             if(fruitList[listKey]=='Raj'){
                System.debug('hey hii'); 
             }
             else{
                 fruitList2.add(fruitList[listKey]);
             }
             
          }
           
           System.debug(FruitList2);
        
    }    
}