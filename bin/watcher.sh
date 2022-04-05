#!/bin/sh

cd ~/work/home/jared-homepage-vue

exec chpst -P sh -c 'fswatch -0 -m poll_monitor --event Updated -r -e content.json -e skills.json bin/cook-content-index.rb ~/projects/wordzoo.com/jared-content/ ~/work/home/ | xargs -0 -t -n1 bin/cook-content-index.rb'
