public class Month {
    public Month(){
      List<String> months = new List<String>{'Jan','Feb','March','aprial','may','june','july','aug','sep','oct','nov','dec'};
      List<String> capMonth = new List<String>();   
          for(Integer monthKeys=0;monthKeys< months.size();monthKeys++){
              String listVal=months[monthKeys];
              capMonth.add(listVal.toUppercase());
              
          }
        System.debug(capMonth);
    }
}