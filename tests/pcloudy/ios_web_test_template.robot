*** Settings ***

Library         AppiumLibrary

*** Test Cases ***

Open Browser

	Open Application    https://device.pcloudy.com/appiumcloud/wd/hub   pCloudy_Username=axq54@case.edu	pCloudy_ApiKey=hvpbgzvsypdryv7kd9t77sm3   platformName=iOS    pCloudy_DeviceFullName=APPLE_iPadAir5_iOS_15.6.1_2ae29  browserName=Safari  automationName=XCUITest

Navigate To Url
	Go To Url	https://www.google.com
	Input text 	name=q   'pCloudy'
    Log To Console	Text is input in search box
	Click Element	xpath=/html/body/div[1]/div[3]/form/div[1]/div[1]/div[4]/center/input[1]
	Log To Console	Clicked on google search icon

Close All Apps

	Close All Applications



