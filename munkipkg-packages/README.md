# munkipkg-packages

These are packaging projects built for use with Greg Neagle's excellent [munkipkg tool](https://github.com/munki/munki-pkg). 

Through several quirks of Github, munkipkg projects are not compatible out of the box. To preserve empty directories and file/dictory permissions munkipkg has the arguments `--export-bom-info` and `--sync` that creates/reads the file Bom.txt to accomodate these quirks. Read more about it in the [munkipkg README.md](https://github.com/munki/munki-pkg#important-git-notes).
