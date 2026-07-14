# ATAIL global-count and same-cap production boundary (2026-07-13)

## Scope and rigor labels

This audit records authorized parallel research on the card-at-least-12 ATAIL
lane.  It does not change the shared Route-B Lean source, the proof-blueprint
anchor, the closure matrix, or the closure plan.  Card 11 and LIVE-T1 remain
outside this artifact's scope.

Claims use the following labels.

- **PROVEN:** present in current Lean, or an elementary consequence of named
  current Lean facts with the complete argument recorded here.
- **EMPIRICALLY VERIFIED:** replayed exactly by the deterministic finite-shadow
  validator, but not a Lean-kernel theorem or Euclidean realization.
- **CONJECTURED:** a precise theorem target not currently proved.
- **HEURISTIC:** a research ranking or interpretation.

Before deriving the boundary, the theorem-bank registries required by
`AGENTS.md` were checked, including the sibling `p97-rvol` census and the U5
incidence families.  The banks contain many contradiction consumers, but no
theorem classifying the live K-A packet into one of their antecedents.  The
legacy same-cap files likewise contain consumers of an already-constructed
edge, not a producer from the current live hypotheses.

## Verdict

**PROVEN.** The current ordered-cap pair count does not contradict either
card-12 cap profile.  Adding a global `CriticalShellSystem` gives blocker
source tags and an exact-row cover, but it does not add independent pair
incidences at a blocker center.

**EMPIRICALLY VERIFIED.** Both card-12 profiles admit explicit finite shadows
which satisfy the current count, exact abstract K4 rows, common-system blocker
provenance, one-sided ordered-cap row injectivity, endpoint one-hit,
outside-pair uniqueness, cyclic shared-pair separation, and absence of the
desired two-point joint apex fiber.

**PROVEN scope boundary.** These are not Euclidean counterexamples.  They omit
coordinates, full convex and strict-cap geometry, the full
`MinorCapChainModel`, MEC/non-obtuse geometry, and other live K-A fields.  They
show that a closure proof must use a new real-metric/order-realizability
coupling rather than a sharper presentation of the existing finite count.

## 1. Current Lean count

The relevant current declarations are in
`lean/Erdos9796Proof/P97/CapSelectedRowCounting.lean`:

- `outsidePair_unique_capCenter` says that two distinct centers in one strict
  ordered cap cannot be equidistant from the same two distinct points outside
  that cap;
- `orderedCap_outsidePairCount_sum_le` sums the outside pairs selected by all
  cap-center rows and bounds them by all pairs in the cap complement; and
- `orderedCap_card_add_four_le_choose_outside` packages the resulting lower
  bound

  ```text
  m + 4 <= choose(|A \ C|, 2).
  ```

The `m+4` is exact bookkeeping, not a heuristic.  An interior cap-center row
has at most two support points in the cap and therefore at least two outside,
contributing at least one outside pair.  Each of the two endpoint-center rows
has at most one support point in the cap and therefore at least three outside,
contributing at least three pairs.  Hence

```text
(m - 2) * 1 + 2 * 3 = m + 4.
```

Outside-pair uniqueness makes these contributions disjoint between distinct
centers of that cap.

For the two card-12 profiles the theorem gives:

| profile | cap size `m` | proved lower `m+4` | pair capacity | slack |
|---|---:|---:|---:|---:|
| `(5,5,5)` | `5` | `9` | `choose(7,2)=21` | `12` |
| `(4,5,6)` | `4` | `8` | `choose(8,2)=28` | `20` |
| `(4,5,6)` | `5` | `9` | `choose(7,2)=21` | `12` |
| `(4,5,6)` | `6` | `10` | `choose(6,2)=15` | `5` |

Thus neither individual cap nor the sum over the three caps is close to an
overflow contradiction.  The summed proved lower is `27` in both profiles;
the summed capacities are `63` and `64` respectively.

### 1.1 What the critical-shell system adds

The relevant current declarations in
`lean/Erdos9796Proof/P97/U1CarrierInjection.lean` are
`CriticalShellSystem.source_mem_selectedFourClass` and
`CriticalShellSystem.selectedFourClass_support_eq_shell`.

**PROVEN, elementary consequence.** Let `f` be `blockerVertex`, and choose one
global selected four-class `K_c` at every carrier center `c`.  If `f(q)=c`,
then `source_mem_selectedFourClass` puts `q` in `K_c.support`.  Distinct
sources remain distinct carrier points, so

```text
|f^{-1}(c)| <= |K_c.support| = 4.
```

The blocker-image rows cover every source, giving

```text
|A| <= 4 * |image f|.
```

This forces at least `ceil(|A|/4)` blocker centers, but not a pair collision.
At a chosen blocker center,
`selectedFourClass_support_eq_shell` identifies every independently chosen
global selected row with the same four-point critical support.  Counting the
global row and the critical row separately would therefore double-count the
same outside pairs.  Common critical provenance supplies useful labels and
deletion information, but no second copy of the row incidence.

