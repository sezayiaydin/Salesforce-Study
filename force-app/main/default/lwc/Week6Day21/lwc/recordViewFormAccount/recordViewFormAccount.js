import { LightningElement } from 'lwc';
import ACCOUNT_OBJECT from '@salesforce/schema/Account';
import NAME_FIELD from '@salesforce/schema/Account.Name';
import TYPE_FIELD from '@salesforce/schema/Account.Type';
import REVENUE_FIELD from '@salesforce/schema/Account.AnnualRevenue';
import INDUSTRY_FIELD from '@salesforce/schema/Account.Industry';
import RATING_FIELD from '@salesforce/schema/Account.Rating';
import PHONE_FIELD from '@salesforce/schema/Account.Phone';

export default class LightningAccountRecordViewForm extends LightningElement {
    recordId = '0014x00001M1jCwAAJ';
    objectName = ACCOUNT_OBJECT;
    
    fields = {
        name:NAME_FIELD,
        type:TYPE_FIELD,
        revenue:REVENUE_FIELD,
        industry:INDUSTRY_FIELD,
        rating:RATING_FIELD,
        phone:PHONE_FIELD

    }

}