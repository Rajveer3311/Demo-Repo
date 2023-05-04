trigger LeadScenario on Lead (before insert) {
    for(lead ld : trigger.new){
        
        if(ld.leadsource == 'Web'){
            
            ld.Rating = 'Cold';
            
        }
        
        else{
             
            ld.Rating = 'Hot';
            
        }
        
    }
}