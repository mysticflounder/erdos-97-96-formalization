# Original unique-five all-split `M44` route audit

Date: 2026-07-22

Status: **NO TERMINAL `IsM44`/`False` THEOREM WAS OBTAINED. THE EXACT LOCAL
EUCLIDEAN/MEC REGRESSION REMAINS VALID, BUT THE OLD 15-ROLE GLOBAL FIXTURE IS
NOT STRICT-KALMANSON COMPATIBLE. NEW GLOBAL-ROW SEARCHES IN THIS DIRECTORY
ALSO DO NOT GIVE LIVE COVERAGE: THEY SILENTLY IDENTIFY THE 15 NAMED ROLES
WITH THE WHOLE CARRIER AND FORCE EVERY SELECTED ROW TO STAY INSIDE THAT
SET. THE LIVE RESIDUAL HAS ARBITRARY CARRIER CARDINALITY, AND MINIMALITY
FORCES A ROW ESCAPE FROM EVERY PROPER NAMED SUBSET.**

This lane owns only
`scratch/atail-force/unique5-all-split-m44/`. It does not modify production
Lean, shared closure documents, proof-blueprint state, or another scratch
lane. In accordance with the task gate, no Lean declaration was added: the
audit did not reach `IsM44`, `False`, or the exact antecedent of an existing
direct terminal.

## Required theorem-bank preflight

Before attempting a new incidence, metric, or cap theorem, the lane checked
the registries required by `AGENTS.md`:

- `docs/general-n-certificate-bank-mining-2026-07-09.md`;
- `certificates/p97_rvol_general_n_mining.{md,json}`;
- `certificates/erdos97_legacy_general_n_mining.{md,json}`; and
- `certificates/erdos_general_theorem_p97_mining.{md,json}`.

Focused indexed Lean searches covered alternative `SurplusCapPacket`
construction, `IsM44`, exact-four arc counts, all-reverse transition outside
pairs, and co-radial return at the original second apex. The terminal
plumbing already exists:

```lean
Problem97.exists_isM44_of_boundaryTriple_twoExactArcs

Problem97.ATailLargeCapUniqueFivePhysicalOmissionTransitionGlobal
  .false_of_transitionReverseOutsidePair_coRadial_firstApex
```

The first declaration is checked scratch assembly over the production
constructor
`isM44Packet_of_capTriple_two_exact_of_card_gt_nine`. It builds a complete
same-carrier packet from three distinct MEC-boundary carrier points, the
three nonobtuse inner-product inequalities, and two exact four-point
`OnArcOpposite` filters. The second declaration is the existing direct
co-radial terminal. No indexed declaration produces either antecedent from
the original unique-five all-split residual.

## Exact source surface

The audited input is the source-faithful conjunction of:

```lean
R : OriginalUniqueFiveInteriorResidual F
W : ReorientedUniqueFivePhysicalCycle R
```

together with the global all-omissions-reverse-membership relation from
`W.globalRelationSplit` and the negation of every candidate
`OriginalSecondApexCoRadialReversePairOccurrence`.

The reorientation identities are essential:

```text
W.packet.oppApex1 = S.oppApex2
W.packet.oppApex2 = S.oppApex1
W.packet.oppCap1  = S.oppCap2
W.packet.oppCap2  = S.oppCap1
```

Thus the queried co-radial metric on a transition reverse outside pair is
centered at `S.oppApex2`, the original second apex and the reoriented first
apex. The exact-five physical class is centered at `S.oppApex1`, the original
unique-radius apex and the reoriented physical second apex.

On the global all-reverse arm, current production already proves:

1. the physical exact-five strict-cap set has exactly three points;
2. every successor actual blocker lies in the strict physical cap;
3. every successor exact critical shell meets that cap in exactly the
   adjacent source pair;
4. its complement is an exact two-point reverse outside pair; and
5. the direct terminal closes if either outside pair is co-radial from the
   original second apex.

The all-split hypothesis negates item 5 for every candidate. It does not
place a reverse target on the MEC boundary and does not change any cap count.

## What an `IsM44` proof actually has to construct

`SurplusCapPacket.IsM44 T` is not a statement about radius colors or selected
rows. It requires a complete same-carrier nonobtuse circumscribed MEC support
triangle whose two non-surplus closed caps both have cardinality four.

The existing checked assembly theorem makes the missing geometry explicit.
The terminal-ready producer has the following shape (schematic binders only):

