trigger AccountTriggernew on Account (before insert, before update, after insert, after update) {
   
   Map<id, account> newAccMap = trigger.newMap;
   map<id, account> oldAccMap = trigger.oldMap;

   system.debug('---start---');
   if (Trigger.isAfter && Trigger.isUpdate) {
      set<id> setAccIds = newAccMap.keySet();
      
      for (id eachId : setAccIds) {
          system.debug('each id which is also key of maps ==> ' + eachId);
          Account newAccount = newAccMap.get(eachId);
          system.debug('new Account name ==> ' + newAccount.Name);

          Account oldAccount = oldAccMap.get(eachId);
          system.debug('old Account name ==> ' + oldAccount.Name);
      }

   }
   system.debug('---end---');












   /*

   if (Trigger.isBefore && Trigger.isInsert) {
       system.debug('before insert old map => ' + oldAccMap);
       system.debug('before insert new map => ' + newAccMap);
   }
   if (Trigger.isAfter && Trigger.isInsert) {
       system.debug('after insert old map => ' + oldAccMap);
       system.debug('after insert new map => ' + newAccMap);
   }

   if (Trigger.isBefore && Trigger.isUpdate) {
       system.debug('before update old map => ' + oldAccMap);
       system.debug('before update new map => ' + newAccMap);
   }
   if (Trigger.isAfter && Trigger.isUpdate) {
       system.debug('after update old map => ' + oldAccMap);
       system.debug('after update new map => ' + newAccMap);
   }

   if (trigger.isAfter) {
       list<account> newAccounts = trigger.new;

       set<id> setAccIds = new set<id>();
       for (account eachAcc : newAccounts) {
           setAccIds.add(eachAcc.Id);
       }
       system.debug('set of ids ==> ' + setAccIds);
   }

   if (trigger.isAfter && trigger.isUpdate) {
       list<account> newAccounts = trigger.new;
       for (account newAcc : newAccounts) {
           system.debug('NEW acc id ==> ' + newAcc.id + ', NEW acc name ==> ' + newAcc.Name);
       }
       list<account> oldAccounts = trigger.old;
       for (account oldAcc : oldAccounts) {
           system.debug('OLD acc id ==> ' + oldAcc.id + ', NEW acc name ==> ' + oldAcc.Name);
       }
   }

   if (Trigger.isBefore && Trigger.isInsert) {
      system.debug('before insert trigger.old ==> ' + trigger.old);

   }
   if (Trigger.isAfter && Trigger.isInsert) {
       system.debug('after insert trigger.old ==> ' + trigger.old);
   }

   if (Trigger.isBefore && Trigger.isUpdate) {
       system.debug('before update trigger.old ==> ' + trigger.old);

    }
    if (Trigger.isAfter && Trigger.isUpdate) {
        system.debug('after update trigger.old ==> ' + trigger.old);
    }

   List<account> newAccounts = trigger.new;
   system.debug('number of accounts ==> ' + newAccounts.size());

   if (Trigger.isBefore && Trigger.isInsert) {
       system.debug('before trigger.new ==> ' + newAccounts);
       for (Account eachAcc : newAccounts) {
           system.debug('BEFORE acc id ==> ' + eachAcc.id + ', acc name ==> ' + eachacc.Name);
       }
   }
   if (Trigger.isAfter && Trigger.isInsert) {
       system.debug('after trigger.new ==> ' + newAccounts);
       for (Account eachAcc : newAccounts) {
           system.debug('AFTER acc id ==> ' + eachAcc.id + ', acc name ==> ' + eachacc.Name);
       }
   }
   if (Trigger.isBefore && Trigger.isUpdate) {
       system.debug('before update trigger.new ==> ' + newAccounts);
       for (Account eachAcc : newAccounts) {
           system.debug('BEFORE acc id ==> ' + eachAcc.id + ', acc name ==> ' + eachacc.Name);
       }
   }
   if (Trigger.isAfter && Trigger.isUpdate) {
       system.debug('after update trigger.new ==> ' + newAccounts);
       for (Account eachAcc : newAccounts) {
           system.debug('AFTER acc id ==> ' + eachAcc.id + ', acc name ==> ' + eachacc.Name);
       }
   }

   if (Trigger.isBefore) {
       system.debug('BEFORE trigger - insert or update.');
       if (Trigger.isInsert) {
           system.debug('account before insert trigger called');
       } 
       if (Trigger.isUpdate) {
           system.debug('account before update trigger called.');
       }
   }
   if (Trigger.isAfter) {
       system.debug('AFTER trigger - insert or update.');
       if (Trigger.isInsert) {
           system.debug('account after insert trigger called');
       } 
       if (Trigger.isUpdate) {
           system.debug('account after update trigger called.');
       }
   }*/
   /*
if (Trigger.isBefore && Trigger.isInsert) {
       system.debug('account before insert trigger called');
   }
   if (Trigger.isAfter && Trigger.isInsert) {
       system.debug('account after insert trigger called');
   }

   if (Trigger.isBefore && Trigger.isUpdate) {
       system.debug('account before update trigger called');
   }
   if (Trigger.isAfter && Trigger.isUpdate) {
       system.debug('account after update trigger called');
   }
   */
/*if (trigger.isInsert) {
       system.debug('account before insert trigger called');
   }
   if (trigger.isUpdate) {
       system.debug('account before update trigger called');
   }*/
   /*if (trigger.isBefore) {
       system.debug('account before insert trigger called');
   }
   if (Trigger.isAfter) {
       system.debug('account after insert trigger called');
   }*/
}