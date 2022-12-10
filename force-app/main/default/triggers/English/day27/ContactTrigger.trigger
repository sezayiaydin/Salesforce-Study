trigger ContactTrigger on Contact (before insert, before update, after insert, after update) {
   
   
//check if switch is ON or OFF.
TriggerSwitch__c accountSwitch = TriggerSwitch__c.getInstance('contact');
boolean accSwitch = accountSwitch.switch__c; //checkbox field
    if (accSwitch == false) {
        return;
    }
// if OFF
    //return

   
    if (Trigger.isBefore && Trigger.isUpdate) {
        //validate it here.
        ContactTriggerHandler.contactUpdateValidation1(Trigger.New, Trigger.Old, Trigger.NewMap, Trigger.OldMap);
        ContactTriggerHandler.contactUpdateValidation2(Trigger.New, Trigger.Old, Trigger.NewMap, Trigger.OldMap);
    }
}