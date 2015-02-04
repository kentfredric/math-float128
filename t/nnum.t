use strict;
use warnings;
use Math::Float128 qw(:all);

print "1..4\n";

*nnf        = \&Math::Float128::nnumflag;
*set_nnum   = \&Math::Float128::set_nnum;
*clear_nnum = \&Math::Float128::clear_nnum;

my $rop = Math::Float128->new('6.5.8');

if($rop == Math::Float128->new(6.5) && nnf() == 1) {print "ok 1\n"}
else {
  warn "\nExpected 6.5, got $rop\n";
  warn "nnumflag() expected 1, got ", nnf(), "\n";
  print "not ok 1\n";
}

set_nnum(5);

if(nnf() == 5) {print "ok 2\n"}
else {
  warn "nnumflag() expected 5, got ", nnf(), "\n";
  print "not ok 2\n";
}

clear_nnum();

if(nnf() == 0) {print "ok 3\n"}
else {
  warn "nnumflag() expected 0, got ", nnf(), "\n";
  print "not ok 3\n";
}

$rop *= '-2 .5';

if($rop == Math::Float128->new(-13) && nnf() == 1) {print "ok 4\n"}
else {
  warn "\nExpected -13, got $rop\n";
  warn "nnumflag() expected 1, got ", nnf(), "\n";
  print "not ok 4\n";
}
