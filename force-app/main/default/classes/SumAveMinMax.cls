/*****************************************************************************************************************
* Name         : SumAveMinMax                                                                     
* @author      : Rajveer Singh Rawat                                                                             
* @date        : July 12, 2021                                                                                   
* @description : Create a method that takes a list of integer and print the sum, average, min and max.                                   
******************************************************************************************************************/
public class SumAveMinMax {
    public static void getParameter(List<Integer> listValue){
        Integer totalVal = 0;
        Integer max=0;
        Integer min=listValue[0];
        for(Integer getValue : listValue){
            totalVal+=getValue;
            if(getValue > max){
                max = getValue;
            }
            else{
                if(getValue<min){
                  min = getvalue;
                }
            }
            
        } 
        System.debug('Sum' + totalVal);
        System.debug('Average' + totalVal/listValue.Size());
        System.debug('Average' + totalVal/listValue.Size());
        System.debug('Minimum' + min);
        System.debug('Maximum' + max);
    }
}