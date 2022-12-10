@isTest
public with sharing class RestCalloutsTest {
    @isTest
    private static void getAnimalsTest() {
        RestCalloutsMock mock = new RestCalloutsMock();
        Test.setMock(HttpCalloutMock.class, mock);
        HttpResponse response = RestCallouts.getAnimals();
        System.assertEquals(200, response.getStatusCode());
        System.assertEquals('OK', response.getStatus());
    }
}