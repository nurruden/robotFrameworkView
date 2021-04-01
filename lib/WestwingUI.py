#-*-coding:utf-8-*-
from WebDriverUtil import fetchSeleniumInstance
from selenium.webdriver.common.action_chains import ActionChains
# from selenium.webdriver.common.keys import Keys

class WestwingUI:


    @staticmethod
    def sendrightclick():
        browser = fetchSeleniumInstance()
        action_chain = ActionChains(browser).key_down('test')
        action_chain.perform()
    @staticmethod
    def getFilterRes():
        browser = fetchSeleniumInstance()
        getLen = "return (function getLen(){var sel = document.querySelector('[data-testid=\"plp-products-grid\"]').children; return sel;})()"
        length = browser.execute_script(getLen)
        return length

    @staticmethod
    def getItemHref():
        browser = fetchSeleniumInstance()
        gethref = "return (function getHref(){var claName = document.querySelector('[data-testid=\"plp-products-grid\"]').children[0].className; var href = document.getElementsByClassName(claName)[0].children[0].href; return href})()"
        href = browser.execute_script(gethref)
        return href


    @staticmethod
    def JSQuerySelectorClick(key,val):
        browser = fetchSeleniumInstance()
        cl = "document.querySelector('["+key+"=\""+val+"\"]').click()"
        browser.execute_script(cl)