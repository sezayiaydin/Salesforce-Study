//Data
Account: Name="Universal Containers", Type="New Customer", Industry="Education"

//JSON Message Format
{
    "Name" : "Universal Containers",
    "Type" : "New Customer",
    "Industry" : "Education",
    "AnnualRevenue" : 30000000.00
}

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
                WHERE Name = 'Burlington Textiles Corp of America'];
String jsonString = JSON.serialize(acc);
System.debug(jsonString);

//Get 10 accounts and convert them into JSON format - debug
List<Account> accounts = [SELECT Id, Name, Type, Industry, AnnualRevenue 
                            FROM Account
                            WHERE Type != null
                            AND Industry != null
                            LIMIT 10];
String jsonString = JSON.serialize(accounts);
System.debug(jsonString);


//Get an opp record whose amount is grater than 5M and convert them into JSON format - debug
//1. Selection of fields
//2. Selection of Objrect
//3. Filter criteria
//4. Sort by
//5. Limit

Opportunity opp = [SELECT Id, Name, Type, StageName, Amount 
                FROM Opportunity 
                WHERE Amount >5000000
                LIMIT 1];
String jsonString = JSON.serialize(opp);
System.debug(jsonString);

//Get 10 opp based on amount is grater than 5M and convert them into JSON format - debug

List<Opportunity> opps=[SELECT Id, Name, Type, StageName, Amount 
                FROM Opportunity 
                WHERE Amount !=Null
                ORDER BY Amount DESC
                LIMIT 10];
String jsonString = JSON.serialize(opps);
System.debug(jsonString);