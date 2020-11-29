import { LightningElement, api } from 'lwc';
import communityId from '@salesforce/community/Id';
import getRegisteredUserURL from '@salesforce/apex/excProspectRegistrationController.getRegisteredUserURL';

export default class ExcRegistrationFlow extends LightningElement {

    //Properties
    @api nbaStrategy;
    @api setFirstChoiceA;
    @api setFirstChoiceB;
    @api setFirstChoiceC;
    @api setSecondChoiceA;
    @api setSecondChoiceB;
    @api setSecondChoiceC;

    //Step Flags
    stepOne = true;
    stepTwo = false;
    stepThree = false;
    stepFour = false;
    stepFive = false;
    stepSix = false;

    //Form Inputs
    firstName;
    lastName
    email;
    password;
    verifyPassword;

    //Registration Function
    registerUser(payload) {
        console.log("Registering user...");

        this.stepFive = false;
        this.stepSix = true;

        getRegisteredUserURL({
                communityName: communityId,
                firstName: this.firstName,
                lastName: this.lastName,
                email: this.email,
                password: this.password,
                verifyPassword: this.verifyPassword
            })
            .then(data => {
                if (data) {
                    if (data == 'USERFAIL') {
                        console.log("User was not successfully created.");
                        //Pass error message back and move back to step 4
                    } else if (data == 'PASSFAIL') {
                        console.log("Passwords don't match.");
                        //Pass error message back and move back to step 4
                    } else {
                        console.log("Successfully logged user in...");
                        //window.location.href = data;
                    }
                } else {
                    console.log("Unexpected error response from login logic.");
                }
            }).catch(error => {
                console.log("Failed to execute login logic.");
                console.error(error);
            });

    }

    //Helper Functions
    progressStep() {
        if (this.stepOne) {

            // Progress the step
            this.stepOne = false;
            this.stepTwo = true;

        } else if (this.stepTwo) {

            //Progress the step
            this.stepTwo = false;
            this.stepThree = true;

        } else if (this.stepThree) {

            //Progress the step
            this.stepThree = false;
            this.stepFour = true;
        } else if (this.stepFour) {

            //Progress the step
            this.stepFour = false;
            this.stepFive = true;
        }
    }

    progressStepEnterKey(event) {
        if (event.which == 13){
            this.progressStep();
        }
    }

    grabFirstName(event) {
        this.firstName = event.target.value;
    }

    grabLastName(event) {
        this.lastName = event.target.value;
    }

    grabPassword(event) {
        this.password = event.target.value;
    }

    grabVerifyPassword(event) {
        this.verifyPassword = event.target.value;
    }

    grabEmail(event) {
        this.email = event.target.value;
    }

}