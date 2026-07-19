# Lemma 81 occurrence audit on the cap-strengthened card-14 surface

Date: 2026-07-17

Status: **NO SOURCE-VALID OCCURRENCE THEOREM IS CURRENTLY AVAILABLE.  LEMMA
81 IS A COMPLETE CONSUMER, BUT THE LARGE-OPPOSITE-CAPS BI-APEX SURFACE DOES
NOT CURRENTLY PRODUCE ITS TWO ACTUAL ROWS AND FIVE-ROLE CYCLIC PLACEMENT.
AN EXACT `(5,6,6)` INCIDENCE/ORDER FIXTURE SATISFIES THE NAMED CARDINALITY,
ROBUSTNESS, COMMON-DELETION, BLOCKER-OMISSION, SOURCE-LOCKING, AND SHARP
CAP-LOCAL ROW CONSEQUENCES WHILE HAVING ZERO LITERAL LEMMA-81 OCCURRENCES.
THE FIXTURE IS NOT A EUCLIDEAN OR FULL-FILTER REALIZATION.  THE REMAINING
LOAD-BEARING FACT MUST COUPLE POSITIVE CRITICAL-ROW INCIDENCE TO CAP ORDER
USING GEOMETRY ERASED BY THAT FIXTURE.**

## Scope

This audit starts from the corrected robust branch

```lean
L : FrontierLargeOppositeCapsBiApexRobustResidual B
```

where `B : FrontierBiApexRobustResidual R`.  Thus the actual source surface
retains:

- the complete frontier and common-deletion parent `R`;
- full deletion robustness at both physical opposite apices;
- one concrete total `CriticalShellSystem` (or, after the checked rebase
  ladder, a critical system chosen late); and
- `6 <= S.oppCap1.card` and `6 <= S.oppCap2.card`, hence
  `14 <= D.A.card`.

Only this directory was modified.  No production Lean, shared plan document,
protected unique-row lane, `ShellCurvature`, `surplusM44`, or card-five
consumer was changed.  No Lean or Lake command was run.

## Required theorem-bank preflight

Before proposing or testing a local row pattern, this audit checked the
registries required by `AGENTS.md`:

- `docs/general-n-certificate-bank-mining-2026-07-09.md`, including the
  sibling `p97-rvol` section and the current 555/654 section;
- `certificates/p97_rvol_general_n_mining.{md,json}`;
- `certificates/erdos97_legacy_general_n_mining.{md,json}`; and
- `certificates/erdos_general_theorem_p97_mining.{md,json}`.

Focused indexed Lean searches were run for the front-before-isosceles
pattern, a source-faithful two-critical-row occurrence, and a large-cap
critical-shell occurrence theorem.  They recover the completed Lemma-81 core
and adapter, the existing critical-fiber consumers, and nearby source-row
packets.  They do not recover a theorem deriving the required positive
cross-row incidence or five-role placement from `L`.

The exact 230/230 fixed-bank match was not treated as occurrence evidence.
Those cores come from the card-12 `(5,5,5)` and `(6,5,4)` frames.  The match
proves that every stored fixed core is consumed *if its source map is already
given*; it does not map a card-at-least-14 live parent to one of those cores.

## Exact statement called Lemma 81

Lemma 81 of `/opt/nfs/verified-results.md` is the following
ambient-cardinality-independent fact.

> Distinct vertices in strict cyclic order `W,F,P,X,Z` cannot satisfy
> `WF = WX = WZ` and `PZ = XZ`.

Production formalizes its metric part as

```lean
Problem97.Census554.FivePointCircleIsoscelesOrderCore.Core R
```

with fields

```text
WF = WX,
WF = WZ,
PZ = XZ,
```

and formalizes the convex-boundary consumer as

```lean
FivePointCircleIsoscelesOrderBridge.false_of_core_of_ccw
```

for boundary indices

```text
iW < iF < iP < iX < iZ.
```

The literal two-row sufficient interface is therefore exactly

