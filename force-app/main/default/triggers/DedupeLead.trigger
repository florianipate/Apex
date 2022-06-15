trigger DedupeLead on Lead (before insert) {

    for (Lead myLead: Trigger.new){

        // search for matching contacts
        List<Contact> matchengContacts = [SELECT id
                                            From Contact
                                            Where Email = :myLead];
        System.debug(matchengContacts.size() + 'Contact(s) found.');

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