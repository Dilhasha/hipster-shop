import ballerinax/jaeger as _;
import ballerina/http;
import ballerina/io;

@display {
    label: "paymentservice"
}
service /paymentservice on new http:Listener(9235) {

    resource function post payment(int orderId) {
        // print status
        io:println("Order placed successfully with order id: " + orderId.toString());
    }

    
}
