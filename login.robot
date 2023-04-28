*** Settings ***
Documentation    Simple example using SeleniumLibrary
Library    SeleniumLibrary

*** Variables ***
${URL}          https://linkedin.com
${BROWSER}      Chrome
${EMAIL}        allard.quek@comp.nus.edu.sg
${PASSWORD}     PassInRealValueAtCommandLine

*** Test Cases ***
Open Test Website
    [Documentation]     As a user I can open the home page
    GoToLinkedIn
    LogIn

*** Keywords ***
GoToLinkedIn
    Open Browser    ${URL}  ${BROWSER}  options=add_experimental_option("detach", True)
    Maximize Browser Window
    Title Should Be    LinkedIn: Log In or Sign Up
    ${input_txt}    set variable    xpath://*[@id="session_key"]
    Element Should Be Enabled   ${input_txt}
    Element Should Be Visible   ${input_txt}
    Sleep   1

LogIn
    Input Text  xpath://*[@id="session_key"]     ${EMAIL}
    Input Text  xpath://*[@id="session_password"]     ${PASSWORD}
    Sleep   2
    Click Button    xpath://*[@id="main-content"]/section[1]/div/div/form[1]/div[2]/button
