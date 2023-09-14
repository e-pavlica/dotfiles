import os
import sys
sys.ps1 = '\033[1;33m❯❯❯ \033[0m\033[h'
sys.ps2 = '\033[1;91m... \033[0m\033[h'

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

