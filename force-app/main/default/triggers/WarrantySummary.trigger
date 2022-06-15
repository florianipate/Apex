trigger WarrantySummary on Case (before insert) {
    for (Case myCase: Trigger.new){
        String purchseDate          = myCase.Product_Purchase_Date__c.format();
        String createdDate          = DateTime.now().format();
        Integer warrantyDays        = myCase.Product_Total_Warranty_Days__c.intValue();
        Decimal warrantyPercentage  = (( myCase.Product_Purchase_Date__c.daysBetween(Date.today()) 
                                      / myCase.Product_Total_Warranty_Days__c) * 100).setScale(2);
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