public class dateTest {
    public dateTest(){
        Date startDate = Date.newInstance(2008, 1, 1);
        Date dueDate = Date.newInstance(2008, 1, 30);
        Integer numberDaysDue = startDate.daysBetween(dueDate);
        System.debug(numberDaysDue);
        System.debug(Date.isLeapYear(2004));
        date myDate = date.newInstance(2004, 11, 21);
        Integer month = myDate.month();
        system.assertEquals(11, month);
        System.debug(Date.isLeapYear(2004));
        
        Date firstDate = Date.newInstance(2006, 12, 2);
        Date secondDate = Date.newInstance(2012, 12, 8);
        Integer monthsBetween = firstDate.monthsBetween(secondDate);
        System.assertEquals(72, monthsBetween);
        System.debug(monthsBetween);
        
        Date myDating = Date.today();
        Date weekStart = myDating.toStartofWeek();
        System.debug('Week'+myDating);
        
        date myDates = date.newInstance(1987, 12, 17);
date firstDates = myDates.toStartOfMonth();
date expectedDate = date.newInstance(1987, 12, 1);
system.assertEquals(expectedDate, firstDates);
        System.debug('toStartOfMonth'+expectedDate);
    }
}