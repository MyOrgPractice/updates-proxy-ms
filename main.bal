import ballerina/http;

const seperator = "/";
const API_Host = "https://gateway.api.cloud.wso2.com/t/updateslive";
const token = "e335604c-9bc3-304d-af60-56f4f861e84b";

service /updates on new http:Listener(9090) {
    resource function get getUpdateSummary() returns json|error? {
        http:Client updates = check new (API_Host);

        json results = check updates->get("/updates/1.0.0/recommended-update-levels", {
            "Authorization":  "Bearer " + token
        });

        return results;
    }

    resource function get getUpdatesDetails/[string product]/[string productVersion]/[string channel]/[string startUpdateLevel]/[string endUpdateLevel]() returns json|error? {
        http:Client updates = check new (API_Host);

        string base = "/updates/1.0.0";

        json results = check updates->get(searchUrl(base, product, productVersion, channel, startUpdateLevel, endUpdateLevel), {
            "Authorization": "Bearer " + token
        });

        return results;
    }

    resource function get getAvailableUpdates/[string product]/[string productVersion]/[string channel]/[string startUpdateLevel]/[string endUpdateLevel]() returns json|error? {
        http:Client updates = check new (API_Host);

        string base = "/updates/1.0.0";

        json results = check updates->get(searchUrl(base, product, productVersion, channel, startUpdateLevel, endUpdateLevel), {
            "Authorization": "Bearer " + token
        });

        return results;
    }

    resource function get getUpdateLevelMetadata() returns json|error? {
        http:Client updates = check new (API_Host);

        json results = check updates->get("/updates/1.0.0/product-update-levels", {
            "Authorization": "Bearer " + token
        });

        return results;
    }
}

function searchUrl(string base, string product, string productVersion, string channel, string startUpdateLevel, string endUpdateLevel) returns string {
    return base + seperator + product + seperator + productVersion + seperator + channel + seperator + startUpdateLevel + seperator + endUpdateLevel;
}