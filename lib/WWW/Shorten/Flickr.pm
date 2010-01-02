package WWW::Shorten::Flickr;
use strict;
use warnings;
use base qw( WWW::Shorten::generic Exporter );
our @EXPORT = qw( makeashorterlink makealongerlink );

our $VERSION = '0.01';

use Carp;
use Encode::Base58;

sub makeashorterlink {
    my $uri = shift or croak 'No URL passed to makeashorterlink';

    if ( $uri =~ /www\.flickr\.com\/photos\/\w+\/(\d+)/ ) {
        my $encoded_id = encode_base58($1);
        return qq{http://flic.kr/p/$encoded_id};
    }
    return;
}

sub makealongerlink {
    my $uri = shift or croak 'No URL passed to makealongerlink';

    my $ua = __PACKAGE__->ua();

    $uri = "http://flic.kr/p/$uri" unless $uri =~ m!^http://!i;

    $uri =~ s!flic\.kr!www.flickr.com!;

    my $res = $ua->get($uri);
    return unless $res->is_redirect;
    $res = $ua->get( $res->request->uri );
    return unless $res->is_redirect;
    return "http://www.flickr.com" . $res->header('Location');
}

1;
__END__

=head1 NAME

WWW::Shorten::Flickr -  Perl interface to flic.kr

=head1 SYNOPSIS

  use WWW::Shorten::Flickr;
  use WWW::Shorten 'Flickr';

  $short_url = makeashorterlink($long_url);
  $long_url  = makealongerlink($short_url);

  $short_url = makeashorterlink($long_url, 'YOUR flic.kr USER NAME');

=head1 DESCRIPTION

WWW::Shorten::Flickr is Perl interface to the web api flic.kr.

=head1 Functions

=head2 makeashorterlink

The function C<makeashorterlink> will call the Flickr URL Shortener web site passing
it your long URL and will return the shorter Flickr URL Shortener version.

=head2 makealongerlink

The function C<makealongerlink> does the reverse. C<makealongerlink>
will accept as an argument either the full Flickr URL Shortener URL or just the Flickr URL Shortener identifier.

If anything goes wrong, then either function will return C<undef>.

=head1 AUTHOR

Shinsuke Matsui E<lt>smatsui <at> karashi <döt> orgE<gt>

=head1 SEE ALSO

L<WWW::Shorten>, L<http://flic.kr/>

=head1 LICENSE

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

=cut
