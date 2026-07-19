# Bi-apex MARCO/Kalmanson live-coverage audit

Date: 2026-07-17

Status: **THE CURRENT SEARCH IS THEOREM DISCOVERY ON ONE FIXED
FOURTEEN-ROLE `(8,4,5)` SHADOW; NO WHOLE-CARRIER OR CHOSEN-SUBPACKET
EXTRACTION THEOREM FROM `FrontierBiApexRobustResidual` EXISTS.**

## Verdict

The corrected answer to the coverage question is:

1. **Every live residual does not canonically embed into the current search
   surface.**  A whole-carrier interpretation of fourteen injective labels
   forces `D.A.card = 14`, while the live residual is cardinality-uniform.
2. **No theorem currently extracts even a chosen fourteen-point subpacket.**
   Such an extraction would require `14 <= D.A.card` and closure of the chosen
   points under the represented selected rows and actual critical blockers,
   plus the fixed cap/order and role identities.  The live record does not
   provide those choices or closure facts.
3. **Therefore the current `robust-all-center-marco` and two-omission
   Kalmanson runs are theorem-discovery/regression experiments only.**
   An UNSAT result on that surface would still not close the live endpoint
   without a separate Lean extraction theorem.  The current two-omission run
   is in any case bounded `UNKNOWN`, not UNSAT.

This is a regression gate against further mining of the fixed surface as if
it were a quantified model of every live robust residual.

## The two quantified objects

### Live object

Production
`ATail/PhysicalSecondApexCommonDeletion.lean` defines

```lean
R : FrontierBiApexRobustResidual parent
```

over an arbitrary finite carrier `D.A`.  Its only new field is

```lean
secondApex_robust : FullyDeletionRobustAt D S.oppApex2.
```

The indexed `parent : FrontierCommonDeletionParentResidual F` retains
`D.Minimal`, non-`IsM44`, the concrete `CriticalShellSystem`, the original
frontier pair and common-deletion packet, and only the explicit cardinality
field

```lean
9 < D.A.card.
```

`R.firstApex_robust` derives full deletion robustness at the other physical
apex.  Production `BiApexBlockerMultiplicity.lean` then proves only the
cardinality-uniform blocker-fiber split: two nontrivial fibers or one fiber
with at least three sources.

The higher physical-ingress route can carry both opposite-cap lower bounds
`6 <= S.oppCap1.card` and `6 <= S.oppCap2.card`, which imply
`14 <= D.A.card`.  Those facts are not fields of the bare `R` record and do
not choose a fourteen-role closed subpacket.

### Search object

`robust-all-center-cegar/search.py` fixes, before solving:

```text
PROFILE = (8,4,5)
HULL_NAMES = O,t1,I,F,A,X,Y,Z,D,J,E,C,G,K
carrier labels = exactly 14
surplus cap = {O,t1,I,F,A}                 (card 5)
first opposite cap = {A,X,Y,Z,D,J,E,C}    (card 8)
second opposite cap = {C,G,K,O}           (card 4)
first physical apex = O
second physical apex = A
live q = E
live w = D
exact first-apex class = {A,C,D,E,J}       (card 5)
```

It further fixes the local rows at `O`, `A`, `D`, and `t1`, fixes the actual
blocker identities

```text
E -> D
D -> t1,
```

chooses one represented four-row at every one of the fourteen centers, and
chooses a total blocker value among the same fourteen labels for every one of
the fourteen sources.  It also applies the fixed-profile candidate domains,
pair-intersection bounds, pair-to-center bounds, cyclic row compatibility,
and exactness at represented blocker-image centers.

The two-omission script does not change this quantified domain.  It imports
the same `Surface()`, reapplies the MARCO bank cuts, forbids `O` and `A` in the
represented blocker image, and adds ordinal/full Kalmanson cuts.  It does not
encode `FullyDeletionRobustAt`; it encodes one necessary consequence of
robustness.  The script now correctly requires the explicit flag

```text
--allow-nonlive-profile
```

because its physical second opposite cap has cardinality four, whereas the
intended live large-cap endpoint has cardinality at least six.

## Why whole-carrier coverage is impossible

The adjacent source-valid file
`BiApexMarcoCoverageCardinality.lean` records the cardinality prefix of any
possible live extractor.

```lean
FourteenRoleWholeCarrierCardinalityPrefix R
  -> D.A.card = 14

D.A.card != 14
  -> not (Nonempty (FourteenRoleWholeCarrierCardinalityPrefix R)).
```

Thus the fixed labels cannot enumerate the whole carrier uniformly.  At
ambient cardinality greater than fourteen they are necessarily only a
subpacket; below fourteen they cannot even be injected.

There is a second, independent mismatch.  If the fixed cap profile were
interpreted as the complete live cap profile, it would give
`S.oppCap2.card = 4`.  The checked robust-second-apex geometry proves that
full deletion robustness at the physical second apex is impossible at cap
four.  The 101-shadow endpoint audit likewise finds zero robust extensions.
Hence a faithful interpretation of the fixed profile cannot be the live
robust endpoint.  Any possible use must reinterpret it as a selected
subpacket of a larger cap, which is not what the fixed-profile generator has
been proved to cover.

## Why chosen-subpacket coverage is also open

The adjacent Lean gate proves the necessary condition

```lean
FourteenRoleChosenSubpacketCardinalityPrefix R
  -> 14 <= D.A.card.
```

Even where the higher ingress supplies this bound, cardinality alone is far
from an extraction.  A chosen subpacket must simultaneously contain:

- fourteen distinct live carrier points in the pinned cyclic role order;
- the required `5/8/4` intersections with the three cap chains;
- all five members of the exact first-apex radius class;
- one selected four-row centered at every chosen point, with all four support
  points still inside the chosen subpacket;
- the actual critical blocker of every chosen source, again inside the
  subpacket;
- the fixed source/blocker identities `centerAt E = D` and
  `centerAt D = t1`;
- the fixed `O/A/D/t1` row supports and the `q,w` omission incidences; and
- every fixed-profile candidate, compatibility, pair-capacity, and exactness
  predicate used by the Python verifier.

The live data provides a critical blocker for every carrier source and a K4
row at every carrier center, but neither operation preserves an arbitrarily
chosen fourteen-point subset.  Closing under blockers and four-row supports
can add points, and nothing proves that the closure stabilizes at fourteen or
has the pinned profile.  The frontier pair also does not identify its actual
blockers with `w` and `t1`.

Accordingly, the search is not currently the image of a proved dependent
choice construction from `R`.

## Exact missing Lean contract

Before a fixed-surface UNSAT certificate could count as live coverage, Lean
would need a source-faithful structure equivalent to the following schematic
contract (the capitalized field predicates are the exact verifier concepts
that would first need Lean definitions):

```lean
structure LiveTwoOmissionProfile845Shadow
    (R : FrontierBiApexRobustResidual parent) where
  label : Fin 14 -> CriticalShellSystem.CarrierVertex D.A
  label_injective : Function.Injective label
  cyclic_role_order : PinnedCyclicRoleOrder label
  chosen_cap_profile : ChosenCapIntersections845 label
  exact_first_apex_class : ExactNamedFirstApexFiveClass label
  selectedRow : forall i, SelectedFourClass D.A (label i)
  selectedRow_closed : SelectedRowsClosedUnderRoles label selectedRow
  selectedRow_candidate : RowsInVerifierCandidateDomains label selectedRow
  blockerIndex : Fin 14 -> Fin 14
  blocker_realizes : BlockerIndexRealizes H label blockerIndex
  blocker_omits_both_apices : BlockerIndexOmitsPhysicalApices blockerIndex
  fixed_frontier_roles : FixedFrontierAndBlockerRoles F H label
  fixed_local_rows : FixedOADt1Rows label selectedRow
  verifier_constraints : SurfaceVerifierConstraints label selectedRow blockerIndex
```

The load-bearing extraction theorem would then be

```lean
theorem exists_liveTwoOmissionProfile845Shadow
    (R : FrontierBiApexRobustResidual parent) :
    Nonempty (LiveTwoOmissionProfile845Shadow R).
```

No theorem of this shape exists, and several of its fixed-role fields are not
plausible consequences of an arbitrary `R`.  If the intended theorem is only
for the large-cap ingress, its signature must additionally carry the two
cap-at-least-six premises; that repairs the fourteen-point lower bound but
none of the closure or fixed-role gaps.

A second theorem would still be required to replace the bounded solver run:

```lean
theorem false_of_liveTwoOmissionProfile845Shadow
    (E : LiveTwoOmissionProfile845Shadow R) : False.
```

That theorem must be backed by a checked exhaustive certificate or direct
Lean branch consumers.  The present two-omission run ended `UNKNOWN`, so this
fixed-domain coverage theorem is also absent.

## Consequence for the closure plan

Do not describe the fresh two-omission run as the active coverage gate for
`false_of_frontierBiApexRobustResidual`.  The current surface is disjoint from
the live cap-at-least-six endpoint when read as a whole profile, and no
chosen-subpacket extractor has been proved.

The sound uses that remain are:

- regression testing of proposed local consumers;
- theorem discovery for small selected-row/Kalmanson schemas; and
- replay of already extracted concrete role packets.

The next live proof step must start from a source-faithful producer on the
actual `R` surface (for example one of the current minimal-deletion,
exact-five, or common-deletion residuals), then instantiate a small existing
consumer directly.  A new finite run should begin only after its Lean
extraction predicate is written and its fields are traced to production
theorems.

## Bank and indexed-corpus preflight

Before this audit proposed any new local contradiction, the required sources
were checked:

- `docs/general-n-certificate-bank-mining-2026-07-09.md`;
- `certificates/p97_rvol_general_n_mining.{md,json}`;
- `certificates/erdos97_legacy_general_n_mining.{md,json}`;
- `certificates/erdos_general_theorem_p97_mining.{md,json}`; and
- focused `nthdegree docs search --lean` queries for the live robust residual,
  fixed labeled surface, two omitted blocker values, selected-row subpacket
  extraction, and coverage.

The searches found fixed-row consumers and general boundary-order machinery,
but no live-to-fourteen-role extraction or coverage theorem.

## Validation and epistemic boundary

From `lean/`:

```bash
lake env lean -R .. -M 16384 \
  -o /private/tmp/BiApexMarcoCoverageCardinality.olean \
  ../scratch/atail-force/biapex-marco-coverage-audit/\
BiApexMarcoCoverageCardinality.lean
```

The file compiles.  All three printed declarations depend only on `propext`,
`Classical.choice`, and `Quot.sound`.

- **KERNEL-CHECKED:** the fourteen-role subpacket lower bound, whole-carrier
  equality, and nonexistence at other carrier cardinalities.
- **SOURCE-AUDITED:** the exact fixed search domain and the live production
  record fields listed above.
- **EXACT WITHIN THE PINNED FINITE AUDITS:** zero robust extensions among the
  fixed `(8,4,5)` 101 shadows.
- **NOT PROVED:** chosen-subpacket extraction, fixed-surface exhaustive
  two-omission closure, the live robust contradiction, K-A-PAIR, or any
  production `sorry` closure.