This is the exact obstruction to a raw global double count: the new lower
information is linear in `|A|`, while a balanced cap complement has a
quadratic pair-slot supply.

## 2. Reproducible strengthened shadows

The owned artifact is
`scratch/atail-force/global_count_boundary/`:

- `shadows.json` pins both row systems, cap frames, labels, blocker maps, and
  expected statistics;
- `manifest.json` records every encoded field and every omitted field;
- `validator.py` reconstructs the symmetric abstract distance classes and
  checks the models without a solver;
- `test_validator.py` contains replay and fail-closed mutation tests; and
- `checkpoint.json` pins the complete deterministic report and input hashes.

The abstract distance model assigns one radius label to the four row edges at
each center.  Reciprocal row membership is forbidden, so an unordered edge
belongs to at most one radius star.  All other edges receive fresh symmetric
labels.  The validator then checks directly that every chosen row is the
complete four-point class for its radius and that deleting any source at its
chosen blocker leaves no four-point class at that blocker.

The saved blocker row for every source is exactly the global row at its
blocker center.  In particular, the dangerous source has common provenance
`t2 -> p`; this is stronger than the current leaf signature, where `rows` and
`hcritical` are independent arguments.

### 2.1 Exact replay results

**EMPIRICALLY VERIFIED, exact within the encoded finite model.**

| profile | dangerous labels `(p,q,t1,t2,t3,u)` | blocker cycle | blocker image / max fiber | shared row pairs | cap pair usage / capacity | max joint off-surplus fiber |
|---|---|---|---:|---:|---|---:|
| `(5,5,5)` | `(0,3,7,6,9,1)` | `0 -> 1 -> 4 -> 2 -> 3 -> 0` | `5 / 4` | `11` | `9/21, 11/21, 13/21` | `1` |
| `(4,5,6)` | `(0,4,5,2,9,1)` | `0 -> 1 -> 2 -> 0` | `5 / 4` | `8` | `8/28, 15/21, 10/15` | `1` |

For `(5,5,5)`, the surplus endpoints' selected rows have only point `7`
jointly off the surplus cap.  For `(4,5,6)`, the corresponding singleton is
point `11`.  The validator checks all abstract two-center distance signatures,
not just those two displayed selected-row intersections, and finds maximum
off-surplus joint fiber one in both cases.

Both shadows also satisfy:

1. every row has four distinct carrier points and omits its center;
2. distinct-center row supports overlap in at most two points;
3. whenever two rows share two points, those points cyclically separate the
   two centers;
4. for every cap center, the row has at most one hit on either side in the
   cap order, and an endpoint-center row has at most one cap hit total;
5. no outside pair is reused by two centers of the same cap;
6. every source lies in the exact row at its nonfixed blocker center;
7. every blocker fiber has cardinality at most four;
8. deleting a source destroys the unique four-point class at its blocker in
   the abstract distance model;
9. the dangerous `p` row is exactly `{q,t1,t2,t3}`, `t2` maps to `p`, and `u`
   has a different abstract `p`-radius; and
10. no legacy wrong-side endpoint-spending row occurs.

The validated witness usages can exceed the proved `m+4` lower bound, as in
the size-five cap using `15` of `21` slots in the `(4,5,6)` case, without
forcing a collision.

## 3. Fail-closed Euclidean and live omissions

**PROVEN scope boundary.** A finite equality/incidence shadow is not a metric
space, much less a convex Euclidean configuration.  Successful replay does
not refute `DoubleApexOffSurplusSharedRadiusPair` or the proposed same-cap
second-center producer.

The load-bearing omissions include:

- coordinates in `R^2`, triangle inequalities, and polynomial distance
  realizability;
- `ConvexIndep` and geometric noncollinearity;
- the full signed-area/subchord content of `StrictCapOrder`;
- the full analytic content of `MinorCapChainModel`;
- minimum-enclosing-circle, non-obtuse, and circumscribed-Moser geometry;
- geometric construction of `CapTriple`, `SurplusCapPacket`, and
  `leafSurplusPacket`;
- the exact geometric `hNoM44` predicate rather than its profile consequence;
- all live-data fields not reduced to the encoded dangerous exact row and
  off-radius selected point;
- exhaustive named-label placements and exhaustive row systems; and
- card 11.

The validator refuses target-faithful promotion while this omission list is
nonempty.  Its only successful status is
`VALIDATED_STRENGTHENED_FINITE_SHADOW_ONLY`.

**HEURISTIC interpretation.** Full Euclidean ordered-cap geometry may still
exclude both shadows.  If so, the useful output is a small recurring metric
or cap-order incompatibility which can be generalized and proved in Lean.
The finite count itself has already been exhausted by these witnesses.

## 4. Legacy same-cap packages are consumers

The sibling files

