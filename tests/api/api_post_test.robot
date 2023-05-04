*** Settings ***
Documentation    POST Request Example using RequestsLibrary
Library     RequestsLibrary
Library     JSONLibrary
Library     Collections

*** Variables ***
${BASE_URL}     https://thetestingworldapi.com

*** Test Cases ***
POST Request Test
    Create Session    POST_test   ${BASE_URL}
    ${body} =    Create Dictionary    first_name=John     middle_name=Jane    last_name=Doe   date_of_birth=5/4/2023
    ${header} =  Create Dictionary    Content-Type=application/json

    ${response} =       POST On Session    POST_test    url=/api/studentsDetails/  json=${body}    headers=${header}
    ${status_code} =    Set Variable    ${response.status_code}
    Log To Console                      ${response.content}
    Should Be Equal As Strings          ${status_code}    201
