import { LightningElement,track ,api } from 'lwc';
import { CloseActionScreenEvent } from 'lightning/actions';
export default class rajveerCalendar extends LightningElement {
    @track leaveId;
    @api recordId;
    //Boolean tracked variable to indicate if modal is open or not default value is false as modal is closed when page is loaded 
    @track isModalOpen = true;
    @track closeAction = true;
    causeValid;
    typeValid;
    fromValid;
    toValid;
    
    openModal() {
        // to open modal set isModalOpen tarck value as true
        this.isModalOpen = true;
    }
    closeModal() {
        // to close modal set isModalOpen tarck value as false
        this.isModalOpen = false;
    }
    /* submitDetails() {
      //   to close modal set isModalOpen tarck value as false
      //  Add your code to call apex method or do some processing
        alert('chal gaya! submit');
       this.isModalOpen = false;
  }*/
   typeValidation(event){
    this.typeValid = event.target.value;
    console.log(this.typeValid);
   }
   causeValidation(event){
    this.causeValid = event.target.value;
    console.log(this.causeValid);
   }
   fromValidation(event){
    this.fromValid = event.target.value;
    console.log(this.fromValid);
   }
   toValidation(event){
    this.toValid = event.target.value;
    console.log(this.toValid);
   }
    handleSubmit(event){
       event.preventDefault();       // stop the form from submitting
       console.log(this.fromValid);
        if(((this.typeValid) && (this.causeValid ) && (this.toValid)) && (this.toValid > this.fromValid)){
             
         const fields = event.detail.fields;
        fields.Contact__c = this.recordId;
        this.template.querySelector('lightning-record-edit-form').submit(fields);
        this.isModalOpen = false;
        }
        else{
          alert('These First Three field are required !');
          return ;
        }
     }
    handleSuccess(event){
      this.levId = event.detail.id
      this.dispatchEvent(new CloseActionScreenEvent());
    }
    
    closeQuickAction() {
      
        
      }
      
      
  
}