```lean
exists a b c : ℝ²,
  a ∈ D.A ∧ b ∈ D.A ∧ c ∈ D.A ∧
  a ∈ MEC.boundary D.A D.nonempty ∧
  b ∈ MEC.boundary D.A D.nonempty ∧
  c ∈ MEC.boundary D.A D.nonempty ∧
  a ≠ b ∧ b ≠ c ∧ a ≠ c ∧
  0 ≤ inner ℝ (b - a) (c - a) ∧
  0 ≤ inner ℝ (c - b) (a - b) ∧
  0 ≤ inner ℝ (a - c) (b - c) ∧
  (D.A.filter (fun x => OnArcOpposite a b c x)).card = 4 ∧
  (D.A.filter (fun x => OnArcOpposite b c a x)).card = 4
```

Once this is available,
`exists_isM44_of_boundaryTriple_twoExactArcs` constructs `T`, and
`R.noM44 T` yields `False`. There is no remaining packet-assembly problem.

Reindexing the displayed triangle cannot work. The designated surplus cap
has cardinality at least five, and the original exact-five strict-interior
packet gives at least three strict points in `S.oppCap1`, hence
`5 <= S.oppCap1.card`. Therefore at most one displayed cap can have
cardinality four. Any `IsM44` packet must use a genuinely different support
triangle and hence a fourth MEC-boundary carrier point.

This gives the first necessary gate on the proposed route:

```lean
4 <= (MEC.boundary D.A D.nonempty).card.
```

It is not sufficient: after a fourth boundary point is found, one must still
select a nonobtuse boundary triple with two exact four-point arcs.

## Exact Euclidean/MEC regression

The strongest relevant current exact witness is
`scratch/atail-force/full-parent-t0t1-exact-model/`. Its independent
`fractions.Fraction` replay was rerun in the current checkout:

```bash
UV_CACHE_DIR=/tmp/p97-unique5-all-split-uv uv run --no-project python \
  scratch/atail-force/full-parent-t0t1-exact-model/\
  verify_exact_source_faithful_full_cell.py \
  --certificate scratch/atail-force/full-parent-t0t1-exact-model/\
  exact-source-faithful-full-cell.json
```

It returned

```text
status = EXACT_RATIONAL_REPLAY_PASS
point_count = 26
cap_sizes = (11,10,8)
coordinate_digest =
  ed4d4520d0b0a00e775ba05fe71cfacc1f2ccf2c4fc1dab65ec42d7294e59d8a
minimum_mec_slack =
  5961799036125637485532448 / 3867804783508507839443747078063 > 0
```

The positive MEC slack is checked for every carrier point except the three
displayed support vertices. Hence the model has exactly three MEC-boundary
points. Every same-carrier `SurplusCapPacket` must use those three points up
to permutation; its cap-cardinality multiset is therefore `(11,10,8)`, so no
`IsM44` packet exists.

After the non-surplus-role swap, the model also realizes the local geometric
content relevant to `OriginalUniqueFiveInteriorResidual`:

- the original first apex has a unique exact five-point class with three
  strict-cap points;
- deleting any two of those strict points destroys K4 at that apex while
  deleting either one preserves it;
- a fresh four-row at the original second apex survives those double
  deletions;
- three complete all-reverse `2+2` critical rows coexist in one exact strict
  convex/MEC/cap order; and
- every reverse outside pair has unequal distance from the original second
  apex.

The witness additionally carries the source-faithful T0/T1 rows, the
retained frontier metric split, an unused critical row, and two common-
deletion sources. It omits the total global K4 property, a total
`CriticalShellSystem` on all 26 sources, and global deletion minimality.

Therefore the following implication is **refuted by exact rational planar
coordinates**:

```text
local Euclidean rank two + strict convex order + MEC/cap geometry
+ exact-five class + all three complete all-reverse rows
+ original-second-apex double-deletion rows
+ all reverse pairs split across original-second-apex radii
+ no alternative IsM44 packet
  -> IsM44 or False.
```

This is not a Problem-97 counterexample because the omitted global fields are
part of `CounterexampleData`/`R`. It is a decisive regression against trying
to prove the requested terminal from cap order, MEC containment, the named
rows, or Euclidean circle equations alone.

## First missing geometric implication

The first new implication must couple the omitted global fields to MEC
support. A minimally stronger gate is:

```lean
-- Schematic, not a declaration.
theorem four_le_mecBoundary_card_of_uniqueFive_allReverse_allSplit
    (R : OriginalUniqueFiveInteriorResidual F)
    (W : ReorientedUniqueFivePhysicalCycle R)
    (hallReverse : GlobalAllOmissionsReverseMembership W)
    (hallSplit : NoOriginalSecondApexCoRadialReversePair W) :
    4 <= (MEC.boundary D.A D.nonempty).card
```

Any valid proof must visibly use at least one field absent from the exact
26-point regression:

