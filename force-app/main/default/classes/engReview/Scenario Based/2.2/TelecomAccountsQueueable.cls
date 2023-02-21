public with sharing class TelecomAccountsQueueable implements Queueable {
    private Set<Account> telecomAccounts=new Set<Account>();

    public TelecomAccountsQueueable(Set<Account> accounts) {
        this.telecomAccounts=accounts;
    }

    public void execute(System.QueueableContext cxt){
        List<Contact> contacts=new List<Contact>();

        //iterate over accounts and create a contact
        for (Account acc : telecomAccounts) {
            Contact con=new Contact();
            con.FirstName='Queueable';
            con.LastName=acc.Name;
            con.Email='test@test.com';
            con.Phone=acc.Phone;
            con.AccountId=acc.Id;
            contacts.add(con);
        }

        //insert contacts
        try {
            insert contacts;
        } catch (Exception ex) {
            //create log
            System.debug(ex.getMessage());
        }
    }
}