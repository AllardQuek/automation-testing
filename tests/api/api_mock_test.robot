*** Settings ***
Documentation    Example from: https://github.com/etsi-cti-admin/robotframework-mockserver/blob/master/tests/robot/tests/mock_server.robot
Library  String
Library  Collections
Library  RequestsLibrary
Library  MockServerLibrary
Library  JSONLibrary

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
    Send GET Expect Success  server  ${ENDPOINT}

*** Keywords ***
Create Sessions
    Create Session  server  ${MOCK_URL}  disable_warnings=1  verify=False
    Create Mock Session     ${MOCK_URL}

Reset Mock Server
    Dump To Log
    Reset All Requests

Send GET Expect Success
    [Arguments]  ${session}  ${endpoint}=${ENDPOINT}  ${response_headers}=${None}  ${response_body}=${None}
    ${rsp}=  Get Request  ${session}  ${endpoint}   verify=False
    Should Be Equal As Strings  ${rsp.status_code}  200
