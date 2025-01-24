*** Settings ***
Documentation    All the page objects and keywords of landing page
Library    SeleniumLibrary
Resource    ../PageObject/Generic.robot

*** Variables ***
${button_loc}    css:.btn.btn-info.btn-md


*** Keywords ***
Fill the login form
    [Arguments]    ${username}    ${password}
    Input Text    username    ${username}
    Input Password    password    ${password}
    Click Button    ${button_loc}

Verify error message is correct
    ${result}=    Get Text    ${error_message}
    ${text}=    Set Variable    Incorrect username/password.
    Should Contain    ${result}   ${text}

