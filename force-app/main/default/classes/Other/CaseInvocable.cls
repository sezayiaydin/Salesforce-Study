public class CaseInvocable {

    @InvocableMethod(label='Send Email & Save Activity' 
                    description='Sends an email and saves the same under contact as activity'
                    category='Case')
    public static void sendEmailSaveActivity(List<RequestInputs> inputs) {
        List<Messaging.SingleEmailMessage> msgs = new List<Messaging.SingleEmailMessage>();
        //1. Iterate over list of inputs and prepare one email for each
        for(RequestInputs input : inputs) {
            Messaging.SingleEmailMessage msg = new Messaging.SingleEmailMessage();
            msg.setSubject('Case Created: ' + input.caseNumber);
            msg.setPlainTextBody('Hi there, '
                                 + '\n A case has been created for your query. Please quote the case number when you call us next time. '
                                 + '\n\n Thanks,'
                                 + '\n Salesforce');
            msg.setTargetObjectId(input.contactId);
            msg.setSaveAsActivity(true);
            msgs.add(msg);
        }
        //2. Send those emails
        try {
            Messaging.sendEmail(msgs);
        } catch(Exception ex) {
            System.debug(ex.getMessage());
        }
    }
    
    public class RequestInputs {
        @InvocableVariable(label='Case Number' description='Case Number' required=true)
        public String caseNumber;
        
        @InvocableVariable(label='Contact Id' description='Contact Id' required=true)
        public Id contactId;
    }
}