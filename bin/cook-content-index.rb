#!/usr/bin/env ruby


require 'json'
require 'yaml'

output_file = 'homeapp/src/assets/content.json'
pages = {}
routes = {}

pages["homepage"] = { name: "Homepage", file: "homepage.md", no_title: true, link: "/" }
pages["colophon"] = { name: "Colophon", file: "colophon.md", link: "/colophon" }
pages["copyright"] = { name: "Copyright", file: "wordzoo.com/jared-content/copyright.md", link: "/copyright", no_title: true }

pages["resume-cover"] = { name: "Résumé", title: "Jared Rhine Résumé", file: "resume-cover.md", link: "/resume/cover" }
pages["resume-general"] = { name: "Résumé", file: "resume.md", no_title: true, link: "/resume" }
pages["resume-full"] = { name: "Résumé", file: "resume-full.md", no_title: true, link: "/resume/full" }
pages["tomo-design"] = { name: "Tomo design", file: "personal/information/tomo/tomo-design.md", no_title: true, link: "/projects/tomo-design" }
pages["dx-is-key"] = { name: "DX is key", file: "dx-is-key.md", link: "/software/dx-is-key" }
pages["k8s-cheatsheet"] = { name: "k8s cheatsheet", file: "computing/kubernetes/kubernetes-cheatsheet.md", no_title: true, link: "/software/k8s-cheatsheet" }
pages["gcloud-cheatsheet"] = { name: "Gcloud cheatsheet", file: "computing/google-cloud/google-cloud-cheatsheet.md", link: "/software/gcloud-cheatsheet", no_title: true }
pages["skills-inventory"] = { name: "Skills inventory", file: "skills-inventory.md", link: "/skills" }
pages["todo"] = { name: "Todo", file: "/Users/jared/work/home/jared-homepage-vue/TODO.md", link: "/todo", no_title: true }

sws = <<EOM
/software/management-style
/software/naming-guidelines
/software/vue-onboarding
/software/unix-homebase
/software/theta-design
/tech-stack
/content-todo
EOM

navigation = %w(
  /
  /resume/cover
  /tech-stack
  /skills
  /software/management-style
  /software/dx-is-key
  /software/unix-homebase
  /software/theta-design
  /software/vue-onboarding
  /software/k8s-cheatsheet
  /software/gcloud-cheatsheet
  /software/naming-guidelines
  /projects/tomo-design
  /content-todo
  /todo
)

# kid-naming namespace
# move todos to its own doc
# font tuning
# early career advice
# ops
# unix aliases, functions, bin
# processes presentation
# igg-deploy design
# keyboard environment
# skill analysis/matrix
# vendor/solution evaluation
# eng team structures
# open more repositories for public presence
# github profile: Select up to six public repositories or gists you’d like to show.
# mac apps
# hammerspoon config
# linux desktop
# good ideas: functional. data perspective.
# various job descriptions
# agile rituals i'm used to
# product structure. pm is prime. balance of considerations.
# incident response
# on-call expectations
# business ideas: automated roasted
# code projects: pro-forma double-entry business projection
# tomo
# rusty's domain name
# learning: shank, point of critical failure
# neurons: diversity probably greater than think. bar sound, scrabble.
# coding fonts?
# ci generic-ness. concourse
# backend presentation
# data notes
# roles list
# interviewing
# manager responsibilites (part of management style i guess)
# computing/coding is an amazing testbed for self-learning opportunities
# deciding what not to do. extra chef features, oop "in full"
# JavaScript over time. Props to early visionaries. Power of transpiling in an ecosystem.
# Snippet: dockerfile
# snippet: vue-cli procedure
# snippet: turning new box into git-controlled home directory
# snippet: implement class idiom on type of javascript prototype# https://medium.com/javascript-in-plain-english/please-stop-using-classes-in-javascript-and-become-a-better-developer-a185c9fbede1
# repo: igg-command-shepard
# classic dimensions: mysql vs postgres, vi vs emacs, shell
# pr review standards
# eng guidelines, cribbed from igg
# backups. personal requirements. current/planned.

# Welcome to Jared and Josie's personal site!
# House details (plus pictures!)
# Music
# Search music archives
# Stream an artist
# Stream individual selections
# Download individual selections
# Summary report on all songs
# Bookmarks
# Sailing
# Sailing weather
# Crew notes
# Sailing operations manual (MS Word)
# Sailing skills worksheet (MS Excel)
# Server configuration

# Avi tips

sws.split("\n").compact.each do |link|
  sw = link.split('/').last
  pages[sw] = { name: sw.gsub('-', ' ').capitalize, file: "#{sw}.md" }
  routes[link] = sw
end

pages.each do |key, value|
  routes[value[:link]] = key if value[:link]
end

index = {
  pages: pages,
  routes: routes,
  navigation: navigation,
  default_page: "homepage"
}

pages.keys.each do |page|
  file = pages[page][:file]
  next unless file
  file = "wordzoo.com/jared-content/#{file}" if file =~ /^[\w\-\_\.]+\.md$/
  readfile = file.start_with?('/') ? file : "/Users/jared/projects/#{file}"
  content = File.open(readfile).read
  md = content.gsub(/\A---(.|\n)*?---/, '')
  fm = content[/\A---(.|\n)*?---/, 0]
  pages[page][:frontmatter] = YAML.load(fm) if fm
  pages[page][:body] = md
  pages[page].delete(:file)
end

#json = JSON.generate(index)
json = JSON.pretty_generate(index)

fh = File.open(output_file, 'w')
fh.write(json)
