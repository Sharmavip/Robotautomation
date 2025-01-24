
*** Settings ***
Documentation    To validate login form2
Library       SeleniumLibrary
Library    Collections
Library    String

Test Setup    Open the Browser login app
#Test Teardown    No Operation
Resource    ../PageObject/Generic.robot

*** Variables ***
${url}    https://rahulshettyacademy.com/loginpagePractise/
#${error_message}    css:.alert.alert-danger
#${success_message}    css:.nav-link
#${popup}    css:.modal-body


*** Test Cases ***

Validate Child window Functionality
    [Tags]    Smoke
    Select the Link of the Child Window
    Verify the user is switched to Child window
    Grab the email id from the Child Window
    Switch to Parent window and enter the Email



*** Keywords ***

Select the Link of the Child Window
    Sleep    4
    Click Element    xpath:(//a[@class='blinkingText'])
    #css:.blinkingText
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
    log    ${text_split1}
    ${text_split2} =    Split String    ${text_split1}
    ${email} =    Get From List    ${text_split2}    0
    Log    ${email}
    Set Global Variable    ${email}

Switch to Parent window and enter the Email
    Switch Window    MAIN
    Title Should Be    LoginPage Practise | Rahul Shetty Academy
    Input Text    id:username    ${email}



        




