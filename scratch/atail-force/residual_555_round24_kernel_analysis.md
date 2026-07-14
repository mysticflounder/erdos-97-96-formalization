# Round-24 `(5,5,5)` split-bridge terminal analysis

## Verdict

**PROVEN (exact Euclidean argument; new terminal step not yet Lean-checked).**
The round-24 survivor is incompatible with its saved strict convex cyclic
order.  It is a one-edge variant of the kernel-checked round-20 split-bridge
core, with the same seven labels

```text
(O,A,C,D,E,U,W) = (0,1,2,3,4,6,8).
```

Round 20 ended with `EA = EW`.  Round 24 instead ends with `EC = EW`.
The shared normalized backbone already forces

```text
CE < 1/4.
```

The same backbone also forces the previously unused complementary bound

```text
CD > 1/2.
```

But the round-24 terminal equalities `CD = CW` and `CE = EW`, followed by the
triangle inequality in `C,E,W`, give

```text
CD = CW <= CE + EW = 2*CE < 1/2,
```

a contradiction.

**PROVEN / KERNEL-CHECKED REUSED PREFIX.**  The normalization, reflected
`E`-branch, `h < x`, `x <= 7/8`, and `CE < 1/4` are already implemented in
`scratch/atail-force/seven_point_split_bridge_order_core.lean`.  The prior
independent round-20 replay compiled that exact source and audited the standard
axiom closure `{propext, Classical.choice, Quot.sound}`.  The source hash is
unchanged below.

**NOT YET IMPLEMENTED.**  The new `EC = EW` metric endpoint, equality-closure
core, carrier adapter, matcher, and regression are not present at this analysis
checkpoint.  The saved `formalized_structural_core: null` is therefore accurate.

## Pinned checkpoint

- checkpoint:
  `scratch/atail-force/common_system_metric_probe.json`;
- checkpoint SHA-256:
  `34ba4597f170936b94b7f2899fca7625172345909537c2964249f49f37352335`;
- profile: `(5,5,5)` / `CARD-EQ-12`;
- round: `24`;
- assignment SHA-256:
  `6a85d7de95b8b6530137b05ff58d31e88817f953c14960a62a82c0e748874e1e`;
- incidence result: `SAT` in `40` nodes;
- current matcher source SHA-256:
  `b3109162ff5e4cb9366a61e15878fc335eeb8a0d602baa010b5ed61333deff21`;
- reused round-20 core source SHA-256:
  `efcf689628d8f67ffa2bb196654602171c7e4f949143ca34492258efb6657c61`;
- prior round-20 skeptic audit SHA-256:
  `ffeb7ce7dbae4a66dcabf922174fd5da1e9d6e065dc1a0e7b7875e576a9c96de`.

The rows are

```text
0:{1,2,3,4}
1:{0,2,6,7}
2:{3,8,9,10}
3:{1,4,5,6}
4:{2,5,8,11}.
```

The fixed-frame hull order is

```text
(0,9,10,11,1,3,4,5,2,6,7,8).
```

The round record says

```text
formalized_structural_core = null
full_equality_ideal.status = UNDECIDED_ORACLE_DISAGREEMENT_OR_TIMEOUT
full_equality_ideal.verdicts = [TIMEOUT, NONUNIT, NONUNIT]
reported_status = UNDECIDED_FAIL_CLOSED.
```

That fail-closed status must not be silently upgraded in the checkpoint.  A
larger external CAS probe is reported separately below.

## Bank, indexed-search, and current-core preflight

The required registries were inspected before deriving the new endpoint:

- `docs/general-n-certificate-bank-mining-2026-07-09.md`;
- `certificates/p97_rvol_general_n_mining.{md,json}`;
- `certificates/erdos97_legacy_general_n_mining.{md,json}`; and
- `certificates/erdos_general_theorem_p97_mining.{md,json}`.

Indexed searches covered five-row convex-order obstructions, two-circle common
chords, equal-distance chains, split bridges, triangle inequalities, and the
specific `EC = EW`, `CD = CW` surface.  They recover the current Census-554
order cores and the sibling cap-arc inequalities, but no exact theorem with the
round-24 terminal surface.

A direct replay of the current `scan_formalized_core` on these five exact rows
and the saved hull order returns

