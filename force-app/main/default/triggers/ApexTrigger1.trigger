trigger ApexTrigger1 on Account (before insert) {
    Account a=Trigger.new[0];
    System.debug(a);
    a.Name=a.Name+' Limited';
    System.debug('######################'+a);
}