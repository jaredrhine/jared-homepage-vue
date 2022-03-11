#!/usr/bin/env ruby

require 'json'
require 'yaml'

output_file = 'homeapp/src/assets/content.json'
pages = {}
routes = {}

pages["home"] = { name: "Home", file: "homepage.md", no_title: true, link: "/" }
pages["colophon"] = { name: "Colophon", file: "colophon.md", link: "/colophon" }
pages["copyright"] = { name: "Copyright", file: "wordzoo.com/jared-content/copyright.md", link: "/copyright", no_title: true }

pages["id"] = { name: "Identity", file: "identity.md", no_title: true, link: "/id" }

#pages["resume-cover"] = { name: "Résumé", title: "Jared Rhine Résumé", file: "resume-cover.md", link: "/resume/cover", no_title: true }
#pages["resume-summary"] = { name: "Résumé", file: "resume.md", no_title: true, link: "/resume/summary" }
pages["resume-full"] = { name: "Résumé", file: "resume-full.md", no_title: true, link: "/resume" }
pages["tomo-design"] = { name: "Tomo design", file: "personal/information/tomo/tomo-design.md", no_title: true, link: "/projects/tomo-design" }
pages["dx-is-key"] = { name: "DX is key", file: "dx-is-key.md", link: "/software/dx-is-key" }
pages["k8s-cheatsheet"] = { name: "k8s cheatsheet", file: "computing/kubernetes/kubernetes-cheatsheet.md", no_title: true, link: "/software/k8s-cheatsheet" }
pages["gcloud-cheatsheet"] = { name: "Gcloud cheatsheet", file: "computing/google-cloud/google-cloud-cheatsheet.md", link: "/software/gcloud-cheatsheet", no_title: true }
pages["skills-inventory"] = { name: "Skills inventory", link: "/skills" }
pages["todo"] = { name: "Todo", file: "/home/jared/work/home/jared-homepage-vue/TODO.md", link: "/todo", no_title: true }
pages["vue-onboarding"] = { name: "Vue onboarding", file: "/home/jared/work/js/vue-onboarding/README.md", link: "/software/vue-onboarding", no_title: true }
pages["xencd"] = { name: "Project: XenCD", file: "xencd-announce.md", link: "/project/xencd" }
pages["tips"] = { name: "Tech tips", file: "tips.md", link: "/tech-tips" }
pages["code"] = { name: "Public code", file: "code.md", link: "/code" }

sws = <<EOM
/software/management-style
/software/naming-guidelines
/software/unix-homebase
/software/theta-design
/tech-stack
/content-todo
EOM

navigation = %w(
  /
  /id
  /resume
  --
  /code
  /tech-stack
  /software/unix-homebase
  /software/vue-onboarding
  /project/xencd
)

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
  default_page: "home"
}

pages.keys.each do |page|
  file = pages[page][:file]
  next unless file
  file = "wordzoo.com/jared-content/#{file}" if file =~ /^[\w\-\_\.]+\.md$/
  readfile = file.start_with?('/') ? file : "/home/jared/projects/#{file}"
  content = File.open(readfile).read
  md = content.gsub(/\A---(.|\n)*?---/, '').gsub(/^\/\/.*$/, '')

  fm = content[/\A---(.|\n)*?---/, 0]
  pages[page][:frontmatter] = YAML.load(fm) if fm
  pages[page][:body] = md
  pages[page].delete(:file)
end

File.open(output_file, 'w').write(JSON.pretty_generate(index))

# all to just strip comments, wat
skills_in_filename = '/home/jared/projects/wordzoo.com/jared-content/skills.json'
skills_out_filename = 'homeapp/src/assets/skills.json'
skills_file_filtered_string = File.open(skills_in_filename).readlines.reject {|line| line =~ /^\s*\/\// }.join("\n")
new_skills = JSON.parse(skills_file_filtered_string)
mapped_skills_json = JSON.pretty_generate(new_skills)
File.open(skills_out_filename, 'w').write(mapped_skills_json)
