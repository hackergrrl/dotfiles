config.bind('<Ctrl-o>', 'spawn chromium {url}')
config.bind('Y', 'hint links yank')
config.bind('I', 'hint images run open -t {hint-url}')
config.bind('W', 'hint links spawn chromium https://web.archive.org/web/*/{hint-url}')
config.bind('T', 'spawn st /home/sww/bin/turl {url}')

## Maybe only available in new qutebrowser versions?
# config.set("colors.webpage.darkmode.enabled", True)

# how to do this? so i can fill in a package name at the end
#config.bind('pn', 'open -t https://npmjs.org/package/')
