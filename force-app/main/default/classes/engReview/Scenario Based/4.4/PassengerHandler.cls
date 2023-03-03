public with sharing class PassengerHandler {
    public static void afterUpdate(Map<Id, Passenger__c> oldPassengers, Map<Id, Passenger__c>  newPassengers){
        for (Id key : newPassengers.keySet()) {
            //check if the name or trips or airline info is changed
            Passenger__c oldPass=oldPassengers.get(key);
            Passenger__c newPass=newPassengers.get(key);  
        
            if (oldPass.Name !=newPass.Name || oldPass.Trips__c!=newPass.Trips__c|| oldPass.Airliness__c != newPass.Airliness__c){
                AirlinessCallouts.putPassengerDetails(key);
            }        
        }  
    }
}