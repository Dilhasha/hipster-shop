import ballerinax/jaeger as _;
import ballerina/http;


@display {
    label: "shippingservice"
}
service /shippingservice on new http:Listener(9237) {

    resource function post shipment(int orderId) returns int {
        // Return shipment id
        return 1;
    }

    
}
