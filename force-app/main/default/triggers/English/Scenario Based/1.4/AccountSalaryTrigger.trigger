trigger AccountSalaryTrigger on AccountSalary__c (after insert) {
    if (Trigger.isAfter) {
        if (Trigger.isInsert) {
            AccountSalaryHandler.afterInsert(Trigger.new);
        }
    }
}