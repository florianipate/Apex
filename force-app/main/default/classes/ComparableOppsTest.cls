@isTest
public class ComparableOppsTest {
    @isTest static void noComparableOpps() {
        //Create Records
        Account acc = new Account();
        acc.Name = 'Winterfell Hotel';
        acc.Industry = 'Hospitality';
        insert acc;

        Opportunity opp = new Opportunity();
        opp.Name 		= 'Winterfell Hotel';
        opp.AccountId 	= acc.Id;
        opp.Amount 		= 100;
        opp.StageName 	= 'Prospecting';
        opp.CloseDate 	= Date.today();
        insert opp;
        
        // Query latest value
        List<Comparable__c> comparables = [SELECT Id 
                                     FROM Comparable__c 
                                     WHERE Base_Opportunity__c = :opp.Id];
        
        //Assert
        System.assertEquals(0, comparables.size());
        

    }
    @isTest static void multipleCoparableOpps(){
		 //Create Records
        Account acc 	= new Account();
        acc.Name 		= 'Winterfell Hotel';
        acc.Industry 	= 'Hospitality';
        insert acc;
        
        List<Opportunity> comparablesOpps = new List<Opportunity>();
        Opportunity comp1 	= new Opportunity();
        comp1.Name 			= 'Winterfell Hotel';
        comp1.AccountId 	= acc.Id;
        comp1.Amount 		= 105;
        comp1.StageName 	= 'Closed Won';
        comp1.CloseDate 	= Date.today().addDays(-1);
        comparablesOpps.add(comp1);
        
        Opportunity comp2 	= new Opportunity();
        comp2.Name 			= 'Winterfell Hotel';
        comp2.AccountId 	= acc.Id;
        comp2.Amount 		= 95;
        comp2.StageName 	= 'Closed Won';
        comp2.CloseDate 	= Date.today().addDays(-100);
        comparablesOpps.add(comp2);
        insert comparablesOpps;
        
        Opportunity baseOpp = new Opportunity();
        baseOpp.Name 		= 'Winterfell Hotel';
        baseOpp.AccountId 	= acc.Id;
        baseOpp.Amount 		= 100;
        baseOpp.CloseDate 	= Date.today();
        baseOpp.StageName 	= 'Prospecting';
        insert baseOpp;
        
        List<Comparable__c> comparable = [SELECT Id, 
                                          		 Comparable_Opportunity__c 
                                          FROM Comparable__c 
                                          WHERE Base_Opportunity__C = :baseOpp.Id 
                                          ORDER BY Comparable_Opportunity__r.CloseDate DESC];
        
        //Make assertion
        System.assertEquals(comp1.Id, comparable.get(0).Comparable_Opportunity__c);
        System.assertEquals(comp2.Id, comparable.get(1).Comparable_Opportunity__c);
    }
}