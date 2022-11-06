string cronExp='0 0 13 ** ?';
AccountSchedulable ac= new AccountSchedulable();
System.schedule('accupdateCron thing', cronExp, ac);