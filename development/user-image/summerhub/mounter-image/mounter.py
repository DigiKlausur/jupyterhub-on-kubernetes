#!/usr/bin/env python
"""
Ensure a set of fileservers are mounted in the host.

This is run every few seconds on the Kubernetes hosts, and should
rely only on packages in the standard library for 3.5.
"""
import subprocess
import os
import json
import sys

def mount_fileserver(fileserver, mount_path):
    try:
		os.makedirs(mount_path)
    except OSError, e:
        if e.strerror != 'File exists':
			raise

    subprocess.check_call(['mount'])
    subprocess.check_call([
        'mount', 
        '-t', 'nfs4', 
        '-v',
        '{}:/export/pool0/homes'.format(fileserver),
        mount_path,
        '-o', 'soft,rw'
    ])


def is_mounted(mount_path):
    try:
        subprocess.check_call([
            'mountpoint',
            '-q',
            mount_path
        ])
        return True
    except subprocess.CalledProcessError:
        return False
    

def main():
    fileserver = sys.argv[1]
    mount_path = sys.argv[2]

    print('Ensure {} is mounted at {}'.format(fileserver, mount_path))
    if is_mounted(mount_path):
        print("{} is already mounted, skipping".format(fileserver))
    else:
        print("{} is not mounted, mounting".format(fileserver))
        mount_fileserver(fileserver, mount_path)

if __name__ == '__main__':
    main()
