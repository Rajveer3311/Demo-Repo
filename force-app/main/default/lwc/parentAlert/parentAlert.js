import { LightningElement,api } from 'lwc';
export default class ParentAlert extends LightningElement {
@api message = 'This is By default salesforce error so no worry about that..';
@api errorIcon = '/assets/icons/utility-sprite/svg/symbols.svg#error';
   handleClick() {
          const objChild = this.template.querySelector('c-child-alert');
          objChild.alertMethod(this.message,this.errorIcon);
   }
}