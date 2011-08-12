# console.fm Scrape
## Ruby script to download mp3s from console.fm

For those of you that don't know about [console.fm](http://console.fm), man, you're missing out. This site (and built in web player) allow you to listen to pre-selected playlists in different genres of chart-topping music.

The problem that I have with this great service is that I'm not always online. I love their selection and think the music's great, but how can I use it if I need to be, for example, on a plane?

I created this nice Ruby script, `console-fm-scrape.rb` to download songs (either from the global toplist, or genre-specific tracks) to a predesignated folder (`./music-downloads/`) for offline listening.

Usage is really simple: `ruby console-fm-scrape.rb --help` will show a list of the different genres you can download. If you want to just download the toplist, create the local music-downloads folder `mkdir music-downloads` and run the script with no paramters `ruby console-fm-scrape.rb`. Easy!

To download a specific genre, simply run the script with the genre as a parameter: `ruby console-fm-scrape.rb electro-house` for example. Since Ruby is an interpreted, multiplatform language and I'm not using any weird extensions, this script should work on any platform--Linux, OSX or Windows. Tested and works successfully on Linux and OSX.

And remember to check out [console.fm](http://console.fm) -- those guys are doing a really good job!

## Additional notes
I added in a 15-20 second delay between downloading tracks so as not to overwhelm the console.fm servers. The last thing I want is a bunch of people using my script to take this site that I like so much offline.

I'll be adding options in the near future to specific directories manually, but for now there needs to be a music-downloads folder.

I'm also following console.fm session management to make sure that the script stays authenticated, but I'll try to update if their schema changes. Happy listening, and thanks to the console.fm team for such a cool project!
