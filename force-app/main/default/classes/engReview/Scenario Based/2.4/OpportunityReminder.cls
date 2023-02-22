public with sharing class OpportunityReminder implements Schedulable {
    
    
    public  void execute (SchedulableContext sc){
        List<Task> tasks = new List<Task>(); //birden fazla task olabilir liste olması lazım yoksa tek olsaydı 17.satır insert task olurdu
        Date todayPlus2=Date.today().addDays(2);

        //identify the target records and create a task for each
        for (Opportunity opp : [SELECT Id, OwnerId FROM Opportunity 
                                WHERE CloseDate<= :todayPlus2 
                                AND StageName NOT IN ('Closed Won','Closed Lost')]) {
            Task tsk=new Task();
            tsk.Subject='Reminder: Opp close date is approaching';
            tsk.ActivityDate=Date.today();
            tsk.OwnerId=opp.OwnerId;
            tsk.WhatId=opp.Id;
            tasks.add(tsk);
        }

        //insert tasks
        try {
            if (!tasks.isEmpty()) {
                insert tasks;                
            }

        } catch (Exception ex) {
            //create log
            System.debug(ex.getMessage());
        }
    }
}

//org da apex classa git schedule Apex i aç ayarla