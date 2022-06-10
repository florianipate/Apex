@isTest
public class WarrantysummaryTest {
    @isTest static void addWarrantySammary(){
        Case c = new Case();
        c.Product_Purchase_Date__c= Date.today();
		c.Product_Total_Warranty_Days__c = 10;
        c.Product_Has_Extended_Warranty__c = true;
        insert c;
    }
}