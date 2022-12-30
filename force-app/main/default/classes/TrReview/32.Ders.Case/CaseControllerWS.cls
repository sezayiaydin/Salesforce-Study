public with sharing class CaseControllerWS {
    @AuraEnabled(cacheable=true)
    public static List<case> getCasesByContactId(String contId){
        return [SELECT CaseNumber, Type, Status, ClosedDate, CreatedDate, ContactId 
        FROM Case
        WHERE ContactId =: contID AND (isClosed=False OR ClosedDate=LAST_N_DAYS:14)
        WITH SECURITY_ENFORCED
        ORDER BY CreatedDate DESC];
        //görünmeyen field ları workbench yada developer console dan ilgili object e girip bakılabilir
        //OR dikkat
    }   
}
