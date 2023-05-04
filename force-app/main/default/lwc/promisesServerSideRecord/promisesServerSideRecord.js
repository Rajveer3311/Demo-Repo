import { LightningElement } from 'lwc';
import getContactRecord from '@salesforce/apex/PromisesServerRecords.getAccountContactRecord';
import getOppRecord from '@salesforce/apex/PromisesServerRecords.getAccountoppRecord';
import getCaseRecord from '@salesforce/apex/PromisesServerRecords.getAccountCaseRecord';
const contColumns = [
    { label: 'Label', fieldName: 'Id' },
    { label: 'Name', fieldName: 'Name', type: 'Name' },
];
const oppColumns2 = [
    { label: 'Label', fieldName: 'Id' },
    { label: 'Name', fieldName: 'Name', type: 'Name' },
];

const caseColumns3 = [
    { label: 'Label', fieldName: 'Id' },
    { label: 'Name', fieldName: 'CaseNumber', type: 'Auto Number' },
];
export default class PromisesServerSideRecord extends LightningElement {
   contData = [];
   oppData = [];
   caseData = [];
   columns1 = contColumns;
   columns2 = oppColumns2;
   columns3 = caseColumns3;
  connectedCallback() {
        this.invokeApexMethods();
    }
 
    async invokeApexMethods() {
        try {
            const result1 = await getContactRecord();
            console.log('Method1 result: ' + result1);
            this.contData = result1;
            const result2 = await getOppRecord({
                message1: result1
            });
            console.log('Method2 result: ' + result2);
            this.oppData = result2;
            const result3 = await getCaseRecord({
                message2: result2
            });
            console.log('Method3 result: ' + result3);
            this.caseData = result3;
        } catch(error) {
            console.log(error);
        } finally {
            console.log('Finally Block');
        }
    }
}