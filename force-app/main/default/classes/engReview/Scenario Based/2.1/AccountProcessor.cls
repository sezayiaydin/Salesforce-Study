public with sharing class AccountProcessor {
   
    @future
    public static void processAccounts(List<Id> accountIds) {
        //collect all the accounts along with its cases
        List<Account> accounts=[SELECT Id, CasesThroughEmail__c,CasesThroughPhone__c,CasesThroughWeb__c,
                                (SELECT Id, Origin FROM Cases)
                                FROM Account
                                WHERE Id IN:accountIds];

        //iterate over the accounts and its respective cases to count them by category
        for (Account acc : accounts) {
            Integer web=0;
            Integer phone=0;
            Integer email=0;
            for (Case cs : acc.Cases) {
                if (cs.Origin=='Web') {
                    web++;
                } else if(cs.Origin=='Phone') {
                    phone++;
                }else if(cs.Origin=='Email'){
                    email++;
                }
            }
            acc.CasesThroughEmail__c=email;
            acc.CasesThroughPhone__c=phone;
            acc.CasesThroughWeb__c=web;


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