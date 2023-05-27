import ballerina/io;
import ballerina/http;
import ballerinax/jaeger as _;

@display {
    label: "testtracingservice"
}
service /testtracingservice on new http:Listener(9229) { // can make this port configurable

    resource function post startedtests(string testname) {    
        io:println("started the test: " + testname);
        // get card and get product id
    }

    resource function post endedtests(string testname) {    
        io:println("started the test: " + testname);
        // get card and get product id
    }
}