import ballerina/test;
import ballerina/http;
import ballerinax/jaeger as _;

http:Client inventoryServiceClient = check new ("http://localhost:9236/inventoryservice");

@test:Config {}
function checkAvailabilityTest() returns error? {
    http:Response val = check inventoryServiceClient->get("/isAvailable?productId=1&quantity=2");
    test:assertEquals(val.statusCode, 200, "Status code should be 200");
}

@test:Config {}
function updateSaleTest() returns error? {
    http:Response val = check inventoryServiceClient->post("/updateSale?productId=1&quantity=2", {});
    test:assertEquals(val.statusCode, 202, "Status code should be 202");
}

@test:Config {
    dataProvider:  salesDataProvider
}
function salesTests(int userId) returns error? {
    http:Response val = check inventoryServiceClient->post("/updateSale?productId=1&quantity=2", {});
    test:assertEquals(val.statusCode, 202, "Status code should be 202");
    val = check inventoryServiceClient->get("/isAvailable?productId=1&quantity=2");
    test:assertEquals(val.statusCode, 200, "Status code should be 200");
}

function salesDataProvider() returns int[][] {
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
        [5]
    ];
}