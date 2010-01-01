use strict;
use warnings;
use Test::More;
use WWW::Shorten 'Flickr';

is(makealongerlink('http://flic.kr/p/6WTgue'), 'http://www.flickr.com/photos/poppen/3902877433/');
is(makealongerlink('6WTgue'), 'http://www.flickr.com/photos/poppen/3902877433/');

done_testing;
