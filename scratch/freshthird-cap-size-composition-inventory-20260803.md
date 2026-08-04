# FreshThird/E1 cap-size and interior-composition inventory

Date: 2026-08-03

## Commands and source artifacts

The existing faithful bounded probe was checked without editing production Lean:

```text
uv run python scratch/retained-omission-e1/round5-general-cegar/n17_freshthird_incidence_probe.py --self-check
{"C_selectors": "independent", "carrier": 17, "profile": [6, 8, 6], "status": "PASS"}
```

The profile arithmetic below uses the cap-sum identity `c0+c1+c2=n+3`, the
live lower bounds `ci >= 6`, and the FreshThird field `cap_card_ge_eight` for
the designated/indexed cap.  Strict-interior sizes are `ii=ci-2`; the four
collision endpoints consume four points of the designated interior, so the
number of endpoint-fresh candidates there is `m=ii-4=ci-6`.

## All cap profiles before the FreshThird gate

`ordered` counts distinguish the three labelled caps; `canonical` identifies
profiles up to cap permutation.

| n | canonical cap triples (interiors) | ordered count |
|---:|---|---:|
| 15 | `(6,6,6)` (`(4,4,4)`) | 1 |
| 16 | `(6,6,7)` (`(4,4,5)`) | 3 |
| 17 | `(6,6,8)` (`(4,4,6)`) | 3 |
| 18 | `(6,6,9)` (`(4,4,7)`), `(6,7,8)` (`(4,5,6)`) | 3 + 6 = 9 |

## FreshThird designated-cap profiles

