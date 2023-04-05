@isTest
public class CaseTriggerP7HandlerTest {
    @isTest
    private static void testMethodChildCasePositive() {
        List<Case> listCases = new List<Case>();
        for (Integer i = 0; i < 250; i++) {
            case c=new Case();
            c.Subject='Testtt'+' '+Integer.valueOf(i);
            c.Priority='High';
            c.Description='Contains Password';
            listCases.add(c);
        }
        insert listCases;
        List<Case> getCases=[SELECT Id,Subject, Description FROM Case WHERE ParentId IN :listCases];
        System.assertEquals(250, getCases.size());
        System.assertEquals('Parent Case may contain secret info, do something NOW', getCases[0].Subject);

    }

    @isTest
    private static void testMethodChildCaseNegative() {
        List<Case> listCases = new List<Case>();
        for (Integer i = 0; i < 250; i++) {
            case c=new Case();
            c.Subject='Testtt'+' '+Integer.valueOf(i);
            c.Priority='High';
            c.Description='Contains Nothing';
            listCases.add(c);
        }
        insert listCases;
        List<Case> getCases=[SELECT Id,Subject, Description FROM Case WHERE ParentId IN :listCases];
        System.assertEquals(0, getCases.size());  

    }
}