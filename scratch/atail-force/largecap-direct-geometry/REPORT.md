# Large-cap direct-geometry closure audit

Date: 2026-07-17

Status: **NO SHORT DIRECT CONTRADICTION FOUND. THE LIVE GEOMETRY IS STRICTLY
STRONGER THAN THE ANONYMOUS N=14 SURFACE, BUT THE NEW FORCE NORMALIZES TO A
SOURCE-INDEXED DELETION-SURVIVAL COVER AND THE EXISTING RETAINED-PARENT
TERMINAL SURFACE. NEITHER HAS A CURRENT `False` CONSUMER. NO PRODUCTION
`sorry` IS CLOSED.**

This lane is confined to
`scratch/atail-force/largecap-direct-geometry/`. It does not edit production
Lean, shared closure documents, `surplusM44`, card-five work, the active
`ShellCurvature` lane, or protected FA/unique-row lanes. No Lean or Lake
command was run.

## Exact public input and target

The corrected live endpoint is

```lean
L : FrontierLargeOppositeCapsBiApexRobustResidual B
```

where

```lean
B : FrontierBiApexRobustResidual R
R : FrontierCommonDeletionParentResidual F
F : CriticalPairFrontier D S radius H
H : CriticalShellSystem D.A
```

and `L` retains

```lean
6 <= S.oppCap1.card
6 <= S.oppCap2.card.
```

The honest public theorem remains direct:

```lean
theorem false_of_largeOppositeCapsBiApexRobust
    (L : FrontierLargeOppositeCapsBiApexRobustResidual B) : False
```

No audited theorem proves this statement. A proof may choose a favorable
critical system late using the checked rebase ladder; it should not expose a
fixed-initial-system producer as the public contract.

The narrowest existing production closing contract is still

```lean
Problem97.ATailCriticalFiberClosingCore.false_of_criticalFiberClosingCore
```

so the exact late-choice sufficient theorem is schematically

```lean
theorem exists_lateCriticalFiberClosingCore_of_largeOppositeCapsBiApexRobust
    (L : FrontierLargeOppositeCapsBiApexRobustResidual B) :
    exists Hfav,
      Nonempty
        (CriticalFiberClosingCore
          (rebaseFrontierCommonDeletionParentResidual R Hfav))
```

This statement is **OPEN**. It is an exact antecedent of a checked consumer,
not a claim that `CriticalFiberClosingCore` is the only possible proof route.

## Required theorem-bank preflight

Before looking for a new local contradiction, this lane checked:

- `docs/general-n-certificate-bank-mining-2026-07-09.md`, especially the
  sibling `p97-rvol` section;
- `certificates/p97_rvol_general_n_mining.{md,json}`;
- `certificates/erdos97_legacy_general_n_mining.{md,json}`;
- `certificates/erdos_general_theorem_p97_mining.{md,json}`; and
- indexed Lean searches for robust-apex blocker fibers, full exact-radius
  filters, prescribed double-deletion failure, source-indexed cross rows,
  large-cap common pairs, and minimal-deletion cores.

The closest reusable consumers are:

- `false_of_criticalFiberClosingCore`;
- the five-point circle/isosceles order consumer (Lemma 81);
- `outsidePair_unique_capCenter`;
- the U5 named-incidence incompatibility families; and
- `u1TwoLargeCapObstruction` in the sibling bank.

None is fed by `L` as currently formalized. All require a positive prescribed
cross-row incidence, a same-pair second center, or a compatible named cyclic
placement that `L` does not yet produce.

## What the anonymous n=14 surface erases

The generic whole-carrier encoder keeps cyclic order, one selected four-row
per center, row/pair intersection bounds, a total blocker map, source
membership, same-blocker support locking, physical-apex omission from the
blocker image, selected-witness strong connectivity, and linear Kalmanson
constraints.

That is a sound overapproximation, but it is not the live decision object.
The following fields are absent or represented only by a weak consequence.

