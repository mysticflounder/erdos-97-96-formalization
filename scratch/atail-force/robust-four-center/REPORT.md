# Robust four-center/global-row audit

Date: 2026-07-14

Status: **CONDITIONAL SINK PROVED; CONVEX/MEC/CAP/NO-`IsM44` LOCAL
PRODUCERS EXACTLY RULED OUT; THE MISSING LAYER IS TOTAL GLOBAL-K4/CSS
COUPLING.**

## Verdict

Global K4 really does give a selected four-row at every carrier support point
of both actual blocker shells.  That fact alone does not force either row to
contain the frontier pair.  If rows at two distinct off-first-apex support
points do contain both sources, the first apex and those two support points
are three distinct carrier centers on the pair's perpendicular bisector, so
`Dumitrescu.perpBisector_apex_bound` gives `False` immediately.

The newly surfaced sibling-bank theorem

```text
Problem97.C5D3B
  .two_le_qAllowedSelected_inter_rowOffAnchors_card_of_sameSideTerminal
```

does reveal a transferable two-hit mechanism, but it does not supply the
missing live producer.  Its proof is:

1. a selected global four-row overlaps one fixed selected base row in at most
   two points;
2. therefore at least two of its four points lie off the base row; and
3. an explicit bounded-support hypothesis confines every off-row point to
   four named anchors.

The live actual blocker shell can replace the sibling theorem's specialized
same-side base row.  The first genuinely unmapped antecedent in that proof
shape is step 3:

```text
Kglobal.support subset Kbase.support union anchors.
```

The sibling `U5QAllowedAuditSupport` carries a stronger, all-audited-centers
version of this confinement as a structure field.  No current theorem
constructs it from the robust frontier.  The exact strict-convex audit below
goes further: convexity, the MEC/cap/no-`IsM44` packet, and K4 at every
currently relevant blocker-support center still do not imply either that
confinement or the strictly weaker two-hit conclusion.  A successful producer
must exploit the omitted all-center K4/total-critical-map coupling.

## Kernel-checked scratch boundary

`RobustFourCenter.lean` proves without `sorry`:

- `two_le_selected_inter_anchors_of_support_confinement`, the abstract form
  of the sibling theorem's complete counting argument;
- `exists_global_rows_at_two_blocker_support_points`, showing that `D.K4`
  supplies global rows at support points of both actual blockers; and
- `false_of_twoBlockerGlobalPairRows`, the direct robust sink when two such
  distinct rows both contain `q,w`.

`RobustParentBoundary.lean` sharpens this interface:

- `nonempty_twoBlockerSupportCenters` selects the two distinct off-first-apex
  support centers from exact shell cardinality alone;
- `nonempty_strictTwoBlockerSupportCenters_of_crossSurvival` uses the live
  cross-omission polarity to choose them away from both frontier sources;
- `nonempty_twoBlockerSupportGlobalRows` supplies their rows from `D.K4`; and
- `false_of_supportCentersBisectFrontierPair` needs only the two metric
  equalities saying those centers bisect `q,w`.

`RobustCapFiveRoleExclusion.lean` also proves that neither actual robust
blocker can satisfy `CapFiveOppositeApexBlockerRole`: both are already distinct
from both non-surplus apices, independently of cap cardinality.

All three printed axiom sets are exactly:

```text
propext, Classical.choice, Quot.sound
```

Thus support-center selection, row existence, the perpendicular-bisector
consumer, and the negative cap-role classification are done.  The direct
robust producer is exactly two support-center bisector equalities; prescribed
pair incidence or support confinement is a stronger sufficient presentation.

## Sibling theorem hypothesis map

| Sibling proof input | Robust-frontier replacement | Status |
|---|---|---|
| specialized same-side row centered at `q` | exact selected row at either actual blocker | mechanism transfers |
| selected four-row at audited center `z` | `D.K4` at a blocker-shell support point | available |
| distinct row centers | positive-radius shell excludes its own center | available |
| overlap with base row at most two | `SelectedFourClass.inter_card_le_two` | available |
| selected row has cardinality four | `exists_selectedFourClass_of_globalK4` | available |
| support lies in base row plus four named anchors | no live analogue | **first missing field** |
| at least two hits among `{q,w,a0,a1}` | does not identify the hits as `{q,w}` | downstream classification still required |

Directly importing the sibling theorem would therefore be wrong.  The live
frontier does not construct `C5D3BSameSideTerminalPacket` or
`U5QAllowedAuditSupport`.  After abstracting away the specialized packet, the
same-side field is not load-bearing for the counting step; bounded support is.

## Exact falsifier for the naive pair-hit producer

`verify_incidence_gap.py` exhaustively checks exact integer squared distances
on the pinned 33-point blocker-graph carrier.  It finds 18 robust-shaped
metric witnesses.  The first has:

