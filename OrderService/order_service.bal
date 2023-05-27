import ballerinax/jaeger as _;
import ballerina/http;
import ballerina/io;

http:Client userServiceClient = check new ("http://localhost:9231/userservice");
http:Client shippingServiceClient = check new ("http://localhost:9237/shippingservice");
http:Client cartServiceClient = check new ("http://localhost:9233/cartservice");
http:Client paymentServiceClient = check new ("http://localhost:9235/paymentservice");

@display {
    label: "orderservice"
}
service /orderservice on new http:Listener(9234) {

    resource function post orders(int userId, int productId, int quantity) {    
        // get user details
        json userDetails = getUserData(userId);
        // call cart service
        int cartId = getCartId(userId);
        // call payment service
        int paymentId = initiatePayment(1);
        // create order and return order id
        // return 1;
    }

    resource function post confirmedOrders(int orderId) {    
        // call shipping service
        int shipmentId = initiateShipment(orderId);
        // return shipmentId;
    }
}

function getUserData(int userId) returns json {
    http:Response|error val = userServiceClient->get("/userInfo?userId=123");
    if val is error {
        io:println("Error in getting user data");
    }
    return {};
}

function getCartId(int userId) returns int {
    http:Response|error val = cartServiceClient->get("/cartInfo?userId=123");
    if val is error {
        io:println("Error in getting cart id");
    }
    // extract and return cartId
    return 1;
}

function initiatePayment(int orderId) returns int {
    http:Response|error val = paymentServiceClient->post("/payment?orderId=1", {});
    if val is error {
        io:println("Error in initiating payment");
    }
    // extract and return paymentId
    return 1;
    
}

function initiateShipment(int orderId) returns int {
    http:Response|error val = shippingServiceClient->post("/shipment?orderId=" + orderId.toString(), {});
    if val is error {
        io:println("Error in initiating shipment");
    }
    // extract shipmentId and return
    return 1;
    
}
