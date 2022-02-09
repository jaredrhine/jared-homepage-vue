#!/bin/sh

cd ~/work/home/jared-homepage-vue

fswatch -0 ~/projects | xargs -0 -n 1 -I {} bin/cook-content-index.rb
