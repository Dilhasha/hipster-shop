import ballerina/test;
import ballerina/http;
import ballerinax/jaeger as _;

http:Client cartServiceClient = check new ("http://localhost:9233/cartservice");

@test:Config {}
function cartInfoTest() returns error? {
    http:Response val = check cartServiceClient->get("/cartInfo?userId=1");
    test:assertEquals(val.statusCode, 200, "Status code should be 200");
}

@test:Config {}
function cartUpdateTest() returns error? {
    http:Response val = check cartServiceClient->post("/updateCart?userId=1&productId=1&quantity=2", {});
    test:assertEquals(val.statusCode, 202, "Status code should be 200");
}


@test:Config {
    dataProvider:  cartDataProvider
}
function cartTests(int userId) returns error? {
    http:Response val = check cartServiceClient->get("/cartInfo?userId=1");
    test:assertEquals(val.statusCode, 200, "Status code should be 200");
    val = check cartServiceClient->post("/updateCart?userId=1&productId=1&quantity=2", {});
    test:assertEquals(val.statusCode, 202, "Status code should be 200");
}

function cartDataProvider() returns int[][] {
    return [
        [1],
        [2],
        [3],
        [4],
        [5]
    ];
}