"""
blit.py

Call if you want to run everything
"""


import json
import os
import sys


import integrate



def main(argv):
    with open('config.json', 'r') as f:
        config = json.load(f)

    integrate.integrate(**config)
    return 0



if __name__ == '__main__':
    sys.exit(main(sys.argv))
