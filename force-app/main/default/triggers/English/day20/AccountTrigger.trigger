trigger AccountTrigger on Account (before insert, before update, after insert, after update) {

//check if switch is ON or OFF.
TriggerSwitch__c accountSwitch = TriggerSwitch__c.getInstance('account');
boolean accSwitch = accountSwitch.switch__c; //checkbox field
    if (accSwitch == false) {
        return;
    }
// if OFF
    //return


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