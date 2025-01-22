
*** Settings ***
Documentation    To validate login form2
Library       SeleniumLibrary
Library    Collections
Library    String

Test Setup    Open the Browser login app
#Test Teardown    No Operation
Resource    resource.robot

*** Variables ***
${url}    https://rahulshettyacademy.com/loginpagePractise/
#${error_message}    css:.alert.alert-danger
#${success_message}    css:.nav-link
#${popup}    css:.modal-body


*** Test Cases ***

Validate Child window Functionality
    Select the Link of the Child Window
    Verify the user is switched to Child window
    Grab the email id from the Child Window
#    Switch to Parent window and enter the Email



*** Keywords ***

Select the Link of the Child Window
    Sleep    3
    Click Element    css:.blinkingText
    #xpath:(//a[@class='blinkingText'])
    Sleep    5

Verify the user is switched to Child window
    Switch Window    NEW
    Element Text Should Be    xpath://*[@class='inner-box']/h1    DOCUMENTS REQUEST
    ${result} =    Get Text    //*[@class='im-para']/i
    log    ${result}

Grab the email id from the Child Window
    ${text1} =    Get Text    //*[@class='im-para red']
    @{newText} =    Split String    ${text1}    at
    ${text_split1} =    Get From List    ${newText}    1

        




