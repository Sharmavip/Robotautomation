
*** Settings ***
Documentation    To validate login form2
Library       SeleniumLibrary
Library    Collections
Test Setup    Open the Browser login app
#Test Teardown    No Operation

Resource    resource.robot
Test Template    Validate UnSuccessful Login
#Test Template    Validate Successful Login


*** Variables ***
${url}    https://rahulshettyacademy.com/loginpagePractise/
${error_message}    css:.alert.alert-danger



*** Test Cases ***    username    password
Invalid username    dashed    learning
Invalid password    rahulshetty    abcdf
Special Characters    @#$@    learning
    


*** Keywords ***
Validate UnSuccessful Login
    [Arguments]        ${username}    ${password}
    Sleep    2s

    Fill the login form    ${username}    ${password}
    Wait Until Element is located    ${error_message}
    Verify error message is correct


Fill the login form
    [Arguments]    ${username}    ${password}
    Input Text    username    ${username}
    Input Password    password    ${password}
    Click Button    css:.btn.btn-info.btn-md


Verify error message is correct
    ${result}=    Get Text    ${error_message}
    ${text}=    Set Variable    Incorrect username/password.
    Should Contain    ${result}   ${text}



Wait Until Element is located
    [Arguments]    ${element}
    Wait Until Element Is Visible      ${element}    timeout=10


