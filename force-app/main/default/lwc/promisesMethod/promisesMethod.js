import { LightningElement } from 'lwc';
import getTextMethod1 from '@salesforce/apex/PromisesMethod.getTextMethod1';
import getTextMethod2 from '@salesforce/apex/PromisesMethod.getTextMethod2';
import getTextMethod3 from '@salesforce/apex/PromisesMethod.getTextMethod3';
export default class PromisesMethod extends LightningElement {
  connectedCallback() {
        this.invokeApexMethods();
    }
    res1;
    res2;
    res3;
    invokeApexMethods() {
        getTextMethod1()
        .then((result1) => {
            this.res1 = 'Method1 result: ' + result1;
 
            getTextMethod2({
                message1: result1
            })
            .then((result2) => {
                this.res2 = 'Method2 result: ' +result1 + ' ' +result2;
 
                getTextMethod3({
                    message2: result2
                })
                .then((result3) => {
                    this.res3 = 'Method3 result: '+result1+ ' ' + result2+ ' ' + result3;
                })
                .catch((error => {
                    console.log(error);
                }));
            })
            .catch((error => {
                console.log(error);
            }));
        })
        .catch((error) => {
            console.log(error);
        })
        .finally(() => {
            console.log('Finally Block');
        })
    }
}