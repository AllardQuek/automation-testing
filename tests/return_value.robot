*** Settings ***
Documentation    Simple example using SeleniumLibrary
Library    SeleniumLibrary

*** Variables ***
${URL}      https://image.google.com
${BROWSER}        Chrome

*** Test Cases ***
Log Page Title Test
    [Documentation]     Print page title to log output
    ${pageTitle}    GoToWebsite     ${URL}  ${BROWSER}
    Log To Console    ${pageTitle}

*** Keywords ***
GoToWebsite
    [Arguments]    ${url}   ${browser}
    Open Browser    ${url}  ${browser}
    Maximize Browser Window
    ${title}    Get Title
    [Return]    ${title}
