trigger SalesforceProjectTrigger on Salesforce_Project__c (before insert, after insert) {
    if (Trigger.isAfter && trigger.isInsert) {
        //call method to create default ticket.
        SalesforceProjectTriggerHandler.createDefaultTicket(Trigger.New);
    }
}