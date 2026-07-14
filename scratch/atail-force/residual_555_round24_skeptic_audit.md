# Skeptic audit: round-24 split-bridge terminal

## Audit verdict

**PASS / PROVEN AS AN EXACT EUCLIDEAN CONTRADICTION.**  Two independent
analysis passes agree that the round-24 `(5,5,5)` survivor is impossible in
the saved strict convex order.  The shortest Lean-ready route reuses the
kernel-audited round-20 normalized split-bridge prefix and adds one elementary
lower bound:

```text
CE < 1/4,
CD > 1/2,
CD = CW,
CE = EW,
CW <= CE + EW.
```

These imply `CD < 1/2`, contradicting `CD > 1/2`.

**PASS / NO EXISTING BANK EMBEDDING IN THE AUDITED SCOPE.**  The mandated bank
and indexed-search preflight, an exhaustive direct metric-surface unification,
and a live current-core scan all return no exact existing consumer.  The
strongest four-point near-hit fails precisely at its cyclic-order antecedent.

**PENDING LEAN CLOSURE.**  The shared round-20 normalized prefix is already
kernel-audited, but the new `EC = EW` endpoint, core wrapper, carrier adapter,
matcher, and checkpoint replay were not implemented or built in this audit
lane.  This audit certifies the mathematical route and antecedent map, not a
new kernel declaration.

## Pinned audited surface

- checkpoint:
  `scratch/atail-force/common_system_metric_probe.json`;
- checkpoint SHA-256:
  `34ba4597f170936b94b7f2899fca7625172345909537c2964249f49f37352335`;
- round-24 assignment SHA-256:
  `6a85d7de95b8b6530137b05ff58d31e88817f953c14960a62a82c0e748874e1e`;
- primary round-24 analysis SHA-256:
  `d4a560fac0300460224feed0048668d12c31071bab32173780c97b1d8428ea2f`;
- current matcher source SHA-256:
  `b3109162ff5e4cb9366a61e15878fc335eeb8a0d602baa010b5ed61333deff21`;
- reused round-20 core source SHA-256:
  `efcf689628d8f67ffa2bb196654602171c7e4f949143ca34492258efb6657c61`;
- prior round-20 skeptic audit SHA-256:
  `ffeb7ce7dbae4a66dcabf922174fd5da1e9d6e065dc1a0e7b7875e576a9c96de`.

The exact rows are

```text
0:{1,2,3,4}
1:{0,2,6,7}
2:{3,8,9,10}
3:{1,4,5,6}
4:{2,5,8,11}.
```

The saved hull order is

```text
(0,9,10,11,1,3,4,5,2,6,7,8).
```

The checkpoint record was independently re-read and has

```text
round = 24
nodes = 40
incidence_status = SAT
formalized_structural_core = null
full_equality_ideal =
  UNDECIDED_ORACLE_DISAGREEMENT_OR_TIMEOUT
  [TIMEOUT, NONUNIT, NONUNIT]
reported_status = UNDECIDED_FAIL_CLOSED.
```

## Epistemic ledger

| Claim | Status | Evidence boundary |
|---|---|---|
| The saved row packet contradicts its cyclic order | **PROVEN** | Exact coordinate and triangle-inequality derivation below |
| The normalized prefix through `CE < 1/4` is Lean-valid | **PROVEN / KERNEL-AUDITED REUSE** | Prior direct Lean replay of unchanged round-20 source; standard three axioms |
| The new `CD > 1/2` terminal proof is in Lean | **NOT YET IMPLEMENTED** | Human exact derivation only in this lane |
| A current registered formalized core matches round 24 | **PROVEN NEGATIVE FOR CURRENT SCANNER** | Direct `scan_formalized_core` replay returned `None` |
| A direct theorem-bank metric surface embeds | **EMPIRICALLY VERIFIED NEGATIVE** | Exhaustive over the pinned registries and stated hypothesis-unification model |
| The equality ideal is nonunit | **EXTERNALLY EXACT CAS EVIDENCE** | Three completed exact-arithmetic `NONUNIT` runs; no Lean-replayed certificate |
| The checked-in crosscheck is decisive | **PROVEN NEGATIVE** | Its canonical Singular call timed out, so policy remains fail-closed |

