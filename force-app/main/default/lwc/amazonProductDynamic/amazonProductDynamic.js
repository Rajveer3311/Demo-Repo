import { LightningElement ,api, wire} from 'lwc';
import pictureUrl from '@salesforce/schema/Product_Images__c.Image_Url__c';
import getProductImages from '@salesforce/apex/amazonProductDynamicController.getProductImages';
export default class AmazonProductDynamic extends LightningElement {
    @api recordId;
    Images;
    imperativeContactList=[];
    
    imageData ;
    // ="https://m.media-amazon.com/images/I/71cSV-RTBSL._SX679_.jpg";
    // @wire(getProductImages) Images;
    // renderedCallback() {
    //     console.log('hjegkugsdkj');
    //     console.log(this.Images.data[0]);
    //     this.imageData = this.Images.data[0].Image_Url__c;
    // }
    
    setImage(event) {
        console.log("a raha he");
        try {
            this.imageData =  event.target.src;
            
        } 
        catch (error) {
            console.log(error);
        }
    }


    connectedCallback() {
        getProductImages({ recId: this.recordId })
            .then(result => {
                console.log(result);
                this.Images = result;
                this.imageData =this.Images[0].Image_Url__c;
                
            })
            .catch(error => {
                this.error = error;
            });
            
    }
    

}