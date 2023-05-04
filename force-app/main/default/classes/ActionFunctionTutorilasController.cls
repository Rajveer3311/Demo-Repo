/*public class ActionFunctionTutorilasController {
    public static String myName{get;set;}
    public static String testStr{get;set;}
   
    public static void callTestFunction(){
        System.debug('Testing' + myName);
    }
    public static void methodOne(){
        System.debug('Testing methodOne##> ' + myName + ' ' + testStr);
    }

    public static void sayHellofunction(){
        System.debug('Hello!');
    }
} */

public class ActionFunctionTutorilasController {
    public static Integer firstNo{get;set;}
    public static Integer secondNo{get;set;}
    public static Integer totalSum{get;set;}
    
    public static void totalSums(){
    totalSum= firstNo+secondNo;
        System.debug(totalSum);
}
    
}