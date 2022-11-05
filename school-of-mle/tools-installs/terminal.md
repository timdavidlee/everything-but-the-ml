# MacOSX - Terminal

### Bash autocomplete

```sh
brew install bash-completion
```

Your `./bash_profile` will need to be updated below:

```
echo "[ -f /usr/local/etc/bash_completion ] && . /usr/local/etc/bash_completion" >> ~/.bash_profile
```


### Default MacOSX Terminal

There's nothing wrong the current terminal

### iTerm - Terminal

[Product Link](https://iterm2.com/). Why?

- split pane view
- search will highlight all words
- paste history
- auto-complete

Can also be installed with brew here.

```
brew install cask iterm2
```

**Useful Shortcuts**

There are many useful shortcuts for `iterm`, but for beginners, here's a few:


- `command + d`: splits the current pane into left and right
- `command + shift + d`: splits the current pane into top + bottm
- `command + t`: start a new tab
- `command + w`: close a tab
- `command + enter`: full screen
- `command + shift enter`: full-size a pane / screen

**Command History**

- `Ctrl R`: opens a prompt, then type the search term, keep pressing `Ctrl R` to cycle through results

### Warp Terminal

[https://www.warp.dev/](https://www.warp.dev/)

This is a newer terminal that came out in 2021~ish and is built on `rust (programming language)`. Has a lot more modern features:

- shows visual command history (and output)
- great a suggesting snippets you already typed
- great at showing docs for params you might have forgotten 

