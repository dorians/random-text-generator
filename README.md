Random text generator
=====================
Its very simply tool that can be used to generate pseudo random text in polish.

Algorithm
---------
* Find a random article on wikipedia (using the "Random article" link)
* From this article pick one word
* Google it
* Draw one link and get its content
* Clean html and display full sentences
* Start at the beginning

Cons
----
* The output is mostly the good quality, but sometimes there are weird lines which don't look like a normal text
* Its very slow, approx. 6K per minute
* There is no support other languages than polish

Use
---
Just run ``bin/random-text-generator.rb``. The application was written in ruby, so be sure that you have ruby in version at least 1.9.3 installed.
