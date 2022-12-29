import { api, LightningElement } from 'lwc';

export default class ProgressBar extends LightningElement {
    @api size;
    @api value;

    // progressBarLatest
    
    @api resetProgress() {
        this.size = "Medium";
        this.value = 0;
    }
}