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
Create Person Table
    [Documentation]     Test table creation
    ${output} =     Execute Sql String  CREATE TABLE IF NOT EXISTS Person(id integer, first_name varchar(20), last_name varchar(20));
    Log To Console    ${output}
    Should Be Equal As Strings    ${output}     None

Insert Multiple Rows Into Person Table
    # Single row: ${output} =     Execute Sql String  INSERT INTO Person VALUES(1, 'John', 'Doe');
    ${output} =     Execute Sql Script  ./data/users.sql
    Log To Console    ${output}
    Should Be Equal As Strings    ${output}     None

User Exists In Table - David
    Check If Exists In Database     SELECT id FROM Person WHERE first_name='David';

Use Does Not Exist In Table - UnknownUser
    Check If Not Exists In Database    SELECT id FROM Person WHERE first_name='UnknownUser';

Person Table Exists
    # Note postgresql stores table names as lower case by default
    Table Must Exist    person

No Rows For User Who Does Not Exist
    Row Count Is 0    SELECT * FROM Person WHERE first_name='UknownUser';

1 Row For Existing User
    Row Count Is Equal To X    SELECT * FROM Person WHERE first_name='David';   1

Display Rows in Person Table
    @{queryResults} =       Query       SELECT * FROM Person;
    Log Many    @{queryResults}
