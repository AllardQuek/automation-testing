*** Settings ***
Documentation    Simple example using SeleniumLibrary
Library    SeleniumLibrary

*** Variables ***
${URL}      https://image.google.com
${URL_2}    https://linkedin.com
${BROWSER}        Chrome

*** Test Cases ***
Keyword With Arguments Test
    [Documentation]     Test keyword with arguments
    GoToWebsite     ${URL}  ${BROWSER}
    GoToWebsite     ${URL_2}     ${BROWSER}

*** Keywords ***
GoToWebsite
    [Arguments]    ${url}   ${browser}
    Open Browser    ${url}  ${browser}
    Maximize Browser Window
    Sleep   2
    Close Browser
