*** Settings ***

Library    Process
Library    AppiumLibrary

Suite Setup     Start Process       appium -a localhost -p 4723 --session-override
    ...     shell=True      alias=appiumserver
    ...     stdout=${CURDIR}/appium_stdout.txt  stderr=${CURDIR}/appium_stderr.txt

Suite Teardown   Terminate Process

*** Keywords ***
Wait And Click Element
    [Arguments]     ${locator}
    Wait Until Page Contains Element     ${locator}
    Click Element     ${locator}



*** Test Cases ***
TC1


    Open Application    remote_url=http://localhost:4723     platformName=android
    ...     deviceName=android
    ...     automationName=UiAutomator2
    Set Appium Timeout    20s
    Activate Application    app_id=com.docusign.ink
    Wait And Click Element    xpath=//android.widget.Button[@resource-id="com.docusign.ink:id/btn_login"]
    Sleep    5s
    @{contexts}     Get Contexts
    Log    ${contexts}
    Sleep    5s
    #check for xpath in the context and stay
    FOR    ${context}    IN    @{contexts}
        Switch To Context    ${context}
        ${count}      Get Matching Xpath Count    xpath=//input[@data-qa='username']
        Exit For Loop If    ${count}>0
    END

    Wait Until Page Contains Element    xpath=//input[@data-qa='username']
    Input Text    xpath=//input[@data-qa='username']    hello@gmail.com

    Wait Until Page Contains Element    xpath=//button[@data-qa='submit-username']
    Click Element    xpath=//button[@data-qa='submit-username']
    Sleep    2s



