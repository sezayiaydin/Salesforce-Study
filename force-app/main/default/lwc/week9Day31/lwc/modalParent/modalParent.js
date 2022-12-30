import { LightningElement } from 'lwc';

export default class ModalParent extends LightningElement {

    showModal = false;
    message;

    clickHandler() {
        this.showModal = true;
    }

    childHandler(event) {
        console.log(event);
        this.message = event.detail;
        this.showModal = false;
    }

//version2

    // showModal = false;
    // message;

    // clickHandler() {
    //     this.showModal = true;
    // }

    // childHandler(event) {
    //     console.log(event);
    //     this.message = event.detail;
    //     this.showModal = false;
    // }


//version1 
    // showModal = false;

    // clickHandler() {
    //     this.showModal = true;
    // }

    // childHandler() {
    //     this.showModal = false;
    // }
}