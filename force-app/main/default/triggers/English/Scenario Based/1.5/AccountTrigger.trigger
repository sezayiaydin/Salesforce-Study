//after update 1.3 den geliyor
//before delete 1.5 den geliyor
trigger AccountTrigger on Account (before delete, after insert, after update) {
    if (Trigger.isBefore) {
        if (Trigger.isDelete) {
            AccountHandler.beforeDelete(Trigger.oldMap);
        }
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) {
            AccountHandler.afterInsert(Trigger.new);
        }
        if (Trigger.isUpdate) {
            AccountHandler.afterUpdate(Trigger.oldMap, Trigger.newMap);
        }
        
    }
}