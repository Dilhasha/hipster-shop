import ballerina/test;
import ballerina/http;
import ballerinax/jaeger as _;

http:Client userServiceClient = check new ("http://localhost:9231/userservice");


@test:Config {}
function userSvcTest() returns error? {
    http:Response val = check userServiceClient->get("/users");
    test:assertEquals(val.statusCode, 200, "Status code should be 200");

}

@test:Config {}
function getUserDetailsTest() returns error? {
    http:Response val = check userServiceClient->get("/userInfo?userId=123");
    test:assertEquals(val.statusCode, 200, "Status code should be 200");
}

@test:Config {
    dataProvider:  usersDataProvider
}
function usersTests(int userId) returns error? {
    http:Response val = check userServiceClient->get("/userInfo?userId=123");
    test:assertEquals(val.statusCode, 200, "Status code should be 200");
}

function usersDataProvider() returns int[][] {
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