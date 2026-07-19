# Round-two exact-LRA core normal forms

Date: 2026-07-17

Scope: the 31 `FULL_LRA` refinements in the non-summary JSON outputs under
`../portfolio_round2/`.  This is a scratch theorem-discovery audit, not a
coverage theorem and not a source-`sorry` closure.

## Result

The 31 solver cores remain 31 distinct combinatorial normal forms after:

1. exact deletion minimization;
2. compressing the used vertices to their boundary-order ranks; and
3. quotienting by reversal of the boundary order.

In particular, none is an order-isomorphic copy of the existing
`false_of_three_rows_four_kalmanson_farkas_core`.  The existing theorem has four
strict inequalities and three row equalities.  The smallest round-two core has
six strict inequalities and four row equalities, so the existing theorem does
not directly consume any of these 31 recorded cores.

There is nevertheless a strong algebraic recurrence:

- 28 of the 31 primitive Farkas certificates put coefficient `1` on every
  strict Kalmanson inequality;
- one certificate uses strict-inequality coefficients in `{1, 2}`;
- two certificates use strict-inequality coefficients in `{1, 2, 3}`;
- 28 complete certificates use only coefficients `-1` and `1`, including the
  signed row-equality multipliers.

Thus a unit-sum consumer covers 28 cores, and one weighted generalization covers
all 31.  The combinatorial work does **not** disappear: each concrete schema
must still derive its exact sum cancellation from the selected-row equalities.

The exact certificate inventory is [`normal_forms.json`](normal_forms.json).
Every constraint has its primitive integer multiplier recorded there.  Integer
multipliers are, of course, exact rational Farkas multipliers; the normalization
has gcd one and positive strict-inequality coefficients.

## Smallest round-two core

The unique smallest recorded core is `n12_a2_seed4.json`, attempt 7.  After
order normalization it has eight vertices, six inequalities, and four row
equalities.  Its exact primitive certificate is the coefficient-one sum

```text
K1(0,1,2,7) + K1(0,2,3,7)
+ K2(1,2,6,7) + K2(2,3,6,7)
+ K2(3,4,6,7) + K2(4,5,6,7)
- row(1;0=6) + row(3;0=7)
+ row(5;3=6) - row(5;3=7) = 0.
```

Here `K1(a,b,c,d)` means

```text
d(a,c) + d(b,d) - d(a,b) - d(c,d) > 0,
```

and `K2(a,b,c,d)` means

```text
d(a,c) + d(b,d) - d(a,d) - d(b,c) > 0.
```

The displayed signed sum has zero coefficient on every distance variable, but
its strict part is positive, which is the contradiction.

Core-size distributions are:

```text
used vertices: 8:2, 9:2, 10:6, 11:14, 12:7
inequalities:   6:1, 7:4, 8:4, 9:3, 10:1, 11:3, 12:2, 13:2,
                14:2, 15:1, 16:1, 18:1, 20:1, 22:1, 25:1,
                26:1, 29:1, 32:1
row equalities: 3:5, 4:5, 5:8, 6:10, 7:1, 8:1, 9:1
```

Fifteen cores use only `K2`; the other sixteen mix `K1` and `K2`.

## The three weighted exceptions

The exact exceptional records are:

- `n11_a1_seed4.json`, attempt 3: Kalmanson weights `1` (six terms), `2`
  (four terms), and `3` (two terms); row weights are
  `-1, 1, -2, 1, 1, -1, 2, -1, 1` in the constraint order stored in JSON.
- `n12_a3_seed4.json`, attempt 4: thirteen Kalmanson terms have weight `1`
  and `K2(3,4,5,6)` has weight `2`; its row weights are all `-1` or `1`.
- `n12_a3_seed4.json`, attempt 5: Kalmanson weights are `1` (twenty terms),
  `2` (eleven terms), and `3` (one term); row weights are
  `-1, 1, -2, -1, 2, -1, 1` in stored constraint order.

