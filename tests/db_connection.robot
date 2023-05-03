*** Settings ***
Documentation    Simple example using SeleniumLibrary
Library     SeleniumLibrary
Library     DatabaseLibrary
Library     OperatingSystem
Suite Setup     Connect To Database    psycopg2     ${DBName}   ${DBUser}   ${DBPassword}   ${DBHost}   ${DBPort}
Suite Teardown  Disconnect From Database

*** Variables ***
${DBName}   postgres
${DBUser}   postgres
${DBPassword}
${DBHost}   127.0.0.1
${DBPort}   5432
${URL}      https://image.google.com
${BROWSER}        Chrome

*** Test Cases ***
Database Connection Test
    [Documentation]     Test connection to a database
    ${output} =     Execute Sql String  CREATE TABLE Person(id integer, first_name varchar(20), last_name varchar(20))
    Log To Console    ${output}
    Should Be Equal As Strings    ${output}     None
