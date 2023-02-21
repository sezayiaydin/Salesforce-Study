//collect account ids and than call future method
List<Id> accountIds = new List<Id>();
for (Account acc : [SELECT Id FROM Account]) {
    accountIds.add(acc.Id);
}
AccountProcessor.processAccounts(accountIds);