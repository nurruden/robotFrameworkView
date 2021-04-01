*** Variable ***
${BROWSER}          Chrome
${username}         yangyanzhao@outlook.com
${password}         654!@#qwe
${URL}              https://www.westwingnow.de
*** Keywords ***
WW WEB UI StartTest
   Open browser  ${URL}  browser=${BROWSER}
   Set Browser Implicit Wait  50
   Maximize Browser Window
   sleep    2
WW WEB UI EndTest
    SeleniumLibrary.Close all browsers
