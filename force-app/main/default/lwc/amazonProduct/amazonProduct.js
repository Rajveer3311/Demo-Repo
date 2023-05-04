import { LightningElement } from 'lwc';

export default class AmazonProduct extends LightningElement {
    imageData ="https://m.media-amazon.com/images/I/71cSV-RTBSL._SX679_.jpg";
    setImage(event) {
        console.log("a raha he");
        try {
        this.imageData =  event.target.src;
        console.log(this.imageData);
        console.log('hii');
        } catch (error) {
            console.log(error);
        }
        
        
    }
    oldImage(){
       imgData = "https://m.media-amazon.com/images/I/71cSV-RTBSL._SX679_.jpg";
    }
}