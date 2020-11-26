/**
 * An apex page controller that supports self registration of users in communities that allow self registration
 */
public with sharing class excProspectRegistrationController {

    public excProspectRegistrationController() {}

    @AuraEnabled
    public static String getRegisteredUserURL() {

        //Variables
        String accountId;
        String userName;
        String firstName;
        String lastName;
        String email;
        String password;
        String confirmPassword;
        String communityNickname;
        String profileId;
        String roleEnum;

        // it's okay if password is null - we'll send the user a random password in that case
        if (password != confirmPassword) {
            ApexPages.Message msg = new ApexPages.Message(ApexPages.Severity.ERROR, Label.site.passwords_dont_match);
            ApexPages.addMessage(msg);
            return null;
        }

        //Fetch variables from JS

        //Necessary variables to prefill
        User u = new User();
        u.Username = userName;
        u.Email = email;
        u.FirstName = firstName;
        u.LastName = lastName;
        u.CommunityNickname = communityNickname;
        u.ProfileId = profileId;

        //Create user
        String userId = Site.createPortalUser(u, accountId, password);

        //Provide URL back for redirect
        if (userId != null) {
            System.Debug('User has been created (userId=)' + userId);
            if (password != null && password.length() > 1) {
                ApexPages.PageReference pageToReturn = Site.login(userName, password, null);
                return pageToReturn.getURL();
            }
            else {
                PageReference page = System.Page.CommunitiesSelfRegConfirm;
                page.setRedirect(true);
                return page.getURL();
            }
        }
        return null;

    }
}

