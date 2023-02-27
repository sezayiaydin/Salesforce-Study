public with sharing class AirlinessCallouts {

    public static HttpResponse getAirlineDetails() {
          
        //1. Prepare HttpRequest and wrap all the necessary in it
          HttpRequest request = new HttpRequest();
          request.setMethod('GET');
          request.setEndpoint('https://api.instantwebtools.net/v1/airlines');

          //2. Prepare Internet
          Http http = new Http();
  
          //3. Send the request over the internet in order to receive response back
          HttpResponse response = http.send(request);
          System.debug(response);
          System.debug(response.getBody());
  
          //4. Process the response
        if (response.getStatusCode()==200) {
            String jsonString=response.getBody(); 

            List<AirlinessWrapper> wrappers=(List<AirlinessWrapper>)JSON.deserialize(jsonString, List<AirlinessWrapper>.class);

            List<Airliness__c> airliness= new List<Airliness__c>();
            for (AirlinessWrapper wrap : wrappers) {
                //concert wrapper into sobject
                Airliness__c line=new Airliness__c();
                line.name=wrap.name;
                line.AirlinessId__c=wrap.id;
                line.Country__c=wrap.country;
                line.Established__c=wrap.established;
                line.HeadQuarters__c=wrap.head_quaters;
                line.LogoURL__c=wrap.logo;
                line.Slogan__c=wrap.slogan;
                line.Website__c=wrap.website;
                airliness.add(line);
            }

            //insert airlines records
            try {
                insert airliness;
            } catch (Exception ex) {
                //create a log
                System.debug(ex.getMessage());
            }
        } else {
            //convert json string into sobject records
            System.debug(response.getBody());            
        }

        return response;
    } 

    public static HttpResponse postAirlineDetails() {
        //1. Prepare HttpRequest and wrap all the necessary in it
        HttpRequest request = new HttpRequest();
        request.setMethod('POST');
        request.setEndpoint('https://api.instantwebtools.net/v1/airlines');



        //1.1 prepare data
        Airliness__c line=[SELECT Name, AirlinessId__c, Country__c, Established__c, HeadQuarters__c, LogoURL__c, Slogan__c, Website__c 
                            FROM Airliness__c
                            ORDER BY CreatedDate DESC
                            LIMIT 1];
        //System.debug(JSON.serialize(line));
        AirlinessWrapper wrap =new AirlinessWrapper();
        wrap.name=line.name;
        wrap.id=line.AirlinessId__c;
        wrap.country=line.Country__c;
        wrap.established=line.Established__c;
        wrap.head_quaters=line.HeadQuarters__c;
        wrap.logo=line.LogoURL__c;
        wrap.slogan=line.Slogan__c;
        wrap.website=line.Website__c;
        String jsonString=JSON.serialize(wrap);
        request.setBody(jsonString);
        request.setHeader('Content-Type', 'application/json');

        //2. Prepare Internet
        Http http = new Http();

        //3. Send the request over the internet in order to receive response back
        HttpResponse response = http.send(request);
        System.debug(response);
        // System.debug(response.getBody());

        //4. Process the response
        if (response.getStatusCode()==200) {
            System.debug('Data has been posted succesfully');
            System.debug(response.getBody());
        } else {
            System.debug(response.getBody());
        }
        return response;

    }


}