```text
q = (0,1),                 w = (3,4)
first apex = (1,3),        second apex = (0,5)
q blocker = (0,6),         w blocker = (0,0)
q shell = {(0,1),(3,2),(4,3),(5,6)}
w shell = {(3,4),(0,5),(4,3),(5,0)}.
```

The checker verifies:

- global K4 at every one of the 33 carrier centers;
- exact deletion-critical four-shells at both actual blockers;
- reciprocal cross-deletion survival and distinct blockers;
- four distinct centers: two apices and two blockers;
- an exact first-apex radius class of cardinality five containing `q,w`;
- K4 at the second apex after deleting `q,w` simultaneously;
- global K4 at every off-source point of both blocker shells; and
- no such support point is equidistant from `q,w`.

The last item means no selected same-radius global row centered at any of
those support points can contain the pair.  The audit is pinned by:

```text
base construction:
a78922fbf1a30e7642019a65859c93d34d45f668e06e0f60310bf780b45c55c5

robust incidence audit:
9369233cf210d17dea60e6126e4ef87a5ee47c7d31fc6994a30071a8f6b4963f
```

This is not a K-A-PAIR counterexample.  The carrier is non-convex and has no
MEC/nonobtuse Moser, surplus-cap, or no-`IsM44` packet.  It proves that any
positive pair-hit or bounded-support theorem must visibly use those omitted
geometric fields; global K4 plus the full robust metric/blocker packet is
insufficient.

## Exact strict-convex/MEC/cap adjudication

`verify_strict_convex_local_gap.py` closes the obvious objection to the
33-point abstraction.  It extends the pinned 14-point cap-local robust model
by five exact rational-rotation triples.  The resulting 29-point carrier has:

- an exact supporting-line certificate for every hull edge against every
  other point, so all 29 points are vertices of one strict convex polygon;
- unique MEC boundary `{O,A,C}`, with the original equilateral non-obtuse
  Moser triangle and every added point strictly inside its circumscribed disk;
- exact cap partition cardinalities `(5,8,19)`, with boundary multiplicities
  checked pointwise, hence no `IsM44` for any permutation of the MEC triple;
- the card-five first-apex row `{A,C,D,E,J}` at `O`, containing `q=E,w=D`;
- the double-deletion-surviving second-apex row `{C,G,K,O}` at `A`;
- actual `q`-blocker row `{A,E,F,I}` at `D` and actual `w`-blocker row
  `{D,X,Y,Z}` at `t1`, with both reciprocal cross-deletion survivals; and
- an exact selected K4 row at every off-source support point
  `A,F,I,X,Y,Z`, while none of those six centers is equidistant from `q,w`.

This is stronger than a convexity-only negative result: it includes the local
MEC, cap, no-`IsM44`, robust blocker, and all-relevant-support-center K4 data.
It is still not a K-A-PAIR counterexample.  It deliberately omits the two
genuinely total live layers:

1. all-center `HasNEquidistantProperty 4`; and
2. a total `CriticalShellSystem` coupling every deletion failure to one fixed
   selected critical map.

The omitted all-center K4 failures occur at `C,E,G,J,K` and at the fifteen new
K4-row support points.  This exact boundary is useful: merely localizing the
six blocker-support rows inside the full MEC/cap geometry cannot prove the
needed incidence.

The construction also falsifies the smaller direct target.  With

```text
T_r = first-apex radius class minus surplus cap = {C,D,E,J},
```

the only second-apex radius class surviving deletion of `q,w` is
`{C,G,K,O}`, and its intersection with `T_r` is `{C}`.  Therefore

```text
exists K2, 2 <= (K2.support inter T_r).card
```

is false in this exact local abstraction.  The stronger structured
confinement is false as well:

```text
{C,G,K,O} is not a subset of {A,E,F,I} union {C,D,E,J}.
```

The symbolic construction is pinned by:

```text
base cap-local checker:
7819cdc85946a931879fc1a530ac64cdb0c62af56b3a0ded2663c0bf033cae16

29-point coordinate payload:
b07182bc396ee9b6131961e2a80f5ce420706bf9bb6f292d90471d80300c83c4

exact verifier source:
98a069a5d763436c11f93dafb51bf7173a1909873abaeef7b74a96a451389698
```

All positivity, equality, distance, hull, disk, cap, and incidence checks are
exact symbolic SymPy checks.  The printed minimum floating hull margin is
diagnostic only; it is not used as the proof test.  This is an exact
certificate within the stated abstraction, but it is not Lean-kernel checked.

## Why the cap-row bank does not yet produce the two hits

Three nearby cap theorems were checked explicitly:

- `selectedFourClass_inter_capByIndex_card_le_two` is an upper bound: a row
  whose center lies in cap `i` has at most two support points in that same
  cap.  It supplies no lower bound in `T_r` and no support containment.
