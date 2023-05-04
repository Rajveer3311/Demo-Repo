public class TwoDList {
    public static void TwoDListMethod(){
        List<List<Integer>> twoDList = new List<List<Integer>>();
        List<Integer> l1 = new List<Integer>{10,20,30};
            List<Integer> l2 = new List<Integer>{40,50,60};
                List<Integer> l3 = new List<Integer>{70,80,90};
                    twoDList.add(l1);
                    twoDList.add(l2);
                    twoDList.add(l3);
                    System.debug('############### twoDList '+twoDList);
        
        for(List<Integer> l : twoDList ){
            
            String allList = '[' ;
            for(Integer k : l){
                allList += k + ',';
            }
            System.debug(allList + ']');
            
        }
        
    }
}