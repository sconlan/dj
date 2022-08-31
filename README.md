# dj
A lightweight perl mp3 manager for OS X

# intro

I was looking for a lightweight way to manage a large library of music files. the dj.pl script currently takes a single argument, a directory of music files, and plays them via afplay (available on OS X). It also calls afinfo to grab track lengths. That's it.

# example
```
sh-3.2$ perl -w dj.pl /Volumes/MUSIC/iTunes\ 2019/Excision/         
================================================================================
/Volumes/MUSIC/iTunes 2019/Excision/
================================================================================
        1/10    4:32    /X Rated/09 Deviance (Original Mix).m4a
        2/10    3:24    /X Rated/10 Jaguar (Original Mix).m4a
        3/10    4:25    /X Rated/01 X Rated (Original Mix).m4a
        4/10    4:56    /X Rated/04 8 Bit Superhero (Original Mix).m4a
```

# dependencies

* afplay
* afinfo
