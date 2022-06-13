@isTest
public class CheckSecretInformationTest {
    @isTest static void CheckSecretInformationTest() {
        //create Case 
        Case myCase         = new Case();
        myCase.Subject      = 'Help!!!';
        myCase.description  = 'My bodyweight is Big';
        insert myCase;
        System.debug('Case ' + myCase.id + ' Created with description ' + myCase.Description);

    }
}
