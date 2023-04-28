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
    Input Text  xpath://*[@id="APjFqb"]     Amazon
    Click Button    xpath:/html/body/div[1]/div[3]/form/div[1]/div[1]/div[4]/center/input[1]
    Clear Element Text  xpath://*[@id="APjFqb"]
    Input Text  xpath://*[@id="APjFqb"]     Facebook
    Sleep   2
    Click Button    xpath://*[@id="tsf"]/div[1]/div[1]/div[2]/button
    Sleep   3
    Close Browser
