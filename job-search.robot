*** Settings ***
Documentation    Simple example using SeleniumLibrary
Library    SeleniumLibrary

*** Variables ***
${URL}      https://google.com
${BROWSER}        Chrome

*** Test Cases ***
Open Test Website
    [Documentation]     As a user I can open the home page
    GoToGoogle

*** Keywords ***
GoToGoogle
    Open Browser    ${URL}  ${BROWSER}  options=add_experimental_option("detach", True)
    Maximize Browser Window
    Wait Until Page Contains    Google
    Sleep   5
    Close Browser
