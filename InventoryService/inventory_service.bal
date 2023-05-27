import ballerinax/jaeger as _;
import ballerina/http;
import ballerina/io;


@display {
    label: "inventoryservice"
}
service /inventoryservice on new http:Listener(9236) {

    resource function get isAvailable(int productId, int quantity) returns boolean {
        return true;
    }

    resource function post updateSale(int productId, int quantity) {    
        io:println("Inventory updated for product id: " + productId.toString() + " quantity: " + quantity.toString());
    }
}