1. `D.K4` at every unrepresented carrier center;
2. completeness and source-indexed deletion criticality of the one fixed
   total `H`; or
3. `R.minimal` beyond the displayed local deletion checks.

Proving this boundary-cardinality gate would be genuine progress, but it
would not yet close the branch. The terminal-ready version must strengthen
the conclusion to the boundary triple, nonobtuseness, and two exact arc
counts displayed above. That theorem feeds the existing packet constructor
and `R.noM44` immediately.

## Route verdict

- Do not run another incidence/radius-color CEGAR round on this branch. The
  current all-split finite survivor already decides that abstraction.
- Do not add another conditional `IsM44` wrapper. Packet assembly from a
  two-exact-arc boundary triple is already checked.
- Do not target local MEC/cap/order equations alone. The exact 26-point
  rational witness has all of them, exactly three MEC-boundary points, and
  no `IsM44` packet.
- The only honest continuation of the `M44` route is a global-to-boundary
  theorem using total K4/`H`/minimality, followed by exact arc-count control.
  If that first boundary escape cannot be proved, return to a direct global
  critical/minimality contradiction rather than enlarging the local row
  packet.

## Follow-up audit: what the global K4/CSS/minimality layer actually adds

The next gate was audited separately against the current production APIs,
the global-minimality scratch bank, and both complementary exact regressions.
It does **not** currently prove a fourth MEC-boundary point, a proper
witness-closed subset, or direct `False`.

### The proper-subset route has the wrong direction

Production already proves

```lean
FaithfulCarrierPattern.eq_carrier_of_nonempty_closed
FaithfulCarrierPattern.exists_row_escape_of_proper_subset
```

from `D.Minimal`.  Thus every nonempty proper subset of `D.A` has a selected
row centered inside it whose support leaves it.  Equivalently, a nonempty
selected-row-closed subset is the whole carrier.

For the exact-five omission source set this has already been specialized and
kernel-checked in
`exact-five-omission-cycle-minimality-audit/OmissionCycleMinimalityAudit.lean`:
the cumulative complement is not witness-closed.  Moreover, deleting the
whole source set blocks K4 at every retained actual blocker of a deleted
source, because the deletion removes that source from its own exact critical
shell.  Single-edge deletion survival therefore cannot be composed into a
smaller K4 carrier.

So a proper witness-closed subset is not a missing object that minimality is
expected to produce.  If some independent geometric argument produced one,
`eq_carrier_of_nonempty_closed` would make it an immediate contradiction;
the current all-reverse rows do not produce it.

### Exact separation of the global and geometric halves

Two current exact models locate the remaining logical gap.

1. `unique5-reverse-pair-occurrence/`
   `verify_reoriented_unique5_abstract_countermodel.py` has a total
   fixed-point-free deletion-critical map, a complete K4 radius partition at
   every one of fifteen centers, the global all-reverse relation, all three
   split reverse outside pairs, strong selected-row connectivity, and no
   proper abstract K4 subcarrier among all `32766` nontrivial subsets.  Its
   current replay passes. It is not Euclidean and has no MEC/`noM44`
   semantics. More strongly, the corrective exact checker
   `check_strict_kalmanson_boundary.py` proves that this particular row table
   violates a strict Kalmanson inequality in every one of its `144`
   cap-compatible cyclic orders. It is therefore only a geometry-free finite
   regression, not a geometry-aware survivor.

2. `full-parent-t0t1-exact-model/`
   `verify_exact_source_faithful_full_cell.py` is an exact rational planar
   strict-convex/MEC realization of the local all-split surface.  It has
   exactly the three displayed MEC-boundary points and no alternative
   `IsM44` packet.  It omits all-center K4, a total critical system, and
   global minimality.

The first model shows only that the geometry-free finite projection is
consistent. It does **not** show that global K4, total criticality, cyclic
order, and minimality coexist: its row equalities are killed by strict
Kalmanson. The second shows that the complete local Euclidean/MEC surface
does not escape the three-boundary regime. Neither is a model of the full
live theorem, so they do not refute a genuinely hybrid global-to-MEC theorem.

The independent thirteen-point finite-metric regression in
`exact-five-global-minimality-regression/` gives the same global-side result:
global K4, a total source-faithful critical map, and exhaustive absence of a
proper witness-closed subcarrier coexist with the live exact-five parent-role
marginals while both current terminal occurrences are absent. It likewise
does not supply the live cyclic Euclidean/MEC coupling.

## Kalmanson-aware search correction

This directory contains three follow-up search implementations. Their exact
results are useful regressions, but none has the quantifier shape of the live
theorem.

