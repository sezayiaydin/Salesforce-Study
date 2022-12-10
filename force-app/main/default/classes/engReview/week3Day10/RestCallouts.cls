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

    public static HttpResponse getProducts() {
        //1. Prepare HttpRequest and wrap the necessary information in it
        HttpRequest request = new HttpRequest();
        request.setMethod('GET');
        request.setEndpoint('https://mockyard.herokuapp.com/products');

        //2. Prepare internet
        Http http = new Http();

        //3. Send the request over the internet to receive response
        HttpResponse response = http.send(request);

        //4. Process the response
        if(response.getStatusCode() == 200) {
            System.debug(response.getBody());

            //convert the json string into apex type
            String jsonString = response.getBody();
            List<ProductWrapper> wrappers = (List<ProductWrapper>)JSON.deserialize(jsonString, List<ProductWrapper>.class);

            List<Ecommerce_Products__c> products = new List<Ecommerce_Products__c>();
            for(ProductWrapper pw : wrappers) {
                Ecommerce_Products__c prod = new Ecommerce_Products__c();
                prod.Product_Name__c = pw.name;
                prod.Image__c = pw.image;
                String amount = pw.price.substring(1); //$260.82 => 260.82
                prod.Price__c = Double.valueOf(amount);
                prod.Description__c = pw.description;
                prod.Category__c = pw.category;
                prod.Introduced_Date__c = Date.today();
                prod.Name = pw.productId;
                products.add(prod);
            }

            //insert products
            try {
                insert products;
            } catch(Exception ex) {
                //create log
                System.debug(ex.getMessage());
            }
        }
        return response;
    }

    public static HttpResponse postAnimal() {
        //1. Prepare HttpRequest and wrap the necessary information in it
        HttpRequest request = new HttpRequest();
        request.setMethod('POST');
        request.setEndpoint('https://th-apex-http-callout.herokuapp.com/animals');
        String jsonString = '{"name" : "dog"}';
        request.setBody(jsonString);
        request.setHeader('Content-Type', 'application/json');

        //2. Prepare internet
        Http http = new Http();

        //3. Send the request over the internet to receive response
        HttpResponse response = http.send(request);
        System.debug(response);

        //4. Process the response
        if(response.getStatusCode() == 201) {
            System.debug('Animal has been posted successfully!');
        }
        return response;
    }

    //9c8f501f3c10ded4bc2a0f92b6206722022c543748443e2fbe70dcd7bc10113a
    //https://gorest.co.in/public/v2/users

    // public static HttpResponse postGorestContact() {{
    //     //1. Prepare HttpRequest and wrap the necessary information in it
    //     //2. Prepare internet
    //     //3. Send the request over the internet to receive response
    //     //4. Process the response

    // }

    public static HttpResponse postGorestContact() {
        
        // //1. Prepare HttpRequest and wrap the necessary information in it
        // HttpRequest request = new HttpRequest();
        // request.setMethod('POST');
        // request.setEndpoint('https://gorest.co.in/public/v2/users');
        // //1.1 Get the gorest contact records and prepare them into json string
        // List<Gorest_Contact__c> contacts = [SELECT Name, Email__c, Gender__c, Status__c FROM Gorest_Contact__c LIMIT 2];
        // List<GorestContactWrapper> wrappers = new List<GorestContactWrapper>();
        // for(Gorest_Contact__c con : contacts) {
        //     GorestContactWrapper wrap = new GorestContactWrapper();
        //     wrap.name = con.Name;
        //     wrap.email = con.Email__c;
        //     wrap.gender = con.Gender__c;
        //     wrap.status = con.Status__c;
        //     wrappers.add(wrap);
        // }
        // String jsonString = JSON.serialize(wrappers);
        // System.debug(jsonString);
        // request.setBody(jsonString);
        // request.setHeader('Content-Type', 'application/json;charset=UTF-8');
        // request.setHeader('Authorization', 'Bearer 70e1f461fd475135683473e734663791d988ca49336b3a1002405be2ff00ed29');
        
        //1. Prepare HttpRequest and wrap the necessary information in it
        HttpRequest request = new HttpRequest();
        request.setMethod('POST');
        request.setEndpoint('https://gorest.co.in/public/v2/users');
        //1.1 Get the gorest contact records and prepare them into json string
        Gorest_Contact__c con = [SELECT Name, Email__c, Gender__c, Status__c FROM Gorest_Contact__c LIMIT 1];
            GorestContactWrapper wrap = new GorestContactWrapper();
            wrap.name = con.Name;
            wrap.email = con.Email__c;
            wrap.gender = con.Gender__c;
            wrap.status = con.Status__c;
        String jsonString = JSON.serialize(wrap);
        System.debug(jsonString);
        request.setBody(jsonString);
        request.setHeader('Content-Type', 'application/json;charset=UTF-8');
        request.setHeader('Authorization', 'Bearer 70e1f461fd475135683473e734663791d988ca49336b3a1002405be2ff00ed29');
    
        //2. Prepare internet
        Http http = new Http();
    
        //3. Send the request over the internet to receive response
        HttpResponse response = http.send(request);
        System.debug(response);
        System.debug(response.getBody());
    
        //4. Process the response
        if(response.getStatusCode() == 201) {
            System.debug('records have been created successfully!');
        }
        return response;
    }
    

}