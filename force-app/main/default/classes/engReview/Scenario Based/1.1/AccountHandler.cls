public with sharing class AccountHandler {
    
    //class level constants
    private static final string STAGE_PROSPECT='Prospecting';
    private static final string TYPE_NEW_CUSTOMER='New Customer';

    
    public static void afterInsert(List<Account> newAccount){
        List<Contact> contacts=new List<Contact>();
        List<Opportunity> opps=new List<Opportunity>();


        //iterate over the new accounts and create a contact&opp
        for (Account acc : newAccount) {
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
    
}