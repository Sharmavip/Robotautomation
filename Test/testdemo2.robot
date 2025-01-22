
*** Settings ***
Documentation    To validate login form
Library    SeleniumLibrary
Test Setup    Open the Browser login app
Test Teardown    Close Browser
Resource    resource.robot
#Documentation    To validate login form
Library    SeleniumLibrary
#Test Setup    Open the Browser login app
#Test Teardown    Close Browser Session
Resource    resource.robot

*** Variables ***
${url}    https://the-internet.herokuapp.com/login
${error_message}    css:.flash.flash.error
${success_message}    css:.flash.flash.success


*** Test Cases ***
Validate UnSuccessful Login
    Fill the login form
    Wait until it display error
    Verify error message is correct

Validate Successful Login
    Fill The Login Form with valid credentials
    Verify the next page




*** Keywords ***


Fill the login form
    Input Text    username    ${username}
    Input Password    password    ${invalid_password}
    Click Button    css:.radius

Wait until it display error
    Wait Until Element Is Visible    ${error_message}


Verify error message is correct
    ${result}=    Get Text    ${error_message}
    ${text}=    Set Variable    Your password is invalid!
    Should Contain    ${result}   ${text}

Fill The Login Form with valid credentials
    Input Text    username    ${username}
    Input Password    password   ${valid_password}
    Click Button    css:.radius

Verify the next page
    Wait Until Element Is Visible    ${success_message}
    ${result}=    Get Text    ${success_message}
    ${text}=    Set Variable    You logged into a secure area!
    Should Contain    ${result}    ${text}
#    Element Text Should Be    ${success_message}    You logged into a secure area!
