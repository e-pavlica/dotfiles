import os
import sys
sys.ps1 = '\x01\033[34m\x02>\x01\033[1;33m\x02❯❯ \x01\033[0m\033[h\x02'
sys.ps2 = '\x01\033[1;91m\x02... \x01\033[0m\033[h\x02'

try:
    from rich import pretty, inspect, print
    pretty.install()
except ModuleNotFoundError:
    print('rich is not installed. "pip install rich" to resolve this')
try:
    import orjson as json
except ModuleNotFoundError:
    print('orjson is not installed. using stdlib json instead')
    import json

