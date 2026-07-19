# Uniform additive-tight graph attack: exact degree-four counterfamily

Date: 2026-07-19

Status: **THE `4*n-1` OFF-DIAGONAL BOUND, THE CLAIM THAT TOTAL-ZERO EQUALITY
AT `4*n` FORCES A DIAGONAL, THE LOW-LEFT-ROW LEMMA, AND THE GENERIC
FOUR-CHOICE PRODUCT-BOX / ONE-SIGNED INTERVAL-FLUX THEOREM ARE REFUTED.**

This is scratch theorem-discovery work.  It changes no production Lean and
closes no source `sorry`.

## 1. Registry check

Before constructing a new local metric pattern, the required theorem-bank
registries and indexed Lean corpora were searched.  The indexed corpus finds
the existing strict Kalmanson producers in `ATail.CapCrossingKalmanson` and
the ordinal cycle consumers in `ATail.OrdinalKalmansonCycle`, but no theorem
matching the required additive-tight graph extremal statement.  The general-n
certificate registries likewise contain no such result.

## 2. The all-even counterfamily

Fix an even `n >= 12`.  Write `m = n/2`.  For every proper circular interval
split modulo complement, give the split weight

```text
w_I = n - 8  if min(|I|, n-|I|) = 2,
w_I = 1      otherwise.
```

Every weight is a positive integer.  Define the translation-invariant
circular split metric

```text
D(c,x) = sum_{I separates c and x} w_I.
```

Let `d_t = D(0,t)` for `0 <= t <= m`.  For a split whose smaller side has
cardinality `k < m`, exactly `2*min(k,t)` members of its rotation orbit
separate `0` and `t`; for the antipodal `k=m` orbit, exactly `t` do.  Hence

```text
d_t = 2*min(2,t)*(n-8)
      + sum_{k=3}^{m-1} 2*min(k,t)
      + t.
```

In particular, with `h = 3*n - 21`,

```text
d_1 = h,
d_2 = 2*h,
d_5 = 3*h,
2*d_2 = d_1 + d_5.
```

The same formula shows `d_0 < d_1 < ... < d_m`: at each step at least one
positive split orbit still contributes.  Symmetry gives `d_t = d_{n-t}`.

Now set

```text
alpha_c = 0    when c is even,
alpha_c = h    when c is odd,

beta_x  = 2*h  when x is even,
beta_x  = h    when x is odd.
```

The complete nonself equality graph

```text
D(c,x) = alpha_c + beta_x
```

then has exactly these targets:

```text
c even: x = c +/- 1 and c +/- 2  (mod n),
c odd : x = c +/- 2 and c +/- 5  (mod n).
```

All four targets are distinct when `n >= 12`.  Strict increase of the `d_t`
shows there are no other equality targets.  Therefore the graph has exactly

```text
4*n
```

off-diagonal tight incidences, every left row has degree four, every right
target has multiplicity four, and no diagonal is tight.  This is an
elementary counterexample for **every even card at least twelve**, not merely
a finite solver hit.

All split weights are positive, so the two Kalmanson inequalities are strict
for every cyclic quadruple.  The construction therefore lies on the exact
strict circular-split surface used by the aggregate Gordan alternative.

## 3. Canonical card-twelve certificate

[`tight_graph_uniform_n12_degree_four_counterexample.json`](tight_graph_uniform_n12_degree_four_counterexample.json)
is the smallest member of the family.  It has

```text
distance offsets = [0,15,30,37,42,45,46,45,42,37,30,15],
alpha            = [0,15,0,15,0,15,0,15,0,15,0,15],
beta             = [30,15,30,15,30,15,30,15,30,15,30,15].
```

Its complete selected rows are

```text
 0 : {1,2,10,11}
 1 : {3,6,8,11}
 2 : {0,1,3,4}
 3 : {1,5,8,10}
 4 : {2,3,5,6}
 5 : {0,3,7,10}
 6 : {4,5,7,8}
 7 : {0,2,5,9}
 8 : {6,7,9,10}
 9 : {2,4,7,11}
10 : {0,8,9,11}
11 : {1,4,6,9}
```

Exact replay gives

