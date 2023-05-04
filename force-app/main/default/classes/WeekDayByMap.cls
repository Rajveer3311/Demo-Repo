/*****************************************************************************************************************
* Name         : MonthNameByMap                                                                     
* @author      : Rajveer Singh Rawat                                                                             
* @date        : July 12, 2021                                                                                   
* @description : Create a method which returns the name of weekday based on the number 
                 For example 1 => Sunday , 2 => Monday, if other than 1 to 7 , it should show Invalid WeekDay. (use switch when)                                   
******************************************************************************************************************/
public class WeekDayByMap {
    public WeekDayByMap(Integer weekDayNumber){
        switch on weekDayNumber {
           when 1 {
               //If weekDayNumber is 1 this block is called
               System.debug('Sunday');
           }
           when 2{
               //If weekDayNumber is 2 this block is called
               System.debug('Monday');
           }
            when 3{
                //If weekDayNumber is 3 this block is called
               System.debug('tuesday');
           }
            when 4{
                //If weekDayNumber is 4 this block is called
               System.debug('Wednesday');
           }
            when 5{
                //If weekDayNumber is 5 this block is called
               System.debug('Thrusday');
           }
            when 6{
                //If weekDayNumber is 6 this block is called
               System.debug('Friday');
           }
            
           when else {
               //If weekDayNumber did not match any of the blocks already, this block is called
               System.debug('Saturday');
           }
        }
    }
}