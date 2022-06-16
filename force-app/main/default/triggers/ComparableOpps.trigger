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
        List<Opportunity> comparableOpps =[SELECT Id 
                                            FROM Opportunity
                                           WHERE Amount>= :minAmount
                                             AND Amount <= :maxAmmount
                                             AND Account.Industry = :oppWithAccountInfo.Account.Industry
                                             AND StageName = 'Close Won'
                                             AND CloseDate >= LAST_N_DAYS:365
                                             AND Id != :opp.Id];
        System.debug('Comparable opp(s) Found ' + comparableOpps);

        // for each comparable opp, create a comparable record
        List<Comparable__c> junctionObjsToInsert = new List<Comparable__c>();
        for(Opportunity comp : comparableOpps){
            Comparable__c junctionObj = new Comparable__c();
            junctionObj.Base_Opportunity__c = opp.Id;
            junctionObj.Comparable_Opportunity__c = comp.Id;
            junctionObjsToInsert.add(junctionObj);
        }
        insert junctionObjsToInsert;
    }

}