```text
W-row contains F, X, Z;
Z-row contains P, X;
W < F < P < X < Z.
```

This is the statement tested below.  No equality-closure path from the
fixed 555/654 bank is used.

## Honest source-valid occurrence packet

For the live critical system, `W` and `Z` should not be anonymous row labels.
They should be actual blocker centers of two sources.  The exact producer
packet can be stated schematically as follows.

```lean
structure CriticalShellLemma81Occurrence
    (H : CriticalShellSystem D.A)
    (boundary : BoundaryIndexing D.A) : Prop where
  sourceW sourceZ : CriticalShellSystem.CarrierVertex D.A
  F P X : CriticalShellSystem.CarrierVertex D.A
  -- abbreviate W := H.blockerVertex sourceW
  --            Z := H.blockerVertex sourceZ
  roles_pairwise_distinct : PairwiseDistinct {W, F, P, X, Z}
  F_mem_W  : F.1 ∈ (H.selectedAt sourceW.1 sourceW.2).support
  X_mem_W  : X.1 ∈ (H.selectedAt sourceW.1 sourceW.2).support
  Z_mem_W  : Z.1 ∈ (H.selectedAt sourceW.1 sourceW.2).support
  P_mem_Z  : P.1 ∈ (H.selectedAt sourceZ.1 sourceZ.2).support
  X_mem_Z  : X.1 ∈ (H.selectedAt sourceZ.1 sourceZ.2).support
  cyclic_order : index W < index F < index P < index X < index Z
```

Exact Lean syntax would use the full-shell projections and either one cut of
the cyclic indexing or the already checked `OrderedFrontSchemaEmbedding`.
The important quantifier order is mathematical: choose the two sources and
their actual blocker rows, then prove the memberships and placement.

If the initial critical system is arbitrary, the preferable internal helper
is the late-choice form

```lean
exists Hfav, CriticalShellLemma81Occurrence Hfav boundary
```

after rebasing `F`, `R`, `B`, and `L` to `Hfav`.  The public branch theorem
should remain direct

```lean
false_of_largeOppositeCapsBiApexRobust L : False.
```

Lemma 81 is one possible internal consumer, not a reason to require this
particular witness shape from the arbitrary initial map.

## What the current source gives, and what it does not

### Exact critical rows

For every source `s`, the critical system gives one actual blocker center and
one full exact four-point radius shell through `s`.  Equal blocker centers
lock to the same complete support.  This proves own-source membership and
turns every nonmember into an off-radius inequality.

It does **not** prove either positive cross-row fact needed above:

```text
the second blocker center Z belongs to the W-shell;
some X belongs to both the W-shell and the Z-shell.
```

Full-filter exactness sharpens known membership and nonmembership.  It does
not manufacture a member of a second prescribed row.

### Bi-apex robustness

Robustness omits both physical apices from the blocker image and yields
blocker multiplicity.  Hence there are two nontrivial fibers or one larger
fiber.  A repeated fiber supplies several sources in **one** actual shell; it
does not supply a distinct `Z`-row meeting that shell.

The stored physical common-deletion rows also do not supply the motif.  Both
omit the deleted frontier source, and the second physical apex is not
equidistant from the retained frontier pair.  Robustness is therefore not a
positive two-row overlap theorem.

### Cap size and order

At the minimal cardinality, `L` forces the exact closed-cap profile `(5,6,6)`
and open-core sizes `(3,4,4)`.  Cap order gives the sharp local row bounds:

- an interior cap center has at most two same-radius support points in its
  own closed cap; and
- a cap endpoint has at most one in each incident closed cap.

Once five valid roles are named, the global CCW indexing closes Lemma 81
immediately.  The bounds do not choose the two rows or force their common
target to lie on the required side of the second row center.

## Exact card-14 incidence/order regression

`check_ordered_incidence_model.py` freezes one fourteen-label fixture in the
correct normalized cap order

```text
v2, I1(3 points), v3, I2(4 points), v1, I3(4 points)
```

