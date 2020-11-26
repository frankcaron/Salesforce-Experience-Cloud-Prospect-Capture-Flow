import { LightningElement, api } from 'lwc';
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

    //Form Inputs
    name;

    //Registration Function
    registerUser(payload) {
        console.log("Registering user...");
        /*
            wire
            .then(data => {
            if (data) {
                window.location.href = data;
            }
            }).catch(error => {
                console.error(error);
            });
        */
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

    grabName(event) {
        this.name = event.target.value;
    }

}