| Live field | Exact extra force | Current closure status |
| --- | --- | --- |
| Full exact-radius critical shells and `no_qfree_at` | Off-support points are genuinely at a different radius; deletion failure is equivalent to membership in the source's exact selected shell; equal actual blockers lock complete supports. | Strong and useful, but it produces classifications and omission/survival edges, not a new positive cross-row hit. |
| MEC/non-obtuse Moser packet and cap geometry | Exact contiguous cap blocks, strict cap interiors, cap-local row bounds, opposite-apex radius classes with at least two strict-cap points, and convex boundary order. | Already drives the retained-pair normal form and outside-pair separation. The residual pair banks and common-deletion cycles are not contradictory in balanced large caps. |
| `D.Minimal` | The global minimum-deletion extractor produces a collision, a packed multi-source disjoint-shell core, or an installed singleton omission. | The three-way reduction is checked; all three consumers remain open. Minimality is no longer an unextracted ingredient, but it is not a terminal. |
| `R.noM44` | Excludes every alternative same-carrier `IsM44` surplus packet, not just the displayed `S`. | For displayed `S`, both opposite caps already have size at least six, so `noM44` gives no further local cardinality or incidence fact. No theorem was found that uses alternative surplus packets to close this branch. |
| Robustness at both physical apices | Both apices are absent from the critical blocker image; the second apex has either a radius class of size at least five or two disjoint exact four-classes. | Existing reductions return a common-deletion continuation, an exact-five continuation, or the protected coupled arm. None is direct `False`. |
| Complete source-indexed critical map | Repeated blocker fibers, source-exact rows, support locking, and actual deletion polarity for every source. | This is the decisive distinction from anonymous rows, but current multiplicity theorems give several sources in one row, not a distinct row through a prescribed pair. |

## Strongest checked geometric normal form

Production already proves

```lean
nonempty_retainedStrictInteriorTerminalSurface
    (R : FrontierCommonDeletionParentResidual F) :
    Nonempty (RetainedStrictInteriorTerminalSurface R)
```

with exactly four source-faithful terminal families:

1. a localized strict-first-cap collision with a fresh common deletion and a
   mutual-omission cycle;
2. a matching source-return with its U5 radius outcome;
3. an endpoint critical fiber with a fresh source and either the desired
   cross hit or another common deletion; or
4. a three-distinct-blocker path with either a closing cross hit or a
   source-exact three-cycle.

The cap-cardinality normalization already consumes the historical
`secondCapLocalizedReverseHit` escape: the reverse shell has exactly two
first-cap points, and a large second cap supplies a fresh strict-second-cap
source outside that shell. Thus there is no additional reverse-hit case for
`L` to eliminate. The remaining gap is after this normal form, not before it.

The separately checked physical-second-apex split adds

```text
one physical radius class of cardinality at least five
or
two support-disjoint exact four-classes at the second apex.
```

No current theorem couples either physical outcome to one of the four
first-apex terminal families above. Treating the two reductions as if their
existential rows were automatically aligned would repeat the anonymous-row
provenance bug.

## Strongest source-indexed consequence not visible in n=14

The most concrete extra force comes from combining full critical-shell
exactness with the actual blocker map.

On the directed frontier cross-membership arm

```lean
F.pair.w in
  (H.selectedAt F.pair.q F.pair.q_mem_A).toCriticalFourShell.support,
```

the checked common-pair classifier says that if deletion of both frontier
sources fails at the actual blocker of a source, that blocker is either the
first physical apex or the already known blocker of `F.pair.q`.

`R.firstApexFullyDeletionRobust` eliminates the first alternative for every
actual blocker. Exact support locking then bounds the exceptional known-
blocker source fiber by four. Since `L` gives `14 <= D.A.card`, at least ten
carrier sources lie outside that fiber.

Consequently the live source data supports the following routine
large-cap-strengthened cover (mathematical statement; not freshly elaborated
in this no-build lane):

```lean
-- abbreviate P := F.pair
-- exceptional := {s | H.centerAt s = H.centerAt P.q}

exceptional.card <= 4
and 10 <= (Finset.univ \ exceptional).card
and forall s notin exceptional,
  HasNEquidistantPointsAt 4 (D.A.erase P.q) (H.centerAt s)
  or
  HasNEquidistantPointsAt 4 (D.A.erase P.w) (H.centerAt s).
```

Before entering that arm,
`cross_deletion_survives_or_cross_membership F.pair` is exhaustive. Its
survival arm already constructs a source-valid common-deletion packet from
the robust first apex and the actual `q` blocker. Thus a branch-complete
direct-geometry reduction has the following honest shape:

```text
another source-valid CommonDeletionTwoCenterPacket
or
a ten-source, two-color frontier-deletion survival cover
```

This is stronger than the anonymous blocker graph: it uses the exact
`no_qfree_at` polarity and full-shell support locking. It is also not a
contradiction. Existing finite regressions admit source-faithful omission
cycles and survival covers when the omitted Euclidean/global coupling is not
present.

## Exact first missing fact