The shared structural outer in
`search_kalmanson_aware_survivor.py` fixes a carrier `V = Fin 15`, puts a
selected four-row at every center of `V`, requires every such row to be a
subset of `V`, and imposes strong connectivity on this 15-vertex selected-row
graph. It also fixes one cyclic order. In its two-disjoint-exact-four-class
first-apex mode:

- the structural outer is exactly SAT;
- its saved fixed structure is exact-QF_LRA strict-Kalmanson UNSAT;
- the monolithic variable-row strict-Kalmanson query was UNKNOWN after its
  120-second budget;
- deletion-based ordinal CEGAR was UNKNOWN after 300 seconds and 4,106
  blocked literal cores; and
- the integrated exact-QF_BV one-term Kalmanson quotient was UNSAT in 18.4
  seconds.

The one-class-of-cardinality-at-least-five robust mode was added to the
outer, but its first integrated query was interrupted after the source audit
below exposed the invalid coverage boundary. Its result is UNKNOWN and no
orbit enumeration was performed.

The two-class integrated UNSAT result is exact for that fixed finite model.
It is **not** live coverage, not a Lean proof, and not evidence that the live
all-split branch is impossible. In particular:

1. only one cyclic order was decided;
2. only one of the two first-apex robustness modes was decided; and
3. most importantly, the 15 named roles were treated as the entire carrier.

Item 3 is a source error for coverage, not a harmless finite cutoff.
`OriginalUniqueFiveInteriorResidual` has arbitrary carrier cardinality and
does not identify its named roles with all of `D.A`. Production minimality
proves the opposite behavior for a proper named set via

```lean
FaithfulCarrierPattern.exists_row_escape_of_proper_subset
```

Namely, every nonempty proper subset has a center in the subset whose chosen
row contains a point outside it. Thus a search that closes all named rows
inside `Fin 15` has silently assumed either `D.A.card = 15` and role
exhaustion, or a forbidden proper row-closed subcarrier. Its UNSAT result can
only be used as a fixed-card/closed-subcarrier regression.

The predecessor fixture's `144`-order strict-Kalmanson failure is still
useful. It proves that complete global row equalities can create an immediate
geometric contradiction. But it cannot be upgraded to a live theorem by
searching more closed 15-role tables.

## Exact source-valid replacement contract

A future global-row/Kalmanson argument must work over the actual finite
carrier, not a fixed named-role universe. Let `N0` be the finite set of roles
constructed by the exact-five parent and omission cycle. The proof/search
object must retain the following alternative at every finite named set
`N` containing `N0`:

```text
N = D.A
or
there is an actual carrier center c in N whose chosen K4 row contains
an actual point y in D.A \ N.
```

The second alternative must add `y` and the complete source-valid row data
that produced it; it cannot alias `y` to one of the old 15 roles. Because
`D.A` is finite, iterating genuine escapes eventually reaches the whole
carrier, but there is no current cardinality bound making this a fixed-size
enumeration.

The exact terminal-ready theorem sought from that full-carrier object is a
disjunction of existing terminal antecedents with a finite strict-order
cycle. Schematically:

```lean
-- Schematic; not a current declaration.
theorem terminal_or_globalRowStrictCycle
    (R : OriginalUniqueFiveInteriorResidual F)
    (W : ReorientedUniqueFivePhysicalCycle R)
    (hallReverse : GlobalAllOmissionsReverseMembership W)
    (hallSplit : NoOriginalSecondApexCoRadialReversePair W) :
    Nonempty (OriginalSecondApexCoRadialReversePairOccurrence W) ∨
    (∃ T : SurplusCapPacket D.A, T.IsM44) ∨
    Nonempty (SourceFaithfulStrictDistanceCycle D.A H)
```

Here `SourceFaithfulStrictDistanceCycle` must record:

- actual carrier points, not abstract role aliases;
- distance equalities coming from complete selected or critical shells;
- strict comparisons obtained from cyclic convex order by a Kalmanson
  cancellation; and
- a nonempty directed cycle of those comparisons.

The last disjunct closes by repeated `lt_trans` and `lt_irrefl`; the first is
the existing exact co-radial terminal, and the second contradicts `R.noM44`.
Proving this disjunction uniformly over the full carrier is the first honest
global-row target. A bounded search is relevant only if it discovers a
transportable local cycle schema and a separate source theorem proves that
every full carrier contains that schema. Literal closed-carrier UNSAT at one
cardinality is not that theorem.

### Current source endpoint

The strongest generic production boundary theorem is still

```lean
Problem97.boundary_card_ge_three_of_K4
```

