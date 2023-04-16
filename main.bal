// tested with the access_token generated from the updates-portal
import ballerina/io;
import ballerina/http;

const seperator = "/";
const API_Host = "https://gateway.api.cloud.wso2.com/t/updateslive";
const token = "f7f563cf-6d29-3b65-bd51-dd4d686f4cf0";

service /portal on new http:Listener(9090) {
    resource function get getUpdateSummary() returns error? {
        http:Client updates = check new (API_Host);

        json search = check updates->get("/updates/1.0.0/recommended-update-levels", {
            "Authorization":  "Bearer " + token
        });

        io:println(search);
    }

    resource function get getUpdatesDetails(string product, string productVersion, string channel, string startUpdateLevel, string endUpdateLevel) returns error? {
        http:Client updates = check new (API_Host);

        string base = "/updates/1.0.0";

        json search = check updates->get(searchUrl(base, product, productVersion, channel, startUpdateLevel, endUpdateLevel), {
            "Authorization": "Bearer " + token
        });

        io:println(search);
    }

    resource function get getAvailableUpdates(string product, string productVersion, string channel, string startUpdateLevel, string endUpdateLevel) returns error? {
        http:Client updates = check new (API_Host);

        string base = "/updates/1.0.0";

        json search = check updates->get(searchUrl(base, product, productVersion, channel, startUpdateLevel, endUpdateLevel), {
            "Authorization": "Bearer " + token
        });

        io:println(search);
    }

    resource function get downloadPDF(string product, string productVersion, string channel, string startUpdateLevel, string endUpdateLevel) returns error? {
        http:Client updates = check new (API_Host);

        string base = "/pdfmanager/1.0.0/pdf";

        json search = check updates->get(searchUrl(base, product, productVersion, channel, startUpdateLevel, endUpdateLevel), {
            "Authorization": "Bearer " + token
        });

        io:println(search);
    }

    resource function get getUpdateLevelMetadata() returns error? {
        http:Client updates = check new (API_Host);

        json search = check updates->get("/updates/1.0.0/product-update-levels", {
            "Authorization": "Bearer " + token
        });

        io:println(search);
    }
}

function searchUrl(string base, string product, string productVersion, string channel, string startUpdateLevel, string endUpdateLevel) returns string {
    return base + seperator + product + seperator + productVersion + seperator + channel + seperator + startUpdateLevel + seperator + endUpdateLevel;
}