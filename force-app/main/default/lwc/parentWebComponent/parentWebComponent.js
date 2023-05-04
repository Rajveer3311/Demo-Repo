import { LightningElement } from 'lwc';
export default class ParentWebComponent extends LightningElement {
 callChildMethod(){
     const objChild = this.template.querySelector('c-child-web-component');
     objChild.parentMethod();
 }
}