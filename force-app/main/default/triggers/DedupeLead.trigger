trigger DedupeLead on Lead (before insert) {
    
    // Get data quality record for future use
    Group dataQualityGroup = [SELECT id 
                                        FROM Group 
                                        WHERE DeveloperName = 'Data_Quality' 
                                        LIMIT 1];
    for (Lead myLead: Trigger.new){

        // search for matching contacts
        List<Contact> matchengContacts = [SELECT Id
                                            FROM Contact
                                            WHERE Email = :myLead.Email];
        System.debug(matchengContacts.size() + ' Contact(s) found.');

        // if matching are finded
        if(!matchengContacts.isEmpty()){

            // assign the lead to the data quality Queue  
            myLead.OwnerId = dataQualityGroup.Id;

            // add the duplicated Ids in to the lead Description
            String dupeContactsMessage = 'Duplicate Contact(s) found:\n';
            for (Contact matchingContact : matchengContacts){
                dupeContactsMessage += matchingContact.FirstName + ' '
                                    + matchingContact.LastName + ' '
                                    + matchingContact.Account.Name + ' ('
                                    + matchingContact.Id + ')\n';
            }
            myLead.Description = dupeContactsMessage + '\n' + myLead.Description;
        }
    }
}