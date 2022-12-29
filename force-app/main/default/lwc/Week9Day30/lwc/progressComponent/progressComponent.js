import { LightningElement } from 'lwc';

export default class ProgressComponent extends LightningElement {

    progressSize;
    progressValue;

    changeHandler(event) {
        if(event.target.name === "Size") {
            this.progressSize = event.target.value;
        } else {
            this.progressValue = event.target.value;
        }
    }

    // progressComponentLatest
    progressHandler() {
        this.template.querySelector("c-progress-bar").resetProgress();
    }

    //latest buraya kadar

    get sizeOptions() {
        return [
            {label: "Small", value: "Small"},
            {label: "Medium", value: "Medium"},
            {label: "Large", value: "Large"}
        ];
    }
}