```text
off-diagonal tight entries = 48 = 4*n,
left degrees               = [4,4,4,4,4,4,4,4,4,4,4,4],
right degrees              = [4,4,4,4,4,4,4,4,4,4,4,4],
tight diagonals            = {},
minimum Kalmanson slacks   = 2 and 2,
strongly connected         = true,
pair alternating           = true.
```

The directed graph is strongly connected already from the displayed modular
steps: the `+/-2` edges connect each parity class, an even row reaches the odd
class by `+/-1`, and an odd row reaches the even class by `+/-5`.
Pair alternation is also forced abstractly by strict Kalmanson
single-crossing; the independent replay checks every shared target pair
directly.

Generate and check the artifact with

```bash
uv run python \
  scratch/atail-force/aggregate-positive-contour-discovery/tight_graph_uniform_counterexample.py \
  --n 12 \
  --output scratch/atail-force/aggregate-positive-contour-discovery/tight_graph_uniform_n12_degree_four_counterexample.json

uv run python \
  scratch/atail-force/aggregate-positive-contour-discovery/tight_graph_uniform_verify.py \
  scratch/atail-force/aggregate-positive-contour-discovery/tight_graph_uniform_n12_degree_four_counterexample.json
```

The second program independently reconstructs the interval basis, every
distance, the **complete** equality graph, both strict Kalmanson slack
families, strong connectivity, and pair alternation using integer arithmetic.

## 4. Why this refutes the aggregate contour theorem

Let `u(c,x)` be any balanced signed incidence circulation supported on the
displayed tight edges.  Row and target balance give

```text
sum_{c,x} u(c,x) * D(c,x)
  = sum_c alpha_c * sum_x u(c,x)
    + sum_x beta_x * sum_c u(c,x)
  = 0.
```

On the other hand, expanding the split metric gives

```text
sum_{c,x} u(c,x) * D(c,x)
  = sum_I w_I * Phi_I(u),
```

where `Phi_I(u)` is the circular-interval flux.  Since every `w_I > 0`, the
right side cannot vanish if all interval fluxes have one sign and at least
one is strict.  Thus this row table has no positive aggregate contour.

Consequently the following proposed statements are false:

1. every strict circular-split additive-tight graph has at most `4*n-1`
   nonloop incidences;
2. equality in the proposed `4*n` total-zero bound forces at least one tight
   diagonal;
3. every such graph has a left row of degree at most three;
4. every complete strongly connected pair-alternating four-choice row table
   has a one-signed nonzero interval-flux circulation; and
5. the equivalent generic circular product-box comparability claim.

This counterexample survives all of the finite structural hypotheses that
the aggregate route retained: four choices per source, four uses per target,
strong connectivity, pair alternation, and strict Kalmanson geometry.

## 5. Route consequence

The generic aggregate interval-flux/product-box route cannot close A-tail
from card twelve upward.  Extending its literal CEGAR search beyond card
eleven would at best rediscover this satisfiable family.

This does **not** refute the original Euclidean A-tail statement.  The
circular split separator need not come from the full Euclidean/MEC/critical
fiber data of the parent branch.  Any viable high-card producer must now add
one of those genuinely stronger inputs: nonlinear Euclidean realizability,
minimum-enclosing-circle/cap information, full critical-fiber provenance, or
global minimality.  Strict Kalmanson inequalities plus the abstract selected
row table are insufficient.

Finite decisions below the first counterexample remain potentially useful as
a cardinal split.  In particular, the already certified card-eight and
card-nine product-box results are unaffected.  Cards ten and eleven still
require their own exact coverage/producer status; the present counterfamily
does not decide them.

## 6. Epistemic ledger

- uniform construction for every even `n >= 12`: **PROVED BY THE DISPLAYED
  INTEGER FORMULAS**;
- canonical `n=12` equality graph and all 48 tight equations: **EXACT INTEGER
  REPLAY PASS**;
- completeness of the equality graph, strict Kalmanson slacks, strong
  connectivity, and pair alternation at `n=12`: **INDEPENDENT EXACT INTEGER
  REPLAY PASS**;
- `|E| <= 4*n-1`: **REFUTED**;
- equality at `4*n` total zeros forces a tight diagonal: **REFUTED**;
- existence of a left row of degree at most three: **REFUTED**;
- generic product-box / one-signed interval-flux theorem: **REFUTED**;
- original geometric A-tail branch: **NOT DECIDED; NO SOURCE `sorry` CLOSED**.
