import { LightningElement } from 'lwc';

import BLOG_OBJECT from '@salesforce/schema/Blog__c';
import AUTHOR_FIELD from '@salesforce/schema/Blog__c.Author__c';
import NAME_FIELD from '@salesforce/schema/Blog__c.Name';
import BODY_FIELD from '@salesforce/schema/Blog__c.Body__c';
import TITLE_FIELD from '@salesforce/schema/Blog__c.Title__c';
import TOPIC_FIELD from '@salesforce/schema/Blog__c.Topic__c';

export default class RecordViewFormBlog extends LightningElement {
    recordId = "a084x00000BkI1cAAF";
    objectName = BLOG_OBJECT;
    fields = {
        name: NAME_FIELD,
        author: AUTHOR_FIELD,
        topic: TOPIC_FIELD,
        title: TITLE_FIELD,
        body: BODY_FIELD
    };
}