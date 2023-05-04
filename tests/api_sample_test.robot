*** Settings ***
Documentation    Simple example using SeleniumLibrary
Library    SeleniumLibrary
Library     RequestsLibrary
Library     JSONLibrary
Library     Collections
Library     MockServerLibrary

*** Variables ***
${BASE_URL}     https://thetestingworldapi.com

*** Test Cases ***
GET Request Test
    Create Session    API_Testing   ${BASE_URL}
    ${response} =       GET On Session   API_Testing    url=/api/studentsDetails/7470352
    ${json_response} =  Set Variable    ${response.json()}
    @{first_name_data} =    Get Value From Json    ${json_response}     data.first_name
    ${f_name} =     Get From List    ${first_name_data}     0

    # Log To Console    ${response.content}
    # Log To Console    ${json_response}
    Log To Console    ${response.status_code}
    Log To Console    ${first_name_data}    # Value is a list
    Should Be Equal    ${f_name}    Luis
