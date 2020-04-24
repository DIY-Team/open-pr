# open-pr
Swift tool to open a PR from command line. The command will open a new window (or a tab) in the default browser to the page where a new PR can be generated from the current branch (the branch on which you were working) against the default branch (usually master). The script needs to generate the actual URL that will do so.

![Alt Text](https://github.com/DIY-Team/open-pr/blob/master/demo.gif)

# Usage
Type `open-pr` in the folder directory from terminal. It will take you to the browser on "create new PR" page.

# Installation
clone the repo:
`git clone https://github.com/DIY-Team/open-pr.git`

`cd open-pr`

Next:

**Method 1:**
install using command:
`swift run Install`

By default the tool is named as `open-pr`. If you wish to keep a different name, use something like this:
`swift run Install <desired-name>`

**Method 2:**
run `sh install.sh`


# Uninstallation

`rm -rf /usr/local/bin/<tool-name>`

e.g. `rm -rf /usr/local/bin/open-pr` 

