*** Settings ***
Documentation    GET Request Example using RequestsLibrary
Library     RequestsLibrary
Library     JSONLibrary
Library     Collections

*** Variables ***
# Mock Server URL created using Postman
${BASE_URL}     https://a41a232f-46b1-460b-838b-a2dd3cfa0755.mock.pstmn.io

*** Test Cases ***
Mock GET Request Test
    Create Session    API_Testing   ${BASE_URL}
    ${response} =       GET On Session   API_Testing    url=/get
    Should Be Equal As Strings    ${response.status_code}    200

    ${json_response} =  Set Variable    ${response.json()}
    Log To Console    ${json_response}
