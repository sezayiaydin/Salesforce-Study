trigger SalesforceProjectTrigger on Salesforce_Project__c (before insert, after insert, before update, after update) {
    if (Trigger.isAfter && trigger.isInsert) {
        //call method to create default ticket.
        SalesforceProjectTriggerHandler.createDefaultTicket(Trigger.New);
        
        system.debug('calling future method....');
        SalesforceProjectTriggerHandler.updateDescription(Trigger.newMap.keySet());
        system.debug('DONE calling future method....');
    }
    if(Trigger.isBefore && Trigger.isUpdate){
        //validation method
        //SalesforceProjectTriggerHandler.validateProjectCompletion(trigger.new, trigger.old, trigger.newMap, trigger.oldMap);
    }
    if (trigger.isAfter && trigger.isUpdate) {
        SalesforceProjectTriggerHandler.spCompletedStatus(trigger.new, trigger.old, trigger.newMap, trigger.oldMap);
    }
}
/*
21.10.2022
trigger SalesforceProjectTrigger on Salesforce_Project__c (before insert, after insert, before update) {
    if (Trigger.isAfter && trigger.isInsert) {
        //call method to create default ticket.
        SalesforceProjectTriggerHandler.createDefaultTicket(Trigger.New);
        
        system.debug('calling future method....');
        SalesforceProjectTriggerHandler.updateDescription(Trigger.newMap.keySet());
        system.debug('DONE calling future method....');
    }
    if(Trigger.isBefore && Trigger.isUpdate){
        //validation method
        SalesforceProjectTriggerHandler.validateProjectCompletion(trigger.new, trigger.old, trigger.newMap, trigger.oldMap);
    }
}
*/
/*
21.10.2022 öncesi
public class SalesforceProjectTriggerHandler {
    public static void createDefaultTicket(List<Salesforce_Project__c> spTriggerNew) {
        List<Salesforce_Ticket__c> listST = new List<Salesforce_Ticket__c>();
        
        for (salesforce_project__c eachSP : spTriggerNew) {
            Salesforce_Ticket__c st = new Salesforce_Ticket__c();
            st.Subject__c = 'Default ST';
            st.Salesforce_Project__c = eachSP.id;
            listST.add(st);
        }
        if (!listST.isEmpty()) {
            insert listST;
        }
    }

    public static void validateProjectCompletion(List<Salesforce_Project__c> spTriggerNew, List<Salesforce_Project__c> spTriggerOld,
    Map<id, Salesforce_Project__c> spTriggerNewMap, Map<id, Salesforce_Project__c> spTriggerOldmap) {
        //get projects for which STATUS is CHANGED to 'COMPLETED'
        set<id> setProjectId = new set<id>();
        for (salesforce_project__c eachSP : spTriggerNew) {
            if (eachSp.Status__c != spTriggerOldMap.get(eachSp.id).Status__c
            && eachSp.Status__c == 'Completed') {
                setProjectId.add(eachSP.id);
            }
        }
        system.debug('sp ids in set==> ' + setProjectId);

        //get all tickets of 'setProjectId' which are NOT completed
        List<Salesforce_Ticket__c> listST = [select id, status__c, salesforce_project__c from Salesforce_Ticket__c
            where salesforce_project__c in :setProjectId and status__c != 'Completed'];

        for (salesforce_ticket__c eachST : listST) {
            Salesforce_Project__c sp = spTriggerNewMap.get(eachST.Salesforce_Project__c);
            sp.addError('Cannot completed project because all its tickets are not completed. OKAY?');
        }
    }
}

*/