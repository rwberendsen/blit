"""
blit.py
"""


import json
import os
import sys


def ingest(ingestDirectories={}, schema_prefix='blit'):
    for bank, directory in ingestDirectories.items():
        print(bank)
        print(directory)


def main(argv):
    with open('config.json', 'r') as f:
        config = json.load(f)

    ingest(**config)
    return 0



if __name__ == '__main__':
    sys.exit(main(sys.argv))
