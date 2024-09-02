const axios = require("axios").default;
const qs = require("qs");

async function _muxGetViewsCall(context, ffVariables) {
  var time = ffVariables["time"];
  var assetId = ffVariables["assetId"];

  var url = `https://api.mux.com/data/v1/metrics/views/breakdown?group_by=asset_id&filters=asset_id:${assetId}`;
  var headers = {
    "Content-Type": `application/json`,
    Authorization: `Basic YWViN2Q5MGMtMTcyNi00ZWQzLThjMTItMDQ3MDdhOTU5MzNlOm91TDIxTlJqUnVYU3JqUzZPNzF5SWZYYXh4U2NxNDdaQ25icVBDUVlNVFVxOGNWQVVDUUxJTzV1d1VIRFhsZDhFbUNKelRkam8yaA==`,
    "Access-Control-Allow-Origin": `*`,
  };
  var params = {};
  var ffApiRequestBody = undefined;

  return makeApiRequest({
    method: "get",
    url,
    headers,
    params,
    returnBody: true,
    isStreamingApi: false,
  });
}

/// Helper functions to route to the appropriate API Call.

async function makeApiCall(context, data) {
  var callName = data["callName"] || "";
  var variables = data["variables"] || {};

  const callMap = {
    MuxGetViewsCall: _muxGetViewsCall,
  };

  if (!(callName in callMap)) {
    return {
      statusCode: 400,
      error: `API Call "${callName}" not defined as private API.`,
    };
  }

  var apiCall = callMap[callName];
  var response = await apiCall(context, variables);
  return response;
}

async function makeApiRequest({
  method,
  url,
  headers,
  params,
  body,
  returnBody,
  isStreamingApi,
}) {
  return axios
    .request({
      method: method,
      url: url,
      headers: headers,
      params: params,
      responseType: isStreamingApi ? "stream" : "json",
      ...(body && { data: body }),
    })
    .then((response) => {
      return {
        statusCode: response.status,
        headers: response.headers,
        ...(returnBody && { body: response.data }),
        isStreamingApi: isStreamingApi,
      };
    })
    .catch(function (error) {
      return {
        statusCode: error.response.status,
        headers: error.response.headers,
        ...(returnBody && { body: error.response.data }),
        error: error.message,
      };
    });
}

const _unauthenticatedResponse = {
  statusCode: 401,
  headers: {},
  error: "API call requires authentication",
};

function createBody({ headers, params, body, bodyType }) {
  switch (bodyType) {
    case "JSON":
      headers["Content-Type"] = "application/json";
      return body;
    case "TEXT":
      headers["Content-Type"] = "text/plain";
      return body;
    case "X_WWW_FORM_URL_ENCODED":
      headers["Content-Type"] = "application/x-www-form-urlencoded";
      return qs.stringify(params);
  }
}

module.exports = { makeApiCall };
