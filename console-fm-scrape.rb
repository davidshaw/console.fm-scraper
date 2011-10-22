#!/usr/bin/ruby

#####################################
# by dshaw, 7/29/11
# console.fm is a great way to find new
# music -- this way, you can download
# the playlists and listen to them
# even when you're offline!
#####################################

require "open-uri"

######### TINY BIT OF CONFIG #########
dir = "./music-downloads" # default save dir
######################################


puts """
                   _       __ _ _      _  _
 _ _ ._  _ _ | _ _|_._ _  (_ / |_) /\\ |_)|_
(_(_)| |_>(_)|(/_o| | | | __)\\_| \\/--\\|  |_

usage: ruby console-fm-scrape.rb <genre>

"""

if not File.directory?(dir) then
	puts "[!] download directory #{dir} does not exist!"
	puts "[!] please create it before running!"
	Kernel.exit
end

category = "top"

category = ARGV[0] if ARGV.size > 0

if category == "-h" or category == "--help" then
	puts """

usage: ruby console-fm-scrape.rb <genre>
If no genre is specified, the 'top' playlist is scraped.

Current available playlists include:
Top (default)
Breaks
Chill-out
Deep-house
Drum-and-bass
Dubstep
Electro-house
Electronica
Funk-r-and-b
Glitch-Hop
Hard-dance
Hardcore-hard-techno
Hip-hop
House
Indie-dance-nu-disco
Minimal
Pop-rock
Progressive-house
Psy-trance
Reggae-dub
Tech-house
Techno
Trance

"""

Kernel.exit

end

target = "http://console.fm/#{category}"
puts "[+] trying to reach #{target}"

open(target) do |p|
	p.each_line do |line|
		if line =~ /http:\/\/media.console.fm\/tracks\/\d+/
      			location = $&
      			line =~ /\">(.*)\</
      			name = $1[0..-5]
			name.gsub!(/\//, '_')
      			puts "[+] grabbing track #{name}"

      			if not File.exists?("#{dir}/#{name}.mp3")
      				f = File.new("#{dir}/#{name}.mp3", "wb")
				begin
      					f.write(open(location, "Cookie" => p.meta['set-cookie']).read)
				rescue
					puts "[!] ERROR -- deleting empty file #{name}.mp3"
					f.close
					File.delete("#{dir}/#{name}.mp3")
					next
				end
      				f.close
				sleep (rand(10) +5) # sleep 10-20 seconds
      			else
				puts "[!] detected duplicate file #{name}.mp3, skipping"
      			end
    		end
  	end
end

puts "[+] script completed"
puts "[+] if you like these songs, support the artists and console.fm!"
