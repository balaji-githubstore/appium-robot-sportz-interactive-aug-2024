*** Settings ***
Library     AppiumLibrary
Library    String

Test Teardown       Close Application

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
    ...     autoLaunch=false
    ...     app=${EXECDIR}${/}app${/}khan-academy-7-3-2.apk
    Set Appium Timeout    20s

    Activate Application    app_id=org.khanacademy.android


    Run Keyword And Ignore Error    Wait And Click Element    android=UiSelector().textContains("Allo").instance(2)

    Wait And Click Element    android=UiSelector().textContains("Dismis")
#    click on Search
    Wait And Click Element    xpath=//*[@text='Search']
#   click on Art and humanities
    Wait And Click Element    xpath=//*[contains(@text,'Arts and')]
    Sleep    5s


     ${output}   Run Keyword And Ignore Error    Click Element    xpath=//*[@text='Art of Asia']
     
     WHILE    '${output}[0]'=='FAIL'
          Swipe    1134    1887    1140    1208
          ${output}   Run Keyword And Ignore Error    Click Element    xpath=//*[@text='Art of Asia']
     END

#     ${output}   Run Keyword And Ignore Error    Click Element    xpath=//*[@text='The Himalayas']
#
#     WHILE    '${output}[0]'=='FAIL'
#          Swipe By Percent    90    75    90    25
#          ${output}   Run Keyword And Ignore Error    Click Element    xpath=//*[@text='The Himalayas']
#     END

     #scroll to element using mobile command
    &{scroll_arg}  Create Dictionary       strategy=-android uiautomator       selector=UiSelector().text("The Himalayas")
    Execute Script    mobile: scroll    &{scroll_arg}
    Click Element    xpath=//*[@text='The Himalayas']


TC2
    Open Application    remote_url=http://localhost:4723     platformName=android
    ...     deviceName=android
    ...     automationName=UiAutomator2
    Set Appium Timeout    20s
    &{sms_arg}   Create Dictionary       max=3
    ${sms}    Execute Script    mobile: listSms        &{sms_arg}
    Log    ${sms}
    Log    ${sms}[total]
    Log    ${sms}[items][0]
    Log    ${sms}[items][0][body]
   ${sms_output}      Convert To String    ${sms}[items][0][body]
   ${sms_output}    Remove String    ${sms_output}      Avl Bal for A/c${SPACE}
   ${list}    Split String     ${sms_output}    as
   ${sms_output}    Set Variable    ${list}[0]
   Log    ${sms_output}



#xpath not comInvalidArgumentException: Message: Unsupported strategy: 'xpath'.
#The only supported strategies are: [accessibility id, class name, -android uiautomator].

#    &{scroll_arg}  Create Dictionary       strategy=xpath       selector=//*[@text='The Himalayas']
#    Execute Script    mobile: scroll    &{scroll_arg}
#    Click Element    xpath=//*[@text='The Himalayas']
    Sleep    5s



