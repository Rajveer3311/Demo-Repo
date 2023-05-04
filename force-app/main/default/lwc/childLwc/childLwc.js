import { LightningElement,api } from 'lwc';
export default class ChildLwc extends LightningElement {
    @api percentage = 50;
    
    handlePercentageChange(event) {
        this.percentage = event.target.value;
        const evt = new CustomEvent('sampledemo',{
            detail : this.percentage
        });
        this.dispatchEvent(evt);
    }
}