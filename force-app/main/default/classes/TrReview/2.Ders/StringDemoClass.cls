public class StringDemoClass {
   public void stringMethod1(){
    string sessionDescription = 'Learning string method in apex language';

     //1. length
    integer lengthOfStr = sessionDescription.length();
        system.debug('length of string is ..... ' + lengthOfStr);

     //2. capitalize
     string sessionDescriptionInCaps = sessionDescription.toUpperCase();
     system.debug('capital string is....' + sessionDescriptionInCaps);

    //3. contains apex
    boolean containsApex = sessionDescription.CONTAINS('apex');
    system.debug('contains apex????????????????????? ' + containsApex);

    //3.x contains apex
    boolean containsApex2 = sessionDescription.containsIgnoreCase('APEX');
    system.debug('contains APEX?????? ' + containsApex2);

    //3.a contains salesforce
    boolean containsSalesforce = sessionDescription.containsIgnoreCase('salesforce');
    system.debug('contains Salesforce?????? ' + containsSalesforce);

    //trim
    string trimdemo=sessionDescription.trim();
    System.debug('Normal : '+sessionDescription);
    System.debug('Trim : '+trimdemo);

    //equals
    Boolean equalDemo=sessionDescription.equals('learning string method in apex langauge');
    System.debug('equal ? '+equalDemo );

    //uncapitalize
    String uncapitalizeDemo=sessionDescription.uncapitalize();
    System.debug('First Capitalize small : ' + uncapitalizeDemo );
   }
}
