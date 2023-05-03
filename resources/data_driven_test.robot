*** Settings ***
Library     SeleniumLibrary
Resource    resources.robot
Suite Setup     Open A Browser
Suite Teardown    Close All Open Browsers
Test Template    Invalid Login


*** Test Cases ***              username                password
Right Username Wrong Password   admin@yourstore.com     wrong_password
Wrong Username Right Password   wrong_username          admin
Right Username Empty Password   admin@yourstore.com     ${EMPTY}
Empty Username Right Password   ${EMPTY}                admin
Wrong Username Wrong Password   wrong_username          wrong_password


*** Keywords ***
Invalid Login
    [Arguments]    ${username}  ${password}
    Input Username    ${username}
    Input Password    ${password}
    Click Login Button
    Error Message Should Be Visible

