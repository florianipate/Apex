trigger DedupeLead on Lead (before insert) {

    for (Lead myLead: Trigger.new){

        // search for matching contacts
        List<Contact> matchengContacts = [SELECT Id
                                            FROM Contact
                                            WHERE Email = :myLead.Email];
        System.debug(matchengContacts.size() + ' Contact(s) found.');

        // if matching are finded
        if(!matchengContacts.isEmpty()){

            //  
            Group dataQualityGroup = [SELECT id 
                                        FROM Group 
                                        WHERE DeveloperName = 'Data_Quality' 
                                        LIMIT 1];
        }
    }
}