#!/usr/bin/env ruby

require 'json'

output_file = 'homeapp/src/assets/content.json'

pages = {}
pages["homepage"] = { name: "Homepage", body: "# test 123\n\nwoo hoo\n\n# test 234\n\nboop" }
pages["colophon"] = { name: "Colophon", body: "# Colophon\n\n- vue.js\n- vue-cli\n- markdown-it" }
pages["tomo-design"] = { name: "Tomo design", file: "personal/information/tomo/tomo-design.md" }

routes = {}
routes["/"] = "homepage"
routes["/colophon"] = "colophon"
routes["/tomo-design"] = "tomo-design"

navigation = [
  "/", "/tomo-design", "/colophon"
]

index = {
  pages: pages,
  routes: routes,
  navigation: navigation,
  default_page: "homepage"
}

pages.keys.each do |page|
  file = pages[page][:file]
  next unless file
  pages[page][:body] = File.open("/Users/jared/projects/#{file}").read
  pages[page].delete(:file)
end

#json = JSON.generate(index)
json = JSON.pretty_generate(index)

fh = File.open(output_file, 'w')
fh.write(json)
