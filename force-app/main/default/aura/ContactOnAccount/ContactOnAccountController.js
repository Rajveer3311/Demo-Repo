({
	doInit : function(component, event, helper) {
		var action = component.get("c.getAccounts");
        // Call back method
        action.setCallback(this, function(response) {
            var responseValue = response.getReturnValue(); 
            console.log(responseValue);
            component.set("v.AccountList",responseValue);
	});
        // Enqueue Action
        $A.enqueueAction(action);
    }
})