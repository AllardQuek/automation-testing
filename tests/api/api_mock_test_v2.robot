*** Settings ***
Library  String
Library  Collections
Library  RequestsLibrary
Library  MockServerLibrary
Library    JSONLibrary
Suite Setup  Create Sessions
Test Teardown  Reset Mock Server


*** Variables ***
${MOCK_URL}  https://a41a232f-46b1-460b-838b-a2dd3cfa0755.mock.pstmn.io
${ENDPOINT}  /get

*** Test Cases ***
Success On Expected GET
    &{req}=  Create Mock Request Matcher  GET  ${ENDPOINT}
    &{rsp}=  Create Mock Response  status_code=200
    Log To Console    Request is ${req}
    Log To Console    Response is ${rsp}

    Create Mock Expectation  ${req}  ${rsp}
    Send GET Expect Success  ${ENDPOINT}

*** Keywords ***
Create Sessions
    Create Session  server  ${MOCK_URL}
    Create Mock Session  ${MOCK_URL}

Reset Mock Server
    Dump To Log
    Reset All Requests

Send GET Expect Success
    [Arguments]  ${endpoint}=${ENDPOINT}  ${response_headers}=${None}  ${response_body}=${None}
    Log  Sending GET request to endpoint: ${endpoint}
    ${rsp}=  Get Request  server  ${endpoint}
    Log  Response status code: ${rsp.status_code}
    Log  Response headers: ${rsp.headers}
    Log  Response body: ${rsp.json()}
    Should Be Equal As Strings  ${rsp.status_code}  200
