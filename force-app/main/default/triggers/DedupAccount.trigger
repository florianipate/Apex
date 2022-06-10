trigger DedupAccount on Account (after insert) {
	
    for(Account ac: Trigger.new){
        Case c = new Case(Status = 'New');
        c.Subject = 'Dedupe this account';
        c.OwnerId = '0054H000007UqFUQA0';
        c.AccountId = ac.Id;
        c.Origin = 'Web';
        insert c;
    }
    
    
}