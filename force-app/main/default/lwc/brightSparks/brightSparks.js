import { LightningElement } from 'lwc';
export default class Loops extends LightningElement {
    fruitList = ['apple','mango','orange','grapes'];
    lstAccounts = [
        {
            Id : '101',
            Name : 'Cristiano Ronaldo'
        },
        {
            Id : '102',
            Name : 'Lionel Messi'
        },
        {
            Id : '103',
            Name : 'Sachin Tendulkar'
        }
    ];
    show(e){
        console.log('hii buddy');
    }
}