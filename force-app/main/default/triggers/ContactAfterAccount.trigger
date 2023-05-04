trigger ContactAfterAccount on Account (before insert) {
    List<contact> cons=new List<contact>();
    for(Account acc : Trigger.New){
        Contact c=new Contact();
        c.accountid = acc.id;
        c.lastname = acc.name;
        c.phone = acc.phone;
        cons.add(c);
    }
    insert cons;
}