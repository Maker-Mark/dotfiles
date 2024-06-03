#!/bin/bash

# branch view is column
git config --global column.ui auto
# See branches by most recent commit
git config --global branch.sort -committterdate

# enable merge conflict resolution memory
git config --global rerere.enabled true

# fix long `git status` issue
git config --global core.untrackedcache true
git config --global core.fsmonitor true



# set global aliases
git config --global alias.sa 'stash --all'
git config --global alias.su 'stash --all'
git config --global alias.df 'show --name-only --pretty=format:' #ie  <hash_id_A>  (optional for a range) <hash_id_B>
git config --global alias.dw 'diff --word-diff'
git config --global alias.ch 'checkout'