## Existing-theorem audit

The audit followed the repository-required order:

1. inspect the theorem-bank overview and all three concise/exhaustive sibling
   and legacy registries;
2. run concept and exact-name `nthdegree docs search --lean` queries;
3. rerun the current formalized-core scanner;
4. only then derive a new terminal argument.

### Direct bank-unification result

**EMPIRICALLY VERIFIED, EXHAUSTIVE WITHIN THE PINNED REGISTRIES AND DECLARED
HYPOTHESIS MODEL.**  The bank worker tested all `131` direct sibling
`metric-point-uniform : False` surfaces against the round-24 closure.  The CSP
included:

- transitive and flip-closed row-distance equalities;
- theorem positivity and distinctness premises;
- exact-row off-radius exclusions when present; and
- the pinned cyclic order where a surface exposed order premises.

Result:

```text
matches = 0
timeouts = 0
maximum search nodes = 1473.
```

The other two structured sibling packet declarations reduce to the already
tested direct q-critical top/tail metric surfaces.  Each legacy JSON exposes
only three applicable-shape `False` entries, the Radon eliminators; their
convex-hull intersection or segment witnesses are absent.

The class-incidence registries contain superficial coincidences, but these are
not theorem embeddings.  The round-24 checkpoint is explicitly a
target-unfaithful finite shadow and does not supply a live `CounterexampleData`,
`U5DangerousTriple`, `U5QCriticalTripleClass`, or `U5QDeletedK4Class` producer.
The sole deleted-K4 class theorem without the usual dangerous-triple producer
also fails its eight-incidence surface: only centers `{0,1,4}` share any
support point, and no permutation supplies the required memberships.

### Equality quotient

Independent closure reconstruction gives exactly these four nontrivial
undirected edge classes:

```text
K0 = {0-1,0-2,0-3,0-4,1-2,1-6,1-7}
K1 = {1-3,3-4,3-5,3-6}
K2 = {2-3,2-8,2-9,2-10}
K3 = {2-4,4-5,4-8,4-11}.
```

This independently matches the row-by-row derivation used by the geometric
proof.

### Unique two-circle near-hit

The unique two-center/two-common-point closure pair is

```text
centers Q=0, V=3;
common points U=1, Y=4.
```

It satisfies

```text
QU = QY,
VU = VY.
```

The selected cyclic order is

```text
Q,U,V,Y,
```

not `Q,U,Y,V`.  Hence the two common points straddle the center chord, exactly
as `SeparationCore.SharedPairSeparationCore` requires.  The round-23
same-side/reflection theorem is therefore inapplicable for a mathematically
correct reason; reusing it would drop a false order antecedent.

## Exact geometry audit

### Hypothesis extraction

Set

```text
(O,A,C,D,E,U,W) = (0,1,2,3,4,6,8).
```

The rows give exactly

```text
OA = OC = AC = OD = OE,
DA = DE = DU,
AO = AU,
CD = CW,
EC = EW.
```

The membership count is `4+3+2+3+2 = 14`, grouped at centers
`O,A,C,D,E`.  All five rows are load-bearing.  Labels `5,7,9,10,11` and all
off-support exclusions are unused.

The saved order restricts to `O,A,D,E,C,U,W`.  The four triples

```text
OAC, OAD, OAE, OEC
```

therefore have one strict global orientation.  In the repository boundary
convention they are negative; one global reflection supplies the positive
form expected by the normalized round-20 helper.  The reflection preserves
every distance equality.

### Reused normalized prefix

After normalization,

