#!/bin/bash
cd ~/katello
git remote add upstream git@github.com:Katello/katello.git
git fetch upstream
git remote add fork git@github.com:johnpmitsch/katello.git
git fetch fork
cp ~/config-settings/pre-push ~/katello/.git/hooks

