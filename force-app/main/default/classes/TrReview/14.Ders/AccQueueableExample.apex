List<account> accounts = [SELECT id, name FROM account];
AccountsQueueableExample aq = new AccountsQueueableExample(accounts);//is this valid? will this work?
id jobId = system.enqueueJob(aq);
system.debug(jobId);