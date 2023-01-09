import { LightningElement } from 'lwc';

export default class LifecycleParent extends LightningElement {
    constructor() {
        super();
        console.log("Parent component constructor");
    }

    connectedCallback() {
        console.log("Parent component connectedCallback");
    }

    renderedCallback() {
        console.log("Parent component renderedCallback");
    }
}