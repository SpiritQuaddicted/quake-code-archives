quake-code-archives
===================

Automated archiving of publically available source code repositories of Quake related things.

## Dependencies
* Bash (4?)
* git (if you are on Debian then also git-svn)

## Todo
* Force a username/password for updates so non-existant repos do not halt the script anymore (`yes ""` does not work).

Please send me more repository URLs.

## Dumps
- https://archive.org/download/quake-code-archives_dump_20190813/quake-code-archives_dump_20190813.tar.xz
- https://archive.org/download/quake-code-archives_dump_20170226/quake-code-archives_dump_20170226.tar.xz
- https://archive.org/download/quake-code-archives_dump_20151129/quake-code-archives_dump_20151129.tar.xz

## Notes
- make a dump: `tar --create --file quake-code-archives_dump_$(date +%Y%m%d).tar.xz --auto-compress --verbose ~/archives/`
  - xz is about 10% smaller than gz or bz2
- archive.org upload: `curl --location --progress --header 'x-amz-auto-make-bucket:1'  --header 'x-archive-meta-mediatype:software' --header 'x-archive-meta01-collection:open_source_software' --header 'x-archive-meta-title:Quake Code Archives, 2015-11-29'  --header 'x-archive-meta-creator:Spirit of quaddicted.com'  --header 'x-archive-meta-description:A dump of many git and svn repositories related to Quake gamedev. Made with https://github.com/SpiritQuaddicted/quake-code-archives'  --header 'x-archive-meta-subject:gaming;software;quake;source-code'  --header "authorization: LOW foo:bar"  --upload-file quake-code-archives_dump_20151129.tar.xz http://s3.us.archive.org/quake-code-archives_dump_20151129/quake-code-archives_dump_20151129.tar.xz`
