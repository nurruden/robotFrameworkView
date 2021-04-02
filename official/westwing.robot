*** Settings ***
Documentation   automation web UI testing for westwingnow.de
Library     SeleniumLibrary
Library     ../lib/WestwingUI.py
Resource        ../keywords/WestWingKeywords.robot

Suite Setup		WW WEB UI StartTest-Chrome
Suite Teardown	WW WEB UI EndTest-Chrome
#Test Setup		WW WEB UI StartCaseTest
#Test Teardown	 WW WEB UI EndCaseTest
*** Test Cases ***
Case001-Test search window-chrome
    [Tags]    chromeNode1
    Sleep   5
    Click Element    id:onetrust-accept-btn-handler
    Sleep   1
    execute javascript      document.getElementsByClassName("qa-header-search-input")[0].value="möbel"
    sleep   1
#    execute javascript      document.getElementsByClassName("qa-header-search-input")[0].id="test"
#    sleep   2
#    sendrightclick
#    press keys   id=test     RETURN
#    sleep   2
    #here is a trick, when I try to send ENTER with selenium or js, both failed. I am not vry sure what is the root cause.
    #so when I input search value, then go to the search URL to make this test proceed.
    Go To       https://www.westwingnow.de/moebel/?searched=m%C3%B6bel
    sleep   10
    ${len}  getFilterRes
    log     ${len}
    Should Be True	len('${len}') > 1
    JSQuerySelectorClick    data-testid     wishlist-icon
    sleep   1
    Page Should Contain     Registrieren
    JSQuerySelectorClick    data-testid     login_reg_switch_btn
    sleep   1
    input text      email    ${username}
    input password      password    ${password}
    JSQuerySelectorClick    data-testid     login_reg_submit_btn
    sleep   10
    ${wishlist}     execute javascript  return document.querySelector('[data-testid="wishlist-counter"]').innerText
    log     ${wishlist}
    Should Be Equal      ${wishlist}     1
    JSQuerySelectorClick    data-testid     wishlist-counter
    sleep   5
    Location Should Be      https://www.westwingnow.de/customer/wishlist/index/
    sleep   1
    JSQuerySelectorClick    class   blockListProduct__delete qaBlockListProduct__delete
    sleep   1
