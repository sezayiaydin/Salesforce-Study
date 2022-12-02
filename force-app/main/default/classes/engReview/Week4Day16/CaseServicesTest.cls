@isTest
public with sharing class CaseServicesTest {
    @TestSetup
    private static void makeData() {
        //prepare 3 case records
        List<Case> cases = new List<Case>();
        for(Integer i=0; i<3; i++) {
            Case cs = TestSuite.createCase('Web', 'High');
            cases.add(cs);
        }
        insert cases;
    }

    @isTest 
    private static void getCaseTest() {
        //prepare RestRequest
        Case cs = [SELECT Id FROM Case LIMIT 1];
        String homeUrl = System.URL.getSalesforceBaseUrl().toExternalForm();
        RestRequest request = new RestRequest();
        request.requestURI = homeUrl + '/services/apexrest/Case/' + cs.Id;
        request.httpMethod = 'GET';

        //prepare RestContext
        RestContext.request = request;

        //test method
        Test.startTest();
        Case csObj = CaseServices.getCase();
        System.assertEquals(cs.Id, csObj.Id);
        Test.stopTest();
    }

    @isTest 
    private static void postCaseTest() {
        Test.startTest();
        Id caseId = CaseServices.postCase('High', 'Email', 'Test Subject', 'Test Desc');
        System.assertNotEquals(caseId, null);
        Test.stopTest();
    }

    @isTest 
    private static void deleteCaseTest() {
        //prepare RestRequest
        Case cs = [SELECT Id FROM Case LIMIT 1];
        String homeUrl = System.URL.getSalesforceBaseUrl().toExternalForm();
        RestRequest request = new RestRequest();
        request.requestURI = homeUrl + '/services/apexrest/Case/' + cs.Id;
        request.httpMethod = 'DELETE';

        //prepare RestContext
        RestContext.request = request;

        //test method
        Test.startTest();
        String status = CaseServices.deleteCase();
        System.assertEquals('Case has been deleted successfully!', status);
        Test.stopTest();
    }

    @isTest 
    private static void putCaseTest() {
        Test.startTest();
        //1. lets not pass case id and test
        Id caseId = CaseServices.putCase(null, 'High', 'Email', 'Test Subject', 'Test Description');
        System.assertNotEquals(null, caseId);

        //2. lets pass case id but update 2 fields
        Id caseId2 = CaseServices.putCase(caseId, 'Medium', 'Web', 'Test Subject', 'Test Description');
        System.assertEquals(caseId, caseId2);
        Test.stopTest();
    }

    @isTest 
    private static void patchCaseTest() {
        //prepare RestRequest
        Test.startTest();
        Case cs = [SELECT Id, Priority, Origin, Subject, Description FROM Case WHERE Priority = 'High' LIMIT 1];
        cs.Priority = 'Low';
        String jsonString = JSON.serialize(cs);
        RestRequest request = new RestRequest();
        request.requestBody = Blob.valueOf(jsonString);
        request.httpMethod = 'PATCH';

        //Prepare RestContext
        RestContext.request = request;

        //Perform tests
        Case updatedCase = CaseServices.patchCase();
        System.assertEquals('Low', updatedCase.Priority);
        Test.stopTest();
    }
}