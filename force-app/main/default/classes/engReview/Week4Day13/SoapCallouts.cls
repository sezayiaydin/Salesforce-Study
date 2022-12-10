public with sharing class SoapCallouts {
    public static String[] getParksByCountry(String country) {
        ParksServices.ParksImplPort parksService = new ParksServices.ParksImplPort();
        String[] parks = parksService.byCountry(country);
        System.debug(parks);
        return parks;
    }
}