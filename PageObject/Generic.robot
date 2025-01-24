*** Settings ***

Library    SeleniumLibrary

*** Variables ***

${invalid_password}    12345678
${valid_password}    learning
${username}    rahulshettyacademy
${url}    https://rahulshettyacademy.com/loginpagePractise/

*** Keywords ***
Open the Browser login app
    Create Webdriver    Chrome
    Go To    ${url}

Close Browser Session
    Close Browser
    
Wait Until Element is located on Page
    [Arguments]        ${page_locator}
    Wait Until Element Is Visible    ${page_locator}