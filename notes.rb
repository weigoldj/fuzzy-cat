#!/usr/bin/env ruby

require 'optparse'
require 'tty-markdown'

@notes_dir = "doc/"

options = {
  :markdown_file => "test.md"
}
OptionParser.new do |opts|
    opts.banner = "Usage: example.rb [options]"

      opts.on("-v", "--verbose", "Run verbosely") do |v|
            options[:verbose] = v
      end

      opts.on("-l", "--list", "list notes") do |v|
        puts Dir.entries(@notes_dir)
        puts ""
        exit
      end

      opts.on("-p", "--print FILE","print file") do |v|
        options[:markdown_file] = v
        parsed = TTY::Markdown.parse_file("#{@notes_dir}/#{options[:markdown_file]}.md")
        puts parsed
        puts "MD => #{options[:markdown_file]}"
        exit
      end

      opts.on("-c", "--contents", "Create a New ReadMe with Contents") do |v|

        # load the file as a string
        data = File.read("doc/template.txt")
        contents = ""
        Dir.glob("#{@notes_dir}*.md") do |f|
          contents += "<div> <a href=\"#{f}\">#{f}</a> </div>"
        end

        # globally substitute "install" for "latest"
        filtered_data = data.gsub("<<CONTENTS_LIST>>", contents)
        # open the file for writing
        File.open("README.md", "w") do |f|
          f.write(filtered_data)
        end
        exit
      end

      opts.on("-h", "--help", "Prints this help") do
        puts opts
        exit
      end
end.parse!

p options
p ARGV


# TODO
# LIST CREATER OR README For Web
#
