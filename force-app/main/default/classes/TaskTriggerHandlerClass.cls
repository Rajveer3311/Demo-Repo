public class TaskTriggerHandlerClass {
    public Static void onAfterInsert(List<Task> newList,map<Id,Task> oldmap){
        TaskTriggerHelperClass.AllTriggerEvent(newList,oldMap);
  
    }
    public Static void onAfterUpdate(List<Task> newList,map<Id,Task> oldmap){
        TaskTriggerHelperClass.AllTriggerEvent(newList,oldMap);
  
    }
}