import { LightningElement } from 'lwc';

export default class MyNameRole extends LightningElement {
    username = "SNA ENCM";
    role;
    roleOptions = [
        {label: "Salesforce Admin", value: "Salesforce Admin"},
        {label: "Salesforce Developer", value: "Salesforce Developer"},
        {label: "Salesforce Architect", value: "Salesforce Architect"}
    ];

    changeHandler(event) {
        const field = event.target.label;
        if(field === "Enter your username") {
            this.username = event.target.value;
        } else {
            this.role = event.target.value;
        }
    }
}