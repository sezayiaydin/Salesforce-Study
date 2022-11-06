public with sharing class PaymentTriggerHandler {
    
    public static void updateAmountOnPaymentInsert(List<Payments__c> triggerNew){

        Set<Id> customersIdsSet = new  Set<Id>(); 
        for (Payments__c pym : triggerNew) {
            if (pym.Amount__c!=null) {
                customersIdsSet.add(pym.Customer__c); 
                
            }
        }

        if (!customersIdsSet.isEmpty()) {

            updateAmountOnCustomer(customersIdsSet);
    }
}
    public static void updateAmountOnPaymentUpdate(List<Payments__c> triggerNew, Map<Id, Payments__c> triggerOldMap){

        Set<Id> customersIdsSet = new  Set<Id>(); 
        for (Payments__c p : triggerNew) {
            Payments__c oldRec = triggerOldMap.get(p.Id);
            if ((p.Amount__c != oldRec.Amount__c || p.Customer__c!=oldRec.Customer__c) && p.Amount__c!=null) {
                customersIdsSet.add(p.Customer__c);
                customersIdsSet.add(oldRec.Customer__c);
            }

            if (!customersIdsSet.isEmpty()) {

                updateAmountOnCustomer(customersIdsSet);
        }
        }
    }

    public static void updateAmountOnPaymentDelete(List<Payments__c> triggerOld){

            Set<Id> customersIdsSet = new  Set<Id>(); 
            for (Payments__c pym : triggerOld) {
                if (pym.Amount__c!=null) {
                    customersIdsSet.add(pym.Customer__c); 
                    
                }
            }

            if (!customersIdsSet.isEmpty()) {

                updateAmountOnCustomer(customersIdsSet);
        }
    }

    public static void updateAmountOnPaymentUnDelete(List<Payments__c> triggerNew){

        Set<Id> customersIdsSet = new  Set<Id>(); 
        for (Payments__c pym : triggerNew) {
            if (pym.Amount__c!=null) {
                customersIdsSet.add(pym.Customer__c); 
                
            }
        }

        if (!customersIdsSet.isEmpty()) {

            updateAmountOnCustomer(customersIdsSet);
    }
}







    public static void updateAmountOnCustomer(Set<id> customersIdsSet){

        List<Customer__c> customerRelatedPayment = [SELECT Id, Total_Amount__c, (SELECT Id, Amount__c FROM Payments__r) FROM Customer__c WHERE Id IN :customersIdsSet];

        List<Customer__c> updatedCustomerList = new List<Customer__c>();

        for (Customer__c c : customerRelatedPayment) {
            Decimal totalAmount = 0 ;
            for (Payments__c p : c.Payments__r) {
                totalAmount = totalAmount + p.Amount__c;
            }
            c.Total_Amount__c = totalAmount;
            updatedCustomerList.add(c);
        }
        if (!updatedCustomerList.isEmpty()) {
            update updatedCustomerList; 
        }
    }
}