*** Settings ***
Documentation    Simple example using SeleniumLibrary
Library    SeleniumLibrary

*** Variables ***
${URL}      https://image.google.com
${BROWSER}        Chrome

*** Test Cases ***
Execute Query
    [Documentation]     Test mouse actions with selenium speed set
    GoToGoogle
    QueryTerms

*** Keywords ***
GoToGoogle
    Open Browser    ${URL}  ${BROWSER}
    Maximize Browser Window
    Wait Until Page Contains    Google

QueryTerms
    ${speed}    Get Selenium Speed
    Log To Console    ${speed}
    Set Selenium Speed      1

    Input Text  xpath://*[@id="APjFqb"]     cats
    Click Button    xpath:/html/body/div[1]/div[3]/form/div[1]/div[1]/div[1]/button
    Wait Until Page Contains    cats
    Open Context Menu    xpath://*[@id="islrg"]/div[1]/div[1]/a[1]/div[1]/img
    Click Element    xpath://*[@id="islrg"]/div[1]/div[1]/a[1]/div[1]/img
    Double Click Element    xpath://*[@id="Sva75c"]/div[2]/div/div[2]/div[2]/div[2]/c-wiz/div/div/div/div[3]/div[1]/a/img[1]
    Wait Until Page Contains    cats

    ${speed}    Get Selenium Speed
    Log To Console    ${speed}
    Close Browser
