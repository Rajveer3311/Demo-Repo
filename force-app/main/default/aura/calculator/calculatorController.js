/*({  
    // get input Field value via aura id
	calculate : function(component, event, helper) {
		var fn = component.find("fNum").get("v.value");
        var sn = component.find("sNum").get("v.value");
        var result = component.find("res");
        result.set("v.value",fn+sn);
	}
})*/

/*({  
    // get input Field value via Attribut instead of id
	calculate : function(component, event, helper) {
		var fn = component.get("v.fNum");
        var sn = component.get("v.sNum");
        component.set("v.res",fn+sn);
        
	}
}) */

({  
    // addition value by controller
	calculate : function(component, event, helper) {
		var fn = component.get("v.fNum");
        var sn = component.get("v.sNum");
        var action = component.get("c.calculateValues");
        action.setParams({ "firstNumber" : fn , "secondNumber" : sn});
        
        action.setCallback(this, function(response) {
          var state = response.getState();
           if (state === "SUCCESS") {
             component.set("v.res",response.getReturnValue());
               alert("Internal");
           }
        });
        $A.enqueueAction(action);
        alert('External');
        
	}
})