with closed-cap profile `(5,6,6)`.  It checks:

- two five-point physical-apex classes, so both physical apices survive every
  single deletion;
- a frontier pair `q,w` in the off-surplus first-apex class, with `q` but not
  `w` in the second-apex class;
- both q-deleted physical four-rows, overlap at most two, and the second-row
  one-hit bound against the first-apex marginal;
- a distinct first-apex four-row surviving simultaneous deletion of `q,w`;
- a fixed-point-free blocker map omitting both physical apices, with two
  nontrivial fibers;
- source membership in each displayed blocker row and one locked
  exact-card-four support per blocker value; and
- the sharp interior-at-most-two and endpoint-at-most-one cap-local bounds
  for every displayed selected row.

It then enumerates every literal five-role assignment.  The exact prefix
counts are

```text
raw two-row assignments                 254
also W < F < P                          144
also W < F < P < X                       40
also W < F < P < X < Z                    0
```

Equivalently, the combined checkpoint printed by the script is

```text
raw/W<F<P/W<F<P<X/full-order counts=(254, 144, 40, 0)
literal_motifs=0
```

So the fixture has abundant positive two-row overlaps, including forty role
assignments reaching `W < F < P < X`, but every one places `Z` before `X` on
that cyclic cut.  Cap cardinality, cap blocks, local cap-row bounds, blocker
omission, and source locking do not force the final compatible placement in
this abstraction.

Replay from the repository root:

```bash
UV_CACHE_DIR=/tmp/p97-uv-cache uv run \
  scratch/atail-force/lemma81-n14-occurrence-audit/\
  check_ordered_incidence_model.py
```

### Rigor boundary

This result is **EXACT WITHIN THE FINITE INCIDENCE/ORDER ABSTRACTION**.  It is
not a Euclidean counterexample and does not refute
`false_of_largeOppositeCapsBiApexRobust L` or a Lemma-81 occurrence theorem
from the complete live surface.

The fixture deliberately omits:

1. coordinates realizing one symmetric Euclidean distance matrix;
2. simultaneous realization of every displayed row equality and every
   off-row inequality, so the displayed exact supports are the
   **full-filter incidence signature**, not realized metric filters;
3. MEC disk containment, the non-obtuse support triangle, and shell-curvature
   inequalities;
4. metric verification of each blocker `no_qfree` fact and all deletion
   witnesses beyond the displayed physical classes; and
5. global cardinal minimality and the universal `noM44` assertion over every
   alternative surplus packet on the carrier.

Any valid proof from `L` must visibly use at least one of these omitted
Euclidean/global fields, or a consequence of them not already represented by
the local cap-row bounds.

## Decisive first missing fact

The earliest absent positive source fact is:

> **Find two actual blocker rows with centers `W,Z` such that `Z` lies in the
> `W`-row and a second point `X` lies in both rows.**

That is the minimal source-faithful two-row skeleton.  It cannot be replaced
by an anonymous equality closure or by 230/230 fixed-bank coverage.  After
that skeleton is found, one still has to choose the remaining members `F` of
the first row and `P` of the second row with

```text
W < F < P < X < Z
```

in one cyclic cut.  The card-14 regression shows this second placement step
is independently load-bearing: even many raw skeletons need not admit the
Lemma-81 order.

Therefore the honest theorem target is the combined
`CriticalShellLemma81Occurrence` packet above (preferably after late favorable
system choice), or a different direct contradiction using the omitted
Euclidean/global data.  More 555/654 fixed-profile mining does not address
either missing fact.

## Bottom line

Lemma 81 is reusable and complete, but it is not yet an occurrence theorem on
`L`.  The corrected next step is not another bank scan.  It is a geometric
source-map theorem that turns the large-cap, full-filter, bi-apex parent into
one positive pair of actual critical rows and then couples that pair to the
five-role cap order.  Until that theorem or a different direct `False`
consumer is proved, Lemma 81 closes no live `sorry`.
