/*public class sortList {
public static Integer sortedList(Integer [] arrayOfNumber){

Integer temp;

for(Integer i = 0; i< arrayOfNumber.size(); i++){

for(Integer j=i+1 ; j<arrayOfNumber.size(); j++){
if(arrayOfNumber.get(i) > arrayOfNumber.get(j)){

temp = arrayOfNumber[i];
arrayOfNumber[i] = arrayOfNumber[j];
arrayOfNumber[j]= temp;

}
}
}

Integer maxNumber = arrayOfNumber.get(0);
return maxNumber;


}
}  */

public class sortList {
    public static Integer sortedList(Integer [] arrayOfNumber){
       
        Integer temp;
        Integer secondMost;
        Integer max = arrayOfNumber.get(0);
        for(Integer i = 1; i< arrayOfNumber.size(); i++){
            secondMost = max;
            if(arrayOfNumber.get(i) > max){
                max = arrayOfNumber[i];
            }
         }
        return secondMost;
     }
}


//arrayOfNumber.sort();
//Integer secMaxNumber = arrayOfNumber.get(1);
//System.debug(maxNumber);
//System.debug(secMaxNumber);