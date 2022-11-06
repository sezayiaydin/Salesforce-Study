public class AccountsQueueableExample3 implements Queueable{
    List<account> listAccount;
    public AccountsQueueableExample3(List<account> accs) {
        listAccount = accs;
    }

    public void execute(QueueableContext qc){
        for (account ac : listAccount) {
            ac.Name = ac.Name + 'PANY';
        }
        update listAccount;
    }
}