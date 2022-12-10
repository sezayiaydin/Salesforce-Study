//Data
Account: Name = "Universal Containers", Type="New Customer", Industry="Education"

//JSON Message Format
[ //=> array demek
    
    {
        "Name" : "Universal Containers",
        "Type" : "New Customer",
        "Industry" : "Education",
        "AnnualRevenue" : 30000000.00
    },
    {
        "Name" : "Universal Containers",
        "Type" : "New Customer",
        "Industry" : "Education",
        "AnnualRevenue" : 30000000.00
    }
]

//XML Message Format
<Account>
    <Name>Universal Containers</Name>
    <Type>New Customer</Type>
    <Industry>Education</Industry>
    <AnnualRevenue>30000000.00</AnnualRevenue>
</Account>

//Get an account record and convert the same into JSON format - debug
Account acc = [SELECT Id, Name, Type, Industry, AnnualRevenue 
                FROM Account 
                WHERE Name = 'BATCH 10 Öğrencileri bi harikavia B.0 Batch 10 -- SI'];
System.debug('datanın ilk geldiği hali:' + acc);
String jsonString = JSON.serialize(acc);
System.debug('Datanın JSON hali'+jsonString);

account jsonToApex = (account)JSON.deserialize(jsonString, account.class);
System.debug('Datanın eski haline dönüştüğü durum:'+jsonToApex);




//Get 10 accounts and convert them into JSON format - debug
List<Account> accounts = [SELECT Id, Name, Type, Industry, AnnualRevenue 
                            FROM Account
                            WHERE Type != null
                            AND Industry != null
                            LIMIT 10];
System.debug(accounts);
String jsonString = JSON.serialize(accounts);
System.debug(jsonString);

List<Account> jsonToApex = (List<Account> )JSON.deserialize(jsonString, List<account>.class);
System.debug(jsonToApex);


// Get an opp record whose amount is greater than 5M and convert the same into JSON format - debu
// 1. Selection of fields
// 2. Selection of object
// 3. Filter criteria
// 4. Sort by
// 5. Limit
Opportunity opp = [SELECT Id, Name, Type, StageName, Amount
                   FROM Opportunity WHERE Amount > 5000000
                   LIMIT 1];
String jsonString = JSON.serialize(opp);
System.debug(jsonString);


List<Opportunity> opp = [SELECT Id, Name, Type, StageName, Amount
                   FROM Opportunity 
                   WHERE Amount != null
                   ORDER BY Amount DESC
                   LIMIT 10];

String jsonString = JSON.serialize(opp);
System.debug(jsonString);