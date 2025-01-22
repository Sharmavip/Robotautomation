

*** Variables ***
${username}    rahulshettyacademy
${invalid_password}    12345678
${valid_password}    learning

*** Keywords ***
Open the Browser login app
    Create Webdriver     Chrome
    Go To    ${url}

Close Browser Session
    Close Browser