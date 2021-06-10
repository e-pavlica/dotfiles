try:
    from rich import pretty
    pretty.install()
except ModuleNotFoundError:
    print('rich is not installed. "pip install rich" to resolve this')
