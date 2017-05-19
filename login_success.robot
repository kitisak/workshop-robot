*** Settings ***
Library     Selenium2Library

*** Testcases ***
Login success
    Open login page
    Fill in username and password
    Submit
    User must see the welcome page

*** Keywords ***
User must see the welcome page
    #check case 01
    Wait Until Element Contains    xpath=//*[@id="container"]/h1    Welcome Page
    #check case 02
    Page Should Contain Element    xpath=//*[@id="container"]/p/a
    Click Element     xpath=//*[@id="container"]/p/a
    #show login page
    Wait Until Page Contains     Login Page

Open login page
    Open Browser   http://localhost:7272/   browser=gc

Fill in username and password
    Input Text     id=username_field    demo
    Input Text     id=password_field    mode

Submit
    Click Element    id=login_button
    # Click Button    id=login_button
    # Click Button    LOGIN
