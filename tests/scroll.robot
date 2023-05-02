*** Settings ***
Documentation    Simple example using SeleniumLibrary
Library    SeleniumLibrary

*** Variables ***
${URL}      https://image.google.com
${BROWSER}        Chrome

*** Test Cases ***
Scroll Test
    [Documentation]     Test scrolling page
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
    Scroll Element Into View    xpath://*[@id="islrg"]/div[1]/div[38]/a[1]/div[1]/img
    Click Element   xpath://*[@id="islrg"]/div[1]/div[38]/a[1]/div[1]/img
    Sleep   3
    Close Browser
