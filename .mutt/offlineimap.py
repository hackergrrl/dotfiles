#!/usr/bin/python

import re, subprocess

def get_keychain_pass(account=None):
    command = "pass " + account
    return subprocess.check_output(command, shell=True, stderr=subprocess.STDOUT)

