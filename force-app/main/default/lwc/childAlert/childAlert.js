import { LightningElement,api } from 'lwc';
export default class ChildAlert extends LightningElement {
  @api message;;
  @api errorIcon;
  show = false;
  @api alertMethod(msg,errorSym){
       console.log(msg);
       this.message = msg;
       this.errorIcon = errorSym;
       this.show = true;
       
  }
}