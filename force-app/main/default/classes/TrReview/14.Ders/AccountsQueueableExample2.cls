public class AccountsQueueableExample2 implements Queueable{
    List<account> listAccount;
    public AccountsQueueableExample2(List<account> accs) {
        listAccount = accs;
    }

    public void execute(QueueableContext qc){
        for (account ac : listAccount) {
            ac.Name = ac.Name + ' COM';
        }
        update listAccount;
        System.enqueueJob(new AccountsQueueableExample3(listAccount));
    }
}