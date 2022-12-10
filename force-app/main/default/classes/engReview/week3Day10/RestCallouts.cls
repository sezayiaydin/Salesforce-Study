public with sharing class RestCallouts {
    
    public static HttpResponse getAnimals() {
        //1. Prepare HttpRequest and wrap the necessary information in it
        HttpRequest request = new HttpRequest();
        request.setMethod('GET');
        request.setEndpoint('https://th-apex-http-callout.herokuapp.com/animals');

        //2. Prepare internet
        Http http = new Http();

        //3. Send the request over the internet to receive response
        HttpResponse response = http.send(request);

        //4. Process the response
        if(response.getStatusCode() == 200) {
            System.debug(response.getStatus());
            System.debug(response.getBody());
        }
        return response;
    }

//v1
    // public static HttpResponse getBlogs() {
    //     //1. Prepare HttpRequest and wrap the necessary information in it
    //     HttpRequest request = new HttpRequest();
    //     request.setMethod('GET');
    //     request.setEndpoint('https://mockyard.herokuapp.com/blogs');

    //     //2. Prepare internet
    //     Http http = new Http();

    //     //3. Send the request over the internet to receive response
    //     HttpResponse response = http.send(request);

    //     //4. Process the response
    //     if(response.getStatusCode() == 200) {
    //         System.debug(response.getBody());
    //     }
    //     return response;
    // }

    //v2
    public static HttpResponse getBlogs() {
        //1. Prepare HttpRequest and wrap the necessary information in it
        HttpRequest request = new HttpRequest();
        request.setMethod('GET');
        request.setEndpoint('https://mockyard.herokuapp.com/blogs');

        //2. Prepare internet
        Http http = new Http();

        //3. Send the request over the internet to receive response
        HttpResponse response = http.send(request);

        //4. Process the response
        if(response.getStatusCode() == 200) {
            System.debug(response.getBody());
            //convert the json string into apex type
            String jsonString = response.getBody();
            List<BlogWrapper> wrappers = (List<BlogWrapper>)JSON.deserialize(jsonString, List<BlogWrapper>.class);

            //convert the blog wrappers into blog sobjects
            List<Blog__c> blogs = new List<Blog__c>();
            for(BlogWrapper bw : wrappers) {
                Blog__c blog = new Blog__c();
                blog.Author__c = bw.author;
                blog.Body__c = bw.body;
                blog.Title__c = bw.title;
                blog.Topic__c = bw.topic;
                blogs.add(blog);
            }
            //insert blogs
            try {
                insert blogs;
            } catch(Exception ex) {
                System.debug(ex.getMessage());
            }
        }
        return response;
    }
}