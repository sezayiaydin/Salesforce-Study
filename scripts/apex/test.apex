for (Integer i=1; i<=100;i++) {
    List<Account> accountList=[SELECT name FROM Account];
    System.debug(accountList);
}