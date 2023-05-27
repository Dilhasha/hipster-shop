import ballerina/test;
import ballerina/http;
import ballerina/lang.runtime;
import ballerinax/jaeger as _;

http:Client orderServiceClient = check new ("http://localhost:9234/orderservice");

@test:Config {}
function placeOrderTest() returns error? {
    http:Response val = check orderServiceClient->post("/orders?userId=1&productId=2&quantity=3", {});
    test:assertEquals(val.statusCode, 202, "Status code should be 202");
}

@test:Config {}
function confirmOrderTest() returns error? {
    http:Response val = check orderServiceClient->post("/confirmedOrders?orderId=1", {});
    test:assertEquals(val.statusCode, 202, "Status code should be 202");
}

@test:Config {
    dataProvider:  ordersDataProvider
}
function orderTests(int userId) returns error? {
    runtime:sleep(1);
    http:Response val = check orderServiceClient->post("/confirmedOrders?orderId=1", {});
    test:assertEquals(val.statusCode, 202, "Status code should be 202");
}

function ordersDataProvider() returns int[][] {
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