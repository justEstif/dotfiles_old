# pylint: disable=C0111
from qutebrowser.config.configfiles import ConfigAPI  # noqa: F401
from qutebrowser.config.config import ConfigContainer  # noqa: F401
config: ConfigAPI = config  # noqa: F821 pylint: disable=E0602,C0103
c: ConfigContainer = c  # noqa: F821 pylint: disable=E0602,C0103# User agent to send.

config.load_autoconfig()

c.downloads.location.directory = '~/Downloads'

config.source("./theme.py")
config.source("./keybinds.py")
