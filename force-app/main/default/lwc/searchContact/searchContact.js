import { LightningElement, track, wire,api } from 'lwc';
import getContact from '@salesforce/apex/SearchContactController.getContact';
export default class SearchContact extends LightningElement {
@track searchKey;
@track contactData;
@track errors;
@api auraPassValue;
@api message;
@api vfMessage;
@wire(getContact, { contactName: '$searchKey' })
wiredData({ error, data }) {
  if (data) {
    console.log('Data', data);
    this.contactData = data;
  } else if (error) {
     console.error('Error:', error);
     this.errors = error;
  }
}
 searchData(event){
    console.log('value'+event.target.value);
    this.searchKey = event.target.value;
 }

 handleNext(){
  console.log('next');
  
  this.dispatchEvent(new customEvent('next'));
 }

 handlePrev(){
  this.dispatchEvent(new customEvent('prev'));
  console.log('previous');
 }

}