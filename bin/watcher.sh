#!/bin/sh

cd ~/work/home/jared-homepage-vue

fswatch -0 -m poll_monitor --event Updated -r bin/cook-content-index.rb ~/projects/wordzoo.com/jared-content/ | xargs -0 -t -n1 sh -c bin/cook-content-index.rb
