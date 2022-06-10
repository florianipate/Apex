@isTest
public class DedupAccountTest {
    @isTest static void createAccount(){
        Account ac = new Account();
        ac.Name = 'New Accoun';
        //Case c = new Case(Status = 'New');
        //c.Subject = 'dedup Account';
        //c.OwnerId = '0054H000007UqFUQA0';
        //c.AccountId = ac.Id;
 
        insert ac;
        //insert c;
    }
}