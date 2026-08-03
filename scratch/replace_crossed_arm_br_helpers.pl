use strict;
use warnings;

my $path = "lean/Erdos9796Proof/P97/ATail/CrossedArmSevenPointEuclideanObstruction.lean";
open my $in, "<", $path or die "$path: $!";
local $/;
my $text = <$in>;
close $in;

my $b3 = <<'LEAN';
      have B3 : bs * (bv - bu) * (bw - 1) * (bw - bv) = 0 := by
        exact brEqBwB3 p2 p5 q7 q8raw q9
LEAN

my $b17 = <<'LEAN';
      have B17 : bs * bv * h = 0 := by
        dsimp [h]
        exact brEqBwB17 p2 p5 q7 q8raw q9
LEAN

my $b24 = <<'LEAN';
      have B24 : -bv ^ 2 * (bw - 1) * (bw - bv ^ 2) = 0 := by
        subst bu
        exact brEqBwBuEqBvB24 p2 p5 q7 q8raw q9
LEAN

my $count_b3 = ($text =~ s/^      have B3 :.*?^      let h :=/$b3      let h :=/ms);
die "B3 replacement count $count_b3" unless $count_b3 == 1;

my $count_b17 = ($text =~ s/^      have B17 :.*?^      have hh :/$b17      have hh :/ms);
die "B17 replacement count $count_b17" unless $count_b17 == 1;

my $count_b24 = ($text =~ s/^      have B24 :.*?^      have hwbv2 :/$b24      have hwbv2 :/ms);
die "B24 replacement count $count_b24" unless $count_b24 == 1;

open my $out, ">", $path or die "$path: $!";
print {$out} $text;
close $out;
