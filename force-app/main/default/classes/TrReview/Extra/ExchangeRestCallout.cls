public with sharing class ExchangeRestCallout {
    static string Excahange_Endpoint = ExchangeSettings__mdt.getInstance('CalloutSettings').EndPoint__c;
    static string Excahange_ApiKey = ExchangeSettings__mdt.getInstance('CalloutSettings').ApiKey__c;
    static string defaultCurrceny = UserInfo.getDefaultCurrency();
  
    @invocableMethod (label='Exchange Callouts' 
    description='Bu Method callout sonrasi exchnage rate alanini update eder' 
    category='Exchange')
    public static void getExchangeRate(List<Id> exchangeIds){

        List<Exchange__c> listExchange = [SELECT Currency__c, Exchange_Rate__c FROM Exchange__c WHERE Id IN : exchangeIds ];
        List<Exchange__c> updateExchangeList = new List<Exchange__c>();
        for (Exchange__c exc : listExchange) {
            
            string currencyField = exc.Currency__c;

            HttpRequest request = new HttpRequest();
            request.setMethod('GET');

            // https://api.apilayer.com/exchangerates_data/latest?symbols=TRY&base=EUR
            request.setEndPoint(Excahange_Endpoint + 'symbols=' + currencyField + '&base=' + defaultCurrceny);
            request.setHeader('apikey', Excahange_ApiKey);
            
            HTTP http = new HTTP();
            HttpResponse response = http.send(request);

            String jsonString = response.getBody();
            system.debug(jsonString);
            if(response.getStatusCode() == 200){
                ExchangeWrapper.rates wrapper = (ExchangeWrapper.rates)JSON.deserialize(jsonString,ExchangeWrapper.rates.class);

                decimal exchangeRate = wrapper.rates.get(currencyField);
                exc.Exchange_Rate__c = exchangeRate;
                updateExchangeList.add(exc);
            }
        }
        try {
            update updateExchangeList;
        } catch (Exception ex) {
            System.debug(ex.getMessage());
        }
    }
}