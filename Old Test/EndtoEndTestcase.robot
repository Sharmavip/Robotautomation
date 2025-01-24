
*** Settings ***
Documentation    To validate  End2End Scenario
Library       SeleniumLibrary
Library    Collections
Library    ../customLibraries/shop.py
Library    ../customLibraries/checkout.py
Test Setup    Open the Browser login app
#Test Teardown    No Operation

Resource    ../PageObject/Generic.robot
Resource    ../PageObject/LandingPage.robot
Resource    ../PageObject/ShopPage.robot
Resource    ../PageObject/CheckoutPage.robot
Resource    ../PageObject/ConfirmPage.robot

*** Variables ***
@{listOfProducts}    Blackberry    Nokia Edge
${country_name}        India
${error_message}    css:.alert.alert-danger

*** Test Cases ***

Validate UnSuccessful Login
    Sleep    3
    LandingPage.Fill the login form    ${username}    ${invalid_password}
    Generic.Wait Until Element is located on Page    ${error_message}
    LandingPage.Verify error message is correct    

Validate Successful Login
    Sleep    3
    LandingPage.Fill the login form    ${username}    ${valid_password}
    ShopPage.Wait Until Element is located
    ShopPage.Verify the next page
    ShopPage.Verify Card Details in the Shop Page
    Add Items To Cart And Checkout    ${listOfProducts}

    Check Items On Checkout Page    ${listOfProducts}
    CheckoutPage.Verify the checkout Items and Proceed
    ConfirmPage.Enter the Country and select it    ${country_name}
    ConfirmPage.Purchase the product and Confirm the Purchase

    
















