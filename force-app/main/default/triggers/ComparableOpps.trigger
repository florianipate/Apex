trigger ComparableOpps on Opportunity (after insert) {

    for(Opportunity opp:Trigger.new){
        //query Account Info
        Opportunity oppWithAccountInfo = [SELECT Id,
                                                Account.Industry
                                            FROM Opportunity
                                            WHERE Id = :opp.Id];
        // Get the binding variables ready
        Decimal minAmount = opp.Amount * 0.9;
        Decimal maxAmmount = opp.amount * 1.1;
        // search for the comparable opps
        List<Opportunity> comparableOpp =[SELECT Id 
                                            FROM Opportunity];

        // for each comparable opp, create a comparable record
    }

}