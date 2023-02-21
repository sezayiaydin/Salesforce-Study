public with sharing class AccountHandler {
    
    //class level constants
    private static final string STAGE_PROSPECT='Prospecting';
    private static final string TYPE_NEW_CUSTOMER='New Customer';
    private static final string STATUS_CLOSED='Closed';


    
    public static void afterInsert(List<Account> newAccount){
        List<Contact> contacts=new List<Contact>();
        List<Opportunity> opps=new List<Opportunity>();
        //2.2 de oluşturuldu
        Set<Account> telecomAccounts=new  Set<Account>();


        //iterate over the new accounts and create a contact&opp
        for (Account acc : newAccount) {
            //(Step 2.2 ) check if the industry is telecommunication
            if (acc.Industry=='Telecommunications') {
                telecomAccounts.add(acc);
            }
            //create a contact record
            Contact con=new Contact();
            con.LastName=acc.Name;
            con.Phone=acc.Phone;
            con.AccountId=acc.Id;
            contacts.add(con) ;
            
            //create an opportunity record
            Opportunity opp=new Opportunity();
            opp.Name=acc.Name;
            opp.StageName=STAGE_PROSPECT;
            opp.Type=TYPE_NEW_CUSTOMER;
            opp.Amount=acc.AnnualRevenue;
            opp.CloseDate=Date.today().addDays(7);
            opp.AccountId=acc.Id;
            opps.add(opp);                      
        }
        //(Step 2.2) invoke queueable on telecom accounts
        if (!telecomAccounts.isEmpty()) {
            TelecomAccountsQueueable queueable=new TelecomAccountsQueueable(telecomAccounts);
            System.enqueueJob(queueable);
        }

        //insert contacts
        if (!contacts.isEmpty()) {
            try {
                insert contacts;
            } catch (Exception Ex) {
                //create a log                
            }
        }
        //insert opps
        if (!opps.isEmpty()) {
            try {
                insert opps;
            } catch (Exception Ex) {
                //create a log                
            }
        }

    }
    //Update 1.3 den geliyor
    public static void afterUpdate(Map<Id, Account> oldAccounts, Map<Id, Account> newAccounts){
        Set<Id> accountIds=new Set<Id>();

        //check if the account's customer priority is changed
        for(Id accId :newAccounts.keySet()){
            Account oldAccount=oldAccounts.get(accId);
            Account newAccount=newAccounts.get(accId);
            if (newAccount.CustomerPriority__c!=oldAccount.CustomerPriority__c) {
                accountIds.add(newAccount.Id);
            }
        }

        //make the open cases priority aligned
        List<Case> cases=[SELECT Id, Priority, Account.CustomerPriority__c FROM Case WHERE AccountId IN : accountIds AND Status!= :STATUS_CLOSED];
        for (Case cs : cases) {
            cs.Priority=cs.Account.CustomerPriority__c;
        }
        try {
            update cases;
        } catch (Exception ex) {
            //Create a log
            System.debug(ex.getMessage());
        }
    }
    
    //delete 1.5 den geliyor
    public static void beforeDelete(Map<Id,Account> oldAccounts){
        //collect all the contacts,cases & opps
        List<Contact> contacts=[SELECT Id FROM Contact WHERE AccountId IN :oldAccounts.keySet()];
        List<Case> cases=[SELECT Id FROM Case WHERE AccountId IN :oldAccounts.keySet()];
        List<Opportunity> opps=[SELECT Id FROM Opportunity WHERE AccountId IN :oldAccounts.keySet()];

        //delete all records
        try {
            delete opps;
            delete cases;
            delete contacts;
        } catch (Exception ex) {
            //create error log
            System.debug(ex.getMessage());
        }
    }
}