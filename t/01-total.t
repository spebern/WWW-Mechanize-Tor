use strict;
use warnings;
use Test::More;
use File::Which qw(which);
use WWW::Mechanize::Tor;

if (which 'tor') {
    plan tests => 3;
}
else {
    plan skip_all => 'Need tor available for testing';
}

use_ok 'WWW::Mechanize::Tor';
my $mech = WWW::Mechanize::Tor->new;

isa_ok $mech, 'WWW::Mechanize::Tor';

# 5 tries
my $suc = 0;
for (0 .. 4) {
    $suc = $mech->rotate_ip;
    last if $suc;
}

ok $suc, 'Changed ip (default args)';

