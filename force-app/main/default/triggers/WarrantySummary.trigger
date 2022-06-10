trigger WarrantySummary on Case (before insert) {
    for (Case myCase: Trigger.new){
        Date purchseDate            = myCase.Product_Purchase_Date__c;
        DateTime createdDate        = DateTime.now();
        Integer warrantyDays        = myCase.Product_Total_Warranty_Days__c.intValue();
        Decimal warrantyPercentage  = (purchseDate.daysBetween(Date.today()) / myCase.Product_Total_Warranty_Days__c) * 100;
        Boolean hasExtendedWarranty = myCase.Product_Has_Extended_Warranty__c;

        myCase.Warranty_Summary__c  = 'Product purchased on '+ purchseDate + ' '
                                    + 'and case created on '+ createdDate + '.\n'
                                    + 'Warranty is for '+ warrantyDays + ' '
                                    + 'days and is '+ warrantyPercentage + '% '
                                    + 'through its warranty period.\n'
                                    + 'Extended Warranty: ' + hasExtendedWarranty + '\n'
                                    + 'Have a nice day!';
    }

}