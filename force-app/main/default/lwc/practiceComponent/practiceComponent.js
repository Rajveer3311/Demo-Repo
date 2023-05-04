import { LightningElement, api, track } from 'lwc';
import id from '@salesforce/user/Id';
export default class PracticeComponent extends LightningElement {
 @api name= "Rajveer";
 @track age= 21;
 college = "Government Engg college Ajmer";
 userId = id;

 handleClick(){
     console.log('Change data!');
     this.name = 'Amit';
     this.age = 22;
     this.college = 'LPU';
 }
}