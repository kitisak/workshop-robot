*** Settings ***
Library    Selenium2Library
Test Teardown    Close Browser


*** Testcases ***
Check alert box
        Open Browser   https://epit.rd.go.th/EFILING/RegController   browser=gc
        Click Link    สัญชาติไทย
        Click Element     xpath=//*[@id="iNext"]/table/tbody/tr/td/a
        # Alert Should Be Present     ข้อความปฏิเสธ [E011] :${SPACE*2}กรุณาบันทึกทึกเลขประจำตัวผู้เสียภาษีอากร

        ${result}=   Get Alert Message
        Should Contain    ${result}     [E011]

Ok from confirm dialog
        Open Browser   https://epit.rd.go.th/EFILING/RegController   browser=gc
        Click Link    สัญชาติไทย
        Click Element    xpath=//*[@id="iExit"]/table/tbody/tr/td/a
        Confirm Action
        # Get Alert Message
        Location Should Be     http://epit.rd.go.th/publish/index.php

Cancel from confirm dialog
        Open Browser   https://epit.rd.go.th/EFILING/RegController   browser=gc
        Click Link    สัญชาติไทย

        Choose Cancel On Next Confirmation
        Click Element    xpath=//*[@id="iExit"]/table/tbody/tr/td/a
        Confirm Action

        Location Should Be     https://epit.rd.go.th/EFILING/RegController#

