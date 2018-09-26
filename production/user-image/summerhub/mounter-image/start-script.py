#!/usr/bin/env python
import subprocess
import time
import os

with open(os.environ['MOUNT_SCRIPT']) as f:
    host_script = f.read()

assert 'FILESERVER' in os.environ
assert 'MOUNT_PATH' in os.environ

while True:
    try:
        subprocess.check_call([ 'nsenter',
            # nseenter on alpine wants its options like this, and will print
            # a really unhelpful error message otherwise, boo
            '--target=1',
            '--mount',
            '--net',
            '--',
            'python',
            '-c',
             host_script,
             os.environ['FILESERVER'],
             os.environ['MOUNT_PATH']
        ])
    except subprocess.CalledProcessError:
        print("Host script failed")
    time.sleep(10)
