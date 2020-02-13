#!/usr/bin/env python
# -*- coding: utf-8 -*-

import subprocess


def execute_subprocess_cmd(command):
    p = subprocess.Popen(command, stdout=subprocess.PIPE, shell=True)
    (output, error) = p.communicate()
    return output.decode("utf-8")


o = execute_subprocess_cmd("git describe --tags --abbrev=0")
o = execute_subprocess_cmd(f"git rev-parse --short {o}")
o = execute_subprocess_cmd("git rev-parse --short")
print(o)
