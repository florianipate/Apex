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

        Decimal lowestPrice;
        Integer lowestPricePosition;
        for (Integer i = 0; i< competitorPrices.size(); i++ ){
            Decimal currentPrice = competitorPrices.get(i);
            if(lowestPrice == null || competitorPrices.get(i) > lowestPrice) {
                lowestPrice         = competitorPrices.get(i);
                lowestPricePosition = i;
            }
        }
        opp.Leading_Competitor__c = competitors.get(lowestPricePosition);
        opp.Leading_Competitor_price__c= lowestPrice;
    }

}