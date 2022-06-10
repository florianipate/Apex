trigger LeadingCompetitor on Opportunity (before insert, before update) {
    for(Opportunity opp: Trigger.new){
        // add all prices to a list
        List<Decimal> competitorPrices = new List<Decimal>();
        competitorPrices.add(opp.Competitor_1_Price__c);
        competitorPrices.add(opp.Competitor_2_Price__c);
        competitorPrices.add(opp.Competitor_3_Price__c);

        // add all competitors to a list
        List<String> competitors = new List<string>();
        competitors.add(opp.Competitor_1__c);
        competitors.add(opp.Competitor_2__c);
        competitors.add(opp.Competitor_3__c);

    }

}