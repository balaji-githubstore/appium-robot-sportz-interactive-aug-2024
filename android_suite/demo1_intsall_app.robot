*** Settings ***
Library     AppiumLibrary

Test Teardown   Run Keywords   Log Source   AND   Close All Applications

*** Test Cases ***
TC1
    Log To Console    ${EXECDIR}
    Log To Console    ${CURDIR}
    Log To Console    ${OUTPUT_DIR}
    Log To Console    ${TEMPDIR}
    Log To Console    ${SUITE_NAME}
    Log To Console    ${TEST_NAME}
    Log To Console    hello${SPACE}${SPACE}${/}world

TC2
    Open Application    remote_url=http://localhost:4723     platformName=android
    ...     deviceName=android      app=${EXECDIR}${/}app${/}khan-academy-7-3-2.apk
    ...     automationName=UiAutomator2
#    ...     udid=8d4cdc2f
    #click on Allow manually for time being
    Log Source
    Set Appium Timeout    20s

    Wait Until Page Contains Element    xpath=//android.widget.TextView[@text='Dismiss']
    Click Element    xpath=//android.widget.TextView[@text='Dismiss']

    Wait Until Page Contains Element    xpath=//android.widget.TextView[@text='Sign in']
    Click Element    xpath=//android.widget.TextView[@text='Sign in']

    [Teardown]   Close Application

TC3
    Open Application    remote_url=http://localhost:4723     platformName=android
    ...     deviceName=android
    ...     automationName=UiAutomator2
    Install App    app_path=${EXECDIR}${/}app${/}khan-academy-7-3-2.apk    app_package=org.khanacademy.android
    Activate Application    app_id=org.khanacademy.android

    Run Keyword And Ignore Error    Wait Until Page Contains Element    xpath=//android.widget.Button[@text='Allow']

    Run Keyword And Ignore Error    Click Element    xpath=//android.widget.Button[@text='Allow']

    Run Keyword And Ignore Error    Wait Until Page Contains Element    xpath=//android.widget.TextView[@text='Dismiss']
    Run Keyword And Ignore Error    Click Element    xpath=//android.widget.TextView[@text='Dismiss']

    Wait Until Page Contains Element    xpath=//android.widget.TextView[@text='Sign in']
    Click Element    xpath=//android.widget.TextView[@text='Sign in']

#    SIGN IN
    Wait Until Page Contains Element    xpath=//android.widget.TextView[@text='Sign in']
    Click Element    xpath=//android.widget.TextView[@text='Sign in']
#    enter username as john
    Wait Until Page Contains Element    xpath=//android.widget.EditText[@content-desc="Enter an e-mail address or username"]
    Input Text    xpath=//android.widget.EditText[@content-desc="Enter an e-mail address or username"]    hello

#    enter password as demo123
    Wait Until Page Contains Element     accessibility_id=Password
    Input Text     accessibility_id=Password    hello123

    Wait Until Page Contains Element     xpath=(//android.widget.TextView[@text='Sign in'])[2]
    Click Element    xpath=(//android.widget.TextView[@text='Sign in'])[2]

    ${actual_error}     Get Text    xpath=//*[contains(@text,'issue')]
    Should Be Equal As Strings    ${actual_error}    There was an issue signing in

    Element Text Should Be    xpath=//*[contains(@text,'issue')]    There was an issue signing in
#   click on sign in
# assert the error message shown

TC3 UI Selector
    Open Application    remote_url=http://localhost:4723     platformName=android
    ...     deviceName=android
    ...     automationName=UiAutomator2     noReset=true
    Install App    app_path=${EXECDIR}${/}app${/}khan-academy-7-3-2.apk    app_package=org.khanacademy.android
    Activate Application    app_id=org.khanacademy.android

    Run Keyword And Ignore Error    Wait Until Page Contains Element     android=UiSelector().text('Allow')
    Run Keyword And Ignore Error    Click Element     android=UiSelector().textContains('Allo')

    Run Keyword And Ignore Error    Wait Until Page Contains Element    xpath=//android.widget.TextView[@text='Dismiss']
    Run Keyword And Ignore Error    Click Element    xpath=//android.widget.TextView[@text='Dismiss']

    Wait Until Page Contains Element    xpath=//android.widget.TextView[@text='Sign in']
    Click Element    xpath=//android.widget.TextView[@text='Sign in']

TC3 UI Selector
    Open Application    remote_url=http://localhost:4723     platformName=android
    ...     deviceName=android
    ...     automationName=UiAutomator2     noReset=true
    Activate Application    app_id=com.zomato.app