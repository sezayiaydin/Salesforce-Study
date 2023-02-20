public with sharing class OpportunityHandler {
    public static void afterInsert(List<Opportunity> newOpps){
        Set<Id> accountIds=new Set<Id>();

        //iterate over new opps and collect parent accounts
        for (Opportunity opp : newOpps) {
            if (opp.AccountId !=Null) {
                accountIds.add(opp.AccountId);
            }
        }

        //Calculate total opps & total amounts
        updateAccounts(accountIds);
    }

    private static void updateAccounts(Set<Id>accountIds){
        //get the accounts along with children opps
        List<Account> accounts=[SELECT Id,TotalOpps__c, TotalAmount__c, (SELECT Id, Amount FROM Opportunities)
                                FROM Account
                                WHERE ID IN :accountIds];

        for (Account acc : accounts) {
            acc.TotalOpps__c=acc.Opportunities.size();

            Decimal total=0;
            for(Opportunity opp:acc.Opportunities){
                total += opp.Amount;
            }
            acc.TotalAmount__c=total;
        }
        //update accounts
        if (!accounts.isEmpty()) {
            try {
                update accounts;
            } catch (Exception ex) {
                //create a log
                
            }
        }
    
    }
}