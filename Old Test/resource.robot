

*** Variables ***

${invalid_password}    12345678
${valid_password}    learning
${username}    rahulshettyacademy

*** Keywords ***
Open the Browser login app
    Create Webdriver     Chrome
    Go To    ${url}

Close Browser Session
    Close Browser