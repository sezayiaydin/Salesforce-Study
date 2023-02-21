public with sharing class AccountSalaryHandler {
    public static void afterInsert (List<AccountSalary__c>newSalaries){
        Set<Id> accountsIds=new Set<Id>();
        //iterate over salary records & collect their parent account ids
        for (AccountSalary__c sal : newSalaries) {
            accountsIds.add(sal.Account__c);
        }

        //get all the accounts along with its children salary records
        List<Account> accounts=[SELECT Id, TotalSalary__c, MaxSalary__c,
                                (SELECT Id, Account__c, Salary__c FROM AccountSalaries__r)
                                FROM Account
                                WHERE Id IN:accountsIds];
        for (Account acc : accounts) {
            Decimal total=0.0;
            Decimal max=0.0;
            for (AccountSalary__c sal : acc.AccountSalaries__r) {
                if (max<sal.Salary__c) {
                    max=sal.Salary__c;
                }
                total=total+sal.Salary__c;
            }
            acc.TotalSalary__c=total;
            acc.MaxSalary__c=max;
        }

        //update accounts
        try {
            update accounts;
        } catch (Exception ex) {
            //create log
            System.debug(ex.getMessage());
        }
    }
}