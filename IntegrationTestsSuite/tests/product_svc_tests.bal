import ballerina/test;
import ballerina/http;
import ballerinax/jaeger as _;
import ballerina/lang.runtime;

http:Client productServiceClient = check new ("http://localhost:9232/productservice");


@test:Config {}
function productSvcTest() returns error? {
    http:Response val = check productServiceClient->get("/productCatalog");
    test:assertEquals(val.statusCode, 200, "Status code should be 200");
}

@test:Config {}
function getProductDetailsTest() returns error? {
    http:Response val = check productServiceClient->get("/productInfo?productId=1");
    test:assertEquals(val.statusCode, 200, "Status code should be 200");
}

@test:Config {
    dataProvider:  productsDataProvider
}
function productsTests(int userId) returns error? {
    runtime:sleep(2);
    http:Response val = check productServiceClient->get("/productInfo?productId=1");
    test:assertEquals(val.statusCode, 200, "Status code should be 200");
}

function productsDataProvider() returns int[][] {
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
        [5]
    ];
}