import { LightningElement } from 'lwc';

export default class LifecycleChild extends LightningElement {
    constructor() {
        super();
        console.log("Child component constructor");
    }
    connectedCallback() {
        console.log("Child component connectedCallback");
    }

    renderedCallback() {
        console.log("Child component renderedCallback");
    }
}