```text
None.
```

**EMPIRICALLY VERIFIED, EXHAUSTIVE WITHIN THE PINNED REGISTRIES AND THE
DECLARED HYPOTHESIS-UNIFICATION MODEL.**  A CSP unification pass tested all
`131` direct sibling `metric-point-uniform : False` surfaces with row-equality,
positivity, distinctness, and exact-row off-radius hypotheses.  It found zero
embeddings, zero timeouts, and used at most `1,473` nodes.  The two remaining
structured sibling packet wrappers reduce to direct metric surfaces already in
that zero-hit set.  The two legacy registries each expose only the same three
Radon eliminators, whose convex-hull/segment antecedents are not supplied here.

This is an exhaustive negative result for the stated inventories and matcher
model, not a proof that no combination of bank lemmas could contribute.
Class-level U5 statement shapes are not exact embeddings: this finite shadow
does not produce `CounterexampleData`, a dangerous-triple packet, or any of the
required `U5Q*Class` witnesses.

### Equality quotient and the unique separation near-hit

The five rows generate exactly four nontrivial undirected distance-edge
classes:

```text
{0-1,0-2,0-3,0-4,1-2,1-6,1-7}
{1-3,3-4,3-5,3-6}
{2-3,2-8,2-9,2-10}
{2-4,4-5,4-8,4-11}.
```

The only two-center/two-common-point equality pair is

```text
centers (Q,V) = (0,3),
common points (U,Y) = (1,4).
```

Indeed `QU = QY` and `VU = VY`.  Its selected cyclic order is, however,

```text
Q,U,V,Y = 0,1,3,4,
```

so the common points alternate across the centers.  This is the order required
by `SeparationCore.SharedPairSeparationCore`, not the forbidden same-side order
from round 23.  Thus the strongest local bank near-hit fails at exactly one
antecedent, and that antecedent is correctly false.

## Exact seven-label core

Use

```text
O = 0, A = 1, C = 2, D = 3, E = 4, U = 6, W = 8.
```

Only the following equalities are used:

```text
OA = OC = AC = OD = OE,
DA = DE = DU,
AO = AU,
CD = CW,
EC = EW.
```

They come from exactly fourteen support-membership facts:

```text
A,C,D,E in row(O),
O,C,U   in row(A),
D,W     in row(C),
A,E,U   in row(D),
C,W     in row(E).
```

Labels `5,7,9,10,11` and every exact-row exclusion are irrelevant to this
core.  All five rows are nevertheless used.

The saved hull order restricts to

```text
O,A,D,E,C,U,W.
```

The proof only needs the five-label cyclic subsequence

```text
O,A,D,E,C,
```

which supplies one common strict sign for

```text
OAC, OAD, OAE, OEC.
```

`BoundaryIndexing` exposes these as negative `signedArea2` in the repository's
convention.  As in round 20, reflect the realization once and feed the positive
normalized helper, or provide a reflected negative-sign consumer.  No sign is
assumed independently of the boundary order.

## Exact normalized contradiction

Normalize by the orientation-preserving similarity sending

```text
O -> (0,0),
A -> (1,0).
```

Write

```text
C = (1/2,h),
D = (x,y),
E = (w,z).
```

The base equalities and the four strict orientations give

```text
h^2 = 3/4,  h > 0,
x^2+y^2 = 1,  y > 0,
w^2+z^2 = 1,  z > 0.
```

### Reused split-bridge bounds

The equality `DA = DE` and the unit equations select the nondegenerate
reflection branch

```text
w = 2*x^2 - 1,
z = 2*x*y.
```

The sign `OEC` then yields the exact strict inequality used in the round-20
proof and, after its division-free square argument,

```text
h < x.
```

The first bridge is unchanged:

```text
AU = AO = 1,
DU = DA.
```

Triangle `A,D,U` gives

```text
1 = AU <= AD + DU = 2*AD,
```

and `AD^2 = 2-2*x` therefore gives

```text
x <= 7/8.
```

The already-audited normalized estimate continues to apply verbatim and gives

```text
CE^2 < 3/50 < 1/16,
```

hence

```text
CE < 1/4.
```

The exact final squared slack is

```text
1/16 - 3/50 = 1/400.
```

### New complementary lower bound

From `h^2 = 3/4` and `h > 0`,

