*** Settings ***
Documentation    GET Request Example using RequestsLibrary
Library     RequestsLibrary
Library     JSONLibrary
Library     Collections

*** Variables ***
${BASE_URL}     https://thetestingworldapi.com

*** Test Cases ***
GET Request Test
    Create Session    API_Testing   ${BASE_URL}
    ${response} =       GET On Session   API_Testing    url=/api/studentsDetails/
    Log To Console    ${response.status_code}
    # Log To Console    ${response.content}

    ${json_response} =  Set Variable    ${response.json()}
    # Log To Console    ${json_response}

    ${first_user_data} =    Set Variable    ${json_response[0]}
    Log To Console    ${first_user_data}

    ${first_name} =      Set Variable    ${first_user_data['first_name']}

    # API results keep changing, so we will just log the result
    # instead of verifying if it is a particular value
    Log To Console    ${first_name}
