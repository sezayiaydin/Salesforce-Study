@isTest
public with sharing class ParksServicesMock implements WebServiceMock {
    public void doInvoke(Object a, Object b, Map<String,Object> response, String c, String d, String e, String f, String g, String h) {
        ParksServices.byCountryResponse response_x = new ParksServices.byCountryResponse();
        response_x.return_x = new List<String>{'My Park 1', 'My Park 2'};
        response.put('response_x', response_x);
    }
}