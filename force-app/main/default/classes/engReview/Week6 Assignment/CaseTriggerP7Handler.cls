public class CaseTriggerP7Handler {
    public static void createChildCase(List<Case> caseTriggerNew, Map<id, Case> caseTriggerNewMap) {
        //ten cases insert

        //set of id to store CASE ID of records whose description field has 'Password'
        Set<id> setCaseId = new Set<id>();

        //for each loop
            //check if description field contains 'password' then add to set of id
        for (Case eachNewCase : caseTriggerNew) {
            //            if (eachNewCase.Description?.containsIgnoreCase('password'))
            if (eachNewCase.Description!=null&&eachNewCase.Description.containsIgnoreCase('password')) {
                setCaseId.add(eachNewCase.Id);
            }
        }
        //List<Case>
        List<Case> createCase = new List<Case>();
        //for each loop on set of case ids
        for (Id eachId : setCaseId) {
            //new instance of case
            case c=new Case();
            //assign values
            c.subject='Parent Case may contain secret info, do something NOW';
            c.parentId=eachId;
            c.priority='High';
            c.description='Secret info not allowed in case';
            //add to list
            createCase.add(c);
        }        
        //insert list
        if (!createCase.isEmpty()) {
            insert createCase;
        }        
    }
}