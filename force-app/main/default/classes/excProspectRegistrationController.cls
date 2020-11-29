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
        String verifyPassword){

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

        //Fetch variables from JS
        communityNickname = communityName;
        userfirstName = firstName;
        userlastName = lastName;
        userEmail = email;
        userName = email;
        userPassword = password;
        userConfirmPassword = verifyPassword;

        //Logs
        System.debug('excProspectRegistration || Beginning registration and log in logic.');
        System.debug('excProspectRegistration || Community Name: ' + communityName);
        System.debug('excProspectRegistration || First Name: ' + userfirstName);
        System.debug('excProspectRegistration || Last Name: ' + userlastName);
        System.debug('excProspectRegistration || Email: ' + userEmail);

        // it's okay if password is null - we'll send the user a random password in that case
        if (userPassword != userConfirmPassword) {
            System.debug('excProspectRegistration || Passwords do not match.');
            return PASSFAIL;
        }

        //Necessary variables to prefill
        User u = new User();
        u.Username = userName;
        u.Email = userEmail;
        u.FirstName = userfirstName;
        u.LastName = userlastName;
        u.CommunityNickname = communityNickname;

        //Create user
        System.debug('excProspectRegistration || Creating portal user');
        //userId = Site.createPortalUser(u, accountId, password);

        //Provide URL back for redirect
        if (userId != null) {
            System.Debug('excProspectRegistration || User has been created (userId=)' + userId);
            if (password != null && password.length() > 1) {

                System.debug('excProspectRegistration || Logging user in...');
                //ApexPages.PageReference pageToReturn = Site.login(userName, password, null);
                //return pageToReturn.getURL();

                return '';
            }
            else {
                System.debug('excProspectRegistration || Password is invalid.');
                return null;
            }
        } else {
            System.debug('excProspectRegistration || User has not been created successfully.');
            return USERFAIL;
        }
    }
}

