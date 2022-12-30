import { api, LightningElement, wire } from 'lwc';
import { NavigationMixin } from 'lightning/navigation';
import { getRecord } from 'lightning/uiRecordApi';
import CONTACT_FIELD from '@salesforce/schema/Candidate__c.Contact__c';
import getCasesByContactId from '@salesforce/apex/CaseControllerWS.getCasesByContactId';
const FIELDS =[CONTACT_FIELD];
export default class CasesByContactForCandidate extends NavigationMixin(LightningElement) {
    @api recordId; //HAngi record page de ise o id yi alır
    contactId;
    cases;
 
   @wire(getRecord, { recordId: '$recordId', fields: FIELDS })
   bagliContactId({data,error}){
    if (data) {
        console.log('getirilen contact Id:',data);
        this.contactId = data.fields.Contact__c.value;

    } else {
        console.error(error);
    }
   }
   //contactId için yukarıdaki get record yazıldı(sayfasında bulnduğumuz recordun datası)
   //burada apex class çağırıldı(CaseControllerWS.getCasesByContactId)
    @wire(getCasesByContactId, { contId: '$contactId' }) 
        wiredData({ error, data }) {
        if (data) {
            console.log('cases Data: ', data);
            this.cases = data;
         
        } else if (error) {
            console.error('Error:', error);
        }
    }

    goturBeniCase(event) {
        console.log('mixin case id: ',event.target.value);
        this[NavigationMixin.Navigate]({
            type: 'standard__recordPage',
            attributes: {
                recordId: event.target.value,
                objectApiName: 'Case',
                actionName: 'view'
            }
        });
    }
    
}