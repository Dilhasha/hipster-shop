import ballerinax/jaeger as _;
import ballerina/http;
import ballerina/io;


@display {
    label: "productservice"
}
service /productservice on new http:Listener(9232) {

    resource function get productInfo(int productId) returns json {
        return {"id": 1, "item": "TShirt", "quantity": 100};
    }

    resource function get productCatalog() returns json {    
        return [{"id": 1, "item": "TShirt", "quantity": 100}, {"id": 2, "item": "Pants", "quantity": 50}];
    }

    resource function post buyProduct(int productId) returns error?{    
        // Call inventory to update product stock
        http:Client clientEp = check new("http://localhost:9090/checkout");
        http:Request req = new;
        req.setPayload({"id": 1, "item": "TShirt", "quantity": 100});
        http:Response res = check clientEp->post("/checkout", req);
        if (res.statusCode == 200) {
            io:println("Product purchased successfully");
        } else {
            io:println("Product purchase failed");
        }
    }
}
