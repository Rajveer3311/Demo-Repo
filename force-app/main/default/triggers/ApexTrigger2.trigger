trigger ApexTrigger2 on Account (before insert) 
{
    for(Account a : Trigger.new)
    {
        a.NumberOfEmployees=1200;
        a.AnnualRevenue=34000000;
    }
}