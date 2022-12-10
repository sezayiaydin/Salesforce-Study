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

    @isTest
    private static void getBlogsTest() {
        RestCalloutsMock mock = new RestCalloutsMock();
        Test.setMock(HttpCalloutMock.class, mock);
        HttpResponse response = RestCallouts.getBlogs();
        System.assertEquals(200, response.getStatusCode());
        System.assertEquals('OK', response.getStatus());
    }

    @isTest
    private static void getProductsTest() {
        RestCalloutsMock mock = new RestCalloutsMock();
        Test.setMock(HttpCalloutMock.class, mock);
        HttpResponse response = RestCallouts.getProducts();
        System.assertEquals(200, response.getStatusCode());
        System.assertEquals('OK', response.getStatus());
    }

    @isTest
    private static void postAnimalTest() {
        RestCalloutsMock mock = new RestCalloutsMock();
        Test.setMock(HttpCalloutMock.class, mock);
        HttpResponse response = RestCallouts.postAnimal();
        System.assertEquals(201, response.getStatusCode());
        System.assertEquals('Created', response.getStatus());
    }

    @isTest
    private static void postGorestContactTest() {
        //prepare test gorest contact records
        Gorest_Contact__c con = new Gorest_Contact__c(); //Name, Email__c, Gender__c, Status__c
        con.Name = 'Test Name';
        con.Email__c = 'testemail@test.com';
        con.Gender__c = 'male';
        con.Status__c = 'active';
        insert con;

        //test callout
        Test.startTest();
        RestCalloutsMock mock = new RestCalloutsMock();
        Test.setMock(HttpCalloutMock.class, mock);
        HttpResponse response = RestCallouts.postGorestContact();
        Test.stopTest();
        System.assertEquals(201, response.getStatusCode());
        System.assertEquals('Created', response.getStatus());
    }
}