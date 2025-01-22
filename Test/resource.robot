*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${username}    tomsmith
${invalid_password}    SuperSecretPassword!!
${valid_password}    SuperSecretPassword!


*** Keywords ***
Open the Browser login app
    Create Webdriver     Chrome
    Go To    ${url}

Close Browser Session
    Close Browser