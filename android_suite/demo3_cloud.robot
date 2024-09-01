*** Settings ***
Library     AppiumLibrary

Test Teardown       Close Application
#Cloud 
*** Keywords ***
Wait And Click Element
    [Arguments]     ${locator}
    Wait Until Page Contains Element     ${locator}
    Click Element     ${locator}

*** Test Cases ***
TC1 Android Automation
        &{option}       Create Dictionary       projectName=FirstProject    buildName=khanbuild
        ...     sessionName=day2    userName=dinakaranbalaji1       accessKey=6yXRE4nK1fyvTHWA2kPD

        Open Application    remote_url=http://hub.browserstack.com/wd/hub
        ...     platformName=android    automationName=UiAutomator2    deviceName=Google Pixel 3
        ...     platformVersion=9.0     bstack:options=&{option}
        ...     app=bs://2e9ace2184a279014a0da14c9a3a0fd8a8a727f0

        Log Source

TC2 Android Automation
     &{option}       Create Dictionary       projectName=FirstProject    buildName=khanbuild
    ...     sessionName=day2    userName=dinakaranbalaji1       accessKey=6yXRE4nK1fyvTHWA2kPD

    Open Application    remote_url=http://hub.browserstack.com/wd/hub
    ...     platformName=android    automationName=UiAutomator2    deviceName=Google Pixel 3
    ...     platformVersion=9.0     bstack:options=&{option}
    ...     app=bs://2e9ace2184a279014a0da14c9a3a0fd8a8a727f0
    ...     autoLaunch=false


    Activate Application    app_id=org.khanacademy.android


    Run Keyword And Ignore Error    Wait And Click Element    android=UiSelector().textContains("Allo").instance(2)

    Wait And Click Element    android=UiSelector().textContains("Dismis")
#    click on Search
    Wait And Click Element    xpath=//*[@text='Search']
#   click on Art and humanities
    Wait And Click Element    xpath=//*[contains(@text,'Arts and')]
    Sleep    2s
    &{scroll_arg}  Create Dictionary       strategy=-android uiautomator       selector=UiSelector().text("Art of Asia")
    Execute Script    mobile: scroll    &{scroll_arg}
    Click Element    xpath=//*[@text='Art of Asia']

    Log Source