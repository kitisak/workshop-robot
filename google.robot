*** Settings ***
Library    Selenium2Library
Test Teardown     Close Browser

*** Variables ***
${BASEURL}     http://www.google.com
${BROWSER}    gc

*** Testcases ***
Search robot
    Open browser to open google.com
    Fill in data    robot
    Press Enter
    Found in result page    Robot - Wikipedia

Search python
    Open browser to open google.com
    Fill in data    python
    Press Enter
    Found in result page   python

*** Keywords ***
Found in result page
    [Arguments]    ${expected result}
    Wait Until Page Contains    ${expected result}

Press Enter
    Press Key    name=q    \\13

Fill in data
    [Arguments]    ${search keyword}
    Input Text    name=q    ${search keyword}

Open browser to open google.com
    Open Browser    ${BASEURL}    browser=${BROWSER}



