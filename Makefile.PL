use inc::Module::Install;
name 'WWW-Shorten-Flickr';
all_from 'lib/WWW/Shorten/Flickr.pm';

requires $_ for (qw/ /);
requires 'WWW::Shorten';
requires 'Encode::Base58';

build_requires 'Test::More';
use_test_base;
auto_include;
WriteAll;
