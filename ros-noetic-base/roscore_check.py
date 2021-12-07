#!/usr/bin/env python3
 
import sys
import rosgraph

if not rosgraph.is_master_online():
    print("Waiting roscore ...")
    sys.exit(1)

print("roscore found!")
