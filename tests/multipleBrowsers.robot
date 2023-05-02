*** Settings ***
Documentation    Simple example using SeleniumLibrary
Library    SeleniumLibrary

*** Variables ***
${URL_1}          https://google.com
${URL_2}          https://linkedin.com
${BROWSER}      Chrome

*** Test Cases ***
Open Test Website
    [Documentation]     Open multiple browsers and close all at once
    GoToMultipleWebsites
    Close All Browsers

*** Keywords ***
GoToMultipleWebsites
    Open Browser    ${URL_1}    ${BROWSER}
    Sleep   2
    Open Browser    ${URL_2}    ${BROWSER}
    Sleep   2
