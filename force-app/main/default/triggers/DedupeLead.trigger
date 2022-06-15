trigger DedupeLead on Lead (before insert) {

    for (Lead myLead: Trigger.new){
        List<Contact> matchengContacts = [SELECT id
                                            From Contact
                                            Where Email = :myLead];
        System.debug(matchengContacts.size() + 'Contact(s) found.')
    }
}