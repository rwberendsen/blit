"""
integrate.py

Call if you only want to load new data
"""


import os
import sys
from ingest import asn, rabo


fun_integrate = {
        'asn': asn.integrate
        'rabo': rabo.integrate
}


def integrate(ingestDirectories={}, schema_prefix='blit'):
    for bank, directory in ingestDirectories.items():
        fun_integrate[bank](directory, schema_prefix=schema_prefix)


def main(argv):
    with open('config.json', 'r') as f:
        config = json.load(f)

    integrate(**config)
    return 0



if __name__ == '__main__':
    sys.exit(main(sys.argv))
