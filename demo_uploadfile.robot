*** Settings ***
Library      Selenium2Library
Resource      upload.robot


*** Testcases ***
Choose 2 file to upload
    Open upload page
    upload.Choose File
    Count number of uploaded files
    Upload all files should be successfully

*** Keywords ***
Upload all files should be successfully
    Click Element    xpath=//div[2]/div/button[1]
    Wait Until Page Contains Element    xpath=//div[@style="width: 100%;"]

Open upload page
    Open Browser    https://goo.gl/YE27iy    gc
    Element Should Be Disabled    xpath=//div[2]/div/button[1]

Count number of uploaded files
    Wait Until Element Contains    xpath=//*[@id="ng-app"]/body/div/div[2]/div[2]/p    Queue length: 2

    Xpath Should Match X Times    //*[@id="ng-app"]/body/div/div[2]/div[2]/table/tbody/tr    2

    Table Cell Should Contain   xpath=//*[@id="ng-app"]/body/div/div[2]/div[2]/table   2   1    screenshot_1.jpg

    Table Cell Should Contain   xpath=//*[@id="ng-app"]/body/div/div[2]/div[2]/table   3   1    screenshot_2.jpg

    Element Should Be Enabled    xpath=//div[2]/div/button[1]



