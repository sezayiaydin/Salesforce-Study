public  class PrimitiveDataTypeDemo2 {
    public void printNewDate(){
        system.debug('create new date instances');

        Date newDate1=date.newInstance(1195, 2, 17);
        system.debug('newDate1--->'+newDate1);

        Date newDate2=date.newInstance(2021, 10, 7);
        system.debug('newDate2--->'+newDate2);

        Date todayDate=date.today();
        system.debug('Today\'s Date--->'+todayDate);
        }
    public void printNewTime(){
        time mytime=time.newInstance(18, 9, 30, 25);
        time mytime2=time.newInstance(7,9, 8, 15);

        System.debug('mytime-->'+mytime);
        System.debug('mytime2-->'+mytime2);
        }
    public void printNewDateTime(){
        Date todayDate=date.today();
        time mytime=time.newInstance(18, 9, 30, 25)  ;

        Datetime dt1=Datetime.newInstance(todayDate,mytime);
        System.debug('dt1--->'+dt1);

        Datetime dt2=Datetime.newInstance(2025,9,14);
        System.debug('dt2--->'+dt2);

        Datetime dt3=Datetime.newInstance(2022,4,15,8,8,8);
        System.debug('dt3--->'+dt3);

        Long longTime1=0;
        Datetime dt4=Datetime.newInstance(longTime1);
        Long longTime2=1387844563214L;
        Datetime dt5=Datetime.newInstance(longTime2);

        System.debug('dt4--->'+dt4);
        System.debug('dt5--->'+dt5);

        Datetime dt6=Datetime.now();
        System.debug('dt6--->'+dt6);



        }


}


// public void printmyTimeZone(){
//     TimeZone tz=user.getTimeZone();
//     Datetime dt=Datetime.now();

//     System.debug('Actual Time as String : ' +dt.format());
//     System.debug('Offset '+tz.getOffset(dt)/1000);
//     System.debug('Formatted Time '+dt.addSeconds((tz.getOffset(dt)/1000)));

// }