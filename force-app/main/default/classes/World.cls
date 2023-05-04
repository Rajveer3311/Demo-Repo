public class World 
{
    List<String> empCodes= new List<string>{'Ayush','Karan','Abhimanyu','Aaron'};    
        
        public void addEmployeeCode(String empCode)
        {
        if(empCodes.contains(empCode))
        {
            System.debug('Empcode is already exist.');
        }
        else
        {
            empCodes.add(empCode);
            
            System.debug('Employee code added succesfully ');
            
            for(string names : empCodes)
            {
                System.debug('names are:' + names);
            }    
        }
    }
    
    public static void setEmployeeInfo(String empCode, String empName)
    {
        Map<String,String> employeeInfo= new Map<String,String>();
        employeeInfo.put('karan','Chouhan');
        employeeInfo.put('Ayush','Rubin');
        System.debug(employeeInfo);
        
        if(employeeInfo.containsKey(empCode))
        {
            employeeInfo.put(empCode,empName);
            System.debug('Employee name updated succesfully!');
            
            for(String str : employeeInfo.keyset())
            {
                System.debug(str + '---' + employeeInfo.get(str));
            }
        }
        else
        {
            employeeInfo.put(empCode,empName);
            System.debug('Employee information saved successfully');
            
            for(String str : employeeInfo.keyset())
            {
                System.debug(str + '-' + employeeInfo.get(str));
            }
            
        }
    }
    
}