@isTest
public class AppleWatchTest {
    @isTest static void createOpportunity(){
      	Opportunity opp = new Opportunity();
        opp.Name 		= 'Swift Deal';
        opp.StageName 	= 'Processing';
        opp.CloseDate 	= Date.today();
        opp.Amount 		= 55000;
        insert opp;
    }
}