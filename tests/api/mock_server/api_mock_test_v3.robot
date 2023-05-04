*** Settings ***
Library  String
Library  Collections
Library  RequestsLibrary
Library  MockServerLibrary
Library    JSONLibrary
Suite Setup  Create Sessions
Test Teardown  Reset Mock Server


*** Variables ***
${MOCK_URL}     https://jsonplaceholder.typicode.com
${ENDPOINT}     /todos/1

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
    Log  Sending GET request to endpoint: ${ENDPOINT}
    ${rsp}=  Get Request  server  ${ENDPOINT}
    Should Be Equal As Strings  ${rsp.status_code}  200
