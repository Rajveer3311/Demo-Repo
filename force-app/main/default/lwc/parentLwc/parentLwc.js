import { LightningElement,api} from 'lwc';
export default class ParentLwc extends LightningElement {
   @api percentage = 50;
   handlechange(event){
       console.log('AA raha he');
       this.percentage = event.detail;
   }

    get style() {
        return `width: ${this.percentage}%`;
    }
}