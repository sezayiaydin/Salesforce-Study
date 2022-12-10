@isTest
public with sharing class ParksServicesTest {
    
    @isTest
    private static void getParksByCountryTest() {
        Test.startTest();
        ParksServicesMock mock = new ParksServicesMock();
        Test.setMock(WebServiceMock.class, mock);
        String country = 'Turkey';
        String[] parks = SoapCallouts.getParksByCountry(country);
        Test.stopTest();
        System.assertEquals(2, parks.size());
    }
}