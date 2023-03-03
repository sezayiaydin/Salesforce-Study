trigger PassengerTrigger on Passenger__c (after update) {
    if (Trigger.isAfter) {
        if (Trigger.isUpdate) {
            PassengerHandler.afterUpdate(Trigger.oldMap, Trigger.newMap);
        }
        
    }
}