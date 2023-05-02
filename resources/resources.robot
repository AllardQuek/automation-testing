*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${URL}  https://admin-demo.nopcommerce.com/
${BROWSER}  chrome

*** Keywords ***
Open A Browser
    Open Browser    ${URL}  ${BROWSER}
    Maximize Browser Window

Close All Open Browsers
    Close All Browsers

Go To Login Page
    [Documentation]    In case test case fails, use this keyword instead of repeatedly opening browsers
    Go To   ${URL}

Input Username
    [Arguments]    ${username}
    Input Text    id:Email  ${username}

Input Password
    [Arguments]    ${password}
    Input Text    id:Password   ${password}

Click Login Button
    Click Element    xpath://button[normalize-space()='Log in']

Click Logout Button
    Click Link    Logout

Error Message Should Be Visible
    Page Should Contain    Login was unsuccessful

Dashboard Page Should Be Visible
    Page Should Contain    Dashboard
