/*
When a case is created, check the description field of the newly created case 
- if the description field contains the word ‘password’, then create a child case with the following field values
- subject = ‘Parent Case may contain secret info, do something NOW’
- parentId = _______ (newly create case id) // id gerektiği için after
- priority = ‘High’
- Description = ‘Secret info not allowed in case’
 */

trigger CaseTriggerP7 on Case (after insert) {
    if (Trigger.isAfter) {
        if (Trigger.isInsert) {
            CaseTriggerP7Handler.createChildCase(Trigger.new, Trigger.newMap);
        }
    }
}