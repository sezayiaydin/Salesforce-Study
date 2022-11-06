public class stringDemo {
    public void stringDemoMethod(){
        String asd='I am learning string methods in apex';

        integer lengtOfStr=asd.length();
        System.debug('lenght of the string is '+lengtOfStr);

        String toUpperCase=asd.toUpperCase();
        System.debug('String in uppercase '+toUpperCase);

        Boolean containsLearning=asd.contains('learning');
        system.debug('string conteins learning ' + containsLearning);


    }

}