`normal_forms.json` is authoritative for the name-to-coefficient map; the
counts above are only a compact digest.

## Generic Lean consumers

[`WeightedKalmansonCancellation.lean`](WeightedKalmansonCancellation.lean)
contains two reusable consumers:

```lean
theorem false_of_weighted_kalmanson_cancellation
    ...
    (weight : ι → ℕ)
    (hweight : ∃ i, 0 < weight i)
    (hcancel :
      ∑ i, (weight i : ℝ) * kalmansonShortSum ... =
      ∑ i, (weight i : ℝ) * kalmansonDiagonalSum ...) :
    False
```

and its unit-weight specialization

```lean
theorem false_of_kalmanson_cancellation
    ...
    (hcancel :
      ∑ i, kalmansonShortSum ... =
      ∑ i, kalmansonDiagonalSum ...) :
    False
```

The weighted theorem covers all 31 coefficient patterns.  The specialization
covers the 28 unit patterns without carrying weights through each replay.

These two declarations were kernel-checked before the active ShellCurvature
no-build gate was announced.  Their axiom closures are exactly `propext`,
`Classical.choice`, and `Quot.sound`.

## Smaller CNF terminal

The subsequent CNF outer search found a strictly smaller, size-independent
terminal that is not one of the 31 round-two metric cores:

```text
K2(0,1,2,g) + K1(0,2,3,4)
- row(g;0=1) - row(2;1=4) + row(3;0=4) = 0.
```

Equivalently, the first inequality plus the first two row equalities forces
`d(2,4) < d(0,2)`, while the second inequality plus the third row equality
forces `d(0,2) < d(2,4)`.

The source statement

```lean
theorem false_of_two_kalmanson_three_selected_rows ... : False
```

has been added to `WeightedKalmansonCancellation.lean`.  It consumes two
strict boundary-order inequalities and three `SelectedFourClass` rows, with no
cardinality-specific hypothesis.  The former user-owned no-build gate has
cleared.  On 2026-07-18 the complete file was elaborated with warnings as
errors; this theorem has axiom closure exactly `propext`, `Classical.choice`,
and `Quot.sound`.

## Thirty-core CNF round-three audit

The later CNF bank under
`generic-biapex-kalmanson-cnf/cegar_round3_a1/` contains 30 independently
verified fixed-row Farkas cores.  Their source-oracle cores have between 8 and
24 constraints, with mean `443 / 30 = 14.77`.

Searching only those oracle constraints would preserve that apparent
complexity.  Searching the **complete row table** changes the conclusion:

```text
30 / 30 models contain a 2-Kalmanson / 3-row exact terminal.
22 / 30 use K1 + K1.
 8 / 30 use K1 + K2.
 0 / 30 require K2 + K2.
```

Every alternate has primitive coefficient `1` on both strict inequalities and
coefficient `-1` or `1` on each of the three row equalities.  The sum of the two
Kalmanson vectors first cancels one distance term syntactically.  It leaves
three positive and three negative distance terms, and the three selected-row
equalities pair those terms exactly.  Thus all 30 have the arithmetic normal
form

```text
s1 + s2 < shared + d1
shared + s3 < d2 + d3
s1 = d1, s2 = d2, s3 = d3,
```

which is immediately contradictory after adding the inequalities.

The exact bank has 15 order/reflection normal forms.  If ambient boundary gaps
are forgotten while the ordered roles inside each Kalmanson quadruple are
retained, these become 13 abstract incidence forms, with frequencies

```text
8, 4, 3, 2, 2, 2, 2, 2, 1, 1, 1, 1, 1.
```

Those 13 forms are adapter shapes, not 13 different arithmetic consumers.  A
single theorem is enough after an adapter names the shared distance and obtains
the three row equalities:

