# grrr
error and warning tracking in R

My goal is to make a fun package that will track errors and warnings in R and respond. Specifically, after a certain number of warnings/errors is reached I want an audio clip to play. 

As of May 2, the basic code works. I have room to improve it, but the basics are there (largely thanks to Colin Fay's argh package). Some of the improvements will come when I turn this into it's own package, which I will try to do tomorrow.

As of May 3, the package should work. I've still got the .Rproj file (I'm not sure what happens if I delete that, honestly), but it should be possible to pull from github and use for me. It still has hardcoded audio paths though.