@isTest
public with sharing class excProspectRegistrationControllerTest {

    static testMethod void runTestCases() {

        String USERFAIL = 'USERFAIL';
        String PASSFAIL = 'PASSFAIL';
        String AUTHFAIL = 'AUTHFAIL';
        String LoggedInURL = '';

        //test password for registration fail
        String result = excProspectRegistrationController.getRegisteredUserURL('My Community', 'Bob', 'Loblaw', 'bob@bob.com', 'password', 'notpassword', null, false);
        System.assertEquals(PASSFAIL, result);

        //test user reg fail
        result = excProspectRegistrationController.getRegisteredUserURL('My Community', 'Bob', 'Loblaw', 'bob@bob.com', 'password', 'password', null, true);
        System.assertEquals(AUTHFAIL, result);

        //test auth fail
        result = excProspectRegistrationController.getRegisteredUserURL('My Community', 'Bob', 'Loblaw', 'bob@bob.com', 'password', 'password', null, false);
        System.assertEquals(AUTHFAIL, result);

        //test password on login fail
        result = excProspectRegistrationController.getRegisteredUserURL('My Community', 'Bob', 'Loblaw', 'bob@bob.com', 'password', 'password', null, false);
        System.assertEquals(AUTHFAIL, result);

        //test password on null password
        result = excProspectRegistrationController.getRegisteredUserURL('My Community', 'Bob', 'Loblaw', 'bob@bob.com', '', '', null, false);
        System.assertEquals(PASSFAIL, result);

    }

}
