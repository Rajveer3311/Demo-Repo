/**
*  Description     :  Here we are performing addition of two number..
*
*  Created By      :  Rajveer Singh Rawat
*
*  Created Date    :  28 jan 2022
*
*  Revision Logs   :  V1.0 - Created - Rajveer Singh Rawat
*				      
*
**/

public with sharing class MyFirstApexClass {
    // Define the variable
    static Decimal firstNumber = 20;
    static Decimal secondNumber = 20;
    static Decimal SumOfNumber;
    
/**
*  Description     :  this method will show addition of two number
*
*  @args           :  
*
*  @return         :  Void
*
*  Revision Logs   :  V1.0 - Created - 28 Jan 2022 - Rajveer Singh Rawat
*				      
*
**/    
    public static void sumMethod(){
        SumOfNumber = firstNumber + secondNumber;
        System.debug('Sum of '+firstNumber + ' and ' +secondNumber +' is : ' +SumOfNumber);
    }
    
      
/**
*  Description     :  this method will perform addition, sub, mul, div of two number but dynamically acc to user
*
*  @args           :  Decimal, Decimal, String
*
*  @return         :  Decimal
*
*  Revision Logs   :  V1.0 - Created - 28 Jan 2022 - Rajveer Singh Rawat
*				      
*
**/  
    public static Decimal calculateValues(Decimal firstNum, Decimal secondNum, String operator){
        Decimal sumOfTwoNumber;
        // Validate input
        if(firstNum != NULL && secondNum != NULL){
            if(operator == '+'){
                sumOfTwoNumber = firstNum + secondNum;
            }
            else if(operator == '-'){
                sumOfTwoNumber = firstNum - secondNum;
            }
            else if(operator == '*'){
                sumOfTwoNumber = firstNum * secondNum;
            }
            else if(operator == '/'){
                sumOfTwoNumber = firstNum / secondNum;
            }
            else{
                System.debug('Please choose a correct operator'); 
            }
        }
        else{
            System.debug('Please choose a correct value'); 
        }
        return sumOfTwoNumber;
    }
}