trigger CheckSecretInformation on Case ( after insert, before update) {

    // create a collection containing all secreat keywords
    Set<String> secreatKeywords = new Set<String>();
    secreatKeywords.add('Credit Card')
    secreatKeywords.add('Social Secirity');
    secreatKeywords.add('SSN');
    secreatKeywords.add('Password');
    secreatKeywords.add('Bodyweight');

    List<Case> casesWithSecreatInfo = new List<Case>();
    for(Case myCase: Trigger.new){
        
       for(String keyword: secreatKeywords){
            if(myCase.Description != null && myCase.Description.contains(keyword)){
                casesWithSecreatInfo.add(Case);
                break;
            }
       }
        // check if the case contain any o f the keywords
        // if the cade contain secreat keywords then create a child case

    }
}