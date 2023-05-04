({
    sendObject : function(component, event, helper) {
        var dynamicObjectValue = component.get("v.dynamicObject");
       // alert(dynamicObjectValue);
        var action = component.get("c.dynamicObject"); // call controller 
        try{
            action.setParams({ "objectName" : dynamicObjectValue});
            action.setCallback(this, function(response) {
                var state = response.getState();
                if (state === "SUCCESS") {
                    component.set("v.dynamicObject",'');
                    console.log(response.getReturnValue());
                    var returnVal = JSON.parse(response.getReturnValue());
                    console.log(returnVal.apiName);
                    component.set("v.ObjectApiName",returnVal.apiName);
                    component.set("v.dynamicObjectListViewData",returnVal.wrapperDeveloperNameListValue);
                    console.log(returnVal.wrapperDeveloperNameListValue);
                    component.set("v.showOrHide",true);
                }
            });
        }catch(e){
            console.log(e);
        }
        $A.enqueueAction(action);
        
    },
    handleChange: function (component, event) {
        // This will contain the string of the "value" attribute of the selected option
        
        var selectedOptionValue = event.getParam("value");
        component.set("v.listValueName", selectedOptionValue);
        component.set("v.showOrHide",false);
        component.set("v.showOrHide",true);
        //alert("Option selected with value: '" + selectedOptionValue + "'");
    }
})