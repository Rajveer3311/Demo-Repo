public class RemoveInnerHtml {
    public static void StripHtml()
    {
        
        String input = '<p>ee</p>vjagjsg<b>jhdsbh <Amit/> <Udit/>  </b>';
        // you can replace <br>, <br/> or any fields with something else and replace back
        input = input.replace('<br>','%br%');
        input = input.replaceAll('<[/a-zA-Z0-9]*>','');
        input = input.replace('%br%','<br>'); //replace back
        
        System.debug(input);
    }
}