import { LightningElement, api } from 'lwc';

export default class ExcRegistrationFlow extends LightningElement {

    //Properties
    @api nbaStrategy;

    //Step Flags
    stepOne = true;
    stepTwo = false;
    stepThree = false;

    //Form Inputs
    name;

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