import { LightningElement,api,wire,track } from 'lwc';
import findContactList from '@salesforce/apex/ShowContactOnAccount.getAllContact';
const columns = [
    { label: 'Name', fieldName: 'Name' },
];
export default class ShowContactOnAccount extends LightningElement {
    @api recordId;
    @track contacts = [];
    @track columns = columns;
    error;
    @wire(findContactList, {accId: '$recordId'}) 
    WireContactRecords({error, data}){
        if(data){
            this.contacts = data;
            this.error = undefined;
            console.log(this.contacts);
        }else{
            this.error = error;
            this.contacts = undefined;
        }
    }
}