```text
~/projects/math-projects/p97-rvol/lean/RVOL/P97/WitnessLapInterface.lean
~/projects/math-projects/p97-rvol/lean/RVOL/P97/U1kWrongSideDischarge.lean
~/projects/math-projects/p97-rvol/lean/RVOL/P97/U1kSourcePushout.lean
```

define and consume `SameCapIncompatibleEdge`.

- The structure carries a source index, center index, spent endpoint side,
  cap membership, and the endpoint/source radius equality.
- `samecap_wrongSide_right_contradiction` and its mirror require an existing
  edge, a `MinorCapChainModel`, and the wrong-side order.
- `source_pushout_right` and its mirror require the same edge plus endpoint
  exclusions and conclude that the center lies inside the spent-side rank
  interval.
- `ConsecutiveOppositeEndpointEdges.order_chain` consumes two already-built
  opposite-endpoint edges and returns their order chain.

Repository-wide search found no constructor producing such an edge from the
live K-A or `CriticalShellSystem` hypotheses.

The `(5,5,5)` shadow makes the limitation concrete.  Inside cap
`[0,1,2,3,4]`, its blocker cycle contains the consecutive edges

```text
4 -> 2, spending endpoint 0;
2 -> 3, spending endpoint 4.
```

Their endpoint-radius labels and source-pushout orders both hold in the
abstract row model, while the endpoint sides are opposite.  This instantiates
the finite packet shape of the legacy consecutive-opposite-endpoint scaffold,
not its omitted Euclidean `MinorCapChainModel`.  No current theorem in that
package derives a contradiction from the packet shape alone, and all
wrong-side configurations are absent.

Thus the legacy files are reusable downstream once a suitable edge or edge
chain has been produced.  They do not provide that production step.

## 5. Remaining theorem target

The checked consumer boundary remains
`DangerousRowSameCapSecondCenter.false` in
`scratch/atail-force/same_cap_second_center.lean`.

**CONJECTURED.** The smallest recommended new producer retains a common
critical system and proves that some distinct center in the same cap as `p`
has a critical shell containing two dangerous-row points outside that cap:

```lean
theorem dangerousRow_sameCap_secondCriticalCenter
    (P : LiveCriticalRowProvenance rows f2Row)
    (all current K-A binders) :
  ∃ k source hsource x w,
    p ∈ S.capByIndex k ∧
    P.system.centerAt source hsource ∈ S.capByIndex k ∧
    P.system.centerAt source hsource ≠ p ∧
    x ≠ w ∧
    x ∈ ({q,t1,t2,t3} : Finset ℝ²) ∧
    w ∈ ({q,t1,t2,t3} : Finset ℝ²) ∧
    x ∉ S.capByIndex k ∧ w ∉ S.capByIndex k ∧
    x ∈ (P.system.selectedAt source hsource).support ∧
    w ∈ (P.system.selectedAt source hsource).support
```

The dangerous row supplies equality at `p`; the second critical shell supplies
equality at the new center; and `outsidePair_unique_capCenter` gives `False`.

Common provenance is required for this route.  The actual outer Route-B caller
already constructs the supplied rows and additional row from one
`Hcritical`, but the leaf target accepts `rows` and `hcritical` independently.
Without an explicit provenance packet, equal-center support locking and the
deletion-blocker fact cannot be transferred from the independently supplied
system to the dangerous `t2` row.

An alternative legacy route would first need a theorem producing enough
endpoint-spending same-cap edges, together with the correct cap model and a
closure theorem for the opposite-endpoint or cross-cap continuation.  No such
production theorem was found, and the finite witnesses show that the current
one-sided and counting consequences do not supply it.

## 6. Reproduction

From the repository root:

```bash
PYTHONDONTWRITEBYTECODE=1 PYTHONPATH=. .venv/bin/python \
  scratch/atail-force/global_count_boundary/validator.py --check
```

Exact output:

```text
status: VALIDATED_STRENGTHENED_FINITE_SHADOW_ONLY
checkpoint: MATCH (2 cases)
(5, 5, 5): cap-pairs 9/21, 11/21, 13/21; max-joint 1; wrong-side 0
(4, 5, 6): cap-pairs 8/28, 15/21, 10/15; max-joint 1; wrong-side 0
```

Mutation and replay tests:

```bash
PYTHONDONTWRITEBYTECODE=1 PYTHONPATH=. .venv/bin/python -m unittest -v \
  scratch/atail-force/global_count_boundary/test_validator.py
```

Current result:

```text
10/10 tests passed
```

The checkpoint pins:

```text
manifest SHA-256  21a7345c9249fa98959494a64ef78c151c43e8a2f982d9b7d4a77122da6d55ed
shadows SHA-256   6eed843ad497cc089c3403e5fe03ad153cb3a8f57c8ebd2c34d7f8064ee7e97c
```

No Lean file was changed, so this artifact has no new Lean build claim.
