import { LightningElement, api } from 'lwc';
import contactObject from '@salesforce/schema/Contact';
import Last_Name from '@salesforce/schema/Contact.LastName';
import First_Name from '@salesforce/schema/Contact.FirstName';
export default class RecordFormExample extends LightningElement {
    // Expose a field to make it available in the template
    fields = [Last_Name,First_Name];
    objectApiName = contactObject;
    // Flexipage provides recordId and objectApiName
    
    @api objectApiName;
     handleSuccess(event) {
       
        this.dispatchEvent(evt);
    }
}