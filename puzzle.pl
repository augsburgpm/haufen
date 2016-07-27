#!/usr/bin/env perl6
use v6;

my %ops;
%ops<*> = * * *;
%ops</> = * / *;
%ops<+> = * + *;
%ops<-> = * - *;

my $n = <6 6 5 2>;
my $target = 17;
# my $n = <1 2 3 4>;
# my $target = 24;

for $n.permutations() -> $p {
    for %ops.kv() -> $nm1, $op1 {
        for %ops.kv() -> $nm2, $op2 {
            for %ops.kv() -> $nm3, $op3 {
                try {
                    if $op1($p[0], $op2($p[1], $op3($p[2], $p[3]))) == $target {
                        say "$p[0] $nm1 ($p[1] $nm2 ($p[2] $nm3 $p[3]))";
                    }};
                try {
                    if $op1($op2($p[0], $p[1]), $op3($p[2], $p[3])) == $target {
                        say "($p[0] $nm2 $p[1]) $nm1 ($p[2] $nm3 $p[3])";
                    }};
            }
        }
    }
}
