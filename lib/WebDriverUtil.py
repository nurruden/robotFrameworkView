#-*-coding:utf-8-*-
from robot.libraries.BuiltIn import BuiltIn
import os



def fetchSeleniumInstance():
    se2lib = BuiltIn().get_library_instance('SeleniumLibrary')
    return se2lib.driver


def setDisplay():
    #this is required for centos with vnc without monitor
    os.environ['DISPLAY']=':1.0'
