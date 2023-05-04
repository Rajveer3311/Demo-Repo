({
    getLabel : function(component, event, helper) {
        var myLabel = component.get("v.label");
        console.log(myLabel);
        component.set("v.buttonLabel", myLabel);
    }
})