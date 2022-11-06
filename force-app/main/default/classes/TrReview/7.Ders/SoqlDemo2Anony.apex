SoqlDemo2.childToParent_soql1();
SoqlDemo2.childToParent_soql2();

SoqlDemo2.parentToChild_soql1();
SoqlDemo2.parentToChild_soql2();


//sorgular
SELECT count(Id) FROM contact
SELECT count(mailingCity) FROM contact
SELECT count(mailingCity), count(Id) FROM contact

SELECT count(name)FROM account
SELECT count_distinct(name)FROM account

SELECT max(annualrevenue) FROM account
SELECT min(annualrevenue) FROM account
SELECT avg(annualrevenue) FROM account


SELECT leadsource, count(name) FROM lead group by leadSource
SELECT name, count(id) FROM account group by name having count(id) > 1
SELECT sum(amount) FROM opportunity where isclosed = false
SELECT sum(amount), stageName FROM opportunity where isclosed = false group by stagename
SELECT sum(amount), count(id), stageName FROM opportunity where isclosed = false group by stagename

SOSL

FIND {Map*} IN ALL FIELDS RETURNING Account (Id, Name), Contact, Opportunity, Lead


List<List<SObject>> searchList = [FIND 'Türk*' IN ALL FIELDS RETURNING Account (Id, Name), Contact(Name), Opportunity, Lead];
System.debug(searchList);
Account [] accounts = ((List<Account>)searchList[0]);
System.debug(accounts);
Contact [] contacts = ((List<Contact>)searchList[1]);
System.debug(contacts);
Opportunity [] opportunities = ((List<Opportunity>)searchList[2]);
System.debug(opportunities);
Lead [] leads = ((List<Lead>)searchList[3]);
System.debug(leads);