```lean
theorem false_of_two_strict_pair_sums_three_pairings
    {shared s1 s2 s3 d1 d2 d3 : ℝ}
    (hfirst : s1 + s2 < shared + d1)
    (hsecond : shared + s3 < d2 + d3)
    (hpair1 : s1 = d1) (hpair2 : s2 = d2) (hpair3 : s3 = d3) :
    False
```

Its source proof is `by linarith` in `WeightedKalmansonCancellation.lean`.
The 2026-07-18 warnings-as-errors check elaborated it successfully, with axiom
closure exactly `propext`, `Classical.choice`, and `Quot.sound`.

The most frequent selected-row adapter shape occurs in iterations
`1, 3, 5, 10, 16, 18, 23, 28` after forgetting ambient gaps.  In normalized
roles it is

```text
K1(0,1,2,3) + K1(0,2,4,5)
- row(0;1=4) + row(3;1=2) + row(5;2=4) = 0.
```

The next two adapter shapes occur four and three times respectively.  Their
complete formulas and iteration maps are in
[`cnf_round3_small_cores.json`](cnf_round3_small_cores.json).

There are also two one-Kalmanson equality-closure alternates:

- iteration 4 has `K1 + 5 rows` (six constraints), larger than its five-
  constraint two-Kalmanson terminal;
- iteration 21 has `K2 + 4 rows` (five constraints), tied in total size with
  its two-Kalmanson terminal and using one fewer strict inequality.

The earlier concrete theorem `false_of_two_kalmanson_three_selected_rows` is
another instance of the same arithmetic normal form, but its exact ordered
incidence pattern does not occur among these 30 models.  It must not be cited
as a direct consumer for this bank without an adapter.  The new arithmetic
consumer is the uniform reusable boundary.

Run the audit with:

```bash
PYTHONPATH=round2-core-normal-forms \
UV_CACHE_DIR=/private/tmp/p97-uv-cache uv run python \
  round2-core-normal-forms/analyze_cnf_round3.py \
  ../generic-biapex-kalmanson-cnf/cegar_round3_a1 \
  --output round2-core-normal-forms/cnf_round3_small_cores.json
```

For each model the script constructs all six equality edges supplied by every
four-member row, searches exact signed combinations of at most three row
equalities against every one- and two-Kalmanson sum, and independently searches
one-Kalmanson equality paths through the complete distance-equality graph.  It
then deletion-minimizes and exact-`Fraction`-replays every reported certificate.
The run is deterministic and single-process; it took about 48 seconds locally.

## 173-model CNF round-four audit

The same full-row test was extended to the 173 checked SAT models in
`generic-biapex-kalmanson-cnf/cegar_round4_a1/iteration_*.outer.json`.
Iteration 174 is `UNKNOWN` after a 14-second outer timeout and contains no row
model, so it is correctly excluded rather than treated as an exception.

Every one of the 173 verified models has:

- a source outer replay with status `VERIFIED_SAT`;
- an independently verified source Farkas core;
- a complete four-member row at each of the eleven centers; and
- an exact five-constraint full-row alternate consisting of two Kalmanson
  inequalities and three row equalities.

There are **zero exceptions**.  The source-oracle cores range from 6 to 34
constraints and have mean `2771 / 173 = 16.02`; every full-row alternate has
exactly five constraints and is strictly smaller.  Their inequality-type split
is

```text
K1 + K1: 126
K1 + K2:  41
K2 + K2:   6
```

All primitive strict weights are one and all three row weights are `-1` or
`1`.  Thus the same `false_of_two_strict_pair_sums_three_pairings` arithmetic
consumer covers every case, including the six `K2 + K2` cases absent from the
earlier 30-model bank.

The deterministic matcher chooses the first exact terminal in a fixed
constraint order; it does not claim to enumerate every terminal inside a
model.  Its selected representatives occupy 29 order/reflection normal forms
and 24 abstract role/incidence forms.  The abstract representative frequencies
are

```text
38, 37, 16, 14, 11, 9, 6, 6, 4, 4, 4, 3, 3, 3, 2, 2, 2, 2, 2,
1, 1, 1, 1, 1.
```

