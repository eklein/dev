#!/bin/bash

brew install reattach-to-user-namespace

sudo cp misc/dockerlo.plist /Library/LaunchAgents

cp misc/remote-pbcopy.plist ~/Library/LaunchAgents/remote-pbcopy.plist
