*** Settings ***
Documentation    All the page objects and keywords of landing page
Library    SeleniumLibrary

*** Variables ***
${success_message}    css:.nav-link


*** Keywords ***
Wait Until Element is located
    Wait Until Element Is Visible    ${success_message}

Verify the next page
    Wait Until Element Is Visible    ${success_message}
    ${result}=    Get Text    ${success_message}
    ${text}=    Set Variable    Home
    Should Contain    ${result}    ${text}


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