The exact per-model constraints, memberships, multipliers, and both
normalizations are in
[`cnf_round4_small_cores.json`](cnf_round4_small_cores.json).

Run the deterministic one-core audit with:

```bash
PYTHONPATH=round2-core-normal-forms \
UV_CACHE_DIR=/private/tmp/p97-uv-cache uv run python \
  round2-core-normal-forms/analyze_cnf_round4.py \
  ../generic-biapex-kalmanson-cnf/cegar_round4_a1 \
  --output round2-core-normal-forms/cnf_round4_small_cores.json
```

The script precomputes every two-Kalmanson residual vector once.  For each row
model it enumerates disjoint triples of available full-row equality edges in a
fixed order, stops at the first exact match, deletion-minimizes it, derives
exact primitive multipliers, and replays cancellation with `Fraction`
arithmetic.  Only a genuine exception would trigger the slower one-Kalmanson
equality-path search.  The 173-model run took about five seconds on one core.

Combined with round three, the observed bounded result is now:

```text
203 / 203 verified card-eleven row models admit a 2-Kalmanson/3-row terminal.
```

This is strong convergence evidence for a structural row-coupling theorem.  It
is still not a coverage proof for arbitrary row maps or arbitrary carrier
cardinality; the missing producer must explain why every live row system has
one of these direct three-pair cancellations.

## Transported 2K+3eq membership bank

Each exact row equality `row(c;a=b)` needs only the two positive memberships
`a ∈ row(c)` and `b ∈ row(c)`.  Compressing all vertices used by the two
Kalmanson inequalities and the three equalities into boundary-order roles, then
canonicalizing under reversal exactly as `exact_outer_cnf.load_bank` does,
turns the 203 certificates into only **20 transported schemas**:

```text
certificate provenance records: 203
unique canonical schemas:         20
five-role schemas:                  9
six-role schemas:                  11
positive memberships per schema:   6
```

The bank is
[`transported_2k3_bank.json`](transported_2k3_bank.json).  It uses the existing
`p97-whole-carrier-kalmanson-transported-schema-bank-v1` schema and passes the
real outer loader unchanged.  The deduplicated preload containing the former
435 schemas plus these cuts is
[`bank_435_plus_2k3.json`](bank_435_plus_2k3.json), with 454 schemas.

Only one of the 20 cuts was already present in the 435-bank (existing schema
index 25), so 19 are exact-key additions.  More importantly, the smaller cuts
make many larger positive-membership cuts redundant.  Under increasing
embeddings and reversal:

```text
existing schemas subsumed by at least one new cut:          156 / 435
existing schemas strictly subsumed by at least one new cut: 155 / 435
existing schemas not subsumed:                              279 / 435
```

The 20 new cuts form an antichain: there are no internal subsumption pairs.
Per-cut counts are:

| cut | roles | memberships | certificates | exact overlap | existing subsumed | strictly subsumed |
|---:|---:|---:|---:|:---:|---:|---:|
| 0 | 5 | 6 | 21 | no | 15 | 15 |
| 1 | 5 | 6 | 19 | no | 1 | 1 |
| 2 | 5 | 6 | 8 | no | 16 | 16 |
| 3 | 5 | 6 | 11 | no | 6 | 6 |
| 4 | 5 | 6 | 5 | yes | 3 | 2 |
| 5 | 5 | 6 | 6 | no | 1 | 1 |
| 6 | 5 | 6 | 2 | no | 3 | 3 |
| 7 | 5 | 6 | 2 | no | 10 | 10 |
| 8 | 5 | 6 | 3 | no | 3 | 3 |
| 9 | 6 | 6 | 13 | no | 6 | 6 |
| 10 | 6 | 6 | 16 | no | 16 | 16 |
| 11 | 6 | 6 | 52 | no | 6 | 6 |
| 12 | 6 | 6 | 11 | no | 18 | 18 |
| 13 | 6 | 6 | 20 | no | 21 | 21 |
| 14 | 6 | 6 | 2 | no | 12 | 12 |
| 15 | 6 | 6 | 4 | no | 4 | 4 |
| 16 | 6 | 6 | 2 | no | 1 | 1 |
| 17 | 6 | 6 | 1 | no | 5 | 5 |
| 18 | 6 | 6 | 4 | no | 7 | 7 |
| 19 | 6 | 6 | 1 | no | 4 | 4 |

