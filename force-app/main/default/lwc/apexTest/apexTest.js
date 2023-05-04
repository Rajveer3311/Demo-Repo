import { LightningElement } from 'lwc';
import methodName from '@salesforce/apex/TestApexClass.methodName';
export default class ApexTest extends LightningElement {
    handleSearchKeyChange(){
                     methodName({ firstNumber: this.rj})


                    .then(result => {


            


          


           // this.error = undefined;


        })


        .catch(error => {


            


            //this.error = error;


        });


    }   


}