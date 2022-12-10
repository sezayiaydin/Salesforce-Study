trigger PaymentTrigger on Payments__c (
    after insert,
     after update,
      after delete,
       after undelete) {

    if (trigger.isAfter) {
        if (trigger.isInsert) {

            PaymentTriggerHandler.updateAmountOnPaymentInsert(trigger.new);
        }
        if (trigger.isUpdate) {

            PaymentTriggerHandler.updateAmountOnPaymentUpdate(trigger.new, trigger.oldMap);
        }

        if (trigger.isDelete) {

            PaymentTriggerHandler.updateAmountOnPaymentDelete(trigger.old);
        }
        if (trigger.isUndelete) {

            PaymentTriggerHandler.updateAmountOnPaymentUnDelete(trigger.new);
        }
        
    }

}