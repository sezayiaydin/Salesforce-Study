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
}
