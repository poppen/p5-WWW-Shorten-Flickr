use inc::Module::Install;
name 'WWW-Shorten-Flickr';
all_from 'lib/WWW/Shorten/Flickr.pm';
readme_from 'lib/WWW/Shorten/Flickr.pm';
readme_markdown_from 'lib/WWW/Shorten/Flickr.pm';
readme_pod_from 'lib/WWW/Shorten/Flickr.pm';
githubmeta;

requires $_ for (qw/ /);
requires 'WWW::Shorten';
requires 'Encode::Base58';

build_requires 'Test::More';
auto_set_repository;
auto_include;
WriteAll;
