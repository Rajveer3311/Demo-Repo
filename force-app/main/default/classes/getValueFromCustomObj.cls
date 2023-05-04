public class getValueFromCustomObj {
             public String name{get;set;}
    public List<String> foodNames{get;set;}
    public Map<Decimal, String> monthByIndex{get;set;}
    
    public getValueFromCustomObj(){
        name = 'Text';
        
        foodNames = new List<String>();
        foodNames.add('Pasta');
        foodNames.add('Dal Makhani');
        foodNames.add('Fried Rice');
        foodNames.add('Roti');
        
        monthByIndex = new Map<Decimal, String>();
        monthByIndex.put(1, 'JAN');
        monthByIndex.put(2, 'FEB');
        monthByIndex.put(3, 'MAR');
        monthByIndex.put(4, 'APR');
    }
}