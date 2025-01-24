*** Settings ***
Documentation    All the page objects and keywords of landing page
Library    SeleniumLibrary
Resource    Generic.robot
*** Variables ***


*** Keywords ***
Enter the Country and select it
    [Arguments]    ${countryname}
    Input Text    id:country    ${countryname}
    Sleep    3s
    Wait Until Element is located on Page    //a[text()='${country_name}']
    Click Element    //a[text()='${country_name}']
    Click Element    //div[@class='checkbox checkbox-primary']/label

Purchase the product and Confirm the Purchase
    Click Button    css:.btn-success
    Page Should Contain    Success!