- `outsidePair_unique_capCenter` is a contradiction sink once two distinct
  centers in one ordered cap are already known to bisect the same pair of
  points outside that cap.  It does not manufacture the shared pair.
- `orderedCap_outsidePairCount_sum_le` is an aggregate upper bound on outside
  pairs selected by rows centered in one cap.  It permits rows to use fresh,
  disjoint outside pairs and therefore does not force any prescribed pair or
  marginal hit.

The 29-point model realizes this mismatch exactly.  The second-apex row at
`A` meets the surplus cap only in `O` and the first opposite cap only in `C`;
its remaining points `G,K` lie in the other opposite cap.  Rows at `F,I`
meet their own surplus cap only in `O`, while rows at `X,Y,Z` meet their own
first opposite cap in at most `C`.  Their other support points are fresh
labels in the second opposite cap, so the aggregate outside-pair bound sees
no repeated pair.  All three bank theorems remain satisfied while both the
two-hit and confinement targets fail.

## Parent-call placement

The outer `u1_largeCap_routeB_tail_false` retains the exact chosen
`Hcritical` and builds `Hdepth5Rows` from that same system before entering the
weakened `liveData` helper tree.  A robust theorem may therefore be called at
the parent and consume the actual critical map directly.

That does not yet connect the five named depth-5 sources to the independently
extracted frontier pair `q,w` or to support points of their two blocker rows.
An explicit source/alignment bridge is required before the named rows can be
used to manufacture the missing bounded-support packet.

## Current direct producer targets

The next theorem should not merely assert global rows at blocker-support
points; that is already proved.  The direct robust target is to choose the
automatic centers `zq,zw` and prove

```text
dist zq P.q = dist zq P.w
dist zw P.q = dist zw P.w.
```

`false_of_supportCentersBisectFrontierPair` consumes exactly those two
equalities.  Pair membership in both global rows is sufficient but stronger.
An independent consumer-facing route remains the second-apex two-hit statement

```text
exists K2 : SelectedFourClass D.A S.oppApex2,
  2 <= (K2.support inter
    ((D.A.filter fun x => dist x S.oppApex1 = r) \ S.surplusCap)).card.
```

This avoids prescribing more structure than that downstream argument needs.
The strongest currently visible theorem-bank-shaped sufficient route is the
one-row confinement

```text
exists K2 : SelectedFourClass D.A S.oppApex2,
  K2.support subset
    Kq.support union
    ((D.A.filter fun x => dist x S.oppApex1 = r) \ S.surplusCap),
```

where `Kq` is the selected row of the actual `q` blocker from the retained
`Hcritical`.  The blocker center is distinct from `S.oppApex2`, so
`SelectedFourClass.inter_card_le_two` bounds `K2`'s overlap with `Kq` by two;
the confinement then forces at least two points into the marginal.  This is
exactly the reusable sibling counting mechanism, with no specialized
same-side packet left over.

The direct two-hit target is logically weaker and is the preferred final
producer statement.  The confinement target is the preferred structured
route if the total critical map exposes a support-localization lemma.  The
29-point exact model proves that neither can be derived from just the local
convex/MEC/cap/no-`IsM44` fields plus K4 at the six relevant centers.  The
proof must visibly use all-center K4 and/or total `CriticalShellSystem`
coherence.  A parent-level theorem is the natural placement because
`u1_largeCap_routeB_tail_false` still owns both of those total objects.

The MEC-boundary-row lane independently stops at the closed half-plane power
law and the reciprocal-survival/directed-three-cycle dichotomy.  Its exact
`(5,5,4)` model fails global K4 precisely at the off-boundary points, while
the exact audit here shows that adding global K4 without convex/cap
confinement still does not force the pair hit.  These two boundaries agree.

## Validation

```text
cd lean
lake env lean -M 16384 \
  ../scratch/atail-force/robust-four-center/RobustFourCenter.lean

UV_CACHE_DIR=/tmp/uv-cache-atail uv run python \
  scratch/atail-force/robust-four-center/verify_incidence_gap.py

UV_CACHE_DIR=/tmp/uv-cache-atail uv run python \
  scratch/atail-force/robust-four-center/verify_strict_convex_local_gap.py
```

The three displayed commands exit `0`.  Focused isolated-olean checks of
`RobustParentBoundary.lean` and `RobustCapFiveRoleExclusion.lean` also exit
`0`; every printed endpoint closes under only `propext`, `Classical.choice`,
and `Quot.sound`.  The numerical
`search_strict_convex_extension.py` was used only to discover the rational
parameters; every reported mathematical property is rechecked symbolically
by the pinned exact verifier.  No production file, closure doc, `SurplusM44`
file, or unique-row file was edited.
