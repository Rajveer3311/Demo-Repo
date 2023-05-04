public with sharing class BinaryNumberPattern {
    public Static void numberPattern() {
           for (Integer i = 1; i<=5; i++) {
               String binaryNum = ' ';
                for (Integer j = 1; j<=5; j++) {
                    if(j==1 || j==3 || j==5)
                    {   if(i == 2 || i == 4){
                          binaryNum=binaryNum+'0';
                        }
                        else{
                        binaryNum=binaryNum+'1';
                        }
                    } 
                    else
                    {   if(i == 2 || i==4){
                        binaryNum=binaryNum+'1';
                        }
                        else{
                        binaryNum=binaryNum+'0';
                        }
                    }
                }
                System.debug(binaryNum);
           }
    }
}