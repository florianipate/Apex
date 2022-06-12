trigger CheckSecretInformation on Case ( after insert, before update) {

    // create a collection containing all secreat keywords
    Set<String> secreatKeywords = new Set<String>();
    secreatKeywords.add('Credit Card')
    secreatKeywords.add('Social Secirity');
    secreatKeywords.add('SSN');
    secreatKeywords.add('Password');
    secreatKeywords.add('Bodyweight');
    // check if the case contain any o f the keywords
    List<Case> casesWithSecreatInfo = new List<Case>();
    for(Case myCase: Trigger.new){
        
       for(String keyword: secreatKeywords){
            if(myCase.Description != null && myCase.Description.containsIgnorCase(keyword)){
                casesWithSecreatInfo.add(Case);
                System.debug('Case ' + myCase.Id + 'includes keyword' + keyword);
                break;
            }
       }
        
    // if the cade contain secreat keywords then create a child case
    for(Case caseWithSecreatInfo : casesWithSecreatInfo){
        Case childCase = new Case();
        childCase.subject = 'Worning Parent Case Contain Secret Info';
        childCase.ParentId = caseWithSecreatInfo.Id;
        childCase.IsEscalated = true;
        childCase.Priority = 'High';
        childCase.Description = 'At least one of the following keywords wer found' + secreatKeywords;
        insert childCase;
    }

    }
}