#!/bin/sh
git add .
git commit -am "changes"
gem build blackjack.gemspec
gem install