The designated cap must have `ci >= 8`, so n=15 and n=16 have no live
FreshThird profile (their maxima are 6 and 7).  With a fixed designated cap
(the probe's middle cap), the profiles are:

| n | fixed-index cap triple(s) | interior of indexed cap | `m` | ordered endpoint-fresh C-source pairs |
|---:|---|---:|---:|---:|
| 17 | `(6,8,6)` | 6 | 2 | `2*1 = 2` |
| 18 | `(6,9,6)`, `(7,8,6)`, `(6,8,7)` | 7, 6, 6 | 3, 2, 2 | 6, 2, 2 |

Allowing any of the three labelled caps to be designated gives 3 placements at
n=17 and 9 at n=18.  The corresponding total ordered C-source slots are 6
(n=17) and 30 (n=18); unordered pair counts are 3 and 15 respectively.

If the independent Q source selectors are also counted over this same
endpoint-fresh candidate set (an accounting convention, not an added theorem),
the raw `(C1,C2,Q1,Q2)` slot counts are `m(m-1)` squared: 4 for n=17; and
44 for the fixed-index n=18 rows (132 when all designated-cap placements are
counted).  The current probe deliberately keeps C and Q selectors independent,
so these are not claims that the Lean packet has this exact finite cardinality.

## Residual-arm reading

`firstNonHit` and `secondNonHit` only choose which C-source interaction is the
non-hit; they do not change the cap-composition gate.  Thus the n=17 profile
has two ordered endpoint-fresh C choices for either arm.  The noncanonical
`equalCrossRowCenters` arm needs both C rows and has the same capacity counts.
For n=18, a designated cap of size 8 supplies 2 ordered C choices, while size
9 supplies 6.  No n=18 solver run or universal-n conclusion is implied.

Existing n=17 artifacts (`N17-FRESH-THIRD-INCIDENCE-ROUND1.md` and
`N17-FRESH-THIRD-CYCLIC-METRIC-ROUND2.md`) report external-Z3 SAT for
`firstNonHit`, `secondNonHit`, and `equalCrossRowCenters` in `(6,8,6)`; this is
bounded diagnostic evidence only.  There is no supported n=15/n=16 FreshThird
instance and no n=18 artifact in the current probe directory.

## Extension through n=36

The same integer enumeration is trivial through `n = 36`.  Here `fixed` is
the number of ordered triples with the designated cap in the indexed slot,
`canonical` is the number of cap-permutation classes represented, `C-pairs`
is the total number of ordered endpoint-fresh C-source pairs, and `C/Q-slots`
is the corresponding raw independent `(C₁,C₂,Q₁,Q₂)` count.

| n | fixed | canonical | C-pairs | C/Q-slots |
|---:|---:|---:|---:|---:|
| 15 | 0 | 0 | 0 | 0 |
| 16 | 0 | 0 | 0 | 0 |
| 17 | 1 | 1 | 2 | 4 |
| 18 | 3 | 2 | 10 | 44 |
| 19 | 6 | 4 | 30 | 228 |
| 20 | 10 | 5 | 70 | 812 |
| 21 | 15 | 7 | 140 | 2,296 |
| 22 | 21 | 8 | 252 | 5,544 |
| 23 | 28 | 10 | 420 | 11,928 |
| 24 | 36 | 12 | 660 | 23,496 |
| 25 | 45 | 14 | 990 | 43,164 |
| 26 | 55 | 16 | 1,430 | 74,932 |
| 27 | 66 | 19 | 2,002 | 124,124 |
| 28 | 78 | 21 | 2,730 | 197,652 |
| 29 | 91 | 24 | 3,640 | 304,304 |
| 30 | 105 | 27 | 4,760 | 455,056 |
| 31 | 120 | 30 | 6,120 | 663,408 |
| 32 | 136 | 33 | 7,752 | 945,744 |
| 33 | 153 | 37 | 9,690 | 1,321,716 |
| 34 | 171 | 40 | 11,970 | 1,814,652 |
| 35 | 190 | 44 | 14,630 | 2,451,988 |
| 36 | 210 | 48 | 17,710 | 3,265,724 |

This remains finite arithmetic and selector accounting.  It is cheap to
generate, but it does not make the profiles realizable or provide a
universal-in-`n` Lean theorem; the trust boundary below still applies.

## What this says about a general-n proof

Writing `s = n - 15` and `eᵢ = cᵢ - 6`, the cap identity is
`e₀ + e₁ + e₂ = s`.  For a fixed designated index, the number of profiles
with `c₁ >= 8` is `binomial(n - 15, 2)`, and the total ordered C-source-pair
capacity over those profiles is `2 * binomial(n - 13, 4)`.  The independent
C/Q selector count is degree six in `n` (it is
`s*(s-1)*(s+1)*(s+2)*(s^2+s-1)/30`).  Thus explicit enumeration is polynomial,
not exponential, but it is still the wrong shape for a universal Lean proof.

More importantly, the thin designated-cap stratum exists for every
`n >= 17`.  With the designated cap in the middle coordinate, its profiles
are exactly

```text
(6+a, 8, n-11-a),  0 <= a <= n-17.
```

The extremal subfamily `(6,8,n-11)` is the `a=0` endpoint, not the entire
stratum.  Every profile in the stratum has only `m = 2` endpoint-fresh
candidates, so increasing `n` does not remove the hardest local branch; the
extra points can be split arbitrarily between the other two caps.  Any proof
based on a cap-profile split must therefore retain the minimal designated-cap
surplus unless a transport lemma permits choosing the largest cap.  A
geometric impossibility result for the thin profiles or a profile-independent
terminal could instead bypass that split.  Under the largest-cap transport,
the designated cap is at least `ceil((n+3)/3)`, and the local slack grows with
`n`.

The inventory consequently supports a two-part strategy: prove the thin-cap
branch once for arbitrary surplus, then use monotonicity/cardinality for
larger designated caps.  It does not justify extrapolating the `n=17` SAT
results to all `n`.

## Extension through n=256

The identities above were checked for every integer `15 <= n <= 256` by
`scratch/freshthird_cap_profile_census_check.py`.  The endpoint values and
several scale markers are:

| n | all labelled profiles | fixed designated profiles | canonical classes | ordered C-pairs | raw C/Q-slots |
|---:|---:|---:|---:|---:|---:|
| 36 | 253 | 210 | 48 | 17,710 | 3,265,724 |
| 64 | 1,275 | 1,176 | 225 | 499,800 | 489,604,080 |
| 128 | 6,555 | 6,328 | 1,121 | 13,826,680 | 71,240,586,032 |
| 192 | 15,931 | 15,576 | 2,700 | 82,713,752 | 1,042,358,702,704 |
| 256 | 29,403 | 28,920 | 4,961 | 283,444,920 | 6,612,316,471,728 |

For `n=256`, the largest possible
designated cap is `247`, so `m=241` and its single-profile ordered-pair
capacity is `57,840`.

The computation remains integer composition arithmetic.  Even at `n=256`, it
does not certify that any profile has a Euclidean realization or close the
FreshThird Lean obligation.

This is a complete parametric census rather than a checked-in tuple dump.  The
literal labelled expansion over `15 <= n <= 256` would contain 2,391,444 rows
(2,332,880 after retaining a fixed designated cap with `c₁ >= 8`); the
stars-and-bars bijection is the compact exhaustive representation.

## Trust boundary

This is finite arithmetic plus selector-capacity counting, not a geometric
realization, QF_NRA proof, Lean theorem, CEGAR certificate, or universal-in-n
statement.  The existing probe is external Z3 and records
`lean_kernel_proof=false`, `universal_n_claim=false`; its SAT models cannot be
promoted to closure or to a contradiction for the live E1 residual.
