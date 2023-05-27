import ballerina/test;
import ballerina/http;
import ballerinax/jaeger as _;
import ballerina/lang.runtime;

http:Client shippingServiceClient = check new ("http://localhost:9237/shippingservice");

@test:Config {}
function placeShipmentTest() returns error? {
    http:Response val = check shippingServiceClient->post("/shipment?orderId=1", {});
    test:assertEquals(val.statusCode, 201, "Status code should be 200");
}

@test:Config {
    dataProvider:  shippingsDataProvider
}
function shipppingsTests(int userId) returns error? {
    runtime:sleep(1);
    http:Response val = check shippingServiceClient->post("/shipment?orderId=1", {});
    test:assertEquals(val.statusCode, 201, "Status code should be 200");
}

function shippingsDataProvider() returns int[][] {
    return [
        [1],
        [2],
        [3],
        [4],
        [5],
        [1],
        [2],
        [3],
        [4],
        [5],
        [3],
        [4],
        [5],
        [1],
        [2],
        [3],
        [4],
        [5],
        [1],
        [2],
        [3],
        [4],
        [5],
        [9]
    ];
}