The first missing fact is **not** another arbitrary selected row and is not
another enumeration of literal 555/654 cores.

It is a geometric consumer of the source-indexed two-deletion survival cover:

> For the cap-strengthened bi-apex parent, the sources outside the exceptional
> four-source blocker fiber cannot all be covered by the two classes
> "deleting `q` survives at this source's actual blocker" and "deleting `w`
> survives at this source's actual blocker."

Equivalently, the strongest direct form would force one outside-fiber source
at which both frontier deletions fail. The checked common-pair classifier
would immediately identify its blocker with the exceptional blocker,
contradicting outside-fiber membership. This equivalent existential should
not be introduced as a new intermediate packet: proving it is already the
branch contradiction.

Any proof of the cover consumer must visibly use a field absent from the
anonymous n=14 surface. The available candidates are:

1. a common cap/MEC boundary cut forcing one survival color to create a
   source-valid Kalmanson cycle;
2. cumulative global minimal deletion over several sources, with a monotone
   progress measure that prevents the installed-singleton/common-deletion
   loop; or
3. a coupled physical-second-apex theorem forcing a prescribed pair into a
   distinct actual critical row.

The third form is the earliest exact antecedent shared by the current
production consumers: a **source-valid second row through a prescribed
pair**, followed by its cap/order localization. Full-filter exactness can
turn deletion failure into that membership, but it cannot manufacture the
failure. Cap order can refute a named occurrence, but it cannot choose the
row. This is the precise producer/consumer gap.

## Why the other audited ingredients do not close the gap alone

### Full exact filters

They prove exact nonmembership and uniqueness after a source/blocker/radius
is chosen. They do not force a second prescribed source into that shell. The
current missing statement is positive cross-row incidence, not uncertainty
about whether a displayed support is exact.

### MEC and non-obtuseness

They already yield the cap partition and local cap-chain bounds. The checked
localized-collision audit obtains two distinct outside-pair incidences, not a
repeated pair. Balanced complements have enough capacity for those pairs.
`ShellCurvature` may provide a future packing consumer, but no current theorem
combines multiple source-indexed shells into a contradictory global turn
budget; this lane did not touch that active file.

### Global minimality

The completed extractor is not missing. Its collision, multi-core, and
installed-singleton arms need respectively a physical co-radial pair, a
second center through a repeated outside pair, or a genuine nonreturn/progress
invariant. Re-running the extractor without such a consumer only recreates
the common-deletion cycle.

### `noM44`

On `L`, local use against the displayed packet is redundant with the two
cap-six hypotheses. A nonredundant use would need a theorem constructing a
different Moser support triangle or surplus packet from one survival color
and then contradicting the universal `R.noM44`. No such construction exists
in the checked source or theorem banks.

### Second-apex robustness

Separate K4-survival witnesses after deleting two sources do not place those
sources on one common second-apex circle. This is exactly why the collision
endpoint still lacks the co-radiality consumed by center rigidity. The robust
radius classification is exhaustive, but its rows are not source-aligned
with the first-apex critical pair.

## Route recommendation

Do not resume anonymous whole-carrier mining as the primary proof route and
do not add another producer structure whose consumer is unspecified.

The next theorem-development target should be one of these two equivalent
forms:

1. the direct cover consumer described above, stated from the complete
   `L`/`R`/`F` surface and concluding `False`; or
2. the late-choice exact consumer antecedent
   `exists_lateCriticalFiberClosingCore_of_largeOppositeCapsBiApexRobust`,
   with the proof explicitly deriving a source-valid prescribed-pair row and
   its cap/order placement from the cover plus physical-second-apex geometry.

The first form is preferable as the public theorem. The second is useful only
if the resulting pair lands immediately in
`false_of_criticalFiberClosingCore`.

## Epistemic ledger

- Exact live surface, carrier lower bound, retained-parent normal form,
  physical robust-radius split, common-pair classifier, support locking, and
  blocker-fiber bound: **SOURCE-CHECKED; several are recorded as
  kernel-checked in their owning lanes.**
- The ten-source bound and branch-complete cover: **ROUTINE SOURCE-GROUNDED
  COROLLARY; NOT FRESHLY ELABORATED HERE BECAUSE Lean/Lake builds are paused.**
- A contradiction from that cover plus the complete parent geometry:
  **OPEN MATHEMATICS.**
- A current theorem-bank match from `L`: **NONE FOUND IN THE LISTED BANKS AND
  INDEXED SEARCHES.**
- Production `sorry` closed by this lane: **NONE.**

