import { LightningElement ,wire} from 'lwc';
import getContacts from '@salesforce/apex/testApexDataController.getContacts';
export default class TestApexData extends LightningElement {
    con;
    contactList;
    @wire(getContacts)
    wiredContacts({ error, data }) {
        if (data) {
            console.log('data', data);
            this.contactList = data;
        } else if (error) {
            console.log('error', error);
        }
    }
    showData(){
        
           
                this.con = this.contactList;
            
    }
   
}