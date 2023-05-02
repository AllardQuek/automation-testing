*** Settings ***
Documentation    Simple example using SeleniumLibrary
Library    SeleniumLibrary

*** Variables ***
${URL}      https://image.google.com
${BROWSER}        Chrome

*** Test Cases ***
Open Test Website
    [Documentation]     Take screenshots of search results
    GoToGoogle
    QueryTerms

*** Keywords ***
GoToGoogle
    Open Browser    ${URL}  ${BROWSER}
    Maximize Browser Window
    Wait Until Page Contains    Google

QueryTerms
    Input Text  xpath://*[@id="APjFqb"]     cats
    Sleep   1
    Click Button    xpath:/html/body/div[1]/div[3]/form/div[1]/div[1]/div[1]/button
    Wait Until Page Contains    cats
    Capture Page Screenshot       images/cats.png
    Capture Element Screenshot    xpath://*[@id="islrg"]/div[1]/div[1]/a[1]/div[1]/img  images/cat.png
    Sleep   2
    Close Browser
