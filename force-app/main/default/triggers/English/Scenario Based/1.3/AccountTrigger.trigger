//after update 1.3 den geliyor
trigger AccountTrigger on Account (after insert, after update) {
    if (Trigger.isAfter) {
        if (Trigger.isInsert) {
            AccountHandler.afterInsert(Trigger.new);
        }
        if (Trigger.isUpdate) {
            AccountHandler.afterUpdate(Trigger.oldMap, Trigger.newMap);
        }
        
    }
}