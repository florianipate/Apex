trigger CheckSecretInformation on Case (after insert, before update) {

    String childCaseSubject = 'Worning Parent Case Contain Secret Info';

    // create a collection containing all secreat keywords
    Set<String> secreatKeywords = new Set<String>();
    secreatKeywords.add('Credit Card');
    secreatKeywords.add('Social Secirity');
    secreatKeywords.add('SSN');
    secreatKeywords.add('Password');
    secreatKeywords.add('Bodyweight');

    // check if the case contain any o f the keywords
    List<Case> casesWithSecreatInfo = new List<Case>();
    Set<String> sensitiveKeyWords = new Set<String>();
    for(Case myCase: Trigger.new){
        if(myCase.Subject != childCaseSubject){
            for(String keyword: secreatKeywords){
                if(myCase.Description != null && myCase.Description.containsIgnoreCase(keyword)){
                    sensitiveKeyWords.add(keyword);
                    // casesWithSecreatInfo.add(myCase);
                    System.debug('Case ' + myCase.Id + 'includes keyword' + keyword);
                    // break;
                }
                if(casesWithSecreatInfo.contains(myCase)){
                    continue;
                    
                } else {
                    casesWithSecreatInfo.add(myCase);
                }
            }
        }
    }

     // if the cade contain secreat keywords then create a child case
     List<Case> casesToCreate = new List<Case>();
     for(Case caseWithSecreatInfo : casesWithSecreatInfo){
        Case childCase          = new Case();
        childCase.Subject       = childCaseSubject;
        childCase.ParentId      = caseWithSecreatInfo.Id;
        childCase.IsEscalated   = true;
        childCase.Priority      = 'High';
        childCase.Description   = 'The following keywords wer found '+ secreatKeywords;
        casesToCreate.add(childCase);
    }
    insert casesToCreate;
}