which proves only three MEC-boundary carrier points.  The indexed theorem
bank contains no strengthening to four from `D.K4`, `D.Minimal`, or a fixed
`CriticalShellSystem`.  The fixed critical system itself adds exact
source-indexed deletion blockers, but no existing theorem turns an
off-boundary global row into a new MEC support point.

The source-faithful next theorem should therefore be posed under the sharp
three-boundary normal form:

```lean
-- Schematic; not a current declaration.
theorem false_of_exactly_three_mecBoundary_uniqueFive_allReverse_allSplit
    (R : OriginalUniqueFiveInteriorResidual F)
    (W : ReorientedUniqueFivePhysicalCycle R)
    (hallReverse : GlobalAllOmissionsReverseMembership W)
    (hallSplit : NoOriginalSecondApexCoRadialReversePair W)
    (hboundary : (MEC.boundary D.A D.nonempty).card = 3) :
    False
```

Together with `boundary_card_ge_three_of_K4`, this would yield the required
fourth boundary point.  A proof must visibly use a global row or exact
critical shell at a carrier point not represented by the 26-point local
model and relate that row to the three MEC support vertices.  Merely invoking
strong connectivity, a row escape from a proper subset, or another generic
minimal-deletion split cannot suffice: those consequences are already
realized by the abstract global model.

Even this theorem would advance only the first `M44` gate.  It would not by
itself supply the nonobtuse boundary triple and two exact four-point arcs
required by `exists_isM44_of_boundaryTriple_twoExactArcs`.  Consequently the
boundary route remains a two-stage research route, not a near-term packet
assembly task.

### Follow-up route decision

- Do not search for a proper witness-closed subset; production proves that
  every such proper subset has an escaping row.
- Do not claim a generic direct contradiction from global K4/CSS/minimality;
  no current full-carrier cyclic-order theorem supplies it.
- Do not continue the fixed 15-role closed-carrier Kalmanson mining as a
  coverage lane. It has the wrong source quantifiers.
- If using finite search for discovery, require every learned cycle to be a
  transportable schema and prove separately that the actual full carrier
  contains an embedding of it.
- If continuing the `M44` route, target the exactly-three-boundary theorem
  above and require a concrete off-boundary-row/MEC coupling in the proof.
- If no such coupling is found, the shorter terminal target remains one
  original-second-apex co-radial transition reverse outside pair.  It closes
  directly and avoids the additional exact-arc-count stage.

## Epistemic ledger

| Claim | Status |
|---|---|
| Reorientation into the production exact-five physical cycle | **PROVEN / KERNEL-CHECKED in predecessor scratch** |
| Global all-reverse gives three physical vertices and exact `2+2` rows | **PROVEN / KERNEL-CHECKED in production** |
| A co-radial reverse pair closes directly | **PROVEN / KERNEL-CHECKED in production** |
| A nonobtuse MEC boundary triple with two exact four-point arcs constructs `IsM44` | **PROVEN / KERNEL-CHECKED in predecessor scratch** |
| The exact 26-point local Euclidean/MEC row surface has exactly three MEC-boundary points and no `IsM44` packet | **EXACT RATIONAL EXTERNAL REPLAY PLUS SOURCE-PROVEN CAP PERMUTATION ARGUMENT** |
| Local Euclidean/MEC/named-row data force `IsM44` or `False` | **REFUTED BY THAT EXACT LOCAL MODEL** |
| Total K4/criticality/minimality force a fourth MEC-boundary point | **OPEN / CONJECTURED** |
| A nonempty proper selected-row-closed subset follows from the all-reverse cycle | **REFUTED BY PRODUCTION MINIMALITY AND THE KERNEL-CHECKED OMISSION-CYCLE AUDIT** |
| The saved 15-role global fixture is strict-Kalmanson compatible | **REFUTED EXACTLY FOR ALL 144 CAP-COMPATIBLE ORDERS** |
| The variable 15-role two-class outer is ordinal-Kalmanson feasible in its fixed order | **REFUTED BY EXACT-QF_BV UNSAT, BUT ONLY UNDER FIXED-CARD/CLOSED-SUBCARRIER ASSUMPTIONS** |
| That fixed-card UNSAT covers the live residual | **NO; REFUTED BY SOURCE-QUANTIFIER AUDIT** |
| Current full-carrier K4/CSS/minimality plus cyclic order gives direct `False` | **OPEN** |
| Exactly-three MEC boundary plus the full all-reverse/all-split parent is contradictory | **OPEN / CONJECTURED; PRECISE HYBRID NEXT GATE** |
| Full all-split residual constructs an `IsM44` packet or yields `False` | **OPEN** |
| Production `sorry` closed by this lane | **NONE** |
