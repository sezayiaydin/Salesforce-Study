        List<Salesforce_Project__c> projects = new List<Salesforce_Project__c>();        
        
        for (Integer i = 1; i <= 30; i++) {
            Salesforce_Project__c sp = new Salesforce_Project__c();
            sp.Project_Name__c = 'Project ' + i;
            if (i <= 10) {
                sp.Status__c = 'New';
            } else if (i <= 20) {
                sp.Status__c = 'In - progress';
            } else {
                sp.Status__c = 'Completed';
            }
            projects.add(sp);
        }
        insert projects;

        List<Salesforce_Ticket__c> tickets = new List<Salesforce_Ticket__c>();
        
        integer T = 1;
        for (Salesforce_Project__c sp : projects) {
            Salesforce_Ticket__c st1 = new Salesforce_Ticket__c();
            st1.Subject__c = 'Ticket ' + T;
            st1.Priority__c = 'High';
            st1.Salesforce_Project__c = sp.Id;
            Salesforce_Ticket__c st2 = new Salesforce_Ticket__c();
            T++;
            st2.Subject__c = 'Ticket ' + (T);
            st2.Priority__c = 'Medium';
            st2.Salesforce_Project__c = sp.Id;
            Salesforce_Ticket__c st3 = new Salesforce_Ticket__c();
            T++;
            st3.Subject__c = 'Ticket ' + (T);
            st3.Priority__c = 'Low';
            st3.Salesforce_Project__c = sp.Id;
            T++;
         

            tickets.add(st1);
            tickets.add(st2);
            tickets.add(st3);
        }
        insert tickets;







List<Salesforce_Ticket__c> ticketList = [SELECT id FROM Salesforce_Ticket__c];
delete ticketList;

List<Salesforce_Project__c> projectList = [SELECT id FROM Salesforce_Project__c];
delete projectList;