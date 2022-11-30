@RestResource(urlMapping='/Case/*')
global with sharing class CaseServices {
    //https://developercom172-dev-ed.develop.my.salesforce.com/services/apexrest/Case/*
    //https://developercom172-dev-ed.develop.my.salesforce.com/services/apexrest/Case/5004x00000Oda1ZAAR
  
    //Chrome extension Postman Rest client Header : Aythorizan Value: aşağıda komple

    //Almak için dev console da execute yerine " System.debug(UserInfo.getSessionId().subString(1));" yapıtır ve aşagıyı kopyala
    //Bearer 0D4x000008YCbs!ARQAQA6EBewDJ93bbaqRvY6IoC3eCz1iQvAhkHTzlzHEJukltVB_UGc_39amQt9auQTzosc5PJcwytvV7CixYnJQ5xhCz73I

    @HttpGet
    global static Case getCase() {
        RestRequest request = RestContext.request;
        String uri = request.requestURI;
        String caseId = uri.substringAfterLast('/');
        Case cs = [SELECT Id, CaseNumber, Priority, Origin, Subject, Description FROM Case WHERE Id = :caseId];
        return cs;
    }
        /*
        //split()
        String str = 'boo:moo:voo';
        str.split(':'); ['boo', 'moo', 'voo'];

        String uri = 'https://sf10-dev-ed.trailblaze.my.salesforce.com/services/apexrest/Case/5005h00000ZY3jcAAD';
        String[] words = uri.split('/');
        [
            'https:',
            '',
            'sf10-dev-ed.trailblaze.my.salesforce.com',
            'services',
            'apexrest',
            'Case',
            '5005h00000ZY3jcAAD'
        ]

        */
    @HttpPost
    global static Id postCase(String Priority, String Origin, String Subject, String Description) {
        Case cs = new Case();
        cs.Subject = Subject;
        cs.Priority = Priority;
        cs.Origin = Origin;
        cs.Description = Description;
        insert cs;
        return cs.Id;
    }

    // @HttpPost
    // global static List<Case> postCases() {
    //     RestRequest request = RestContext.request;
    //     String jsonString = request.requestBody.toString();
    //     List<Case> cases = (List<Case>)JSON.deserialize(jsonString, List<Case>.class);
    //     insert cases;
    //     return cases;
    // }

    @HttpDelete
    global static String deleteCase(){
      RestRequest request = RestContext.request;
      String uri = request.requestURI;
      String caseId = uri.substringAfterLast('/');
      Case cs = [SELECT Id FROM Case where Id =:caseId];
      delete cs;
      return 'Case deleted successfully';
  }

    @HttpPut 
    global static Id putCase(String Id, String Priority, String Origin, String Subject, String Description) {
        Case cs = new Case();
        cs.Id = Id;
        cs.Subject = Subject;
        cs.Priority = Priority;
        cs.Origin = Origin;
        cs.Description = Description;
        upsert cs;
        return cs.Id;
    }

    @HttpPatch
    global static Case patchCase() {
        RestRequest request = RestContext.request;
        String jsonString = request.requestBody.toString();
        //Approach 1
        Case cs = (Case)JSON.deserialize(jsonString, Case.class);
        update cs;
        Case csObj = [SELECT Id, CaseNumber, Priority, Origin, Subject, Description FROM Case WHERE Id = :cs.Id];
        return csObj;
    }


}