```text
O=(0,0), A=(1,0), C=(1/2,h), D=(x,y), E=(w,z).
```

The exact base facts are

```text
h^2=3/4, h>0,
x^2+y^2=1, y>0,
w^2+z^2=1, z>0.
```

`DA=DE` selects the reflected branch

```text
w=2*x^2-1,
z=2*x*y.
```

The strict `OEC` sign yields `h<x`.  Triangle `A,D,U`, using
`AU=1` and `DU=DA`, yields `AD>=1/2`; since `AD^2=2-2*x`,

```text
x<=7/8.
```

The previously kernel-audited exact estimates then give

```text
CE^2 < 3/50 < 1/16,
CE < 1/4.
```

The strict squared slack is `1/400`.

### Independently checked new lower bound

From `h^2=3/4` and `h>0`,

```text
h<7/8
```

with exact squared gap `1/64`.  Since `h<x`, the unit equation for `D` gives

```text
y^2<1/4,
y<1/2.
```

Thus

```text
2*h*y<h<7/8.
```

Together with `x<=7/8`,

```text
x+2*h*y<7/4.
```

Direct expansion using `h^2=3/4` and `x^2+y^2=1` gives

```text
CD^2=(1/2-x)^2+(h-y)^2=2-x-2*h*y>1/4.
```

Distance nonnegativity now gives `CD>1/2`.  Every strict inequality has a
strict source: `h<x` for the `y` bound and the already strict `CE` estimate
for the final upper bound.  Nothing is divided by an unproved-nonzero scalar.

### Terminal contradiction

Rows 2 and 4 give `CD=CW` and `CE=EW`.  The correctly directed triangle
inequality is

```text
CW <= CE+EW.
```

Therefore

```text
1/2 < CD = CW <= CE+EW = 2*CE < 1/2.
```

This closes the exact metric/order surface.

An independent cyclic-chord/Ptolemy analysis reached the same obstruction,
but it is not the recommended implementation: the coordinate route reuses the
already-audited round-20 prefix and adds only the displayed lower bound.

## External CAS audit

The equality-ideal computation is not used by the proof.

- saved 30-second Singular 4.4.1, canonical variable order: `TIMEOUT`;
- new 120-second Singular 4.4.1, canonical variable order: `TIMEOUT`;
- new Singular 4.4.1, reversed variables, 120-second cap: `NONUNIT`
  (about `0.6` seconds wall time);
- saved msolve 0.10.1, forward variables: `NONUNIT`;
- saved msolve 0.10.1, reversed variables: `NONUNIT`.

The three completed verdicts use exact rational arithmetic and agree, but no
CAS certificate was emitted and checked in Lean.  They are **externally exact
CAS evidence**, not kernel proof.  The checkpoint's configured canonical
three-way result remains mixed and must remain `UNDECIDED_FAIL_CLOSED`.

## Generalization and implementation boundary

Rounds 20 and 24 expose one common `SplitBridgeBackbone`.  In normalized form
it produces

```text
EA > 24/25,
1/2 < CD < 3/5,
CE < 1/4.
```

For a terminal point with `CW=CD`, both radii are excluded:

```text
EW != EA,
EW != EC.
```

Round 20 violates the first exclusion and round 24 violates the second.  The
recommended formalization is therefore one shared bound producer with two
small endpoint consumers, not two independent scalar developments.

Required closure gates remain:

1. expose `h<x` or `1/4<CD^2` from the private normalized helper;
2. implement the `EC=EW` metric/core endpoint;
3. adapt the reviewed round-20 carrier bridge by replacing `a_mem_e` with
   `c_mem_e`;
4. build and audit both orientation consumers and the adapter;
5. register the five-row matcher and its negative controls;
6. replay the pinned checkpoint before accepting round 24 as a cut.

No Lean, matcher, test, checkpoint, production, closure-document, card-11,
LIVE-T1, or proof-blueprint file was edited in this audit lane.
