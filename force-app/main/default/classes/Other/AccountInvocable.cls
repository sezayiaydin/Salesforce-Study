public class AccountInvocable {
    @InvocableMethod(label='Update Opportunities'
                    description='This method updates the stage name of given accounts related opportunities to closed lost'
                    category='Account')
    public static void updateOpps(List<Id> accountIds) {
        List<Opportunity> opps = [SELECT Id, StageName FROM Opportunity WHERE AccountId IN :accountIds];
        if(!opps.isEmpty()) {
            //iterate over the opps and set their stage
            for(Opportunity opp : opps) {
                opp.StageName = 'Closed Lost';
            }
            
            //update opps
            try {
                update opps;
            } catch(Exception ex) {
                System.debug(ex.getMessage());
            }
        }
    }
}