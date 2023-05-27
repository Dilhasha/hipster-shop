import ballerina/io;
// import ballerina/observe;
// import ballerina/log;
import ballerinax/jaeger as _;
// import ballerina/http;

// Prints `Hello World`.

public function main() returns error? {
    io:println("Hello, World!");
}

// @display {
//     label: "testdetails"
// }
// service /test on new http:Listener(9237) {

//     map<int> spanIds = {};
//     // Resource functions are invoked with the HTTP caller and the
//     // incoming request as arguments.
//     resource function post startTest(string testName) returns error? {
//         log:printInfo("testName: " + testName);
//         int spanId = check observe:startSpan(testName);
//         error? tagToSpan = observe:addTagToSpan("testName", testName, spanId);
//         if tagToSpan is error {
//             log:printError("error occurred while adding tag to span: " + tagToSpan.message());
//         }
//         self.spanIds[testName] = spanId;

//     }

//     resource function post endTest(string testName) returns error? {
//         int? spanId = self.spanIds[testName];
//         if spanId is () {
//             log:printError("span not found for : " + testName);
//         } else {
//             error? finishSpan = observe:finishSpan(spanId);
//             if finishSpan is error {
//                 log:printError("error occurred while finishing the span: " + finishSpan.message());

//             }
//         }
//     }
// }
