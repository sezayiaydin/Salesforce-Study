public with sharing class AddressBatch implements Database.Batchable<SObject>, Database.Stateful{
    
    private Integer recordsProcessed=0;
    
    public Database.QueryLocator start(Database.BatchableContext bc){
        String query='SELECT Id, BillingStreet, BillingCity, BillingState, BillingCountry, BillingPostalCode, '
                    +'(SELECT Id, MailingStreet, MailingCity, MailingState, MailingCountry, MailingPostalCode FROM Contacts) '
                    +'FROM Account';
        return Database.getQueryLocator(query);
    }

    public void execute(Database.BatchableContext bec, List<Account> scope){
        List<Contact> contacts = new List<Contact>(); //best practice

        //iterate over accounts and list of child contacts
        for (Account acc : scope) {
            for (Contact con : acc.Contacts) {
                con.MailingStreet=acc.BillingStreet;
                con.MailingCity=acc.BillingCity;
                con.MailingState=acc.BillingState;
                con.MailingCountry=acc.BillingCountry;
                con.MailingPostalCode=acc.BillingPostalCode;
                //update contact (Tüm contactlar update olur not best practice)
                contacts.add(con);//best practice
                recordsProcessed++;
            }
        }

        //update contacts
        try {
            update contacts;
        } catch (Exception ex) {
            //create log
            System.debug(ex.getMessage());
        }
    }
    public void finish(Database.BatchableContext bc){
        // //get the batch job id
        // Id jobId=bc.getJobId();

        //Send an email
        List<Messaging.SingleEmailMessage> msgs= new List<Messaging.SingleEmailMessage>();
        Messaging.SingleEmailMessage msg=new Messaging.SingleEmailMessage();
        List<String> toAddresses=new List<String>{'salesdevelopernew@gmail.com'};
        msg.setToAddresses(toAddresses);
        msg.setSubject('Address Batch Completed');
        msg.setPlainTextBody('Address Batch Apex has been completed. The records processed are: '+recordsProcessed);
        msgs.add(msg);
        Messaging.sendEmail(msgs);
    }
}