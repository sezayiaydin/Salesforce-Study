public with sharing class RestCalloutsMock implements HttpCalloutMock {
    public HttpResponse respond(HttpRequest request) {
        if(request.getMethod() == 'GET' && request.getEndpoint() == 'https://th-apex-http-callout.herokuapp.com/animals') {
            HttpResponse response = new HttpResponse();
            response.setStatus('OK');
            response.setStatusCode(200);
            String jsonString = '{"animals":["majestic badger","fluffy bunny"]}';
            response.setBody(jsonString);
            return response;
        } else if(request.getMethod() == 'GET' && request.getEndpoint() == 'https://mockyard.herokuapp.com/blogs') {
            HttpResponse response = new HttpResponse();
            response.setStatus('OK');
            response.setStatusCode(200);
            String jsonString = '[{"id":1,"topic":"business","title":"Korean App Builder ProtoPie Raises $8 Million For North America Expansion","author":"Jayde Cheung","body":"ProtoPie, a Seoul-based startup that helps companies build websites and mobile apps, has raised $8 million in a funding round to fuel its global expansion."}]';
            response.setBody(jsonString);
            return response;
        } else if(request.getMethod() == 'GET' && request.getEndpoint() == 'https://mockyard.herokuapp.com/products') {
            HttpResponse response = new HttpResponse();
            response.setStatus('OK');
            response.setStatusCode(200);
            String jsonString = '[{"id":1,"name":"Pepper - Chilli Seeds Mild","image":"https://source.unsplash.com/random/900×700/?product,fruit,electronics,food,drink","price":"$260.82","description":"sem fusce consequat nulla nisl nunc nisl duis bibendum felis sed interdum venenatis turpis enim blandit mi in porttitor pede justo","category":"Groceries","createdAt":"30-03-2021","productId":52434932138}]';
            response.setBody(jsonString);
            return response;
        } else if(request.getMethod() == 'POST' && request.getEndpoint() == 'https://th-apex-http-callout.herokuapp.com/animals') {
            HttpResponse response = new HttpResponse();
            response.setStatus('Created');
            response.setStatusCode(201);
            return response;
        } else if(request.getMethod() == 'POST' && request.getEndpoint() == 'https://gorest.co.in/public/v2/users') {
            HttpResponse response = new HttpResponse();
            response.setStatus('Created');
            response.setStatusCode(201);
            return response;
        }
        return null;
    }
}