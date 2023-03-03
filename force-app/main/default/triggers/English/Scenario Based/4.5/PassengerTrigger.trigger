trigger PassengerTrigger on Passenger__c (after update, after delete) {
    if (Trigger.isAfter) {
        if (Trigger.isUpdate) {
            PassengerHandler.afterUpdate(Trigger.oldMap, Trigger.newMap);
        }
        if (Trigger.isDelete) {
            PassengerHandler.afterDelete(Trigger.old);
        }
        
    }
}