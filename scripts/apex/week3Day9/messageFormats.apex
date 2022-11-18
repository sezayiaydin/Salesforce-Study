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