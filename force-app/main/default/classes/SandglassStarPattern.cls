public with sharing class SandglassStarPattern {
    public Static void StarPattern() {
        Integer k = 0;
            for (Integer i = 1; i <= 10; i++) {
                String storeStar = '';
                if(i<=5){
                    k++;
                } 
                else{
                    k--;
                }
                if(i==6){
                    k++;
                }
                for (Integer j = 1; j <= 5; j++) {
                    if (j >= k || k == 6) {
                        storeStar+='* ';
                    }
                    else{  
                        storeStar+='_';
                    }
                }
                   System.debug(storeStar);
               }  
            }
}