```text
h < 7/8,
```

because

```text
(7/8)^2 - h^2 = 49/64 - 3/4 = 1/64 > 0.
```

Since `h < x`, `x^2+y^2=1`, and `y>0`,

```text
y^2 < 1/4,
y < 1/2.
```

Consequently

```text
2*h*y < h < 7/8.
```

Together with `x <= 7/8`, this gives

```text
x + 2*h*y < 7/4.
```

The exact coordinate identity already present in the round-20 derivation is

```text
CD^2 = (1/2-x)^2 + (h-y)^2
     = 2 - x - 2*h*y.
```

It follows that

```text
CD^2 > 1/4,
CD > 1/2.
```

No trigonometric monotonicity or division is needed.

### Round-24 terminal step

Rows 2 and 4 give

```text
CD = CW,
CE = EW.
```

Triangle `C,E,W` gives

```text
CW <= CE + EW.
```

Substitution yields

```text
1/2 < CD = CW <= CE + EW = 2*CE < 1/2,
```

which is impossible.

## Larger bounded CAS rerun

This computation is diagnostic only; the geometric proof above does not use
it.

The saved three-oracle run used a 30-second per-call budget and returned

```text
Singular forward variables: TIMEOUT
msolve forward variables:  NONUNIT
msolve reverse variables:  NONUNIT.
```

The canonical forward-variable Singular 4.4.1 run was repeated over `QQ` with
a 120-second cap and again returned

```text
TIMEOUT.
```

With the same polynomial system and the ring variables reversed, Singular
4.4.1 returned

```text
NONUNIT
```

within the 120-second cap (about 0.6 seconds wall time in this run).  This
agrees with both msolve 0.10.1 orderings.

**EXTERNALLY EXACT CAS EVIDENCE, NOT A KERNEL CERTIFICATE.**  The completed
computations use exact rational arithmetic and support a nonunit equality
ideal, but no proof artifact was replayed in Lean.  The canonical configured
crosscheck still contains a timeout, so the checked-in status remains
`UNDECIDED_FAIL_CLOSED` until the probe policy itself is deliberately changed
and revalidated.

## General theorem emerging from rounds 20 and 24

The two residuals share a cardinality-independent seven-point backbone.  That
backbone forces the metric gap bundle

```text
EA > 24/25,
1/2 < CD < 3/5,
CE < 1/4
```

after normalizing `OA = 1`.

For any terminal point `W` with `CW = CD`, it follows simultaneously that

```text
EW != EA,
EW != EC.
```

- round 20 violates the first exclusion with `EW = EA`;
- round 24 violates the second exclusion with `EW = EC`.

This suggests one reusable `SplitBridgeBackbone` bound theorem plus two thin
terminal consumers, rather than two unrelated seven-point algebra proofs.  It
is independent of `card = 12`; a matcher should recognize it at any finite
carrier cardinality.

## Minimal implementation plan

1. Refactor or extend the private round-20 `normalized_split_bridge_bounds` so
   it exposes `h < x` or directly adds `1/4 < CD^2` to its returned bundle.
   Preserve the already-audited proof rather than replacing it with a new
   Ptolemy/trigonometric route.
2. Add a second metric endpoint consuming `CD = CW` and `EC = EW`; optionally
   package both round-20 and round-24 endpoint exclusions under one shared
   backbone theorem.
3. Define an `EqualityCore` structure identical to the round-20 split-bridge
   core except that its final field is

   ```text
   EC_EW : EdgeClosure R (E,C) (E,W).
   ```

4. Clone the reviewed carrier adapter with the single semantic change

   ```text
   a_mem_e  ->  c_mem_e.
   ```

   The other thirteen memberships and all four boundary signs are unchanged.
5. Register a monotone matcher for

   ```text
   OA=OC=AC=OD=OE,
   DA=DE=DU,
   AO=AU,
   CD=CW,
   EC=EW,
   cyclic O,A,D,E,C.
   ```

6. Add a pinned round-24 regression, verify that greedy minimization retains
   all five rows, and add a negative control breaking `EC = EW`.
7. Only after the new kernel, adapter, axiom audit, tests, and checkpoint replay
   pass should round 24 be accepted as a structural cut and its successor be
   treated as the next live residual.
