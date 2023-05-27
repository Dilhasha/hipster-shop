import ballerina/http;

http:Client testTracingServiceClient = check new ("http://localhost:9229/testtracingservice");

function startTest(string testname) returns error? {
    http:Response val = check testTracingServiceClient->post("/startedtests?testname=" + testname, {});
}

function endTest(string testname) returns error? {
    http:Response val = check testTracingServiceClient->post("/endedtests?testname=" + testname, {});
}