trigger AccountTrigger on Account (before insert, before update, after insert, after update) {
    system.debug('---start---');
    if (Trigger.isBefore) {
        
        AccountTriggerHandler.updateAccountDescription(Trigger.New, Trigger.Old, Trigger.NewMap, Trigger.OldMap);
    }
    if (Trigger.isAfter && Trigger.isUpdate) {
        //udpate VIP field for all its contacts.
        AccountTriggerHandler.updateVIPforAllContacts(Trigger.New, Trigger.Old, Trigger.NewMap, Trigger.OldMap);
    }
    system.debug('---end---');
}