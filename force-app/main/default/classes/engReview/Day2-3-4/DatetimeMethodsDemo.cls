public class DatetimeMethodsDemo {
    public void calculateAgeInMonths(){
                                    //YEAR, MONTH, DAY
        date birthdate = date.newInstance(1980, 01, 28);
        date todayDate = date.today();

        integer ageInMonths = birthdate.monthsBetween(todayDate);
        system.debug('Sez age is months is ' + ageInMonths);
        
    }
    public void calculateAgeInDays(){
        date birthdate = date.newInstance(1980, 01, 28);
        date todayDate = date.today();

        integer ageIndays = birthdate.daysBetween(todayDate);
        system.debug('Sez age is days is ' + ageIndays);
    }
    public void printSubscriptionEndDate(){
        date subscriptionStartDate = date.today();
        
        date subscriptionEndDate = subscriptionStartDate.addDays(1000);
        system.debug('subscription end date is .... ' + subscriptionEndDate);
    }
}