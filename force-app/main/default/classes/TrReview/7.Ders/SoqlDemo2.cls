public class SoqlDemo2 {
    public static void childToParent_soql1() {
        //list<sObject> on whichever object we are doing query.
        List<contact> listContact = [SELECT id, name, account.name, account.Industry,account.AccountSource FROM contact 
                        WHERE account.industry = 'Energy'];
        for (contact eachContact : listContact) {
            System.debug('eachContact'+eachContact);
            string accName = eachContact.account.name;
            string accIndustry = eachContact.account.Industry;//will this work?
            system.debug('contact name is ' + eachContact.name + ' account name => ' + accName+'account.AccountSource :'+account.AccountSource);
        }
    }
    public static void childToParent_soql2() {
        //list<sObject> on whichever object we are doing query.
        List<Salesforce_Ticket__c> listTicket = [SELECT Id, Name, Subject__c, Status__c, Priority__c, SalesForce_Project__r.Name, SalesForce_Project__r.Status__c, SalesForce_Project__r.Project_Name__c FROM Salesforce_Ticket__c];
        for (Salesforce_Ticket__c eachTicket : listTicket) {
            string ProjectName = eachTicket.SalesForce_Project__r.Name;
            string projectStatus = eachTicket.SalesForce_Project__r.Status__c;
            system.debug('Ticket name is => ' + eachTicket.Name + '  Ticket subject is => '+ eachTicket.Subject__c );
            system.debug(' Project Name => ' + ProjectName+' Project status => ' + projectStatus );
            System.debug('--------------------------------------');
        }
    }

    public static void parentToChild_soql1() {
        list<account> listAccWithOpps  = [SELECT id, name, annualrevenue, type, 
                            (SELECT id, name, amount, stagename FROM opportunities WHERE stageName = 'Closed Won') 
                            FROM account WHERE type = 'Customer - Direct' LIMIT 3];
        //account name, its annual revenue
            //opp name --> amount -->
            System.debug('Account Listesi'+listAccWithOpps);
         for (account eachAcc : listAccWithOpps) {
             system.debug('account name is ' + eachAcc.Name + ', and annual revenue is ' + eachAcc.AnnualRevenue);
             List<Opportunity> listOpp = eachAcc.Opportunities;
             System.debug(eachAcc.Name + ' Accountuna Bağlı tüm Opportunitiler: '+listOpp);
             for (opportunity eachOpp : listOpp) {
                 system.debug('opp name is ' + eachOpp.Name);
                 system.debug('oppp amount is ' + eachOpp.Amount);
             }
             system.debug('-------');
         }   
    }

    public static void parentToChild_soql2() {
        list<salesforce_project__c> listSP = [SELECT id, name, project_name__c, 
                            (SELECT priority__c, name FROM salesforce_tickets__r) 
                            FROM salesforce_project__c];
        Integer totalTicket =0;
        integer totalHP = 0;
        for (salesforce_project__c eachSP : listSP) {
            system.debug('-----------------------------------------------------------------------------------------' );
            system.debug('project name is ' + eachSP.project_name__c);
            List<salesforce_ticket__c> listST = eachSP.salesforce_tickets__r; 
            //how to get count of the list?
            integer totalTickets = listST.size();
            system.debug('total tickets in project is ' + totalTickets);
            //# of High priority tickets in each project.
            integer eachProjectHP = 0;
            for (salesforce_ticket__c eachST : listST) {
                system.debug('eachST ==> ' + eachST);
                System.debug('***********');
                totalTicket++;
                if (eachST.priority__c == 'High') {
                    eachProjectHP++;
                    totalHP++;
                }
            }
            system.debug('# of High priority tickets ' + eachProjectHP);
        }
        System.debug('totalTicket=> '+totalTicket);
        System.debug('TotalHp=> '+totalHP);
    }
}