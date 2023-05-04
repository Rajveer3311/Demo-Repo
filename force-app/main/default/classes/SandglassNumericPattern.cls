public with sharing class SandglassNumericPattern {
    public Static void numberPattern() {
      for(Integer i = 1; i <= 10; i++){
          String strNum = '';
          for(Integer j = 1; j <= 10-i; j++){
              if(j >= i){
                strNum+=j;
              }
              else{
                strNum+='_';
              }
            
          }
          System.debug(strNum);
      }
    }

    public Static void numberPattern2() {
        Integer k = 0;
        for(Integer i = 1; i <= 10; i++){
            String strNum = '';
            if(i < 6){
                k++;
            }
            else{
                k--;
            }
            if(i==6){k++;}
            for(Integer j = 1; j <= 9; j++){
                if(j >= k && j <= 10-k){
                  strNum+=j;
                }
                else{
                  strNum+='_';
                }
              
            }
            System.debug(strNum);
        }
      }
}