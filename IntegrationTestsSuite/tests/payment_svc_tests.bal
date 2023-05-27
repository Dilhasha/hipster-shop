import ballerina/test;
import ballerina/http;
import ballerinax/jaeger as _;

http:Client paymentServiceClient = check new ("http://localhost:9235/paymentservice");

@test:Config {}
function processPaymentTest() returns error? {
    http:Response val = check paymentServiceClient->post("/payment?orderId=1", {});
    test:assertEquals(val.statusCode, 202, "Status code should be 202");
}

@test:Config {
    dataProvider:  paymentsDataProvider
}
function paymentsTests(int userId) returns error? {
    http:Response val = check paymentServiceClient->post("/payment?orderId=1", {});
    test:assertEquals(val.statusCode, 202, "Status code should be 202");
}

function paymentsDataProvider() returns int[][] {
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
        [1],
        [2],
        [3],
        [4],
        [5]
    ];
}