({
    sendData : function(component, event, helper) {
        var action = component.get("c.createContact");
        var conList = component.get("v.contactList");
        action.setParams({ 'conObj' : component.get("v.contactObj")});
        action.setCallback(this, function(response) {
            var state = response.getState();
            conList.splice(0,0,component.get("v.contactObj"));
            component.set("v.contactList", conList);
            if (state === "SUCCESS") {
                //component.set("v.res",response.getReturnValue());
                alert('Contact is Inserted! ');
            }
            else if(state === "ERROR"){
              var errors2 = response.getError();
              console.error(errors2);
           }
               
        });
        $A.enqueueAction(action);
        
    },
    showContacts : function(component, event, helper) {
        var action = component.get("c.retrieveContact");
        action.setCallback(this, function(response) {
            component.set("v.contactList",response.getReturnValue());
         });
        $A.enqueueAction(action);
    }
})