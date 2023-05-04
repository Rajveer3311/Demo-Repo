import { LightningElement } from 'lwc';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';
export default class XXCalculator extends LightningElement {
    result;
    firstNumber;
    secondNumber;
    show = true;
    showResult = false;
    isLoading = false;
    blank;
    firstNum(event){
        console.log("1st"+this.firstNumber);
        this.firstNumber = event.target.value;
        console.log(this.firstNumber);
    }
    secondNum(event){
        this.secondNumber = event.target.value;
        console.log(this.secondNumber);
    }
    allCalculation(event){
        console.log('All Calculation Inside');
      this.operator = event.target.value;
      if(this.firstNumber != '' && this.secondNumber != ''){
          if(!(isNaN(this.firstNumber)) && !(isNaN(this.secondNumber))){
             this.isLoading = true;
             window.setTimeout(() => { this.isLoading = false,this.showResult = true;}, 1000);
             
        if(this.operator == '+'){
            this.result = (parseFloat(this.firstNumber) + parseFloat(this.secondNumber)).toFixed(2);
            this.show = false;
            console.log(this.result);
          }
          if(this.operator == '-'){
            this.result = (parseFloat(this.firstNumber) - parseFloat(this.secondNumber)).toFixed(2);
            this.show = false;
            console.log(this.result);
          }
          if(this.operator == '*'){
            this.result = (parseFloat(this.firstNumber) * parseFloat(this.secondNumber)).toFixed(2);
            this.result.toFixed(2);
            this.show = false;
            console.log(this.result);
          }
          if(this.operator == '/'){
              if(this.secondNumber != 0){
                this.result = (parseFloat(this.firstNumber) / parseFloat(this.secondNumber)).toFixed(2);
                this.show = false;
                console.log(this.result);
              }
              else{
                console.log('Calling Toast');
                //desc = 'Denominator should be greater than 0..'
                this.showToast();
                 
                //alert();
                this.result = '';
              }
            
          }
        }
        else{
            alert("Input value should be number type..");
            this.result = '';
        } 
      }
      else{
          alert('Both filled are required!');
      }
      
    }
    clearBtn(){
      this.show = true;
      this.result = '';
      this.showResult = false;
      this.firstNumber = '';
      this.secondNumber = '';
      const inputFields = this.template.querySelectorAll('lightning-input');
      if(inputFields){
        inputFields.forEach(currentItem => {
          currentItem.value = '';
        });
      }
    }
    //Show toast error message
    showToast() {
      this.dispatchEvent(
                    new ShowToastEvent({
                        title: 'Error creating record',
                        message: 'hi',
                        variant: 'error'
                    })
                );
    } 
}