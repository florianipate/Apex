@isTest
public class HelloWorldTest {
    @isTest static void updateLead(){
        Lead l = new Lead();
        l.FirstName = 'Florian';
        l.LastName 	= 'Ipate';
        l.Company 	= 'google';
        insert l;
        
        l.Company = 'adovys';
        update l;
    }

}