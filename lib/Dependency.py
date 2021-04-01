#!/usr/bin/python
# -*- coding: utf-8 -*-

from robot.libraries.BuiltIn import BuiltIn


class Dependency(object):
    ROBOT_LISTENER_API_VERSION = 2.0
    ROBOT_LIBRARY_SCOPE = 'GLOBAL'

    def __init__(self):
        self.ROBOT_LIBRARY_LISTENER = self
        self.testStatus = {}

    def requireTestCase(self, name):
        key = name.lower()
        if key not in self.testStatus:
            BuiltIn().fail("ERROR: Required test case can't be found: " + name)
        if self.testStatus[key] != "PASS":
            BuiltIn().fail("ERROR: Required test case failed: " + name)
        return True

    def _end_test(self, name, attrs):
        self.testStatus[name.lower()] = attrs["status"]
