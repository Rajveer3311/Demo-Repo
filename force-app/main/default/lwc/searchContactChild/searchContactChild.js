import { LightningElement, api, track  } from 'lwc';
export default class SearchContactChild extends LightningElement {
@track page=1;
@api strOutput;
@api handleNext(){
console.log('next');
this.page = this.page + 1;
}
@api handlePrev(){
console.log('prev');
this.page = this.page - 1;
}
}