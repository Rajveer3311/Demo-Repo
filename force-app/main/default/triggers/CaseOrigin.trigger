trigger CaseOrigin on Case (before insert) {
    for(case c : Trigger.New){
        if(c.origin == 'Email'){
            c.status = 'New';
            c.priority = 'Medium';
        }
    }
}