*** Variable ***
${ChromeBROWSER}          Chrome
${FirefoxBROWSER}          Firefox
${username}         yangyanzhao@outlook.com
${password}         654!@#qwe
${URL}              https://www.westwingnow.de
*** Keywords ***
WW WEB UI StartTest-Chrome
   Open browser  ${URL}  browser=${ChromeBROWSER}     remote_url=http://hub:4444/wd/hub
   Set Browser Implicit Wait  50
   Maximize Browser Window
   sleep    2
WW WEB UI EndTest-Chrome
    SeleniumLibrary.Close all browsers
WW WEB UI StartTest-Firefox
   Open browser  ${URL}  browser=${FirefoxBROWSER}     remote_url=http://localhost:4444/wd/hub
   Set Browser Implicit Wait  50
   Maximize Browser Window
   sleep    2
WW WEB UI EndTest-Firefox
    SeleniumLibrary.Close all browsers