
*** Settings ***
Documentation    To validate login form2
Library       SeleniumLibrary
Library    Collections
Test Setup    Open the Browser login app
#Test Teardown    No Operation

Resource    resource.robot

*** Variables ***
${url}    https://rahulshettyacademy.com/loginpagePractise/
${error_message}    css:.alert.alert-danger
${success_message}    css:.nav-link
${popup}    css:.modal-body


*** Test Cases ***
Validate UnSuccessful Login
    Fill the login form    ${username}    ${invalid_password}
    Wait Until Element is located    ${error_message}
    Verify error message is correct

Validate Successful Login
    Fill the login form    ${username}    ${valid_password}
    Wait Until Element is located    ${success_message}
    Verify the next page
    Verify Card Details in the Shop Page
    Select the Phone    iphone X

Select the form and navigate to Child window
    Fill the login details and form    ${username}    ${valid_password}
    Verify the next page


*** Keywords ***
Fill the login form
    [Arguments]    ${username}    ${password}
    Input Text    username    ${username}
    Input Password    password    ${password}
    Click Button    css:.btn.btn-info.btn-md


Verify error message is correct
    ${result}=    Get Text    ${error_message}
    ${text}=    Set Variable    Incorrect username/password.
    Should Contain    ${result}   ${text}


Verify the next page
    Wait Until Element Is Visible    ${success_message}
    ${result}=    Get Text    ${success_message}
    ${text}=    Set Variable    Home
    Should Contain    ${result}    ${text}


Wait Until Element is located
    [Arguments]    ${element}
    Wait Until Element Is Visible      ${element}    timeout=10

Verify Card Details in the Shop Page
   ${expected_list} =     Create List    iphone X    Samsung Note 8    Nokia Edge    Blackberry
   ${elements} =     Get Webelements    css:.card-title
   ${actual_list} =    Create List

    FOR    ${element}    IN    @{elements}
        Log    ${element.text}
        ${text} =         Get Text    ${element}
        Append To List    ${actual_list}    ${text}

    END
    Log    ${actual_list}
    Lists Should Be Equal    ${actual_list}    ${expected_list}


Select the Phone
    [Arguments]    ${phonename}
    ${elements} =     Get Webelements    css:.card-title
    ${index} =   Set Variable    1

    FOR    ${element}    IN    @{elements}
        Exit For Loop If    '${phonename}' == '${element.text}'
        ${index} =    Evaluate    ${index} + 1

    END
    Click Button    xpath:(//*[@class='card-footer'])[${index}]/button


Fill the login details and form
        [Arguments]    ${username}    ${password}
        Input Text    username    ${username}
        Input Password    password    ${password}
#Radio Button
        Click Element    css:input[value='user']
        Wait Until Element is located    ${popup}
        Click Element    okayBtn
        Wait Until Element Is Not Visible    ${popup}
# Dropdown Box
        Select From List By Value    css:select.form-control    teach
        Select Checkbox     css:input[id$='terms']
        Checkbox Should Be Selected    css:input[id$='terms']
        Sleep    5s
        Click Button    signInBtn
        Sleep    5s

