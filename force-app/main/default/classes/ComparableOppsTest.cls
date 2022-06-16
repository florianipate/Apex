@isTest
public with sharing class ComparableOppsTest {
    @isTest static void noComparableOpps() {
        Account acc = new Account();
        acc.name = 'winterfell Hotel';
        acc.Industry = 'Hospitality';
        insert acc;

        Opportunity opp = new Opportunity();
        opp.name = 'Winterfell Hotel';
        opp.Account.Id = acc.Id;
        opp.Amount = 100;
        opp.StageName = 'Prospecting';
        insert opp;

    }
    @isTest static void multipleCoparableOpps(){

    }
}
