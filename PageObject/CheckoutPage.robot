*** Settings ***
Documentation    All the page objects and keywords of landing page
Library    SeleniumLibrary

*** Variables ***


*** Keywords ***
Verify the checkout Items and Proceed
    Click Button    css:.btn-success
    ${item_count} =     Get Text    xpath:(//a[@class='nav-link btn btn-primary'])
    log    ${item_count}
    Should Contain    ${item_count}    2