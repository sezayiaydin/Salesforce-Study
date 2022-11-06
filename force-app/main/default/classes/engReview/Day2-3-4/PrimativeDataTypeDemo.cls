public class PrimativeDataTypeDemo {
    public void printBasicDataType(){
        System.debug('inside print basic datatype method.');

        String batchName='Batch 10';
        Integer totalCandidates=85;
        Boolean isAdminCompleted=true;

        System.debug(batchName);
        System.debug(totalCandidates);
        System.debug(isAdminCompleted);

        string batchDescription=batchName+' is amazing, Really';

        System.debug(batchDescription);

        Decimal decValue=77.88;
        system.debug('dec Value - '+decValue);

        Long longValue=778899L;
        system.debug('Long Value - '+longValue);

        Object obj='this is a string objject';
        System.debug('obj is '+obj);

        Object obj2=987.5;
        System.debug('obj2 is '+obj2);

        Id id1='0014x00001M3tgUAAR';
        System.debug('id1 is '+id1);
        


        
    }
    
}
