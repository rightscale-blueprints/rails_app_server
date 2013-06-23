#!/usr/bin/ruby

# first, manually remove some .gitignore files in cookbooks
system("[ -e cookbooks/chef/.gitignore ] && rm -v cookbooks/chef/.gitignore")
system("[ -e cookbooks/runit/.gitignore ] && rm -v cookbooks/runit/.gitignore")

Dir.entries('cookbooks').each { |cookbook|
  system("knife cookbook metadata #{cookbook} -o cookbooks/")
}