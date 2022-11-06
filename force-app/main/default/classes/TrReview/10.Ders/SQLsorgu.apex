
System.debug([SELECT name, Active__c, Industry FROM account WHERE Name = 'Test']);

string degisken= 'Test';
System.debug([SELECT name, Active__c, Industry FROM account WHERE Name = :degisken]);

string kisaDegisken ='%Test%';
System.debug([SELECT name, Active__c, Industry FROM account WHERE Name LIKE :kisaDegisken]);

list<string> strList = new list<string>{'Mahmut','Test'};
System.debug([SELECT name, Active__c, Industry FROM account WHERE Name LIKE :strList]);

System.debug('Contactı olan accountların listesi: '+[SELECT name, Active__c, Industry FROM account WHERE Id IN (SELECT accountId FROM Contact)]);



List<Contact> cntList = [SELECT accountId FROM Contact];
List<Id> accountIds = new List<Id>();

System.debug('cntList'+cntList);
for (contact cnt : cntList) {
    accountIds.add(cnt.AccountId);
}
System.debug('Contactı olan accountların listesi: '+[SELECT name, Active__c, Industry FROM account WHERE Id IN :accountIds]);

/*

System.debug([SELECT name, Active__c, Industry FROM account WHERE Name = 'Test']);

string degisken= 'Test';
System.debug([SELECT name, Active__c, Industry FROM account WHERE Name = :degisken]);


System.debug([SELECT name, Active__c, Industry FROM account WHERE Name LIKE '%es%']);

string kisaDegisken ='%'+methoddanGelenParametre+'+%';
System.debug([SELECT name, Active__c, Industry FROM account WHERE Name LIKE :kisaDegisken]);

list<string> strList = new list<string>{'Mahmut','es'};
System.debug([SELECT name, Active__c, Industry FROM account WHERE Name LIKE :strList]);

System.debug('Contactı olan accountların listesi: '+[SELECT name, Active__c, Industry FROM account WHERE Id IN (SELECT accountId FROM Contact)]);


List<Contact> cntList = [SELECT accountId FROM Contact];
List<Id> accountIds = new List<Id>();

System.debug('cntList'+cntList);
for (contact cnt : cntList) {
    accountIds.add(cnt.AccountId);
}
System.debug('Contactı olan accountların listesi: '+
[SELECT name, Active__c, Industry FROM account WHERE Id IN :accountIds]); 
*/