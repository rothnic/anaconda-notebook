#!/usr/bin/env python
# -*- coding: utf-8 -*-

# Modified from https://github.com/minrk/profile_default/blob/master/startup/mplimporthook.py
import sys, os
from IPython import get_ipython
from IPython.kernel.zmq.zmqshell import ZMQInteractiveShell as shell

def init_matplotlib():
    ip = get_ipython()
    if ip is None:
        return

    # default to inline in kernel environments for ipython notebook only
    if hasattr(ip, 'kernel') and isinstance(ip.instance(), shell):

        # setting backend so qt isn't imported
        import matplotlib
        matplotlib.use('nbagg')

        # enable inline since this is default behavior for remote notebook 
        print('enabling inline matplotlib')
        ip.enable_matplotlib('inline')

init_matplotlib()