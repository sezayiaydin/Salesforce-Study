trigger AirlinesTrigger on Airlines__c (after insert) {
    if(Trigger.isAfter) {
        if(Trigger.isInsert) {
            AirlinesHandler.afterInsert(Trigger.new);
        }
    }
}