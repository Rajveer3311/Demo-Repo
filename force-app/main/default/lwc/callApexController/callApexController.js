import { LightningElement, track, wire } from 'lwc';
import getValues from '@salesforce/apex/CallApexControllerClass.getValue';
import getContactList from '@salesforce/apex/CallApexControllerClass.getContactList';
export default class CallApexController extends LightningElement {
@track name ;
@track getNameValueData;
@track contacts;
@track error;
listVal = ['Jaipur','Ajmer','vishakaPathnam'];
city = [
    {
        id : '087387',
        name : 'Ajmer'
    },
    {
        id : '087345',
        name : 'Jaipur'
    }
];
//@wire(getValue) getNameValueData;
//console.log(this.getNameValueData);
@wire(getValues)
wiredData({ error, data }) {
  if (data) {
    console.log('Data', data);
    this.getNameValueData = data;
  } else if (error) {
     console.error('Error:', error);
  }
}
// imperative call method
callImperativeMethod() {
        getContactList()
            .then(result => {
                this.contacts = result;
            })
            .catch(error => {
                this.error = error;
            });
    }
}