*** Settings ***
Library  String
Library  Collections
Library  RequestsLibrary
Library  MockServerLibrary
Library    JSONLibrary
Suite Setup  Create Sessions
Test Teardown  Reset Mock Server


*** Variables ***
${MOCK_URL}  https://jsonplaceholder.typicode.com
${ENDPOINT}  /todos/1

*** Test Cases ***
Success On Expected GET
    &{req}=  Create Mock Request Matcher  GET  ${ENDPOINT}
    &{rsp}=  Create Mock Response  status_code=200
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
    ${rsp}=  Get Request  server  ${endpoint}
    Should Be Equal As Strings  ${rsp.status_code}  200
    Run Keyword If   ${response_headers != None}  Verify Response Headers  ${response_headers}  ${rsp.headers}
    Run Keyword If   ${response_body != None}  Verify Response Body  ${response_body}  ${rsp.json()}

Verify Response Headers
    [Arguments]  ${expected}  ${actual}
    Dictionary Should Contain Sub Dictionary  ${actual}  ${expected}

Verify Response Body
    [Arguments]  ${expected}  ${actual}
    Dictionaries Should Be Equal  ${expected}  ${actual}
