@isTest
public class LeadingCompetitorsTest {
    @isTest static void createOppWithCompetitors() {
        // Create an opporunity and set the reqired fields
        Opportunity opp = new Opportunity();
        opp.Name        = 'Big Deal';
        opp.CloseDate   = Date.today();
        opp.StageName   = 'Prospectig';

        // Populate all 3 competitor price
        opp.Competitor_1__c = 'Google';
        opp.Competitor_2__c = 'Oracle';
        opp.Competitor_3__c = 'Yahoo!';

        opp.Competitor_1_Price__c = 5000;
        opp.Competitor_2_Price__c = 5000;
        opp.Competitor_3_Price__c = 5000; 

        insert opp;
        System.debug('Opportunity' + opp.Name + 'inserted with all competitor fields populated');
    }
}
