rimgur
======

Ruby CLI client for Imgur
------

Simple CLI for downloading images from an album, following Practicing Ruby's example: https://practicingruby.com/articles/building-unix-style-command-line-applications

Usage
-----

Currently there are only two option flags: `-c --client_id` and `-a --album_id`. These expect your api client id provided by imgur and the id of the album you want to download images from.  Anything after those arguments is assumed to be a path to a directory that exists.

`rimgur -c YOUR_CLIENT_ID -a ALBUM_ID /some/path /another/path`
