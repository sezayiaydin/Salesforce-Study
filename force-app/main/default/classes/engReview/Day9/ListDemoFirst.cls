public class ListDemoFirst {
    public static void candidateList() {
        //className instanceName = new className();
        List<string> listCandidate = new list<string>();
        listCandidate.add('Marc');
        listCandidate.add('Elon');
        listCandidate.add('Bill');
        listCandidate.add('Marc');
        system.debug('listCandidates => ' + listCandidate);

       
    }

    public static void randomIntegerList() {
        List<integer> listInteger = new list<integer>();
        listInteger.add(15);//0
        listInteger.add(21);//1
        listInteger.add(10);//2
        listInteger.add(15);//3
        listInteger.add(15);//4
        system.debug('list integer ===> ' + listInteger);

        integer index3value = listInteger.get(3);
        system.debug('index 3 value is ===>' + index3value);

        integer index2value = listInteger[2];
        system.debug('index 2 value is ==> ' + index2value);
    }
}
