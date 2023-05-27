import ballerinax/jaeger as _;
import ballerina/http;


@display {
    label: "userservice"
}
service /userservice on new http:Listener(9231) {

    resource function get userInfo(int userId) returns json {
        return {"id": 123, "name": "John Doe"};
    }

    resource function get users() returns json {    
        return [{"id": 123, "name": "John Doe"}, {"id": 456, "name": "Jane Doe"}];
    }
}
