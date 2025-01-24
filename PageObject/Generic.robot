*** Settings ***

Library    SeleniumLibrary

*** Variables ***

${invalid_password}    12345678
${valid_password}    learning
${username}    rahulshettyacademy
${url}    https://rahulshettyacademy.com/loginpagePractise/
${Browser}    Firefox

*** Keywords ***
Open the Browser login app
    Create Webdriver    ${Browser}

    Go To    ${url}

Close Browser Session
    Close Browser
    
Wait Until Element is located on Page
    [Arguments]        ${page_locator}
    Wait Until Element Is Visible    ${page_locator}