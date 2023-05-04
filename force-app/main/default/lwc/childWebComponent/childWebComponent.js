import { LightningElement,track,api } from 'lwc';
export default class ChildWebComponent extends LightningElement {
  name = '';
  @api parentMethod(){
       console.log('Parent method call !!');
       this.name = 'Rajveer';
  }
}