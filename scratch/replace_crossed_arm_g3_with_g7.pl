use strict;
use warnings;

my $path = "lean/Erdos9796Proof/P97/ATail/CrossedArmSevenPointEuclideanObstruction.lean";
open my $in, "<", $path or die "$path: $!";
local $/;
my $text = <$in>;
close $in;

my $replacement = <<'LEAN';
    have G7 : bs * bv * (br ^ 2 - br * bv + bv ^ 2 - br) = 0 := by
      apply q1EqZeroG7
      · simpa [q1Polynomial] using hq
      · simpa [e2Polynomial] using p2
      · simpa [e5Polynomial] using p5
      · simpa [e7Polynomial] using q7
      · simpa [e8Polynomial] using q8
      · simpa [e9Polynomial] using q9
    have hK : br ^ 2 - br * bv + bv ^ 2 - br = 0 :=
      (mul_eq_zero.mp G7).resolve_left (mul_ne_zero hbs hbv0)
    have hprod : br * bs * (bv - 1) * (bs - bv) = 0 := by
      linear_combination q9 - bv * hK
    have hbsbv : bs = bv := by
      have hlast : bs - bv = 0 :=
        (mul_eq_zero.mp hprod).resolve_left
          (mul_ne_zero (mul_ne_zero hbr hbs) hbv)
      exact sub_eq_zero.mp hlast
    rw [hbsbv] at f6
    norm_num at f6
LEAN

my $count = ($text =~ s/
    have G3 : -\(bu - bs\) \* \(br - bv\) \* bv \* bw = 0 := by.*?
    exact hbv \(sub_eq_zero\.mpr hbv1\)/\n$replacement/s);
die "replacement count $count" unless $count == 1;

open my $out, ">", $path or die "$path: $!";
print {$out} $text;
close $out;
