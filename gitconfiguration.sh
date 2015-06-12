#!/bin/sh

git config --global user.email "contact@michaelszymczak.com"
git config --global user.name "Michael Szymczak"
git config --global alias.st status
git config --global alias.l "log --decorate"
git config --global alias.ll "log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit --"