The exact schemas, existing-bank indices, and full subsumption lists are in
[`transported_2k3_bank_audit.json`](transported_2k3_bank_audit.json).

Two independent certificate checks are recorded:

1. [`emit_transported_2k3_bank.py`](emit_transported_2k3_bank.py) reopens every
   fixed-row model, checks all six memberships, reruns exact Z3 LRA and deletion
   minimality, derives primitive multipliers, and replays the rational vector
   sum.
2. [`verify_transported_2k3_bank.py`](verify_transported_2k3_bank.py) reads only
   the emitted provenance, independently reopens the 203 source models,
   reconstructs every schema, and replays every stored multiplier with
   `Fraction` arithmetic.

The independent result
[`transported_2k3_bank.verify.json`](transported_2k3_bank.verify.json) reports
`VERIFIED_EXACT_2K3_TRANSPORTED_BANK`, 20 schemas, 203 certificates, all source
memberships present, all coefficients canceling, and every schema reconstructed
in canonical form.

This bank is a stronger bounded CEGAR cut bank, not yet a Lean coverage theorem.
Its small antichain and 156-schema subsumption footprint sharpen the structural
target: prove that one of these 20 positive-membership patterns occurs in every
live whole-carrier row system, uniformly in the carrier cardinality.

## Corrected n=11 Euclidean cell audit

The corrected full-Kalmanson SAT survivor
`uniform-cycle-coverage-audit/n11_a1_minimal0.full_lra.json` is not a genuine
Euclidean residual.  The exact audit in
[`euclidean-cell-audit/REPORT.md`](euclidean-cell-audit/REPORT.md) establishes
two increasingly strong facts:

1. the exported rational metric has indefinite exact Gram matrices and is not
   Euclidean in any dimension; and
2. five of its selected rows already instantiate the source-proved sibling-bank
   theorem
   `Problem97.u5_qcritical_aux_base_collision_metric_incompatibility`.

The second fact excludes every injective planar metric assignment with the same
row equalities.  The adapter uses rows `0,2,4,8,9` and roles
`(p,q,t1,t2,t3,x) = (0,2,4,9,10,8)`.  It needs neither Kalmanson inequalities
nor the exported distances.  Current-repository closure is a bounded theorem
port plus row adapter after the no-Lean-build gate is lifted; this does not yet
establish coverage of all remaining survivor cells.

## Validation and trust boundary

Run:

```bash
UV_CACHE_DIR=/private/tmp/p97-uv-cache uv run python \
  round2-core-normal-forms/analyze.py portfolio_round2 \
  --output round2-core-normal-forms/normal_forms.json
```

The analyzer:

- reads only the 31 non-summary `FULL_LRA` records;
- reruns exact rational LRA deletion checks with Z3;
- derives a nonnegative Farkas multiplier with strict weights summing to one;
- clears denominators and divides by the gcd;
- directly replays the resulting integer linear combination using Python
  `Fraction` arithmetic and rejects any nonzero distance coefficient; and
- canonicalizes the complete weighted constraint set under order compression
  and reflection.

The regenerated payload reports:

```text
core_count = 31
normal_form_count = 31
all_raw_cores_deletion_minimal = true
all_primitive_certificates_exactly_cancel = true
```

The exact cancellation replay is independent of floating point.  Z3 remains
part of the discovery/minimality trust boundary; no claim here upgrades the 31
bounded schemas into an exhaustive arbitrary-cardinality theorem.
