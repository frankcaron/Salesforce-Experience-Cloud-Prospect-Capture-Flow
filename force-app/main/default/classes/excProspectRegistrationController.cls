/**
 * An apex page controller that supports self registration of users in communities that allow self registration
 */
public with sharing class excProspectRegistrationController {

    public excProspectRegistrationController() {}

    @AuraEnabled
    public static String getRegisteredUserURL(
        String communityName,
        String firstName,
        String lastName,
        String email,
        String password,
        String verifyPassword,
        String accountRecord,
        Boolean loginMode){

        //Variables
        String accountId;
        String userName;
        String userfirstName;
        String userlastName;
        String userEmail;
        String userPassword;
        String userConfirmPassword;
        String communityNickname;
        String userId;

        //Constants
        final String USERFAIL = 'USERFAIL';
        final String PASSFAIL = 'PASSFAIL';
        final String AUTHFAIL = 'AUTHFAIL';

        //Fetch variables from JS
        communityNickname = communityName;
        userfirstName = firstName;
        userlastName = lastName;
        userEmail = email;
        userName = email;
        userPassword = password;
        userConfirmPassword = verifyPassword;
        accountId = accountRecord;

        //Logs
        System.debug('excProspectRegistration || Beginning registration and log in logic.');
        System.debug('excProspectRegistration || Community Name: ' + communityName);
        System.debug('excProspectRegistration || First Name: ' + userfirstName);
        System.debug('excProspectRegistration || Last Name: ' + userlastName);
        System.debug('excProspectRegistration || Email: ' + userEmail);
        System.debug('excProspectRegistration || Account Id: ' + accountId);
        System.debug('excProspectRegistration || Login Mode: ' + loginMode);

        //Validate that passwords match and reject if they don't
        if (userPassword != userConfirmPassword) {
            System.debug('excProspectRegistration || Passwords do not match.');
            return PASSFAIL;
        }

        //If not in login mode...
        if (!loginMode) {
            try {
                //Populate variables
                User u = new User();
                u.Username = userName;
                u.Email = userEmail;
                u.FirstName = userfirstName;
                u.LastName = userlastName;
                u.CommunityNickname = userName;

                //Create user
                System.debug('excProspectRegistration || Attempting to create user ' + u.Username);

                //Create User
                userId = Site.createPortalUser(u, accountId, password);

                //Log
                System.Debug('excProspectRegistration || User has been created (userId=)' + userId);

            } catch (Exception e) {
                System.debug('excProspectRegistration || User creation failed');
                System.debug('excProspectRegistration || ' + e.getMessage());
                return USERFAIL;
            }
        }

        //Provide URL back for redirect
        if (password != null && password.length() > 1) {
            System.debug('excProspectRegistration || Logging user ' + userName + ' in...');

            try {
                ApexPages.PageReference pageToReturn = Site.login(userName, userPassword, null);
                return pageToReturn.getURL();
            } catch (Exception e) {
                System.debug('excProspectRegistration || User login failed');
                System.debug('excProspectRegistration || ' + e.getMessage());
                return AUTHFAIL;
            }

        }
        else {
            System.debug('excProspectRegistration || Password is invalid.');
            return PASSFAIL;
        }
    }
}

