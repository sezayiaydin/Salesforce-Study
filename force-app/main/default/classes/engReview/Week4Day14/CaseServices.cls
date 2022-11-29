@RestResource(urlMapping='/Case/*')
global with sharing class CaseServices {
    //https://developercom172-dev-ed.develop.my.salesforce.com/services/apexrest/Case/*
    //https://developercom172-dev-ed.develop.my.salesforce.com/services/apexrest/Case/5004x00000Oda1ZAAR
  
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

    @HttpDelete
    global static String deleteCase(){
      RestRequest request = RestContext.request;
      String uri = request.requestURI;
      String caseId = uri.substringAfterLast('/');
      Case cs = [SELECT Id FROM Case where Id =:caseId];
      delete cs;
      return 'Case deleted successfully';
  }
}
