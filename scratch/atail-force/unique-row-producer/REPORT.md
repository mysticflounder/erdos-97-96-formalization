# ATAIL unique-row producer: card-five branch boundary

Date: 2026-07-14

Status: **CHECKED INTERIOR-SURVIVOR AND CROSS-BLOCKER-LOCALIZATION
INTERMEDIATES, PLUS CONDITIONAL ADAPTER; SOURCE-INDEXED ALL-PAIR SURVIVOR
SEARCH HAS FOUR FIXED SURVIVORS EXCLUDED BY INDEPENDENTLY REPLAYED QQ CORES;
ACCEPTED PRODUCER OPEN.**

This work is isolated to `scratch/atail-force/unique-row-producer/`.  It does
not edit `U1LargeCapRouteBTail.lean`, `ATail/CriticalPairFrontier.lean`, the
closure documents, or any production metric-core module.

## Result

`card_five_distinct_cap_local_producer.lean` proves the conditional adapter

```text
cardFiveCapOrMutualFields_of_frontier_distinct_capLocalCross
```

from a production `CriticalPairFrontier` in the exact card-five branch.  Once
the caller has split to distinct blockers, the complete existing
`CardFiveCapOrMutualFields` packet follows from one additional proposition:

```text
(w is in the selected shell sourced at q
  and centerAt(q) is in the surplus cap)
or
(q is in the selected shell sourced at w
  and centerAt(w) is in the surplus cap).
```

This proposition is named
`CardFiveDistinctCapLocalCrossHypothesis`.  It is the exact first missing live
hypothesis on the distinct-blocker arm.  The frontier pair already supplies:

- both carrier memberships;
- both memberships in the first-apex selected class;
- pair distinctness;
- both off-surplus facts; and
- the same pair for all dependent fields.

The branch split supplies blocker-center distinctness.  No second cross hit,
orientation field, or fresh pair choice is required.  The companion theorem

```text
false_of_frontier_cardFive_distinct_capLocalCross
```

feeds the constructed packet to the existing card-five consumer and closes
the branch immediately.  This is not itself the requested producer: its new
antecedent is exactly the source-indexed metric-incidence fact that remains to
be proved from the live hypotheses.

## Checked unconditional intermediate

`card_five_interior_survivor_pair.lean` proves that an exact card-five class
at `S.oppApex1` has at least three members in the strict interior of the
opposite cap.  The existing one-blocked-source theorem at `S.oppApex2` then
leaves two distinct members whose individual deletion preserves K4 there.
The resulting structure

```text
CardFiveInteriorSurvivorPair
```

retains both strict-interior memberships, both unary second-apex survival
facts, and converts to the production `SurvivorPairRelocationPacket`.  This is
an unconditional reduction of the exact-card-five branch, but it is not one
of the three accepted outputs: it still does not force a cap-local cross hit,
mutual cross incidence, or the coincident-blocker residual-member packet.

## Checked directed-cross blocker localization

`card_five_cross_blocker_localization.lean` strengthens the strict-interior
intermediate in both orientations:

```text
q_blocker_mem_firstInterior_of_cross
w_blocker_mem_firstInterior_of_cross
```

If the actual critical shell sourced at one retained point contains the other
point, its blocker center belongs to the same strict cap interior as the pair.
The proof uses live geometry, not a finite shadow:

1. exact card five makes the first apex survive deletion of either source, so
   the corresponding actual blocker is not that apex;
2. the two strict-interior equal-distance lemmas exclude the other two Moser
   vertices as blocker centers; and
3. if the blocker lay in either other cap interior, it and the first apex
   would be two distinct ordered-cap centers equidistant from the same pair
   outside that cap, contradicting `outsidePair_unique_capCenter`.

Consequently the coincident-blocker branch has no remaining cap-placement
ambiguity: the common blocker and common pair lie in one strict cap interior,
and the existing two-hit bound sends both residual shell members outside that
cap.  This still is not the accepted residual-member packet.  Its one missing
field is exactly

```text
for one residual x, some SelectedFourClass D.A x contains both common points.
```

Global K4 supplies a class centered at `x`, but does not force the radius
through the common pair.  The localization theorem therefore narrows the
producer boundary without claiming the source-indexed metric incidence.

## Why this is the exact boundary

Production `CriticalPairFrontier` proves

```text
K4 after cross deletion iff the opposite source is absent from the selected shell.
```

Thus the robust-survival arm has the wrong polarity for the desired directed
cross hit.  On the non-survival arm, cross membership follows, but no live
field places that row's blocker in `S.surplusCap`.  Ordered-cap uniqueness is
a consumer of precisely that localization; it does not produce it.

The exact missing live statement is therefore not another finite-set adapter.
It is a geometric source-to-cap transport theorem coupling an actual frontier
blocker to the MEC surplus cap, on at least one directed cross-hit arm.  No
such field occurs in `CriticalPairFrontier`, `SurvivorPairRelocationPacket`,
or the named U1 live-data packets.

## Independent second-apex split

The other half of the dependent frontier does not supply the missing row.

- In the double-deletion-survival arm, `P.oppApex2_dist_ne` says the two
  sources have different radii at `S.oppApex2`, so this apex is not another
  center for the common pair.  At either actual source blocker, the exact
  survival criterion has the opposite polarity: survival after deleting the
  other source is equivalent to that source being absent from the chosen
  shell.
- In the blocked arm, the frontier constructs two disjoint exact four-shells
  centered at `S.oppApex2`, one through each source and at their two distinct
  radii.  Hence neither shell contains the common pair.  The existing
  cap-growth consequence forces the opposite cap to have size at least six
  and the carrier to have size at least twelve, but it does not create a
  cross-source shell membership or a surplus-cap blocker.

Thus retaining both apex splits on the same pair is essential bookkeeping,
but neither second-apex arm maps to any of the three accepted unique-row
outputs without a new coupling theorem.

## Full-global-row audit

The later audit of the global selected-row surface does not remove this
antecedent.

- `Census554.GeneralCarrierBridge.blocker_row_support_eq_shell` identifies a
  faithful carrier row at a chosen blocker with that source's exact critical
  shell.  It transports an already-chosen blocker row; it does not place the
  blocker in a cap or add the opposite frontier source to the shell.
- `CapSelectedRowCounting.orderedCap_card_add_four_le_choose_outside` is an
  aggregate outside-pair count.  It gives no coverage theorem for the
  particular pair in the frontier and no source-to-blocker localization.
- The sharp equality-case statements
  `exists_orderedSurplusCapSix_with_selected_hitCounts` and
  `selectedClass_support_inter_surplusCap_card_eq` require `S.IsM44`.  The live
  K-A-PAIR branch assumes `hNoM44`, so these declarations cannot be mapped to
  the current hypotheses.
- The current critical-map fiber theorems give upper bounds on sources per
  blocker and lower bounds on the number of blocker centers.  They do not
  force an image center into `S.surplusCap`, and even cap localization alone
  would not identify a shell containing the prescribed pair.

Thus the faithful-carrier route reaches exactly the same first missing field
as the direct frontier route.  It is not an alternate producer.

## Other two accepted outputs

The same preflight fixes the first missing field for the other accepted
unique-row outputs.

- **Card four:** `ExistsSurplusPairCriticalBlocker` needs a
  choice-invariant deletion-blocking shell centered at a non-apex point of the
  surplus cap and containing the two selected off-cap points.  The card-four
  apex shell is deletion-blocking but has center equal to the apex.  Moreover,
  `CriticalShellSystem.overrideAt` can make an arbitrary selector choose that
  apex shell for both sources, so a theorem about every supplied selector is
  false.  The missing result must existentially produce a favorable geometric
  blocker, independent of the selector.
- **Card five, coincident blocker:** the checked four-shell classifier leaves
  two residual members.  The accepted terminal packet needs one residual
  member `x` and a `SelectedFourClass D.A x` whose support contains the common
  pair.  Global K4 supplies some selected class centered at `x`, but it does
  not select the radius through either common point.  Exact-shell provenance
  at the common blocker does not change the center to `x`.

These are source-indexed metric-incidence statements.  None follows from the
current finite support, blocker-map, or faithful-carrier interfaces.

## Required theorem-bank preflight

The following registries were searched before writing the scratch theorem:

- `docs/general-n-certificate-bank-mining-2026-07-09.md`;
- `certificates/p97_rvol_general_n_mining.{md,json}`;
- `certificates/erdos97_legacy_general_n_mining.{md,json}`; and
- `certificates/erdos_general_theorem_p97_mining.{md,json}`.

The exhaustive inventories contain no declaration producing a frontier
blocker in the surplus cap or a selected source row containing the opposite
frontier point from the current hypotheses.  The closest surfaces fail at
their first antecedent as follows.

- `exists_shortCap_point_two_off_four_carrier_of_minimal_u3` requires the old
  `IsM44`, `U2Statement`, `Minimal`, and `U3ShortCapSaturation` package.  The
  live branch assumes `hNoM44`, and the theorem does not identify its selected
  center with either frontier blocker.
- `U5QCriticalTripleClass.mutual_no_p_exact_center_incompatibility` is a
  contradiction consumer.  It assumes both mutual dangerous-source hits and
  an additional exact row at a shared witness; none is produced by the
  frontier.
- The sibling-bank theorem `u1TwoLargeCapObstruction` consumes a fixed
  five-point pattern with seven distance equalities and one point inequality.
  Its registry entry has `source_reachable: false`; after importing
  `Erdos9796Proof.P97.U1LargeCapRouteBTail`, Lean reports the advertised fully
  qualified constant as unknown.  It is therefore a proved sibling-source
  candidate, not a currently import-reachable local consumer.  Even after an
  explicit import/port, the frontier supplies only the first-apex pair
  equality and no theorem producing the remaining row equalities.
- The older `SurplusCapBlockerCore.lean` contains only abstract statement and
  certificate interfaces, not a proof of its blocker-core statement or a
  theorem in the current `ℝ²` packet vocabulary.
- `qfreeK4_of_blocker_core` packages a surviving class after assuming its
  card-four fact, an avoided seed, and strict cap-interior center placement.
  It does not produce the required center placement and has the survival,
  rather than cross-hit, polarity.

Indexed searches were also run across every configured Lean corpus with
`nthdegree docs search --lean`, using concept and name-filtered queries for:

- surplus-cap blockers whose selected shell contains an off-cap pair;
- card-five mutual critical-source incidence and cap-local blockers;
- coincident-blocker residual members whose selected class contains the
  common pair;
- source-indexed blocker-to-Moser-cap transport;
- `*mutual*`, `*blocker*`, and `*u1TwoLargeCapObstruction*` declarations.

The corpora were freshly indexed again at 2026-07-14 22:58 UTC.  The closest hits
were the same consumers and exact-support adapters listed above; none supplies
`CardFiveDistinctCapLocalCrossHypothesis`.

## Corrected narrow finite-shadow audit

`card_five_interior_shadow_search.py` is a theorem-discovery search for the
distinct-blocker card-five boundary.  Its encoding was adversarially re-read
against the live Lean structures after the first run.  Three errors in the
initial diagnostic were fixed before retaining any verdict:

1. A K4 witness at an arbitrary center supplies only a four-point subset of a
   radius class.  The corrected encoding marks a row exact only at the pinned
   card-five apex and at the two selected critical-shell blocker centers.
2. Two unary deletion-survival facts at `S.oppApex2` do not imply a single K4
   row avoiding both sources.  The corrected encoding makes no such
   inference; it enumerates all three pairs among the strict-interior triple.
3. A complete row assignment may admit several target-negating blocker maps.
   The corrected callback rejects the row assignment only after every such
   distinct-blocker choice is covered by a formalized metric core.  The
   blocker-independent equality scan is shared, and exactness-dependent scans
   are cached by the unordered blocker-center pair.

The live-to-shadow implication used for a finite UNSAT verdict is now:

- the exact first-apex five-class gives the pinned five-row and contains the
  three strict-interior labels;
- for the actual survivor pair, its two distinct critical blockers supply the
  exact four-rows through the corresponding sources;
- K4 supplies an arbitrary four-point same-radius subset at every other
  center; and
- convexity gives the adjacent one-hit, circle-intersection, cyclic
  separation, and at-most-two-bisector-center constraints used by the DFS.

The target predicate is the literal negation of the three `outcome` arms in
`CardFiveCapOrMutualFields`: neither directed cross hit has its blocker in the
surplus cap, and the two directed cross hits do not both hold.  The search
also enforces distinct blockers.  It deliberately omits unused or stronger
live information, including non-pair critical rows, unary second-apex
survival, `hNoM44`, the remaining MEC/disk inequalities, and the coincident
blocker residual packet.  Consequently SAT is only an abstraction witness;
UNSAT is meaningful only for the named finite profile and the formalized
cuts actually applied.

Corrected deterministic results:

| profile | corrected result | decisive scope |
|---|---|---|
| `(5,5,4)` | `EXHAUSTIVE_UNSAT_IN_FINITE_SHADOW` | 12/12 five-row supports; 22,498 DFS nodes; no node cap; the two complete target-negating row assignments are excluded by the formalized duplicate-center and equilateral-bisector-collision cores |
| `(6,5,4)` | `SAT_TARGET_NEGATING_FINITE_SHADOW_ONLY` after resumed CEGAR | fourteen successive fixed shadows are now exactly real-infeasible, but the raised-cap run continues to expose new support-1 variants; no exhaustive verdict |
| `(5,5,5)` | `SAT_TARGET_NEGATING_FINITE_SHADOW_ONLY` | witness on the first five-row support after 104,524 nodes; survives the current formalized metric-core scanner |

The first fixed `(6,5,4)` witness has polynomial digest
`2476ead343e748e4edb2147ea81c03ed94280245cd82ea7dd7128eff4ed06750`.
Singular and msolve in both variable orders agree that its normalized complex
ideal is nonunit.  Exact real exclusion is nevertheless now available, as
recorded below.

### Full Problem 97 realizability test of the fixed `(6,5,4)` witness

`p97_counterexample_realizability_654.py` tests the hash-bound row system
against exactly the geometry needed by `Problem97.IsCounterexample`, rather
than against the cap shadow alone.  The audited full ledger has 24 coordinate
variables and 227 named atoms: four similarity-gauge equations, the 37 saved
row equalities, 66 pairwise squared-distance positivity constraints, and 120
strict boundary-edge orientation inequalities in cyclic order
`(0,10,11,1,3,4,5,6,2,7,8,9)`.  The rows cover all twelve centers exactly
once, exclude their centers, and have four distinct supports except for the
pinned five-support row at center `1`.  Their ordered exact-CAS polynomial
stream reproduces digest
`2476ead343e748e4edb2147ea81c03ed94280245cd82ea7dd7128eff4ed06750`.
Independent SAT/UNSAT engine smoke pairs and fixed row/orientation smoke pairs
all pass.

The reduced query substitutes `p0=(0,0)` and `p1=(1,0)`, leaving twenty real
variables, 37 row equalities, and 120 strict orientation inequalities.
Explicit distinctness is redundant in this reduced query: if two labels were
equal, either their common boundary edge would have zero area or one label
would be a zero-area witness for a boundary edge incident to the other.  Thus
SAT for the reduced query would still give twelve distinct strictly convex
real points with four positive-radius equidistant witnesses at every point,
which is a genuine Problem 97 counterexample.  Cap, MEC, blocker, deletion,
and exact-radius-filter predicates are intentionally absent because they are
not hypotheses of `Problem97.IsCounterexample`.

The earlier bounded NRA and numerical attempts did not decide that query:

- Z3 4.16.0 and cvc5 1.3.3 both returned `UNKNOWN`/internal timeout at 30
  seconds on the explicit 227-atom query.
- The equivalent twenty-variable, 157-atom reduced query also timed out at 30
  seconds in Z3 4.16.0 and cvc5 1.3.3.  Z3 4.17.0 timed out on the same query
  serialized by Z3 itself; a plain cvc5 query with an explicit `QF_NRA`
  preamble timed out as well.
- `p97_counterexample_numerical_654.py` ran eight strict-geometry barrier
  starts.  Its best geometrically positive endpoint still missed a row
  equality by about `0.704845`; this is nowhere near the `1e-9` candidate
  replay threshold.  This is only a failed witness search, never an UNSAT
  result.
- `p97_counterexample_distinct_saturation_654.py` attempted exact
  characteristic-zero removal of collision components.  Full saturation and
  the cheaper single-quotient sufficient test both timed out before completing
  their first pair.  An initial implementation incorrectly treated Singular's
  direct ideal return from `sat` as a list; that bug was corrected before any
  result was accepted.  The corrected runs still yielded only timeout.

Those diagnostics are now superseded by an exact characteristic-zero result.
msolve bases in two variable orders contain `4*x10y^2+1` and `4*x2y^2+1`.
`p97_counterexample_exact_real_exclusion_654.jl` additionally computes a QQ
Groebner change matrix for all 37 row generators, replays the full
transformation exactly, and verifies

```text
4*x10y^2 + 1 = sum_i c_i * g_i.
```

The target row uses all 37 generators and has certificate SHA256
`6a37fbfdf3d55c11bba07837bf371441867bc357e5e4ee0806c43d593b383778`.
Since a real square is nonnegative, the row equalities alone have no real
solution.  The fixed shadow is therefore definitively **not** a Problem 97
counterexample; adding strict convexity and distinctness cannot restore
feasibility.

### Resumed `(6,5,4)` CEGAR

`card_five_interior_shadow_search.py` now supports exact algebraic no-goods,
prints a canonical row-signature SHA256 for every witness, and exposes the
per-support bound through `--max-nodes` and the result ledger.

Fourteen target-negating fixed shadows have been classified.  Eleven are
`CROSSCHECKED_UNIT` in Singular and in msolve under forward and reverse
variable orders.  One-pass row deletion retained literal five- or six-row
unit subsystems with 15--19 equalities; the scanner cuts any complete
assignment containing one of those exact subrow systems.  The other three
fixed shadows are nonunit but exactly real-infeasible:

- the first has the independently replayed `4*x10y^2+1` certificate above;
- shadow 7 has `4*x11y^2+1` in the msolve reduced basis, and Singular reduces
  that polynomial to zero modulo the full ideal; its cofactor lift timed out;
- shadow 9 has `4*x8y^2+1` in the forward basis and
  `4*x5x^2-6*x5x+3` in the reverse basis; Singular direct reduction timed out.

All fourteen *fixed* shadows are thus excluded over the reals, but the branch
is not exhausted.  The old 500,000-node bound was materially too low.  With
`--max-nodes 2000000`, support 1 produced new witnesses at 759,145, 821,713,
1,026,916, and 1,111,867 nodes.  Each was unit and supplied another literal
core.  The latest cut has not been followed by an exhaustive rerun, so the
current solver state remains a nonconverged CEGAR sequence, not finite-shadow
UNSAT.

### Replayed five-row certificate and scratch Lean core

The most compact reusable core found in this sequence has five rows, 16
generated equalities, and 12 active equality hypotheses.  The owned artifacts
are:

- `unit_core_654_05_certificate.jl`, which computes the exact QQ change matrix;
- `unit_core_654_05_certificate.json`, containing generators and cofactors;
- `check_unit_core_654_05_certificate.py`, which independently rebuilds every
  squared-distance generator and expands the identity over QQ; and
- `unit_core_654_05_scalar_certificate.lean` plus the invariant
  `EdgeClosure` wrapper `unit_core_654_05_collision.lean`.

The independent replay reports 12 nonzero multipliers, 3,629 multiplier terms,
maximum multiplier degree 4, and exactly one expanded identity term, the
constant `1`.  The certificate file SHA256 is
`455995d97d579977481857cb95958702942f1ae0a386cc3c4bf59b53b8f095e6`;
the raw change-row identity SHA256 is
`7df1aeb65effa1fee93e31da9fbb30c394de314f4eff8c714572b97adf66aefe`.
The wrapper states that the twelve distance equalities force labels `P0` and
`P1` to coincide, then packages the obstruction as
`UnitCore65405CollisionCore`.

The new Lean files have deliberately **not** been built in this continuation,
because the existing no-Lean-build instruction remains in force.  They are
source-complete certificate candidates, not yet kernel-checked claims.

The fixed `(5,5,5)` row assignment has polynomial digest
`618d6f58388b198066982745141f6021bdd5d2d515504521e3c4c1fe6ffad48c`.
Singular and both msolve variable orders agree on `CROSSCHECKED_UNIT`.  A
bounded deletion pass retained a seven-row unit subcore, but two deletion
attempts timed out, so the subcore is not claimed minimal.  This is a useful
future equality-core candidate, not the requested producer; moreover it does
not generalize to the continuing `(6,5,4)` support family.

A separate coincident-blocker row DFS is not a sound next test for the
accepted residual-member output.  Choosing one global-K4 row at a residual
center which omits the common pair negates only that selector choice; the
target quantifies over every possible radius and could be witnessed by a
second selected class at the same center.  A valid target-negating solver
encoding must at least impose the actual squared-distance inequality between
the two common points at each residual center (or exhaust all radius classes),
and a proof-relevant verdict would additionally need the real convex/MEC
constraints.  The current equality-row DFS encodes neither negation, so no
coincident-branch verdict is inferred from it.

### Source-indexed all-pair probe and new five-row certificate

`card_five_source_indexed_target_probe.py` strengthens the earlier
single-pair CEGAR encoding at the live source boundary.  For every off-surplus
member of a pinned exact first-apex five-class it chooses an exact
deletion-critical shell, and it chooses one global K4 row at every non-apex
center.  Rows at a chosen blocker obey the source-indexed no-q-free condition.
Every complete assignment is rejected if any off-surplus pair already exposes
one of the following sufficient outputs:

- a deletion-critical shell centered in the surplus cap and containing the
  pair;
- the distinct-blocker `CardFiveCapOrMutualFields` cap-local or reciprocal
  incidence fields; or
- on a coincident-blocker prefix, a residual center's chosen global row
  containing the common pair.

The first two checks exactly recognize the corresponding fields of the chosen
critical-shell system.  The third is only a sufficient recognizer: one chosen
global row omitting the pair does not negate existence of a different radius
class containing it.  This asymmetry is fail-safe for an UNSAT search but makes
a SAT assignment only a relaxed survivor.  The survivor below has four
pairwise distinct source blockers, so the coincident residual branch is not
invoked for any pair.

On the first `(6,5,4)` five-support `[0,2,7,8,9]`, the source-indexed search
found a target-negative assignment at 709,661 nodes.  After adding monotone
partial-target pruning, an independent rerun returned the identical assignment
signature
`5fd78b83e7ba5150f3607a15f7d59da01a7ae7645a07640762a72bbc659af344`
at 708,955 nodes.  Its exact source blockers are `0 ↦ 2`, `7 ↦ 3`, `8 ↦ 0`,
and `9 ↦ 8`; their shell supports agree with the chosen global rows at those
centers.  It passes every currently formalized metric-core detector and avoids
the two applicable accepted outputs in the finite incidence/equality shadow.

The hash-bound full Problem 97 query for the resulting one-row-per-center
system has equality digest
`8bd0b3bc69181488231d58874ccac6945c044619135dcf3e39bb28ead0b86407`.
Z3 and cvc5 both timed out at 30 seconds, and an eight-start numerical scout
found no near equality solution; neither observation is a verdict.  Exact
characteristic-zero computation is decisive: Singular and msolve in both
declared variable orders agree that the normalized equality ideal itself is
UNIT.  Thus the row system has no normalized complex realization, hence no
real strictly convex realization and no Problem 97 counterexample.

Row deletion reduces the contradiction to the following five rows:

```text
1  : [0,2,7,8,9]
2  : [0,1,10,11]
9  : [0,2,3,4]
10 : [5,6,9,11]
11 : [1,4,9,10]
```

Deleting any one row is NONUNIT in Singular and in msolve under forward and
reverse variable orders.  The core is therefore row-deletion-minimal under
three exact computations.  Its QQ change-matrix certificate has 16 generators,
10 nonzero multipliers, 956 multiplier terms, maximum multiplier degree 7,
and expands independently to the constant `1`.  The certificate file SHA256
is `12f4dd93536864d67882fbc89700f0095ecca3e417ab16859c140a755fd5923d`;
the raw change-row identity SHA256 is
`27a594e685558ed816b9d07b4871577c771e004791c92f6bda6efd8cc8f242a3`.

Owned artifacts are
`unit_core_source_indexed_654_certificate.{jl,json}`,
`unit_core_source_indexed_654_verification.json`,
`generate_unit_core_source_indexed_654_lean.py`, and the generated scalar and
invariant-wrapper sources
`unit_core_source_indexed_654_{scalar_certificate,collision}.lean`.  The
invariant wrapper states that the ten active distance equalities force the two
normalization anchors to coincide and packages the result as
`UnitCoreSourceIndexed654CollisionCore`.  These Lean files are source-complete
and contain no `sorry` or `admit`, but remain unbuilt under the standing gate.
The exact row core is now a scratch-local monotone no-good in the source-indexed
scanner, and enumeration has resumed beyond this survivor.

That resumed scan found a second, non-isomorphic survivor at 752,270 nodes,
with assignment signature
`15fe067b9bb18b35a8e24f1760558a3dd7200d716fe6dcdabbea85092e85f382`.
Its full equality stream has digest
`7ab383e87ec9327c125a574719aceb290f4554471358342b4eec96d4121392d1`
and is again cross-checked UNIT.  A bounded deletion pass retained six rows at
centers `1,2,8,9,10,11`.  Four one-row deletions are cross-checked NONUNIT;
the deletions of centers `1` and `2`, and Singular's deletion of center `11`,
timed out at 30 seconds.  The six-row core is therefore certified UNIT but is
not claimed deletion-minimal.

`unit_core_source_indexed_654_02_certificate.{jl,json}` and its verification
record bind that six-row core to a second exact identity.  Independent replay
reconstructs 19 generators and expands 12 nonzero cofactor products to `1`.
This certificate is much larger: 11,786 multiplier terms, maximum degree 10,
and a 504 KiB JSON artifact.  Its file SHA256 is
`31bb5ade66d20861c62c32f46dca83d204627d5e6cd40bac1e87985e7d9f7e8e`;
the raw identity SHA256 is
`19dc34760df7c641b7ab3577195d594cced9fb2f56f7f118e2a9db79c3ef92b2`.
It is admitted only as a literal scratch scanner cut; no second giant Lean
source is generated or claimed kernel-ready.

A third survivor appeared at 950,523 nodes, with assignment signature
`ad632272bddedf60157332efe3cae8b6d3613d7fc1ed630d52e3bd1e17459fbb`.
It is not a relabeling recognized by either of the first two local core
matchers, but its full equality digest
`6d78b24936645ccfbaa706b6f94520bec4b5f1148c20ebabf4b1384a971f1030`
is the already-audited interior-search case whose retained core was catalogued
as `unit-core-654-13`.  A fresh run again returned UNIT in Singular and both
msolve variable orders for the full 37-equality system and for the retained
five-row core:

```text
1  : [0,2,7,8,9]
2  : [0,1,10,11]
8  : [2,6,9,11]
10 : [1,3,5,8]
11 : [1,4,9,10]
```

`unit_core_source_indexed_654_03_certificate.{jl,json}` and its verification
record now bind this reused core independently.  The checker reconstructs 16
generators and expands 11 nonzero cofactor products to `1`; the certificate
has 4,439 multiplier terms and maximum multiplier degree 6.  Its file SHA256
is `4d7b76c489cafc3e3575b4e2a774e9ed3996a6c472d92e4dae6bc643f60e0903`;
the raw change-row identity SHA256 is
`c21f42eb040eecc473d48bd1a3dd08f47c2d0565bf16957cc43bb958c2efa81d`.
The exact row core is the third literal scanner cut.  It is not promoted to a
Lean source and no row-deletion-minimality claim is made here.

With the third cut active, the scanner returned a fourth survivor at 1,010,789
nodes, assignment signature
`4dfb7f20ddce33c1edaaf1905a3275d3b1e2decb09fb791b3a3c0e16eb035d09`.
Its full 37-equality digest
`d0c3e1e3a0eae06200d695420266d5bdc4f9b18338c3a5adc3eaf13918cbdd74`
and retained rows agree exactly with the last old-bank pattern on this support,
`unit-core-654-14`:

```text
1  : [0,2,7,8,9]
2  : [0,1,10,11]
8  : [3,6,7,9]
9  : [0,2,3,5]
10 : [0,1,3,4]
11 : [1,5,8,10]
```

The locked `unit_core_source_indexed_654_04_certificate.{jl,json}` identity
has 19 generators, 13 nonzero multipliers, 22,053 multiplier terms, and
maximum multiplier degree 9.  The independent checker reconstructs the
generator stream and expands the identity to `1`.  The certificate file
SHA256 is
`15fbba437bd282f512f3dafebbbf0a42426047bfd253609add7fb5ca7225b7db`;
the raw change-row identity SHA256 is
`f277bae93f98134713731b91a792f78d334167481a99e788f0a57cf13828afaf`.
This is the fourth literal cut.  Cores `654-11` through `654-14` are all the
previously catalogued exact-unit patterns on the fixed support, so the resumed
enumeration is now searching beyond the old bank rather than merely replaying
its known survivors.

Verdict: the resumed CEGAR search was useful for falsification and theorem
discovery, and it produced a replayed equality-core candidate.  It is not the
faster route to the requested unique-row producer at present: literal core
cuts continue to reveal non-isomorphic support-1 variants above the old cap.
The next content-bearing step is either a structural generalization of these
collision cores plus a proof-producing finite cover, or the original geometric
source-indexed incidence theorem.  No accepted
`ExistsSurplusPairCriticalBlocker`, `CardFiveCapOrMutualFields`, or
coincident-blocker residual-member packet has been produced.

## Validation

The parent scratch consumer was elaborated into an isolated `.olean` inside
this owned directory, then the producer file was checked from the Lake root
with the owned directory prepended to `LEAN_PATH`.  Both checks passed.

The printed axiom closure of both new public theorems is exactly:

```text
propext
Classical.choice
Quot.sound
```

There is no `sorryAx`, named axiom, or new open declaration.

The four public declarations in
`card_five_interior_survivor_pair.lean` have the same printed axiom closure:
`propext`, `Classical.choice`, and `Quot.sound`.  The direct Lean check passes
without `sorry` or `admit`.

The underlying global-shadow `unittest` suite passes 14/14 tests, including
the independent assignment replay, small brute-force equivalence, node-cap
fail-closed behavior, exact-row compatibility, and complete-callback
backtracking tests.  The corrected script additionally replays each emitted
witness, rechecks the literal target negation, verifies that exactness occurs
only at the apex and selected blockers, and reruns the formalized-core scanner
before emitting a bank-negative witness.

Current non-Lean validation also passes: Python byte-compilation of the owned
search, certificate-checker, and Lean-generator scripts; the 14-test shadow
suite; and independent exact-QQ replay of the five-row certificate.  That
replay reconstructs all 16 generators, expands all 12 active cofactor
products, and obtains the constant polynomial `1` exactly.  The generated
scalar-certificate and invariant-wrapper Lean sources contain no `sorry` or
`admit`, but they have not been elaborated under the standing no-build gate.

The source-indexed extension additionally passes hand-written positive and
negative smoke gates for all three target recognizers and for all four
scratch-local QQ no-goods.  Direct and nontrivially relabeled copies of the
third and fourth cores pass the generic isomorphism recognizer.  The four
certificates independently reconstruct their 16, 19, 16, and 19 generators
and expand their cofactor products to the constant polynomial `1`.

After the proof-blueprint classification fix, the live refresh reports 12
on-spine sorries, zero off-spine placeholders, and this anchor still open via
its single `sorryAx` leaf.  No conclusion here relies on the earlier buggy
off-spine listing.

Rigor labels:

- **PROVEN ADAPTER, NOT PRODUCER:** the conditional construction of the existing
  `CardFiveCapOrMutualFields` packet from the frontier, blocker distinctness,
  and one cap-local directed cross hit.
- **PROVEN:** the existing consumer closes immediately from that packet.
- **PROVEN (Lean-formalized intermediate):** exact card five yields a
  strict-interior pair with unary deletion survival at the second opposite
  apex.
- **PROVEN (Lean-formalized localization):** on either directed-cross arm, the
  corresponding actual blocker lies in the same strict cap interior as the
  retained pair.  Both public theorems close under exactly `propext`,
  `Classical.choice`, and `Quot.sound`.
- **EMPIRICALLY VERIFIED, FINITE SHADOW ONLY:** corrected `(5,5,4)` exclusion
  under the current formalized metric-core bank.
- **EXACT CAS, INDEPENDENTLY REPLAYED FOR ONE FIXED SHADOW:** the first fixed
  `(6,5,4)` row system implies `4*x10y^2 + 1 = 0` over the reals.  Its 37-row
  QQ change-matrix identity was expanded exactly, so this particular shadow
  has no real realization and is not a Problem 97 counterexample.
- **EXACT CAS, FIXED SHADOWS ONLY:** eleven further `(6,5,4)` shadows have
  cross-checked unit ideals, and shadows 7 and 9 have positive-polynomial
  obstructions in exact Groebner bases.  Together these exclude all fourteen
  shadows encountered so far, not all target-negating shadows.
- **EXACT QQ CERTIFICATE; LEAN SOURCE UNBUILT:** the compact five-row core has
  an independently replayed identity `1 = sum_i c_i * g_i`.  Generated Lean
  source packages it as a scalar certificate and collision wrapper, but it is
  not kernel-checked while the no-build instruction remains active.
- **EXACT QQ CERTIFICATES; FOUR SOURCE-INDEXED FIXED SURVIVORS:** none of the
  four assignments is a Problem 97 counterexample.  Each equality ideal is
  cross-checked UNIT and each retained five- or six-row core has an
  independently replayed rational identity.  Only the first core is claimed
  row-deletion-minimal.  These exclude four fixed survivors, not the remaining
  source-indexed search space.
- **BOUNDED FINITE SHADOW, NONCONVERGED:** the raised two-million-node CEGAR
  search continued to find support-1 witnesses beyond the former 500,000-node
  cap.  The latest exact core has not been followed by an exhaustive rerun;
  no `(6,5,4)` finite-shadow UNSAT verdict is claimed.
- **EXACT CAS, FIXED SHADOW ONLY:** the fixed `(5,5,5)` equality system has a
  cross-checked unit ideal.  This does not constitute a general geometric
  theorem or exhaust that finite profile.
- **NOT FOUND / OPEN:** a theorem deriving the cap-local directed cross hit
  from the current live K-A-PAIR hypotheses.
- **NOT FOUND / OPEN:** either of the two alternative accepted source-indexed
  metric-incidence producers described above.
- **NOT CLAIMED:** closure of K-A-PAIR or production readiness of this
  scratch-only module.

## Direct-false interface and relabeled-gauge checkpoint

The proposed parent refactor changes the outer result but does not change this
lane's local boundary.  The scratch `CommonCriticalMapClosingProducer`
quantifies a concrete
`F : CriticalPairFrontier D S r Hcritical` and asks for `False`.  The existing
card-five terminal theorem in this directory consumes that same concrete
`F`/`Hcritical` provenance and already returns `False`; the card-four and
coincident packets likewise remain inputs to terminal contradiction
consumers.  In particular, future output from this lane must be packaged as a
contradiction from the retained frontier, not as a reconstructed
double-apex-pair witness.  The live production source and proof-blueprint
anchor still name `DoubleApexOffSurplusSharedRadiusPair`, so the anchor has not
been moved ahead of the production landing.

The exact probe now records optional cyclic point relabeling before imposing
the normalization `p0 = (0,0)`, `p1 = (1,0)`.  This is sound for exclusion of
an intended realization because the selected Finset points are distinct, so
any relabeled normalized pair is noncoincident.  It is computationally
important: several systems which are merely NONUNIT in the original gauge are
UNIT after a cyclic relabel.  This is an exact characteristic-zero statement
for each fixed equality system, not a general Lean theorem and not a shadow
UNSAT verdict.

Three additional unit cores now have independently replayed change-matrix
identities and are admitted up to relabeling:

- `source-indexed-unit-core-654-09`: six rows, 18 generators, 15 active
  multipliers, 75,298 multiplier terms, maximum degree 10;
- `source-indexed-unit-core-654-12`: five rows, 15 generators, 9 active
  multipliers, 1,149 terms, maximum degree 7; and
- `source-indexed-unit-core-654-13`: five rows, 15 generators, 11 active
  multipliers, 2,431 terms, maximum degree 4.

The last two have generated scratch `linear_combination` replay files with no
`sorry`, `admit`, or declared axiom.  They remain deliberately unelaborated
under the standing no-Lean-build gate.  Together with the newly replayed
offset-10 six-row forced-collision core, the scanner currently carries 17
local exact cuts.  Resumed shards continue to expose successors, so none of
these counts is a branch-closure claim.  Offset 13 is UNSAT only in the finite
shadow; offset 4 remains INDETERMINATE at 4,000,001 nodes.

The next offset-12 successor is also excluded by an independently replayed
six-row certificate, `source-indexed-unit-core-654-19`.  Its 19 generators
have 14 nonzero multipliers (41,968 terms, maximum degree 9), and their exact
rational cofactor sum expands to `1`.  The scanner cut and its direct,
negative, and relabeled smoke gates pass, bringing the scratch-local exact-cut
count to 18.  The offset-12 enumeration has been resumed with this cut; a new
survivor or finite-shadow UNSAT result has not yet been obtained.  This remains
fixed-shadow solver evidence and does not by itself prove the direct-false
parent theorem.

The six-row offset-11 successor core,
`source-indexed-unit-core-654-15`, has likewise been independently replayed:
18 generators, 15 active multipliers, 45,641 terms, and maximum degree 9.
It is admitted as the nineteenth scratch-local exact cut and the offset-11
enumeration has resumed.  The offset-12 certificate has also been rendered to
an unbuilt scratch `linear_combination` source (4,062,381 bytes) with no
`sorry`, `admit`, or declared axiom.  No Lean elaboration or build was run.
The renderer now discovers active variables by streaming coordinate tokens
rather than asking SymPy to compile an entire multi-megabyte expression; this
also rendered the offset-11 certificate to an 8,880,805-byte unbuilt Lean
source with the same placeholder-free scan.

The next offset-11 and offset-12 survivors share one six-row UNIT obstruction
up to injective relabeling.  The chosen shift-one core has 18 equalities and is
row-deletion-minimal in the exact msolve check: deleting any of its six rows
is NONUNIT.  The saved scanner rows were replay-compared against both emitted
JSON assignments before this isomorphism test.  One queued certificate
(`source-indexed-unit-core-654-21`) will therefore cover both successors if it
independently replays; no cut for this core is claimed before that certificate
finishes.  Independent forward and reverse Singular attempts, both plain
standard-basis runs and unit-lift runs, reached their 1,800-second caps.  This
is a timeout, not a NONUNIT disagreement and not an additional certificate;
the exact Julia change-matrix job remains the active route for core 21.

## Refreshed direct-false theorem-bank preflight

The indexed Lean corpora were refreshed again at 2026-07-15 06:54 UTC and
searched for cap-local directed cross hits, mutual critical-source incidence,
coincident-blocker residual rows, and consequences of the parent `hnoRem`
hypothesis.  No new producer was found.  The closest hit remains
`blocker_centers_eq_of_five_le_of_mutual_cross_membership`, which consumes
both cross memberships rather than producing either one.  The non-removable
vertex theorems produce the already-retained `CriticalShellSystem`; they do
not place an actual blocker in the surplus cap or force a residual center's
selected class through the common pair.  Thus the first missing live
hypotheses recorded above are unchanged by the direct-`False` refactor.

The promoted metric bank was then replayed directly against the seven latest
saved SAT assignments (support offsets `3, 8, 9, 10, 11, 12, 14`) using each
profile's current boundary order.  This includes the newly visible
`SevenPointTwinFourCircleCollision` detector and every current extended and
order-sensitive `_formalized_metric_core` check.  All seven replays still
return no bank match.  The owned checker
`audit_saved_scans_against_current_metric_bank.py` makes this drift audit
repeatable.  It explicitly reconstructs the pinned first-apex row from the
top-level saved `support` field before merging it with the retained rows; the
scan JSON does not duplicate that fixed row inside its `rows` list.  In
particular, the shared offset-11/12 six-row obstruction is not an instance of
the promoted twin-four-circle core; its exact certificate remains
content-bearing rather than duplicate theorem-bank work.

A separate injective-relabel audit of queued cores `14` through `21` found no
embedding between any two distinct retained cores.  Thus certificate `21`
covers both latest *full* assignments, but it does not subsume queued cores
`14`, `16`, `17`, `18`, or `20`; those certificates remain independent work.

Core `source-indexed-unit-core-654-20`, extracted from the offset-3 successor,
has now finished and independently replayed.  Its 18 generators have 12
nonzero multipliers (11,023 terms total, at most 2,130 in one multiplier, and
maximum degree 9), and the exact rational cofactor sum expands to the constant
polynomial `1`.  The certificate file SHA-256 is
`960a7c665444c0d32d3c3db2dfd4202682fe8a951da45249256912cb88d50c5b`.
The cut is admitted as the twentieth scratch-local exact cut; its direct,
deletion-negative, and nontrivially relabeled smoke gates pass.  A replay of
the saved offset-3 assignment finds this core up to relabeling while finding
no current promoted metric-bank core, so the cut removes exactly the intended
stale survivor rather than duplicating a current theorem-bank detector.  The
offset-3 enumeration has been resumed at four million nodes.  This is still
fixed-shadow exact solver evidence, not finite-shadow branch closure or a
Lean theorem.  The same certificate has been rendered as a 416,297-byte
scratch `linear_combination` replay with no `sorry`, `admit`, or declared
axiom; it remains deliberately unbuilt under the standing no-Lean-build gate.

Core `source-indexed-unit-core-654-17`, extracted from the current offset-9
successor after cyclic shift one, has also finished and independently
replayed.  Its 19 generators have 13 nonzero multipliers (50,540 terms total,
at most 15,626 in one multiplier, and maximum degree 8), and their exact
rational cofactor sum expands to `1`.  The certificate file SHA-256 is
`ec3b8ca7ed467d868afc791e28ea3e744ab4a39a5018898e921e31480c137dc4`.
It is admitted as scratch-local exact cut 21; direct, deletion-negative, and
nontrivially relabeled smoke gates pass.  The corrected saved-scan replay,
including the separately stored pinned apex row, finds this core in the
offset-9 assignment and no promoted metric-bank core.  Offset 9 has been
resumed at four million nodes.  A 5,165,016-byte scratch
`linear_combination` replay has no `sorry`, `admit`, or declared axiom and
remains unbuilt.  These are exact fixed-shadow exclusions, not a branch-wide
UNSAT result or kernel-checked closure.

## Offset-9 successor after exact cut 21

The resumed offset-9 enumeration rejected 72 complete assignments through
`source-indexed-unit-core-654-17` and then returned a new SAT shadow after
1,498,318 nodes, signature
`0c91f4aa7448b4794e200941047b17dd114383bd4fabd45c81be37ff537649e8`.
It remains negative against both the current promoted metric bank and all
admitted exact cores.  The new fail-closed encoding audit reconstructs the
separately stored pinned apex row, checks all twelve global/pinned center rows,
checks that all four exact shell rows duplicate their corresponding global
rows, replays the assignment signature, and compares the resulting row map
with the algebra input.  Its canonical row-map SHA-256 is
`d8842c9c58abd393b3949c4741ff0a9102cbf4a0f4e84f984d1c956c81f66f0e`.
A known prior pattern passes the same audit and an intentionally mismatched
pattern is rejected.

The full equality system is NONUNIT under cyclic gauges zero through five but
UNIT under gauges six and seven, with forward and reverse msolve variable
orders agreeing in each case.  One shift-six deletion pass retained a six-row,
19-equality UNIT core with expanded-system SHA-256
`bb23793b18de6e68d432ce14e1d7b14eb3c40344232ed76d4899867e7b3960fd`.
The core has no injective-relabel embedding to or from queued cores 14 through
21.  Its exact certificate has now independently replayed: 19 generators, 13
nonzero multipliers, 18,728 multiplier terms total, at most 5,748 in one
multiplier, maximum degree 9, and exact cofactor sum `1`.  The certificate file
SHA-256 is
`39ea300b696ad45ea5f5231fd90d8a5312578d1fbb7ed4301b3d739f443d0fe0`.
`source-indexed-unit-core-654-22` is admitted as scratch-local exact cut 22;
its direct, deletion-negative, and nontrivially relabeled smoke gates pass, and
the saved successor replay hits it up to relabeling.  Offset 9 has resumed at
four million nodes.  Its 642,310-byte scratch `linear_combination` rendering
contains no `sorry`, `admit`, or declared axiom and remains unbuilt under the
standing gate.  This is exact fixed-shadow evidence, not a real witness,
branch UNSAT, or kernel-checked Lean proof.

The complementary reverse-variable-order deletion pass has also completed.
All six one-row-deleted systems are exact `NONUNIT`, including the two cases
that timed out in the forward-variable-order pass.  Thus this particular
six-row system is row-deletion-minimal for the exact unit-ideal obstruction:
every retained row is necessary for the certified equality-ideal
inconsistency.  This bounded minimality statement does not by itself promote
the core to a Euclidean theorem or prove the full frontier branch.

The indexed theorem-bank preflight found the existing promoted
`six_row_anchor_collision` as the closest reusable result.  Its formalized
closure detector is already in the current metric bank and does not match the
core-22 row closure, so it does not subsume this obstruction.  A new scratch
invariant wrapper,
`unit_core_source_indexed_654_22_collision.lean`, now translates the thirteen
active scalar equations into distance equalities, proves that they force the
normalization anchors to coincide, and packages the result as an
`EqualityCore` non-realizability consumer.  The fail-closed companion audit
regenerates all nineteen row equations, verifies that the thirteen nonzero
multipliers are exactly the wrapper hypotheses, and symbolically checks every
squared-distance polynomial with its stored sign.  It passes against
certificate SHA-256
`39ea300b696ad45ea5f5231fd90d8a5312578d1fbb7ed4301b3d739f443d0fe0`
and wrapper SHA-256
`4e2059425b2ba642cf1fad5523a5701b189a8e7b9ca6202239d3cbe4efb4f44f`.
The wrapper remains unbuilt under the standing gate and is therefore not yet
kernel-checked evidence.

## Offset-9 successor after exact cut 22

The next offset-9 run rejected three complete assignments through core 22 and
returned another target-negative shadow after 1,498,324 nodes, assignment
signature
`165d702ae8aca79c118c27e8ef4afaf85051ccb704aa4f41e58c732d050b3531`.
The fail-closed saved-pattern audit reconstructs all twelve global/pinned rows,
checks the four duplicate shell rows, and reproduces canonical row-map SHA-256
`57adb854e851e0fab35f0b831dc675346e171f0df8d4294595a1a37cb7b0a15f`.
The current promoted metric bank and the first twenty-two exact cuts are all
negative on this assignment.

The full equality ideal is `UNIT` in both msolve variable orders after cyclic
shifts one and three; shifts zero and two are `NONUNIT`.  A shift-one deletion
pass retained the following six-row, nineteen-equality core:

```text
0 : [1,2,4,9]
1 : [0,4,7,10]
2 : [5,8,9,10,11]
4 : [2,6,7,9]
5 : [1,4,7,8]
7 : [0,5,6,8]
```

Its expanded-system SHA-256 is
`ace7e1dfe7cd2f9a6c252318c3fc2e0bdca6b55b6f0dfff3c6b736717ff00958`.
The reverse-variable-order deletion audit reports every one-row deletion
`NONUNIT`, so this core is row-deletion-minimal for the exact unit-ideal
obstruction.  It has no injective-relabel embedding to or from cores 14
through 22.

The locked core-23 change-matrix certificate has raw identity SHA-256
`7159e2d5846ad56ec26b4f4afcf7aa45b2dde7ca7997677334095d84266393a5`.
Independent reconstruction and exact expansion verify 19 generators, 17
nonzero multipliers, 17,299 multiplier terms total, at most 4,953 in one
multiplier, maximum degree 6, and cofactor sum exactly `1`.  The final
certificate file SHA-256 is
`f19c8ddc3f2ebf9eebaea0220756a94fb45e4b39a6dfda6c62b22c667bb2b927`.
`source-indexed-unit-core-654-23` is admitted as scratch-local exact cut 23;
its direct, deletion-negative, nontrivially relabeled, and complete-callback
smoke gates pass, and the saved assignment hits it up to relabeling.  Offset 9
has resumed at four million nodes.  Its 993,065-byte generated Lean scalar
replay has SHA-256
`1d43b2902fc19caa88c1701046472e76320004c93bad489643e811adfc688b2b`,
contains no `sorry`, `admit`, or declared axiom, and remains unbuilt.

The certificate-driven invariant-wrapper generator has also emitted
`unit_core_source_indexed_654_23_collision.lean`.  Its independent fail-closed
audit reconstructs all nineteen stored row equations, symbolically verifies
their squared-distance signs, confirms that the seventeen nonzero certificate
multipliers are exactly the wrapper hypotheses, and checks the generated
normalized and `EdgeClosure` fragments.  It passes against certificate
SHA-256
`f19c8ddc3f2ebf9eebaea0220756a94fb45e4b39a6dfda6c62b22c667bb2b927`
and wrapper SHA-256
`1b2b7699866830d8da22e4725dac694f33eeba053cb64712346eb33dcdaf059d`.
The wrapper translates the active equalities into an anchor collision and an
`EqualityCore` non-realizability consumer.  Like the scalar replay, it remains
unbuilt and is not yet kernel-checked evidence.

Separately, the offset-3 run after core 20 reached its four-million-node cap
on support `[0,5,7,8,9]` and returned `INDETERMINATE`; this is only a search
budget boundary.  That support has now restarted at sixteen million nodes
with the 23-cut bank.  Neither ongoing run is a branch-wide verdict.

## Source-indexed cores 24 and 25

The resumed offset-9 scan after core 23 returned a new target-negative shadow
after 1,603,616 nodes, signature
`f6a95b8cf2256482dad27d2d7bfbffc211773def5ed908e59fb064c49952e3dd`.
The saved-pattern audit reconstructed all twelve global/pinned rows, all four
shell duplicates, and canonical row-map SHA-256
`9abbdb32c8429ab7a95728ebe121d07a655d3f359249ff448255a17c6f772c61`.
The promoted metric bank and every then-admitted exact core were negative.
The full equality system is `UNIT` in both msolve variable orders in cyclic
gauges zero and two; gauges one, three, and four are `NONUNIT`.  Both variable
orders of the reverse-row deletion pass retained the same six-row,
nineteen-equality core, expanded-system SHA-256
`c9d63bf42a1ce4f40139ccffb1b5a363025cd10a345e11af304b1466bef7a3b2`.
Every one-row deletion of that core is `NONUNIT` in both variable orders, so
it is row-deletion-minimal for the exact equality-ideal obstruction.

The locked core-24 change-matrix certificate has raw identity SHA-256
`b778397ade22ef196c3c921213448d679842a4b672ae65ee6c05083fb01816a8`.
Independent reconstruction verifies 19 generators, 15 nonzero multipliers,
21,029 multiplier terms, at most 3,145 terms in one multiplier, maximum degree
6, and exact cofactor sum `1`.  The certificate file SHA-256 is
`783ddc1aacc70357fabe12021953d99cdd4c99f114e17d09dfa9b17044f73cf9`.
`source-indexed-unit-core-654-24` is admitted up to injective relabeling, and
the saved offset-9 assignment now replays as its exact hit.  Offset 9 has
resumed at four million nodes.

The older offset-4 scan, which had only cuts through core 22, returned a new
shadow after 4,181,780 nodes, signature
`13a801c85a81443212a03487768484fec69545a61aa17ddcf695902cc5b3f1bd`.
Its fail-closed encoding replay gives canonical row-map SHA-256
`4776058e274993eba71b895adf4ca16063a2d89d99338e5cf2a2a9fe4c2bb146`.
Gauges zero, two, and four are `UNIT` in both variable orders, while gauges
one and three are `NONUNIT`.  The forward-row deletion passes agree on a
six-row, nineteen-equality core with expanded-system SHA-256
`ed83b65752302c6a3a3921e01013a3ce176ffbcf9d2ae85cd63cfbce975c59dc`.
A shift-two deletion audit returns `NONUNIT` for every one-row deletion, so
this core is likewise row-deletion-minimal for the exact ideal.

The locked core-25 certificate has raw identity SHA-256
`b1a6d31f1d7244598a33e390408d4f131a786016a18c9fea42165ef15b19498b`.
Independent replay verifies 19 generators, 15 nonzero multipliers, 77,086
multiplier terms, at most 27,625 in one multiplier, maximum degree 11, and
cofactor sum `1`.  Its certificate file SHA-256 is
`0bd6f845cd0d71222485158e3e45a76b30438a71598a9c8f59272b1f80dd3f23`.
`source-indexed-unit-core-654-25` is admitted with direct,
deletion-negative, relabeled, and complete-callback smoke gates.  The saved
offset-4 assignment now hits it exactly and offset 4 has resumed at eight
million nodes.

The generated core-24 scalar replay is 1,019,023 bytes with SHA-256
`e9b9cdabf69f7e9fc186b6ae421167a2ea30026efff8c668af4cd3a27c81a470`;
its invariant collision wrapper has SHA-256
`65836c3a6b35d750e499781cc2c27320f2e4e1024d5a1be1f9657a0b46ca7375`.
The core-25 scalar replay is 2,746,524 bytes with SHA-256
`51b10e8a08227abec54216c95441d192a930ef8376ccaf33396fa06182112654`;
its wrapper has SHA-256
`38206c8c672dd6ba4045b9c65e2f2003a4b33a70052fbffba1d4f18a25fdf040`.
Both wrapper audits reconstruct every row polynomial, match the active
certificate support, and check the normalized and `EdgeClosure` fragments.
None of these generated sources contains `sorry`, `admit`, or a declared
axiom.  They remain unbuilt and are not kernel-checked evidence.

## Offset-3 successor and source-indexed core 26

The sixteen-million-node offset-3 restart did not hit its cap: after 4,590,472
nodes it returned a new target-negative shadow with signature
`97e7617d7a823c76bf1898f45831441ec258741cb421096973fe513cfa184871`.
Its encoding replay checks all twelve global/pinned rows and four shell
duplicates and gives canonical row-map SHA-256
`ab12c79e37c956aa91f39e735b3d3ada641b88313c588b996a98ba05973fdede`.
The then-current metric and exact banks were negative.  Gauges zero, one,
three, and four are `NONUNIT`, while gauge two is `UNIT` in both variable
orders.  Both variable orders of the reverse-row deletion pass retained the
same six-row, eighteen-equality core:

```text
0 : [1,2,6,8]
1 : [0,3,6,7]
2 : [0,5,8,10]
4 : [0,1,2,3]
5 : [1,4,6,11]
6 : [3,5,8,11]
```

Its expanded-system SHA-256 is
`55a2a122caaabf713275d7f3e3369cf8cf15e8b8134db5fff4cc4d61ab345683`.
The reverse-variable-order audit reports all six one-row deletions
`NONUNIT`, proving row-deletion minimality for this exact ideal.  No core among
14 through 26 injectively embeds into another up to relabeling.

The locked core-26 certificate has raw identity SHA-256
`c83b00b05b9f9fd590bad683571597f98486d76707b6528d919df6d6f2cebab2`
and certificate file SHA-256
`b49c4624b6109e108099c9194aed9d3dfd565065281ccc67c277199110e32cb0`.
Independent expansion verifies 18 generators, 16 nonzero multipliers, only
4,210 multiplier terms, at most 1,146 in one multiplier, maximum degree 6,
and cofactor sum exactly `1`.  The admitted generic matcher hits the saved
assignment up to relabeling, and offset 3 has resumed at sixteen million
nodes.  The 116,216-byte generated scalar replay has SHA-256
`eb88d9448a89524197b395844750313bbf9816b61e956edaba0f5803bfc5615b`;
the invariant collision wrapper passes its fail-closed audit with SHA-256
`43ad239ca075309e7ed13b2aa61face1a956213911bcfeba2ac0920f36a09cae`.
Both remain unbuilt.

These three new cores exclude three fixed finite-shadow assignments.  They do
not prove finite-shadow UNSAT, exhaust the `(6,5,4)` profile, or supply the
missing live `CriticalPairFrontier` incidence/localization theorem.  The
direct-`False` goal therefore remains open.

## Next offset-9 successor and source-indexed core 27

The offset-9 run with core 24 returned another target-negative shadow after
1,747,266 nodes, signature
`cbbdba56a459e197a1b66c1ef763226607fb160dc358da0b1f56c5dfb1c9c546`.
Core 24 fired five prefix cuts during the run.  The saved-pattern audit checks
all twelve global/pinned rows, all four shell duplicates, and canonical
row-map SHA-256
`51120b6485b8b60b19325b23ebfa1993fea8c47d9710bc5935f01e21b4e73b36`.
The current metric bank and cores through 26 were negative on the returned
assignment.  Gauge zero is `UNIT` in both msolve variable orders; gauges one
through four are `NONUNIT` in both.

The reverse-row deletion passes agree on a six-row, nineteen-equality core
with expanded-system SHA-256
`1462da443a07ffd4ca669dec37f9a2d5a1f94e573a3ac25807f585d1c3793a86`.
The forward-row passes retain a different six-row, eighteen-equality UNIT
subsystem.  Core 27 denotes the former.  Five of its six one-row deletions are
`NONUNIT` in both tested variable orders; deletion of row zero times out in
both, so row-deletion minimality is deliberately not claimed.

The locked core-27 certificate has raw identity SHA-256
`4106dfe7e3924779edc5ccadf02093bdde678d9c0fe7d8098ae85211c2c0b731`
and certificate file SHA-256
`164b946fbc3e39096c209abc4f13b4831eb126d86dd5dc3356867a045e610a7a`.
Independent replay verifies 19 generators, 17 active multipliers, 31,098
multiplier terms, at most 2,937 in one multiplier, maximum degree 6, and exact
sum `1`.  It has no injective-relabel embedding to or from cores 14 through
26.  Its scanner direct, deletion-negative, relabeled, and complete-callback
gates pass; the saved assignment now hits it exactly, and offset 9 has resumed
at four million nodes.

The generated scalar replay is 2,243,963 bytes with SHA-256
`c557c50791d1bc549b802dcf5eaf99886c0f12d4f094fe132a61b2040c3244b7`.
Its invariant collision wrapper passes the fail-closed polynomial/hypothesis
audit with SHA-256
`8cd499e3db035f7695f8bc88fd4dd5a5c72756b58b39f80dba77d1fad2310d1f`.
Both are placeholder-free and remain unbuilt.

## Certificate-gauge search for queued core 21

The shared offset-11/12 obstruction remains msolve-`UNIT`, but its original
Julia and Singular certificate routes timed out.  The exact certificate
generator now supports an optional internal row order while mapping the
resulting cofactors back to the canonical generator stream.  A core-26
regression reproduced the locked raw and normalized identity hashes and
passed the independent checker.  Eight distinct core-21 row orders then each
reached a twenty-minute cap inside change-matrix propagation without emitting
a certificate.  Thus generator order alone is not currently an effective
route.

A new fail-closed anchor-gauge scanner tested all 66 unordered normalization
pairs.  It found 7 gauges `UNIT` in both msolve variable orders, 38
`NONUNIT` in both, 20 timing out in both, and 1 `NONUNIT`/timeout split.  The
cross-checked UNIT old-anchor pairs are
`(0,1)`, `(0,3)`, `(0,5)`, `(0,9)`, `(1,3)`, `(2,3)`, and `(3,11)`.
The `(3,11)` gauge was fastest in the bounded msolve scan, but the `(1,3)`
change-matrix job was the first exact certificate to finish.  Its point
permutation and raw identity SHA-256
`847f5b22a9ef00b6af5a03b9e13963ee5aeccaa6213a160b0c3c64312893f5c5`
are now pinned in the generator.  The final certificate file has SHA-256
`60848f1370ddd8f557c0bb5aa0c8f33b3cbad99ec414789f05d171a3806d8fbc`.
Independent reconstruction verifies all 18 generators, 13 active
multipliers, 34,324 multiplier terms (at most 7,635 in one multiplier),
maximum degree 7, and exact sum `1`.  The companion anchor audit also proves
that the certificate's relabeled rows are exactly the `(1,3)` gauge of the
saved canonical core.

Core 21 is therefore admitted to the scanner.  Its direct, deletion-negative,
injectively relabeled, and complete-callback smoke gates pass.  Replay of the
two saved assignments reports an isomorphic core-21 hit for both offset 11
and offset 12, and both four-million-node shards have resumed with the new
cut.  The generated scalar replay is 4,250,490 bytes with SHA-256
`26c5ea2ac40c36588041deb21214780956e97402b68bc00603eedbcbf05072ab`;
the invariant wrapper passes the fail-closed audit with SHA-256
`257655d7477268d732a7632c46b182aadbcaef1efe8119ef5e781834269e61d0`.
Both sources are placeholder-free and remain unbuilt under the standing
no-Lean-build gate.

## Successors after cores 25, 26, 27, and 21

The offset-4 run after core 25 returned a one-row mutation of the preceding
full shadow (signature
`2193c4e99a0b5a74fdc6063d0303a1ee2c763092bd1089e727ea03a27b18abbb`).
The exact saved-row audit records canonical row SHA-256
`0fc3397231a281f8cf3ffd8d43ffe6d535a1517dec081bd0894ae081ac4d5b75`.
The same seven-row UNIT subsystem occurs in both full assignments and is
queued as core 28.  Six row deletions are `NONUNIT` in at least one exact
order while one deletion times out in both, so minimality is not claimed.
Its exact change-matrix job remains in flight and no scanner cut is admitted
from it yet.

After core 27, offset 9 returned a new current-bank miss after 1,860,255
nodes, signature
`1df28045e5ff28efce426e583b1a91c9c6c7d44ebb4b8fba60f5c05c55539f06`.
The exact encoding audit records canonical row SHA-256
`1d2aa86240b386090af674f67d45fabeb46b1dbe77af9a9c3069679119d942d4`.
Gauges four and five are `UNIT/UNIT`; the reverse deletion passes agree on a
six-row, 19-equality core with expanded-system SHA-256
`a3a4ebe5916823344529289c617bb9fda5c4cfc456a2cb4e473aace65b449334`.
The locked core-29 certificate has raw identity SHA-256
`e97a43f8648631faed145050f55995a7d35cd7f1b84aee772dd16c0b385edbe1`
and certificate SHA-256
`30febb44c1c7c393c2f988279caf5ee74dfaf89b0dbf78e8fa8b01dcb78a183b`.
It verifies 19 generators, 14 active multipliers, 39,051 multiplier terms,
maximum single multiplier size 14,042, maximum degree 8, and exact sum `1`.
The scanner direct, deletion-negative, relabeled, and complete-callback gates
pass; the saved assignment hits core 29 up to relabeling and offset 9 has
resumed at four million nodes.  The placeholder-free unbuilt scalar replay
has SHA-256
`95554743d58e3a16bcc5d385028e6f7a5a12dc3d37c1783149cf4215894fdb21`;
the audited wrapper has SHA-256
`ea3067cb381c04225d97b31adb43abaca9ae8469c97920bfb6c4055b04ed1dff`.

After core 26, offset 3 returned a new shadow after 6,139,775 nodes, signature
`aa280141e67587bb2469edf5f7353e7d40fd5c190b7f9ffdddd369996ee5d427`.
The saved assignment passes an exact 12-row/four-shell-duplicate audit with
canonical row SHA-256
`94ad3a8d4b63e4455d17633c7441e4d30531634541c2754ca34a7358bef1b4c9`.
Gauges two and three are `UNIT/UNIT`; reverse deletion in both variable
orders identifies the same six-row, 19-equality core 30.  Its locked raw
identity SHA-256 is
`29d23bb4e61fead5681317203b83c68c71fd1bd5868638fcc917b6ef37b4dd9b`
and its final certificate SHA-256 is
`25e730e0dcfab5d3ecde3c8591509f52556cefae36316fee50b630b634ca4dea`.
Independent replay verifies 19 generators, 14 active multipliers, 10,640
terms, maximum single multiplier size 3,065, maximum degree 8, and exact sum
`1`.  The scanner direct, deletion-negative, relabeled, and complete-callback
gates pass; the saved assignment hits core 30 up to relabeling and the
16-million-node offset-3 shard has resumed.  The placeholder-free unbuilt
scalar replay has SHA-256
`72a7615166f310d71bae91693ca6315367bad401296a453572f8ca4bd451cd20`;
the audited wrapper has SHA-256
`49ca0945105fcab118526d06abbd76334a814b2d7592cf64fc4809c22eb7dbd4`.

The resumed offset-11 shard after core 21 returned another current-bank miss
after 408,449 nodes, signature
`f4cdafa2a8dc8ced434956d7d3c3de15a018debfa007a1c2682130fb160e1743`.
Its exact encoding has canonical row SHA-256
`f8dd433b257e6a9e9ca6cbc1b7012f954a970afaf84af1558740c9de64e16855`.
Gauge three is `UNIT/UNIT`, and both reverse deletion passes identify the same
five-row, 16-equality core 31.  Deleting any of those five rows is `NONUNIT`
in both tested variable orders.  The locked raw identity SHA-256 is
`87ab512ed728d6abd3a420116298a06d4600e269c84a87e28e57f35b9d307f5f`;
the final certificate SHA-256 is
`2e476522bcaa05ef6793b63546ee8048d01ee217b575a757152327cd5af2141f`.
Independent replay verifies 16 generators, 10 active multipliers, only 854
terms, maximum single multiplier size 245, maximum degree 7, and exact sum
`1`.  All scanner gates pass, the saved assignment hits core 31 up to
relabeling, and offset 11 has resumed at four million nodes.  The unbuilt
placeholder-free scalar and audited wrapper have SHA-256 values
`a9ee164ca45310f8defc1c9fa505ff78ee94a560aab5b4c495d40a3d4be80264`
and `81e300366fd048b3cbb6b06e21d9ea06532ac6b92de66bf818f6ffda76459b84`
respectively.

Offset 12 also returned a new current-bank miss after core 21, at 828,532
nodes with signature
`5a5aa787c20c80ab925ddce78566db7016e6f5aebcabd7da137559db88244a4a`.
The exact encoding audit records canonical row SHA-256
`53f05cafd306c3a84af82fde168ccb84cc435f885f5b886ca2955b2dd2b4a56c`.
Gauges one and two are `UNIT/UNIT`; row minimization is still in flight, so
the two forward passes identify the same seven-row, 22-equality subsystem
with expanded-system SHA-256
`1eccfa864a15925b629c7c21795e0dfd86a0c9fa43c63874f4800ab7726ddef5`.
Deleting any of its seven rows is `NONUNIT` in both tested variable orders.
The reverse passes retain a different seven-row subsystem with several
unresolved deletions.  Core 32 denotes the stronger forward subsystem; its
exact change-matrix job is in flight and no scanner cut is yet admitted.

None of these finite-shadow cuts supplies the missing general incidence or
localization theorem from `CriticalPairFrontier`; the direct-`False` goal
therefore remains open.

## Strict-interior production frontier and cores 33--35

`card_five_interior_critical_frontier.lean` is a new isolated bridge from
exact card five to the production frontier.  It strengthens the earlier
unary survivor selection: among the three strict-interior first-apex class
members it chooses two outside one fixed second-apex selected class, so their
simultaneous deletion preserves K4 at `S.oppApex2`.  The resulting
`CardFiveInteriorDoubleDeletionPair` converts to the production
`SurvivorPairRelocationPacket` and `CriticalPairFrontier`.  The public
`CardFiveInteriorCriticalPairFrontierPacket` retains the strict-interior pair,
and its `frontier` is definitionally constructed from that pair.  This makes
the existing directed-cross blocker-localization theorems applicable to the
actual production frontier pair.  The file is placeholder-free but remains
unbuilt under the standing no-Lean-build gate, so this is not yet
kernel-checked evidence.  It still does not produce the missing residual
member's selected class through the common pair.

After core 31, offset 11 returned a new bank miss after 684,204 nodes,
signature
`55ecb75515dd620ed4e1783024e35af739ffa01ccd3078a352e211410b22273e`.
Its exact encoding has canonical row SHA-256
`e99adf80569a78483433d95edc211d75f821d2c6de8388a2a5ade4b218163ea4`.
Cyclic gauges nine and eleven are `UNIT/UNIT`.  Reverse-row deletion in both
variable orders identifies the same six-row, eighteen-equality core 33, with
expanded-system SHA-256
`8a23f9b8f4579ff92b03cc97eca0da29d169e3932e5744e392b1790dae68bb27`;
every one-row deletion is `NONUNIT` in both orders.  The locked raw identity
SHA-256 is
`237b9d2f41912438eb91c54b548d7535106265070fea4c1ce5ec10369e154404`,
and the final certificate SHA-256 is
`38229f37e18e519a62ac085d3059a0fde046c034944a409bfa0cc36ced802c7d`.
Independent replay verifies 18 generators, 13 active multipliers, 5,000
terms, maximum single multiplier size 1,274, maximum degree 7, and exact sum
`1`.  All scanner gates pass and the saved assignment hits core 33 up to
relabeling.  The placeholder-free unbuilt scalar replay and audited wrapper
have SHA-256 values
`6398352a8988922b32742a5ab68542b97d616341daef945a930771039f80d4af`
and `1c1db9dbc20708960e395a04c14385dc9a2bf0e2d8cc1aa4fbb53240b69ea0d2`.

After core 29, offset 9 returned another bank miss after 1,860,287 nodes,
signature
`0010ea6b2981fb2ff839be8fc506747ff0844593e7e8c2353c00704825c33a57`.
The exact saved-row replay checks all twelve global/pinned rows and four shell
duplicates and records canonical row SHA-256
`916940fd30ecb3044d3e4bc4d2a222366ab168267e1d7337d04e41b6c8f4e484`.
Gauges four and five are `UNIT/UNIT`.  The reverse-row passes agree on the
six-row, nineteen-equality core 34 with expanded-system SHA-256
`6d96f1287c6e18f66755db087382580ed3ec32372c8b4f67e27efa4da842e546`.
Five one-row deletions are `NONUNIT` in at least one exact order; deletion of
row zero times out in every tested order, so minimality is not claimed.  The
locked raw identity and final certificate SHA-256 values are
`82c9b4b44979e98d6a657e6728a9e9e13ddf88be36944bf580818e2ba2b80572`
and `1839cd38aa99aacc0a844602242cfe82ebc0d8b071f9bbc5b9cb41ba54c45ade`.
Independent replay verifies 19 generators, 14 active multipliers, 24,719
terms, maximum single multiplier size 6,077, maximum degree 8, and exact sum
`1`.  Scanner gates pass and the saved assignment now hits core 34 up to
relabeling.  Its placeholder-free unbuilt scalar replay has SHA-256
`00ba46792320f362e7705a52692898720845ff8f0031b7c4fc4ae6cf752bd52f`;
the audited wrapper has SHA-256
`4246d5500765374e7f63897dbef1af71b99eddc78708b1efa6e3c0a82536f03b`.

The resumed offset-11 shard after core 33 returned a further current-bank
miss after 724,587 nodes, signature
`c8a2f3a15cf477ed1c092831d13f16f16e3a48f848058362dd56d8c4d7f730e7`.
Its fail-closed encoding replay gives canonical row SHA-256
`0fe506e46a4f396e7c298974d2d7d0bf6efe7158e0cdbd1c136d8ccce56cbcb8`.
Gauges seven, eight, and nine are `UNIT/UNIT`; row deletion is in flight and
no core 35 scanner cut is admitted yet.

These are fixed finite-shadow exclusions, not an exhaustive `(6,5,4)` result
and not a proof of any accepted general producer.  The direct-`False` goal
remains open.

## Cores 08 and 11, and the current parallel certificate queue

Two further fixed shadows now have fully tracked, independently replayed
change-matrix certificates and scanner cuts.  The old offset-7 shadow contains
the five-row interior-bank core `unit-core-654-08`, whose 15 reconstructed
generators have 13 active multipliers, 31,387 multiplier terms, maximum
single-multiplier size 10,500, maximum degree 11, and exact cofactor sum `1`.
Its certificate SHA-256 is
`566396c6c96827ebfc5b20f3c17378cc4f2ee6693c263e558bde37cff514a3f8`.
The corresponding placeholder-free, unbuilt scalar replay and audited
collision wrapper have SHA-256 values
`fed12d888507e0a3e6907589ebf079c479e6935f97ed302f10d294647fa44d2f`
and
`86142b38998bae871a86c0ae1a96f93f275e1a624fffb3ef50fe247c86ccad98`.
The current scanner recognizes the core both literally and up to injective
point relabeling, and the saved offset-7 assignment replays as an exact hit.

The current offset-0 shadow contains the six-row
`source-indexed-unit-core-654-11`.  Independent reconstruction verifies all
19 generators, 14 active multipliers, 44,394 multiplier terms, maximum
single-multiplier size 11,993, maximum degree 9, and exact sum `1`.  Its
certificate SHA-256 is
`4b00f621ff4d9efffd45874a88d640b70f83539ad3114dd881d745ab080fd944`.
Its placeholder-free, unbuilt scalar replay and audited collision wrapper
have SHA-256 values
`bc3a3f5ab1e95f75853a70cf458593228bb814dac38361472038db409d1219ef`
and
`a69b6adc8f43a94f1b2733605eac79e4ba85de7ef9e3ec309402f174ff8b2247`.
All scanner gates pass, the saved assignment hits the core, and offset 0 has
resumed at four million nodes.

Core 28 has completed the full admission path.  Its pinned raw identity
SHA-256 is
`27def8ba53ac864577d4673d21999a47cbb2989b939ca299ac73cc6c5fc83f96`,
and its deterministic tracked certificate SHA-256 is
`2b315342941eb6526d95525268eaa0a01bb7e771288b2d555b6dc8dbdc3af0d3`.
Independent reconstruction verifies 22 generators, 20 active multipliers,
195,929 multiplier terms, maximum single-multiplier size 43,710, maximum
degree 10, and exact sum `1`.  Scanner smoke gates pass, and both saved
offset-4 assignments hit the core up to injective relabeling.  Its
placeholder-free, unbuilt scalar replay and audited invariant wrapper have
SHA-256 values
`1f9183199bcead12789ce2f2796fab5e7a8145a38bca5cd86f1e3045a3981c29`
and
`9d4c7c83aec5553ad7f440884d8e946bbf40b976c0bfd5525a32e70a60b7f4a3`.
Offset 4 has resumed at eight million nodes with the cut active.

Core 36 has now completed that full admission path.  Its pinned raw identity
SHA-256 is
`b735ebcfd3a0f5ae7a600108776da28c9ca64b95fca0f9152c32f2dcc76b02e5`,
and its deterministic tracked certificate SHA-256 is
`cc5336400a082434cdfc9c7177f6f254b2b26aa2d7bacddcd7b09074e857e53c`.
Independent reconstruction verifies 21 generators, 20 active multipliers,
28,824 multiplier terms, maximum single-multiplier size 2,689, maximum degree
5, and exact sum `1`.  The scanner smoke gates pass and the saved offset-5
assignment hits core 36 up to injective relabeling.  Its placeholder-free,
unbuilt scalar replay and audited invariant wrapper have SHA-256 values
`0b233fb858f8ab0e26205f2658e9f118875872e649d633d5f0763dc80183efab`
and
`1b79cfa4acc46fbf15b2c8818991820810e4589024920089d5728e84eed5f5e1`.
Offset 5 has resumed at four million nodes with this cut active.

Core 38 has also completed the full admission path.  Independent
reconstruction verifies 18 generators, 16 active multipliers, 119,992
multiplier terms, maximum single-multiplier size 45,258, maximum degree 10,
and exact sum `1`.  Its pinned raw identity SHA-256 is
`0b0eb013671f26b761093cf498ab33486bb6bebeef4a787def1047d901570c99`,
and its deterministic tracked certificate SHA-256 is
`a862f719ad5922c2039b0a6b48748efe6e192e070b468e966f9257c3c3f7b97f`.
Scanner smoke gates pass, and the saved offset-9 assignment hits the core up
to injective relabeling.  Its placeholder-free, unbuilt scalar replay and
audited invariant wrapper have SHA-256 values
`3da3eed41a9ac43ac28b76486cbb7e1fd31d84ac1465610d98398633e1147270`
and
`ae0bcae693c2d645e2019b4df4011b2db63db98b2f52a3d2c7a465d9ed014f97`.
Offset 9 has resumed at four million nodes with the cut active.

The next offset-7 survivor appears after 371,246 nodes with assignment
signature
`12c2e483c95fe6175b8506e386878806ff4275d48e3f3220ace8e820c3829bda`.
Three deletion passes leave two six-row alternatives; the chosen core 39 has
18 equalities rather than 19, is `UNIT` in both direct msolve orders, and has
no injective-relabel embedding to or from the existing source-indexed unit
cores.  Its expanded-system hash is
`3e4716d1b8b2f8157a5e1a6e4230d6ffcbc927789cfead60bee9ffc457821233`.
The next offset-3 survivor appears after 8,301,289 nodes with signature
`afbde5899e9e170fcf7abdb47907e2c9db02a8a9cf536461d0c2a64b97fc0c39`.
Its preferred six-row core 40 has 19 equalities, is `UNIT` in both orders,
has expanded-system hash
`c8e1c7eec98663e9d14eef4027a284f8dc48f0aa6bc9d08b4b0090c5a4e88e95`,
and is likewise new up to the tested injective relabeling.  Exact certificate
jobs for both cores are active; neither is admitted.

The older queued offset-10 and offset-14 cores, respectively cores 16 and 18,
were rechecked directly as `UNIT/UNIT` and non-isomorphic to the present core
bank.  Exact certificate jobs are now active for both.  The other active
certificate gates are cores 02, 10, 14, 32, 35, 37, 39, and 40.  Core 32
is using a reverse row order; core 35 is a deterministic tracked rerun after a
temporary certificate replayed.  Core 14 had already reached twelve
independent twenty-minute certificate caps; its current two-hour attempt
remains only a timeout race, not evidence of nonexistence.

The authorized long-run queue remains capped at sixteen and is kept saturated
when a sound certificate, deletion, or scan job is ready.  Offset 13 is
finite-shadow UNSAT only; the other unfinished branches await a certificate
admission, a resumed scan, or extraction of the next current-bank miss.

A fail-closed theorem-discovery matcher also tested 106 parsed source-proved
U5 class-incidence contradiction consumers against the latest saved survivors
for offsets 0, 3, 5, 7, 9, and 14.  A separate fail-closed matcher covers all
eight declarations rejected by the first parser: raw row-distance closure,
exact pinned-circle nonmembership, convex-independent noncollinearity, one
membership disjunction, and the class-only tetrahedron kernel.  Its positive
smoke gates exercise every added hypothesis kind, and its missing-class
negative gate rejects an incomplete package.  All 114 source-proved consumers
have zero matches on all six survivors.  The same two fail-closed matchers
were rerun on the newer offset-0, offset-5, and offset-9 signatures
`28a7aebe...`, `d3aae93e...`, and `5c195f57...`; all 114 consumers again have
zero matches, with every metric-kernel smoke gate passing.  This closes no
general theorem-bank route and makes no realizability claim.
No theorem-bank search has produced the residual-centered
`SelectedFourClass` through the coincident common pair.  Thus every new core
here excludes a fixed relaxed shadow only; the accepted direct contradiction
and all three named intermediate outputs remain open.

The offset-0 resume after core 11 produced another current-bank miss after
2,563,183 nodes, assignment signature
`0392366851f0aaca3f5d2c3009ab43b080d3f03beeb0e2aa90c15e5e52da6a26`.
The fail-closed saved-encoding replay checks all twelve global/pinned rows and
four shell duplicates, with canonical row SHA-256
`2e78700a46eb8384c895ecaa3c5ac20b88c0485ea4667cbadd6c37c803ba8e3e`.
The full 37-equation ideal is `UNIT/UNIT`.  The forward-row deletion passes in
both variable orders agree on the same six-row, 19-equation subsystem with
expanded-system SHA-256
`407b26d022749528e27cf0d4b90ce5ff7ea6b52b7bc70f96794337b93cbf93c8`.
Both reverse-row passes agree on a larger seven-row, 22-equation alternative.
The six-row winner is core 41: it is `UNIT/UNIT` directly and has no
injective-relabel embedding to or from the previously admitted exact-QQ core
bank.  Its pinned raw identity SHA-256 is
`98820dc9c54395f0bebdd3095f965f6421a9bb12053bcb80be3634f4c727a305`;
the deterministic tracked certificate SHA-256 is
`07021b1de0b3fafa3ffcb265667df8c830d8257e5a0cbc192547ffd5bc0f9a22`.
Independent reconstruction verifies 19 generators, 13 active multipliers,
16,409 multiplier terms, maximum single-multiplier size 4,716, maximum degree
8, and exact sum `1`.  Scanner smoke gates pass and the saved assignment hits
core 41 both literally and up to relabeling.  Its placeholder-free, unbuilt
scalar replay and audited invariant wrapper have SHA-256 values
`df1e3a56032c04abb7af000c406458ae6b81f7c1e10cc11c115a8f2d465a03d5`
and
`89e70ca8baa2ac7dce2f7eba87fa529fb5120639485799404357f76bc1f9dbd1`.
Offset 0 has resumed at four million nodes with the cut active.

The offset-5 resume after core 36 produced a new SAT shadow after 883,495
nodes, assignment signature
`d3aae93e0b70df73a5a6c6d6d9563cf52ef785f162848560c9996657a2a5550b`.
Core 36 rejected 27 complete assignments on the way to that successor but did
not close the branch.  The successor's exact-encoding replay checks all twelve
global/pinned rows and four shell duplicates, with canonical row SHA-256
`790416150db8016370d657268df1cdf1e9235411462f2163d78917e82b8bb1f8`.
Its full 37-equation ideal is `NONUNIT/NONUNIT`; a forced-collision scan is
inconclusive after the forward Singular order timed out at 300 seconds, and a
reverse-order pass timed out identically.  However cyclic gauge two, which
normalizes original labels 10 and 11, is `UNIT/UNIT` in direct msolve.  The
forward-row deletion passes retain the same seven-row, 21-equation subsystem.
Both reverse-row passes independently retain a smaller six-row, 19-equation
subsystem with expanded-system SHA-256
`851cc6f2165ab6f5c748497781d2fd39ee3806c50c4d4597e0b895c7ec7cc0c6`.
The smaller subsystem is `UNIT/UNIT` directly, is core 42, and has no
injective-relabel embedding to or from the previously admitted scanner bank.
Its deterministic tracked certificate independently reconstructs 19
generators and 15 active multipliers, with 8,632 total multiplier terms,
maximum single-multiplier size 2,406, maximum degree 6, and exact sum `1`.
The raw identity SHA-256 is
`f92a05ddc35d335e17d7aaa2bd2c86bad31e39df7826f4f1196dd84cb65e63c7`
and the certificate SHA-256 is
`f1fdec0d6ddcb1c3792391400e8e3503c17adfe6d39817670cfe93288424621a`.
Scanner smoke gates pass and the saved offset-5 assignment hits core 42 up to
relabeling.  Its placeholder-free, unbuilt scalar replay and audited
invariant wrapper have SHA-256 values
`63742eb752df70af7a9c7f07aa4615f95b6f91ded3efdf35122a2fd24598ac43`
and
`4a431b2ba227b7192a4113e4afe0d2fcb352be3f3e2266e2cb85778d21e56ac2`.
The first seven-row temporary certificate is superseded and was not admitted.
Offset 5 has resumed at four million nodes with core 42 active.  Because gauge two maps
original labels 10 and 11 to normalized anchors 0 and 1, a replayed
certificate will identify the exact forced-collision target `P10 = P11`.
A hash-bound eight-start convex numerical scout found no witness, while the
30-second Z3/cvc5 QF_NRA counterexample query returned `UNKNOWN/UNKNOWN`.
Those latter results are heuristic/inconclusive; the gauge-two unit
certificate is the sound route.

The offset-0 resume after core 41 produced another current-bank miss after
2,561,220 nodes, assignment signature
`28a7aebecda7969dc35d989757ab7adee67571d5e66de3b5d9e79083e2f8d1b0`.
The fail-closed saved-encoding replay checks all twelve global/pinned rows and
four shell duplicates, with canonical row SHA-256
`978ae76410462d1b78236500cdd78f27aa92828a3cb95b395be25925c62512cc`.
Its full 37-equation canonical ideal is `UNIT/UNIT`, with expanded-system
SHA-256
`761857eb74b72caa45e36397b1d9a214e827d8e03970118370d95ff303eca3a4`.
The two forward-row deletion passes agree on the same six-row, 19-equation
subsystem with expanded-system SHA-256
`b2b832861d062fdf9c4787b9cee27733c5013c199dc688bc47de8f26f7c61dbc`.
It is `UNIT/UNIT` directly and has no injective-relabel embedding to or from
the previously admitted scanner bank.  Both reverse-row deletion passes agree
on the same larger seven-row, 22-equation alternative.  The six-row winner is
core 43.  Its pinned raw identity SHA-256 is
`09d06be47700d200c4852836767177d852be3de8a4a702e0c5c169a8fd4b6c0a`,
and its deterministic tracked certificate SHA-256 is
`cde6d4ecb8c142fab23ce71cd6c2f48ac0a46edb0effc0470aedfb783e95caf4`.
Independent reconstruction verifies 19 generators, 16 active multipliers,
15,301 multiplier terms, maximum single-multiplier size 4,526, maximum degree
8, and exact sum `1`.  Scanner smoke gates pass and the saved offset-0
assignment hits core 43 up to relabeling.  Its placeholder-free, unbuilt
scalar replay and audited invariant wrapper have SHA-256 values
`92ae22df9fdc7cb49a054e299e2b608bc6cd09a8cf63bafbd21bd774b3d82933`
and
`852eb93bac4a8032c836820a44b074db15807469fbca82c42ecaac412d12a33e`.
Offset 0 has resumed at four million nodes with core 43 active.

The offset-9 resume after core 38 produced another current-bank miss after
1,862,027 nodes, assignment signature
`5c195f57028f8499b652f8855d8557227a43a93a02bc3e3ddece3bb5504216ee`.
Core 38 rejected six complete assignments before that successor.  The exact
saved-encoding replay checks all twelve global/pinned rows and four shell
duplicates, with canonical row SHA-256
`92c0d7a0fcf3b5bab75d1b7f6dc3315da6490b41350f85fb810d3e1b8ca2a852`.
Its full 37-equation canonical ideal is `NONUNIT/NONUNIT`, not a realizability
result.  The exact 66-anchor sweep finds 29 `UNIT/UNIT` gauges and 37
`NONUNIT/NONUNIT` gauges.  Five consecutive-label gauges were rechecked in
the cyclic normalization used by the deletion tool and are all `UNIT/UNIT`.
The two forward-row deletion passes agree on a seven-row, 21-equation
subsystem.  The first reverse-row pass yields a smaller six-row, 19-equation
subsystem with expanded-system SHA-256
`78d86fa38af94973e2cc748c3b09d855b9a2ed4b7f3d3697642de646dcdae150`.
Both reverse-row deletion passes agree on that smaller system.  It is
`UNIT/UNIT` directly, is new up to injective relabeling, and is core 44.
Gauge two normalizes original labels 10 and 11.  The preliminary
forward/reverse Singular runs only timed out on the full canonical ideal
before reaching pairwise membership and are discarded as non-results.  The
default and reverse Julia row orders independently computed raw identity
SHA-256
`cebcb788adb677089421d10d166d2a0abc1c7ddf5de3f5f746e33c7cac51a695`.
The completed default temporary certificate has SHA-256
`9bb58fa078606601c5a417b6f391a6278f762c8edc964d0f80897d0348424016`;
independent reconstruction verifies 19 generators, 17 active multipliers,
237,549 multiplier terms, maximum single-multiplier size 67,445, maximum
degree 9, and exact sum `1`.  A hash-pinned deterministic tracked rerun is
active.  Core 44 is not admitted until that tracked rerun and its replay pass.

Core 35 now closes the saved offset-11 shadow with assignment signature
`c8a2f3a15cf477ed1c092831d13f16f16e3a48f848058362dd56d8c4d7f730e7`
up to relabeling.  Its pinned raw identity SHA-256 is
`e81b944c18c074162c50e571f21800f44d46cb1aaf70e67da1e5db1081f2aab7`,
and its deterministic tracked certificate SHA-256 is
`e6dfbfb5754be0cf6c7ae04e4f62ead917945b374a15952107ae0973788bbf44`.
Independent reconstruction verifies 18 generators, 15 active multipliers,
82,181 multiplier terms, maximum single-multiplier size 13,781, maximum
degree 8, and exact sum `1`.  Scanner smoke gates pass.  Its placeholder-free,
unbuilt scalar replay and audited invariant wrapper have SHA-256 values
`3e6016ea85c5731c077553891f5aeec6a7a2ab3e8f98d92a5d95afdec7abc14f`
and
`36c3d0565139f9fdd75cf1c5444a01cea5c011e56ed513aa5b27e414305a7913`.
Offset 11 has resumed at four million nodes with core 35 active.

The offset-0 resume after core 43 produced another current-bank miss after
2,775,638 nodes, assignment signature
`8273a44e94bb399e68186cd606cc7e73bb80c39758ab9b8cf79f660e3a868fdb`.
The fail-closed saved-encoding replay checks all twelve global/pinned rows and
four shell duplicates, with canonical row SHA-256
`a77c802b0a2c79da307191b20331b5932eb2b59a831f5440127c6bd5a04214a7`.
Its full 37-equation canonical ideal is `UNIT/UNIT`, with expanded-system
SHA-256
`4eb5d0b8a503f6ae518cadafae01dc606cb353c8d5995c1289fd1ff3fe27451e`.
Both forward-row deletion passes independently retain the same five-row,
16-equation subsystem with expanded-system SHA-256
`907860e23d88eb2f7f1f8ff506f6c9ff6c31f699b0e7f1f7537cf1b75af0eca8`;
both reverse-row passes retain a larger seven-row alternative.  The five-row
subsystem is `UNIT/UNIT` directly and has no injective-relabel embedding to or
from the admitted scanner bank.  It is core 45.  A Singular unit lift passed
its internal check and exact SymPy replay, and two Julia row orders agreed on
the raw identity SHA-256
`8007b48d2c36c30604d5878b4499e46df2a08330e74c1e9317eea29c25dd6c63`.
The deterministic tracked Julia certificate has SHA-256
`ca9b0a459ecf466b5518992f278d97067251a6f1854cc0f0e0feb39d3fbbd19b`.
Independent reconstruction verifies 16 generators, 11 active multipliers,
2,493 multiplier terms, maximum single-multiplier size 846, maximum degree 6,
and exact sum `1`.  Scanner smoke gates pass and the saved assignment hits
exactly core 45.  Its placeholder-free, unbuilt scalar replay and audited
invariant wrapper have SHA-256 values
`4895d312ca42fa96f42a1fa2c0e1eb381aedb83bc9c50942899283791fed2534`
and
`88351562fed04ba77b1b111a27faa89ef97473aaee782afb4c2cfd6e6a45214c`.
Offset 0 has resumed at four million nodes with core 45 active.
The required sibling-bank preflight reports zero hits on this shadow across
all 106 source-proved incidence consumers and all eight residual metric
kernels; every metric matcher smoke gate passes.  This is theorem-discovery
evidence only.

Offset 4 reached eight million nodes after core 28 and offset 5 reached four
million nodes after core 42 without finding a successor or exhausting the
branch.  Both reports are `INDETERMINATE` at their node caps, not UNSAT
results and not proof closure.

The offset-11 resume after core 35 produced another current-bank miss after
1,081,838 nodes, assignment signature
`b55979797ff527d57a36f6e6b1ef30347b55c50b43eba9e106802305ab35b905`.
The fail-closed saved-encoding replay checks all twelve global/pinned rows and
four shell duplicates, with canonical row SHA-256
`223bedeed23492ae46473b47aaf7cee66a1b7d6695fa4a9355dbee87d0969d19`.
All 114 source-proved U5 bank consumers again report zero theorem-discovery
hits, with every metric smoke gate passing.  The canonical 37-equation ideal
is `NONUNIT/NONUNIT`, with expanded-system SHA-256
`92ca2f1ce83c3c8187e06c71fc55958210e2bc7c576924bd88c2fbe0bcb3b9b9`;
this is not a realizability result.  The exact 66-anchor sweep finds 14
`UNIT/UNIT` gauges and 52 `NONUNIT/NONUNIT` gauges.  The fastest unit gauge
normalizes original labels 8 and 9 using old-to-new permutation
`[2,3,4,5,6,7,8,9,0,1,10,11]`; its full expanded-system SHA-256 is
`f007f483dd56bb78b37ab63a9e8beb1cf600e5dacb0864472666be1f647cafa2`.
Both forward-row deletion passes retain the same six-row, 18-equation
subsystem, while both reverse-row passes retain a larger seven-row subsystem.
The six-row system has expanded-system SHA-256
`e020c408ae96d7daa2674fead6282c3c80cd2a6f86e9934bf81caec4db91ac63`,
is `UNIT/UNIT` directly, and has no injective-relabel embedding to or from any
admitted or queued unit core.  It is provisional core 46.  Singular-lift and
Julia change-matrix certificate routes are active; no core-46 obstruction is
admitted yet.

## Exact-gauge queue update: cores 02, 10, 44, and 47

Core 44's hash-pinned tracked rerun has now completed with the same raw
identity SHA-256
`cebcb788adb677089421d10d166d2a0abc1c7ddf5de3f5f746e33c7cac51a695`.
The tracked certificate SHA-256 is
`9bb58fa078606601c5a417b6f391a6278f762c8edc964d0f80897d0348424016`;
independent reconstruction again verifies 19 generators, 17 active
multipliers, 237,549 multiplier terms, maximum single-multiplier size 67,445,
maximum degree 9, and exact sum `1`.  The scanner smoke gates pass and the
saved offset-9 survivor hits core 44 up to relabeling.  Its placeholder-free,
unbuilt scalar replay and audited invariant wrapper have SHA-256 values
`8a8402ed90bcba39b414fe2cc53ccd590abd43a708efc4718f4a2cecb8455b58`
and
`6327583ee4675717f0da618e93f0abfa953d851d3f0457935ddc96252475a1fa`.
Offset 9 has resumed at four million nodes with the cut active.

The offset-0 resume after core 45 produced a further current-bank miss after
3,298,808 nodes, assignment signature
`24c674a0f324ce9c435e1ec7516566b3982b48d3536564a426b4782d760d2b45`.
Its fail-closed saved-encoding replay checks all twelve global/pinned rows and
four shell duplicates, with canonical row SHA-256
`572e2d8983657419861a0cb513155b4bfc22a72881320fb25d7545fcd9d1dfcc`.
All 114 source-proved U5 theorem-bank consumers report zero discovery hits,
with every matcher smoke gate passing.  The canonical 37-equation equality
ideal is `UNIT/UNIT`, with SHA-256
`bfcf685d1c40112312f26d87df3a314378c251905ac7ea7d9d9d52a7bb322dc5`.
Forward deletion in both variable orders retains the same six-row,
19-equation core with SHA-256
`f355dc18d8515a63d589f48cbea997749e1b9778ab5513ca5f7ad1806f1d49cd`;
reverse deletion in both orders retains a different six-row core with
SHA-256
`7613d9a69172b033e2936265c5ef595e66f10f33afb3530cd605934cdee25091`.
Neither subsystem embeds in, nor receives an embedding from, any admitted or
queued exact core.  The forward subsystem is admitted as core 47 because it
yielded the first replayed certificate.

Singular produced a unit lift for core 47 and its internal exact-SymPy replay
passed.  Independently, Julia produced a smaller identity with pinned raw
SHA-256
`0f34d517464404286576bdb228f40588de2c5bd631736bdbaa79787c381f366e`.
The deterministic tracked certificate SHA-256 is
`809949c8253415be395812838a7fdd63c0258f09482b3f49c92b3d82c8dceee8`;
independent reconstruction verifies 19 generators, 12 active multipliers,
6,816 multiplier terms, maximum single-multiplier size 2,569, maximum degree
9, and exact sum `1`.  Scanner smoke gates pass and the saved offset-0
survivor hits core 47 literally.  Its placeholder-free, unbuilt scalar replay
and audited wrapper have SHA-256 values
`72e5b1fc16369bdca210ccd3f3b2137f78a9c4c479391c2bcb38e8342fee4df9`
and
`e79ce7a75925e58e38b0372ff9e2d32521115b7c0713de93ba59838ca4ef9a53`.
Offset 0 has resumed at four million nodes beyond core 47.

The complete 66-anchor sweeps for queued cores 02 and 10 found eight and
fifteen `UNIT/UNIT` gauges, respectively.  Normalizing old anchors `(1,8)`
for core 02 gives core-system SHA-256
`648d2a73b6aec22369993df730d70e60ade24fb1feab1008d5f8127e8babfaec`;
normalizing `(1,9)` for core 10 gives
`0375b3c66ab9cdd927bd829d2865c3e6f911c43af001f0fee4eb3912cd9f86b7`.
Both Singular unit lifts pass their internal exact replay and the independent
certificate checker.  Core 02's certificate SHA-256 is
`3db0582909f9446e1fad3a157658f79d679d881a06c2c4838f6bd4487704c389`;
it has 19 generators, 17 active multipliers, 60,599 multiplier terms, maximum
single-multiplier size 13,428, maximum degree 10, and exact sum `1`.  Core
10's certificate SHA-256 is
`d4e4182f0efac8ddc8cfdbd6bb0f03a0c5dd5a59e536d3ba1b3dc7904b1ae193`;
it has 19 generators, 18 active multipliers, 135,340 multiplier terms,
maximum single-multiplier size 31,244, maximum degree 12, and exact sum `1`.
The saved offset-2 and offset-1 assignments hit cores 02 and 10 literally and
all scanner smoke gates pass.  Their audited invariant-wrapper SHA-256 values
are
`ca0863f0172f0a72643523ff48adab9e0e841337faf97883f4d243e43b24386e`
and
`5c2f9c89ddd79099c28857b349eaec626eee8fd31ff504f4adeab0a883f1ddcb`.
The generated unbuilt scalar sources have SHA-256 values
`964008eb50cc7b829ff9fbd3cde771f27410f74793c85234088da0fd5193b977`
and
`7c52b3f59bcf02ffbddbea4e0e83ac8a7c6fd4774ab85d9875d6658e85f3725b`.
The latter source is about 148 MB and is therefore exact scratch evidence,
not yet a practical production certificate.  Offsets 2 and 1 have resumed at
four million nodes with their cuts active.

The anchor sweeps for queued cores 14, 37, and 40 found 14, 20, and 15
`UNIT/UNIT` gauges.  Singular unit-lift attempts in the fastest gauge for each
timed out at 300 seconds; these are non-results.  Gauge-specific Julia jobs
are active, with additional bounded Singular races for cores 37 and 40.
Core 46's two Julia certificate routes also remain active.  None of this is a
direct `False` proof or one of the three accepted frontier packets yet; the
finite-shadow CEGAR queue is still theorem-discovery and exclusion evidence.

## Successor round: exact cores 40, 48, and 49

The post-core-02 offset-2 search found a successor after 570,339 nodes, with
assignment signature
`ffa4b7a6d4a8becf15b8b0bc8a69c4b9f361882d34d74f42577135642146d55a`.
The fail-closed encoding audit checks all twelve global/pinned rows, four
shell duplicates, and canonical row SHA-256
`a5abb26a390d5388e074c9f2e1dc883fbe470dd596f0e3d304702ff1d508e745`.
Its canonical 37-equation ideal is `UNIT/UNIT`, with SHA-256
`3d99d260f0c69eb65ec5a2267b7fc1a67f938dfdfca3b6bf0b2d8d66b939b80b`.
Forward-row deletion in both variable orders retains the same six-row,
19-equation subsystem, core 48, with SHA-256
`b3d0c80e40eb6c3163fd4a1438f624836643a4476ce4ac7ee3f2658627f7db6c`.
The complete short-cap anchor sweep finds eight `UNIT/UNIT` gauges; the
fastest normalizes old labels `(1,9)` and has gauge-system SHA-256
`56bfa3781c59e322a1bcf3859fff43777178a2f0e11338c6ea941ca4afeeaf47`.
Its Singular unit lift passes both the internal check and exact SymPy replay.
The independently reconstructed tracked certificate has SHA-256
`07fef744c80308196a0dafd5734716bd3c1a593d349164812e78f972f273c941`;
it has 19 generators, 16 active multipliers, 18,157 multiplier terms, maximum
single-multiplier size 5,181, maximum degree 10, and exact sum `1`.  Scanner
smoke gates pass and the saved assignment hits core 48 literally.  The
placeholder-free, unbuilt scalar replay and audited invariant wrapper have
SHA-256 values
`0ad8f016e13bb095fe8ea23b27a171d568e3bffe29a7893a243a4f6af6c2b2cb`
and
`c489efc3e4a66f714427ff275639e4006b165db39560dfd94860a6dfcbe7decd`.
Offset 2 has resumed at four million nodes with core 48 active.

The queued offset-3 core 40 has also crossed the certificate gate.  Its
anchor-`(8,9)` Julia identity has raw SHA-256
`f6261397e05a9a4aa86f9542aec0f05ef693529462b34f6980c066854b008f86`
and tracked certificate SHA-256
`fa97a054a27941e82a8ad7ce674821930c4ecf9f16a88112549a3e9b8940be32`.
Independent reconstruction verifies 19 generators, 15 active multipliers,
168,149 multiplier terms, maximum single-multiplier size 40,731, maximum
degree 10, and exact sum `1`.  The generator spec now pins the exact old-to-new
point relabeling and gauge-system SHA-256
`ffde43c9d3ac811227b8dda3084d9f9eb61931a1b25ef3d8a117f03c09853e6a`.
There is no injective-relabel embedding to or from the admitted bank.  Scanner
smoke gates pass and the saved offset-3 assignment hits core 40.  Its unbuilt
scalar replay and audited wrapper have SHA-256 values
`159c7849b2782be74e15dc133f7b2831a2974e6357da5b8ca797f330cd1390d3`
and
`3a5c4f844e0203b91dbe09bd993529f7b57786bc503cfa822d10580cfaade503`.
Offset 3 has resumed at four million nodes with core 40 active.

The post-core-47 offset-0 search found another successor after 3,620,040
nodes, with assignment signature
`1b1ca643f68ab8f3a3b000de92bb928b795311fcc306168f7d879bc4cf964946`.
Its exact encoding has canonical row SHA-256
`2b74db8e20d1b4842edd7fe2e338e854e2d256375e661500acd9902699030bb0`;
the 37-equation system is `UNIT/UNIT`, with SHA-256
`d6fe7d363ac6c5147bd54b2275b2ace1631bc8f792e4c235e041f468c1b8638b`.
Both forward-row passes retain the same six-row core 49 with SHA-256
`880c827190a6e0816cb3fb1c104890425e9d341db316bbf018736bb0f4bc7711`;
both reverse-row passes retain a distinct six-row alternative with SHA-256
`9bc0e5c98b518aa504c729729395aa3fcb19d3af3f918061f7eba17a585c12b0`.
Core 49 has no injective-relabel embedding to or from the admitted bank.  Its
Singular lift passes internal and exact-SymPy replay, and the independent
checker verifies certificate SHA-256
`a70808072db8b9b3c45f59b3669da814f978f18166ca59303331f5a33ae312bc`:
19 generators, 16 active multipliers, 55,285 terms, maximum multiplier size
16,289, maximum degree 10, and exact sum `1`.  Scanner smoke gates pass and
the source assignment hits core 49 literally.  The unbuilt scalar replay and
audited wrapper have SHA-256 values
`11963b380579c00a9ef84f4a30cf713990de690116b33daa6a34b30143088b23`
and
`afcfe711703934e4eea2f3134400e2a24b02a7fbaf4d602df41c15112bf1f62c`.
Offset 0 has resumed at four million nodes beyond core 49.

Two other current-bank misses remain in the certificate queue.  The
post-core-42 offset-5 successor has signature
`d72a3084c85705e52a8b4ae7d94a034be9dd295f01ae2c6f60910244a91a2693`,
canonical row SHA-256
`0e486332d29105637e441bddce66b21bc12ca5cb2c2c9da4398bc2da44f79fb4`,
and a `NONUNIT/NONUNIT` default gauge; 17 of its 66 anchor pairs are
`UNIT/UNIT`, but the first two Singular lifts timed out and prove nothing.
The post-core-44 offset-9 successor has signature
`4fadacf2dfbd4b3cd52ca07df57dc799d42757145096964bf2168b9bb811aadd`,
canonical row SHA-256
`bcdf65a742b7e251b4a3673d603de20070300ab85a361cab7a5c7352336cf22f`,
and a `NONUNIT/NONUNIT` default gauge; 28 anchor pairs are `UNIT/UNIT`, but its
first two Singular lift attempts also timed out.  Across these two shadows
and the core-48 source shadow, all 106 supported U5 incidence consumers and
all eight residual metric kernels report zero theorem-discovery hits, with
every matcher smoke gate passing.

Finally, extending offset 4 after core 28 found a successor at node 8,154,188,
before the sixteen-million cap.  Its signature is
`c4082af4f60579cd30eeb9f622f89cafa952f54eeb976d36f4c93628a1a3c10e`,
canonical row SHA-256 is
`f9cb799247b4c32fe428ba873ca70a56050708577ea778779cc598984b656ebd`,
and full equality-system SHA-256 is
`b3c4e4e99037a5d1b5a6a222d43231a38a8d6b542c139115bfbfc784f62bd340`.
The full ideal is `UNIT/UNIT`.  Forward-row deletion in both variable orders
retains a seven-row core-50 candidate with SHA-256
`5b349963d36cbbf8e3f756f660920ec475fe66040c09bf95c794a85e553cb0cb`;
reverse-row deletion in both orders retains a different seven-row candidate
with SHA-256
`e9b1400b6d918f63403d238404a56d081d086e88a8756727dfb045ad0d614d46`.
Singular and Julia certificate races are active for both candidates.  Neither
core 50 nor either proper-gauge successor is admitted yet.  The offset-1
four-million run ended `INDETERMINATE`, not UNSAT, and has been extended to
eight million nodes.  These exclusions still do not prove direct `False` from
the production `CriticalPairFrontier` and do not yet produce any accepted
frontier packet.

## Proper-gauge minimization and next successor wave

The post-core-42 offset-5 shadow now has four completed row-deletion passes in
the fastest unit gauge, normalizing old anchors `(5,6)` by old-to-new
permutation `[2,3,4,5,6,0,1,7,8,9,10,11]`.  Both forward-row passes retain
the same seven-row, 21-equation subsystem, provisional core 51, with SHA-256
`06cea78868b60e18a77261c485aa908258b448c2ee5cad03d0ee16a8e31a6996`.
Both reverse-row passes retain a distinct seven-row, 22-equation subsystem
with SHA-256
`e9ac440e10e6e280e9d7be0d8a058193f692fe85a8c5f4ab0a73ec320a5ad6c7`.
Core 51 is independently `UNIT/UNIT` and has no injective-relabel embedding
to or from the admitted scanner bank.  Its first minimized Singular lift
timed out at 300 seconds and proves nothing; a Julia exact-identity job remains
active, so core 51 is not yet admitted.

For the post-core-44 offset-9 shadow, the forward-row deletion passes in both
variable orders agree on a seven-row, 21-equation subsystem, provisional core
52, with SHA-256
`b09f37c228681ae8429edf18cb063f95a4ca9b0df7907588f0aaf39719175160`.
This uses anchor gauge `(0,8)`, old-to-new permutation
`[0,2,3,4,5,6,7,8,1,9,10,11]`, whose full-system SHA-256 is
`8d44fa23bf3802c2e6a976a2b4dd52f8e1c499b6ba400c78ff190175d2c182c4`.
The core is independently `UNIT/UNIT`, has no embedding to or from the
admitted bank, and is in parallel Singular/Julia certificate races.  The
reverse-row minimizers have not yet been run, and no core-52 cut is admitted.

Offset 2, resumed after core 48, returned another current-bank miss after
1,303,147 nodes.  Its assignment signature is
`b55e772af16bb1b14109d6ae5e497bf150852ebb1eeb864d51ff76ef1da7d4a9`;
the fail-closed encoding audit checks all twelve global/pinned rows and four
shell duplicates, with canonical row SHA-256
`9950aefc8ca8b476084ecbdf8c51b72d8423730f67a49ab45a6e0c848501f5b9`.
The default 37-equation ideal is `NONUNIT/NONUNIT`, with SHA-256
`1ea2e1edad070d8276a981f6458d6181e64de06a1ecefa8d3697cfff91eef624`;
31 of the 66 anchor gauges are instead `UNIT/UNIT`.  The fastest normalizes
old anchors `(0,9)`, has full-system SHA-256
`6d79dc9277d152cc8fb4015332297c4c49a0bc6ca056b49dfff3722df48854f0`,
and is being row-minimized.  All 114 supported U5 theorem-bank consumers again
report zero discovery hits, with every metric smoke gate passing.

Offset 0, resumed after core 49, returned a new miss after 3,639,578 nodes,
assignment signature
`d38276179b47f5a004c8dc1f358ba756a574d7440eed20ed46276d2d0dda5891`.
Its exact encoding audit has canonical row SHA-256
`999ff6d4c74f19605ac74b8dd828bb383b234457aebbe23d3a0f38159315cdd5`.
The default 37-equation system is already `UNIT/UNIT`, with SHA-256
`13c4f9a60b286260cc06b83715a2cf356746e00838ee350aab17bbe37c2ec30b`;
row minimization is active.  Its U5 incidence and residual-metric bank audits
also report zero hits.  Thus neither resumed branch is closed, none of cores
50--52 is scanner-admitted, and the direct contradiction from the concrete
production `CriticalPairFrontier` remains open.

## Exact admissions 51, 53, and 54; successor wave

Three later row cores have now crossed the fail-closed banking boundary.  Core
53 is the five-row subsystem of the post-core-49 offset-0 survivor, with
equality-system SHA-256
`9b20ba3f98168d896bf4e46b4e36782bd3f86746f251e727314afa9fe0be4c8d`.
Its independent rational replay verifies certificate SHA-256
`3c09182797da123112f4f386e8a49caadad73ae83688bcafd951ef4e5f5d8153`:
16 generators, 12 active multipliers, 10,233 multiplier terms, maximum
multiplier size 3,440, maximum degree 9, and exact sum `1`.  Scanner positive,
negative, relabeling, and complete-assignment gates pass.  The generated but
unbuilt scalar and invariant-wrapper sources have SHA-256 values
`49b061ea9b3ea1241ccea0f06613f6ccee2e936011e0221f4e9ecdcd5d36ddcb`
and
`d2f56618923f009b17c5802e52b646745d84e0085f6eabffa734e76da18699a7`;
the wrapper encoding audit passes and both files are placeholder-free.  Offset
0 has resumed at four million nodes with core 53 active.

Reverse-row minimization of the post-core-44 offset-9 survivor found the
strictly smaller five-row, 16-equation core 54, SHA-256
`7080337b65009b7f91deaed1f89e7829d32b6bc532111e0d2b08ac085a5a6b68`.
Singular produced a unit lift immediately, and the independent exact replay
verifies certificate SHA-256
`a3e4a1eb0effc296c3d890c1ea492113e98b7679a8df8c1abefe5d9eb03e9aac`:
16 generators, nine active multipliers, 701 multiplier terms, maximum
multiplier size 130, maximum degree 5, and exact sum `1`.  The saved survivor
hits the cut literally and after a nontrivial relabeling.  All scanner gates
pass.  The generated but unbuilt scalar and audited invariant wrapper have
SHA-256 values
`5678b2cf32cdc257eb72928f29741817b84dd545ae90c4cf42fe471429c10f1b`
and
`18ffd9334ddd8c2ba4ebb32e593fe605364370176fcafc7cbc041cb625d8bb2c`.
Offset 9 has resumed at four million nodes with core 54 active.  Provisional
core 52 remains a distinct queued certificate candidate; it is not needed for
the core-54 cut.

Core 51, the seven-row forward minimization of the post-core-42 offset-5
survivor, has also completed its Julia change-matrix race.  Its equality-system
SHA-256 is
`06cea78868b60e18a77261c485aa908258b448c2ee5cad03d0ee16a8e31a6996`.
Independent replay verifies certificate SHA-256
`a7aea4105b5f3b3c9963dd0ca4ccc2b7d989416b9e66e04320a11b74d97b505a`:
21 generators, 15 active multipliers, 31,223 multiplier terms, maximum
multiplier size 4,532, maximum degree 7, and exact sum `1`.  Its saved survivor
and a relabeled copy both hit the scanner cut.  The generated but unbuilt
scalar and audited invariant wrapper have SHA-256 values
`c17521111b8dfde3f1feba2c37055718373a012cada8091ab901ae46c1939be8`
and
`004abbebd0a17d2b48c4590868439810e58bd68f16228ff980156472dbda75ea`.
Offset 5 has resumed at four million nodes with core 51 active.

All four deletion passes for the post-core-48 offset-2 survivor have now
finished.  The two forward-row passes agree on provisional core 55, a
seven-row, 21-equation subsystem with SHA-256
`eef5a457ced4c08f444da92e17a772991f4c32c2e3cd640eac7d3a0581e65bfd`;
the two reverse-row passes agree on a different seven-row, 22-equation
subsystem with SHA-256
`e6de8b898a6c56ad1860ed892abbd2a9bd8780b99f00418ef7810934d6ef32ce`.
Core 55 is independently `UNIT/UNIT` under anchor gauge `(0,9)`.  Singular and
Julia exact-certificate races are active; it is not scanner-admitted yet.

The offset-1 branch extended to eight million nodes returned a new survivor at
node 5,490,001, signature
`22a21a25e0c4e1fed4e6de53b7ee03927b6f763fe9b74c37ef594d75a11b2e0a`.
Its fail-closed encoding audit checks all twelve global/pinned rows and four
shell duplicates, with canonical row SHA-256
`5e15de6cc16abf2d13a994ea9dcd2bccfaf61f5c18e36ae6f16ef9645bb98053`.
The default 37-equation ideal is `NONUNIT/NONUNIT`, SHA-256
`9552cdb5572bf588e440831e9ec6d1597067ef9bed53402cd4bee87b5cbf3012`;
34 of its 66 anchor gauges are `UNIT/UNIT`.  Both theorem-bank audits report
zero hits across the 106 supported incidence consumers and eight residual
metric kernels.  Row minimization has started in the fastest unit gauge,
normalizing old anchors `(2,11)`.

These are exact exclusions of fixed source-indexed equality shadows.  They do
not prove shadow coverage, do not provide a Euclidean realization for any
`NONUNIT` system, and do not yet prove `False` from the concrete production
`CriticalPairFrontier`.

## Post-core-54 offset-9 successor and provisional cores 56--57

The four-million-node offset-9 run with admitted core 54 active found a new
bank-surviving assignment at node 2,012,020.  Its signature is
`9669a150eed0597d9ced28dad91089e2ad9e25432bbf90b06faf20610d64d606`,
its audited canonical-row SHA-256 is
`73e23226ce89b7ccf6ba0811de7c16832415db1ba3ebdb391434974a1db003b3`,
and its default 37-equation system is `NONUNIT/NONUNIT`, SHA-256
`dfbf43b294e023624e7877a8e306a323af6276c16b0fcf94f739000b7bdc89a5`.
The encoding audit checks all twelve global/pinned rows and four shell
duplicates.  The 106 supported U5 incidence consumers and eight residual
metric kernels again report zero hits, with all smoke gates passing.

Twenty-four of the successor's 66 anchor gauges are independently
`UNIT/UNIT`.  The fastest normalizes old anchors `(4,6)` by old-to-new
permutation `[2,3,4,5,0,6,1,7,8,9,10,11]`.  Reverse-row deletion in both
msolve variable orders agrees on provisional core 57, the following six
source-labeled rows:

```
0  -> {1,3,6,9}
1  -> {4,7,8,9,10}
2  -> {0,1,10,11}
4  -> {2,3,9,11}
6  -> {2,4,5,10}
10 -> {0,4,6,11}
```

This 19-equation subsystem is `UNIT` in both variable orders and has SHA-256
`36563619831c7bcf64f0deaaddfe69b7609287588a000ee83d0ec167b6814228`.
The two forward-row passes agree on a different eight-row subsystem.  Singular
then produced a unit lift for core 57; its internal check, exact SymPy replay,
and the common independent rational checker all agree.  Certificate SHA-256
`476fd369fe6fe969276190ecd9bc1e2fbf04722601ac7908b63e7f535c990275`
has 19 generators, 16 active multipliers, 30,675 multiplier terms, maximum
multiplier size 8,977, maximum degree 9, and exact sum `1`.  Scanner positive,
negative, nontrivial-relabel, and complete-assignment gates pass; the saved
offset-9 survivor hits core 57 literally and isomorphically.  The generated
but unbuilt scalar theorem and audited invariant wrapper have SHA-256 values
`4d330c349f28a4652601da812f19a18192ccb8e528b3cec86e187748947e2106`
and
`d6cc34b6160678273ba473935d60a5909fe3567f6a0b75cf4c3aedbe46083bfd`.
Both are placeholder-free.  Core 57 is scanner-admitted and offset 9 has
resumed to four million nodes with the new cut active.

For the offset-1 successor, the forward-row deletion passes in both msolve
variable orders agree on provisional core 56, a six-row, 18-equation
subsystem with SHA-256
`b6e4c812179d920e493c5e91fea11eaafc58f3e570a506d0cc87c870272d633a`.
Every timed-out deletion attempt was conservatively retained.  Both
reverse-row passes then found the strictly smaller five-row, 16-equation core
58, SHA-256
`471ec4a062f281bcc1535d08d46f80303329077842f60328fbbe4d52bd4d3781`.
Singular's unit lift, its internal check, an independent exact SymPy replay,
and the common streaming rational checker all agree.  The final certificate
has SHA-256
`dc6cfdb12853e5a661f966d8fb5b8f3387b9d8a9a9b81ec6bd6fae9f235936bf`:
16 generators, 12 active multipliers, 2,410 multiplier terms, maximum
multiplier size 762, maximum degree 6, and exact sum `1`.  Scanner positive,
negative, nontrivial-relabel, and complete-assignment gates pass; the saved
offset-1 survivor hits core 58 literally and isomorphically.  The generated
but unbuilt scalar theorem and audited invariant wrapper have SHA-256 values
`e1c9916bff8af14ec8f4220523f63d04a3b5966ab39f926d530e721574f3b0a2`
and
`67100dff0141294875cdfc9b39d07bb56391469f20717e72ca713a483c83d3c1`.
Both files are placeholder-free.  Core 58 is scanner-admitted, core 56 is
superseded, and offset 1 has resumed to eight million nodes with the new cut
active.

Finally, the post-core-53 offset-0 rerun reached its 4,000,001-node bound
without a survivor or a finite-shadow UNSAT proof and therefore reports
`INDETERMINATE`.  None of these bounded results establishes shadow coverage
or proves the requested contradiction from the production
`CriticalPairFrontier`.

## All-core motif and active-certificate-kernel audit

`mine_core_data_patterns.py` now audits the union of the scanner-admitted
source-indexed cores and every saved queued variant.  The current inventory is
57 fixed row hypergraphs: 54 numbered targets plus three alternate variants,
with 44 independently replayed exact certificates and 13 queued candidates.
The full-core comparison finds no exact relabeling class, injective subcore
embedding, or direct cover between distinct cores.  The 57 cores do, however,
fall into only six row/equality/support-size profiles.

Every full core has pairwise support intersections of size at most two, uses
each support-point pair in at most two rows, and contains both a mutual
center-incidence pair and a directed center three-cycle.  Fifty-five cores
contain both center features in one three-row subsystem.  The combined
center-only skeleton is not an obstruction: it has elementary distinct-point
circle realizations.  Canonical full three-row incidence signatures are more
selective.  An exact 0/1 HiGHS set-cover solve, followed by direct replay of
the selected union, proves that five full three-row signatures are necessary
and sufficient to hit all 57 cores.  Since each selected signature is a proper
subsystem of a row-minimal exact core, this is case-packaging evidence rather
than five local contradiction theorems.

The audit also streams the zero/nonzero cofactor positions from all 44 exact
certificate JSON files without loading the large polynomial bank at once.
Removing zero-cofactor generators yields the equality kernels actually used by
the fixed certificates.  Only cores 07 and 08 become exactly isomorphic: both
reduce to the same six-label, five-row, nine-equality kernel with support sizes
`[4,3,3,2,2]`.  Core 54 has that coarse profile but is not isomorphic.  Across
all active kernels there are only the two reciprocal 07/08 embeddings; a
minimum cover of the 44 admitted full cores still needs 43 active kernels, and
none of the 13 queued full cores contains an already certified active kernel.
The mutual-pair plus directed-cycle invariant persists in all 44 active
kernels, with both features in the same triple for 43, but remains only a
preprocessing motif.  The first concrete shared theorem lift is therefore the
07/08 six-point kernel; the uniform route remains a parameterized
`EqualityCore`/Gram-certificate checker rather than a single fixed incidence
graph theorem.  A second exact set-cover audit on the complete three-row
motifs of the 44 certificate-active kernels needs 13 motif types.  Thus even
after zero-cofactor removal the data do not collapse to a small fixed-pattern
theorem family; the 13 types are useful case labels, not contradictions.

The concrete 07/08 lift is now materialized rather than merely observed.
`extract_active_qq_certificate.py` freshly replays the parent certificate,
keeps exactly its nine nonzero-cofactor positions, reconstructs the five
smaller equal-radius rows from their generator names, and records the parent
hash and retained positions.  The resulting six-label certificate has
SHA-256
`aaf922f9836f566f28429f9ff8262abb64d9cb677e01ae46ffcadcd078ecc3ce`;
the common independent checker reconstructs all nine generators and verifies
the 182-term, degree-5 identity to exact sum `1`.  The all-core isomorphism
audit and the scanner matcher both replay that this one active kernel embeds
in full cores 07 and 08 (by the nontrivial `8`/`9` relabeling for core 08).
It is now a stronger scratch scanner cut in its own right.  Its generated but
unbuilt scalar replay and audited invariant wrapper are placeholder-free and
have SHA-256 values
`cc7b2f30afe650ef0d139f539dd1e3dad2a1d487b52e17ef96fff04ae1c1e4ad`
and
`590881ab7d8c49f257d34711b2fd030e9e06b0169b3830b864b13aac9fdd6e12`.
No current queued core or fresh successor contains this shared kernel, so this
is a genuine theorem lift and scanner strengthening, not a present branch
closure.

The machine-readable audit is `core_data_pattern_mining.json`, the concise
report is `core_data_pattern_mining.md`, and the generator script has SHA-256
`4ca2fd0e4cfbe938801d1b999a28c24779a5ada3809b3a5c399c6b431a94313e`.
At this checkpoint the JSON and Markdown SHA-256 values are
`c1b0eef88696a686b417d0754e877a8dd09a5b47fe1972d95fe5e535dc357cb9`
and
`f03af14cdf0c2de016aedecd0a05a99da457f0c91380ded129ea85845443294b`.
Indexed theorem searches found nearby U5 metric consumers and the existing
six-point order core, but no theorem abstracting these equality-only active
kernels.

The eight-million-node continuations at offsets 0, 1, and 5 and the
four-million continuation at offset 9 each produced a fresh bank-surviving
shadow.  Their signatures are, respectively,
`38cd3ca2326b516c2a85c28888ef74dae3dcdaaad8b09346b441968be80bd833`,
`b6561fc91f4eb85a095935f34b0018ff332435b3f3e8e1693f11869b5e2f0645`,
`5f0e0b6787beda4280db43e242b2f5086847daf5491b7d8aec8a1db44db323bc`,
and
`9a5734fcd38aecba9249f7899104fd3cfa01e8b37049422b60924c0b0be7e449`.
The 44 strengthened active kernels have zero injective-relabel hits on all
four, so each requires a new exact core or a genuinely broader theorem.

Core 39 has now completed the exact admission path under anchor gauge
`(8,11)`.  The converted certificate has SHA-256
`09f2571cbd368615e8b965fe536612f74a82cf8097af351edd0b24bda2f52ba8`
and raw cofactor-stream SHA-256
`be926178bacfeded55d0a610defb6eeb196d2ede68752214aad04e43010272af`.
Independent reconstruction verifies 18 generators, 13 active multipliers,
3,641 multiplier terms, maximum single-multiplier size 650, maximum degree 7,
and exact sum `1`.  The fail-closed anchor-gauge audit links the relabeled
certificate rows back to the saved core, the saved offset-7 assignment hits
the scanner cut, and the direct, negative, and relabeled smoke gates pass.
The generated but unbuilt scalar replay and audited invariant wrapper are
placeholder-free and have SHA-256 values
`6a09eec998f6a95c213edcc07cde7f075c99895f8a1039e4aeced4980789f35e`
and
`d7648b749a246465de56534cb27e407d9b573cffc72eef1c5f453246f3ad6142`.
Its active kernel is not isomorphic to or embedded in another current active
kernel, so it does not create a second shared theorem lift.  Offset 7 has
resumed at four million nodes with the new cut active.

That offset-7 continuation has now found a new survivor after 1,764,438 DFS
nodes, with signature
`23a05f86deef5daefcf4b4ee0a3acd1aaab361b05919a88e37a066c784a2ddd2`.
The core-39 cut fired 81 times.  Exact source-row reconstruction reproduces
all 11 saved rows, while all 44 certificate-active kernels and the stronger
shared 07/08 kernel have zero injective-relabel hits.  Fresh audits of all 106
supported U5 incidence-bank patterns and all eight residual metric kernels
also have zero hits.  Direct checks of the nearby exact-center mutual-pair and
five-point hinge-cycle statement shapes likewise hit neither this survivor nor
any current full or certificate-active core.  These are exhaustive checks only
within the named matcher banks, not a general theorem nonexistence claim.

The survivor's full 11-row, 33-equality system has expanded-polynomial
SHA-256
`bcc9ef6f92cdb2142edebba2304c53d22f51b650b54dbe6b2eeac5afba833bdd`.
Singular and both msolve variable orders independently return `UNIT`, so this
particular equality shadow has no normalized complex realization.  The first
two fail-closed forward-row deletion passes, one in each msolve variable
order, agree exactly on provisional core 59: seven rows, 21 equalities, and
expanded-polynomial SHA-256
`2a909d9356bb87a10e039e7f7d2577107b2d7b4962429177b1ef9c9159e95b80`.
Both direct msolve orders return `UNIT` on that retained subsystem.  It is not
yet a scanner cut.  Its complete anchor scan has 24 `UNIT/UNIT` gauges, 29
`NONUNIT/NONUNIT`, ten `TIMEOUT/TIMEOUT`, and three `TIMEOUT/NONUNIT`.

Both reverse-row deletion passes, again one per msolve variable order, agree
on the strictly smaller provisional core 60: six rows, 18 equalities, and
expanded-polynomial SHA-256
`e03b58d197601f4aa3d95957b678ff52772affaa9539cb348d13237dccce1cb0`.
Both direct msolve orders return `UNIT`.  Four retained rows are deletion-
proved essential; attempts to remove either center-0 or center-2 row reached
the 300-second cap and were conservatively retained.  Two 1,800-second
minimality passes and forward/reverse Singular certificate races are active.
The completed 66-anchor sweep has 14 `UNIT/UNIT` gauges, 33
`NONUNIT/NONUNIT`, 16 `TIMEOUT/TIMEOUT`, and three `TIMEOUT/NONUNIT`; a third
Singular race uses the fastest unit gauge `(3,5)`.  Cores 59 and 60 remain
queued, not scanner cuts.

An audit of the apparently failed reverse-variable certificates found a
verifier defect rather than an encoding defect.  `exact_replay` formed the
identity sum in the canonical SymPy generator tuple but compared it directly
with a target `Poly` whose generator tuple followed the reversed Singular ring
order.  SymPy polynomial equality is generator-order-sensitive, so every such
reverse lift was falsely rejected even when Singular's internal exact check
returned zero.  The verifier now normalizes the target into the input
generator tuple before comparison; a positive reversed-generator regression
and a mutated negative regression pass.  The converter also reconstructs the
rows and generator stream and performs its own fresh exact replay instead of
trusting the source report's cached boolean.  A complete audit of saved
reverse-order Singular reports finds exactly three internal-`UNIT` unit lifts:
cores 18, 39, and 46.  Core 39 was already admitted from its independent
forward-order certificate; every other saved reverse-order attempt timed out
or did not request a unit lift, so the bug exposes no additional unprocessed
certificate.

Replaying the already saved reverse streams recovers two exact cuts.  Core 18
under anchor gauge `(3,6)` has certificate SHA-256
`a285c94a72998c2b359a6f5fe4828342f882ce42a791c1281adcec45968f8ac3`
and raw cofactor-stream SHA-256
`19c2688ba113856663b5d90d954885caad8857024f3e00e071fbc0210f74fb67`.
The independent streaming checker reconstructs all 19 generators and verifies
13 active multipliers, 62,930 multiplier terms, maximum multiplier size 9,649,
maximum degree 8, and exact sum `1`.  Core 46 under anchor gauge `(1,11)` has
certificate SHA-256
`8c6de01452a8074eec48f83dc5b608affbb235295469229bca8f5daac47ba77b`
and raw stream SHA-256
`813a5abd07ffb84a0185275a63cf4c895a40b3e48a2b99f56bc64416e78b6009`;
its checker verifies all 18 generators, 16 active multipliers, 101,518 terms,
maximum multiplier size 16,864, maximum degree 9, and exact sum `1`.  Both
anchor/encoding audits and all scanner direct, deletion-negative, and
nontrivial-relabel smoke gates pass.  Exact assignment replay confirms that
the saved offset-14 source hits core 18 and the saved offset-11 source hits
core 46 under the scanner's injective-relabel matcher.

The generated but unbuilt scalar replays for cores 18 and 46 are
placeholder-free and have SHA-256 values
`656ef90f4584ac7553b25e68bcd51aebe69a727847fb687ba93972538e4578dd`
and
`e042da58ec6ac55f6ac33309be70949bb88aaa9956b439c69f5c7369079c8c94`.
Their audited invariant wrappers have SHA-256 values
`e0d2c1c868699f4795ce28f4bcfa2c7976fd8d27af21102ba1afff0a1103a9df`
and
`8cb57125c4a58eedf53468f259c6f4d9750db30270c802be62c305d7e29bf78f`.
No Lean build has been run.  Neither new active kernel embeds in another
current active kernel or covers a current queued full core; the only shared
active-kernel theorem lift remains 07/08.  Direct replay also finds zero
core-18/core-46 hits in the five current fresh survivors at offsets 0, 1, 5,
7, and 9.

The current authorized sixteen-job pool consists of seven previously untried
forward-gauge Singular races for cores 14, 16, 32, 37, 52, 55, and 56; the
core-59 Singular race; four core-60 Singular races (both default variable
orders and forward order in gauges `(3,5)` and `(3,11)`); two long core-60
deletion passes; and the post-core-18 offset-14 and post-core-46 offset-11
CEGAR continuations.  The now-redundant alternate core-18 race was stopped,
and the core-52, core-55, and core-56 Julia processes exited without
certificates.  No further cut is claimed until a lift passes the independent
rational replay and encoding gates.

## Core 60 admission and the next offset-11/offset-7 frontier

The gauge `(3,11)` Singular race for provisional core 60 returned an internally
checked unit lift whose fixed verifier and converter both replay exactly.  The
common independent rational checker then reconstructed all 18 generators and
verified 13 active multipliers, 11,009 multiplier terms, maximum multiplier
size 3,005, maximum degree 7, and exact sum `1`.  Certificate SHA-256 is
`101e6b766e97aac4dcb97969c24398593e372b73540beb57e6afadd24fde6a41`;
the raw cofactor stream has SHA-256
`02788d37f9820ee36e7669e05011a34b2fb8d6db76271d5f2cb44dd8e3789a43`,
and verification-report SHA-256 is
`af7833879027caa55d32bedaa329a9f0c9db71f0a37b215c9d867c8a01405c9c`.
The anchor audit links the relabeled certificate exactly to old anchors
`(3,11)` and canonical core-60 rows.  Scanner direct-positive,
deletion-negative, injective-relabel, and complete-assignment smoke gates all
pass, so core 60 is now an admitted local exact-QQ cut.

The generated scalar replay and audited invariant wrapper are placeholder-free
and have SHA-256 values
`300e33c4d02392c0aab25a1db048b497461d3021e2e9e429c96764312a66c83a`
and
`bd2b0050f75199a7dba466c8ab291b4c57b1f7dda6c175bc94678346524bdbd2`.
They remain unbuilt under the standing no-Lean-build gate.  The second exact
lift found at gauge `(3,5)` is materially larger (7,470,788 serialized
cofactor characters and 15 active multipliers versus 3,887,406 and 13), so the
smaller `(3,11)` certificate remains canonical.  Both 1,800-second deletion
passes retained all six rows: four row removals are directly `NONUNIT`, while
the center-0 and center-2 removals timed out in both msolve variable orders.
Thus the cut is six rows and partially deletion-minimal, with no unsupported
claim about those two timed-out removals.

The refreshed exact census is 57 full hypergraphs, 45 admitted and 12 queued.
No active kernel covers any queued full core.  Cores 07/08 remain the only
nontrivial exact active-kernel isomorphism class and the only concrete shared
kernel theorem lift; the minimum exact cover of the 45 admitted full cores is
44 kernels.  Core 60 joins cores 17, 18, and 21 in the coarse active-row
profile `6 rows / 13 equalities / support sizes 4,3,3,3,3,3`, but it is not
exactly isomorphic to them.  All 45 active kernels contain both a mutual
center-incidence pair and a directed center 3-cycle; 44 realize both on one
triple.  The exact three-row motif cover remains 5 on full cores and 13 on
active kernels.  These are theorem-discovery patterns only, not a general
geometric theorem.

The post-core-46 offset-11 CEGAR resume returned a new bank-surviving shadow
after 1,081,852 nodes, signature
`3312cd0ee9ceae844d1bffae61bfb7732bb84827c2ed8b799daedb470db03410`;
the core-46 cut fired eight times.  Its independently reconstructed 12-row,
37-equality system has canonical expanded SHA-256
`098e2fa47325de3d5230d97e94e4c9bcd430794e383286af7aaffaf23d73ae58`.
Singular and both msolve variable orders return `NONUNIT`, so this equality
ideal is proper and supplies no unit cut.  A hash-bound full Problem 97
QF_NRA query then timed out in both Z3 and cvc5 at 30 seconds.  Three
independent 16-start numerical scouts found no witness, with best equality
residual norm about `0.683`; this is only
`NO_WITNESS_FOUND_NOT_AN_UNSAT_RESULT`, not evidence of infeasibility or a
counterexample.  The counterexample query's exact named-atom encoding audits
pass and its normalized SMT-LIB SHA-256 is
`40883a4e5e7eb8ed144da1dbe021dc673542d5ab55fd8db6be119459d008a58e`.

The seven previous alternate-gauge Singular jobs for cores 14, 16, 32, 37,
52, 55, and 56 all exhausted 1,800 seconds without a lift.  Core 59's default
gauge reached `UNIT`, but Singular returned an empty, internally failing
cofactor stream; it is therefore still queued and no certificate is claimed.
The refilled sixteen-job pool consists of the post-core-18 offset-14 and
post-core-60 offset-7 CEGAR continuations; four forward/reverse races for core
59 at gauges `(2,10)` and `(2,11)`; one new forward-gauge race for each of
cores 14, 16, 32, 37, 50, 50-alt, 52, 55, and 56; and the missing 66-gauge
scan for core 47-alt.  No production source or closure document has been
edited, and no Lean build has been run.

## Core 59 admission and post-core-18 offset-14 survivor

Two alternate-gauge races repaired core 59's failed default lift.  The
forward `(2,10)` and reverse `(2,11)` streams both pass Singular's internal
check and exact SymPy replay.  The former is canonical because its serialized
cofactors occupy 12,353,618 characters rather than 141,760,967.  Its fresh
converter replay, independent rational checker, and anchor audit all pass.
Certificate SHA-256 is
`649f28430b0526ea1db0dbcfb845b22cb358dfe1266f8d9bcd0101459123b833`;
raw stream SHA-256 is
`6b6ea381e7bd766cc9806aee21843c839fcb8b64d2c75deff5ee2fb4a7ffbeae`;
and verification-report SHA-256 is
`50abd21ffd0998de6a79ff3b7674293f54f1d67dd43b90b0b8b7b94c22adca02`.
The checker reconstructs all 21 generators and verifies 18 active
multipliers, 56,983 terms, maximum multiplier size 11,651, maximum degree 9,
and exact sum `1`.

Core 59's scanner direct-positive, deletion-negative, injective-relabel, and
complete-assignment smoke gates pass, so it is now admitted.  Its generated
but unbuilt scalar replay has SHA-256
`8a9312a0c12a370230de80cb8afca108c65d8b6da1df38d85ece8e9265263e42`;
the audited invariant wrapper has SHA-256
`c03b1c9f4a43bc8ae7a95151a1e3409bac8be93b8de2c9aeb91f6af3654c5a00`.
No Lean build has been run.

The refreshed census is now 57 full hypergraphs, 46 admitted and 11 queued.
The exact active-kernel cover number rises to 45: only the 07/08 pair shares
one kernel, and no admitted active kernel covers a queued full core.  Core 59
introduces no new exact isomorphism, embedding, or theorem lift.  It retains
the bank-wide motifs: all 46 admitted kernels have a mutual center pair and a
directed center 3-cycle, while 45 realize both on the same triple.  Thus the
pattern data still points to those incidence motifs as the broad conjectural
lift target, but the exact certificate data remains essentially one core per
shadow outside 07/08.

The post-core-18 offset-14 CEGAR run returned `SAT` after 2,383,992 nodes,
signature
`db21dce58acce6284a86999c02b69eb0d5f55f6945c33ea9f425725c17a66176`.
Core 18 fired 54 times, so it genuinely removed the preceding survivor but did
not close the branch.  Independent extraction of the new source row plus all
eleven global rows passes exactly, with canonical row SHA-256
`3a2fcb5f9a58106bf9dccf5cffa77974ee851a0e332b75e038fd8a3f9d6eab97`.
Its full exact-ideal probe is active.  Offset 7 was restarted behind both cores
59 and 60 rather than preserving a run that had loaded only core 60.

The current sixteen-job pool is the new offset-7 CEGAR run; the offset-14 full
exact-ideal probe; forward races for cores 14, 16, 32, 37, 50, 50-alt, 52, 55,
and 56; paired reverse races for cores 14, 16, and 32; the fastest `(4,5)`
race selected by the completed core-47-alt gauge scan; and the still-running
core-49-alt gauge scan.

## Alternate core 49 admission

The completed 66-gauge scan for alternate core 49 found 15 `UNIT/UNIT`
anchors, 29 `NONUNIT/NONUNIT`, ten `TIMEOUT/TIMEOUT`, and twelve
`TIMEOUT/NONUNIT`.  Its fastest unit gauge `(1,7)` then produced an internally
checked Singular lift with exact SymPy replay.  The fresh converter, common
independent rational checker, and anchor audit all pass.  Certificate SHA-256
is
`933fb17e0cd31357e90040ae4807fc750f00f965a178cede80d2791b6e4d53a9`;
raw stream SHA-256 is
`a1ae1708da0ffc7e6f7818598211f8982bc116e79968dbaf35fd02bfdf93f620`;
and verification-report SHA-256 is
`d3132880bf4a2c63b28430f9d1ee1019f1cb62318a03a72b695d08bcb7de8656`.
The checker reconstructs all 19 generators and verifies 15 active
multipliers, 19,711 terms, maximum multiplier size 2,914, maximum degree 8,
and exact sum `1`.

The alternate core's scanner positive, deletion-negative, relabel, and
complete-assignment gates pass.  Its generated but unbuilt scalar replay and
audited invariant wrapper have SHA-256 values
`4990ee46ee94038ea7ac1ed6057e8f8cf3c028142ffad144a0973480db7ff7e7`
and
`bf9c121b36a682ba71c7bb9655ad71b3cc1bc1302079bdcca3c23ab6ee2c87e4`.
No Lean build has been run.

This is the first admitted saved `-alt` variant.  The pattern miner had
previously skipped variant certificate filenames by construction; it now
routes both numbered and underscored variant artifacts through the same exact
statistics and active-kernel analysis.  The corrected census is 57 full
hypergraphs, 47 admitted and ten queued, with 47 independently replayed
certificate statistics.  The active-kernel cover number is 46; 07/08 remains
the only exact shared-kernel class, there are no new embeddings, and no active
kernel covers a queued full core.  The full and active exact three-row motif
covers remain 5 and 13.  All 47 active kernels have the mutual-pair plus
directed-3-cycle motifs, with 46 realizing both on one triple.  Thus alternate
core 49 adds a useful scanner cut but no new general theorem lift.

Fresh replay finds no new 49-alt hit on the live survivors at offsets 0, 1, 5,
7, 9, 11, or 14.  The current sixteen-job pool contains the offset-7 CEGAR
continuation, the offset-14 exact-ideal probe, the 1,800-second offset-11 full
counterexample QF_NRA race, forward races for cores 14, 16, 32, 37, 50,
50-alt, 52, 55, and 56, paired reverse races for cores 14 and 16, and both
variable orders for core 47-alt at gauge `(4,5)`.

## Core 14 and alternate core 47 admissions

The reverse-variable Singular race for core 14 at old anchor pair `(2,5)`
produced a unit lift whose internal Singular check and exact SymPy replay both
pass.  The source assignment has signature
`d0733e36a7f0f2f6928dfb899b00a2cc2dbc6a9ac535cbb5ba5925214cfbc71c`,
its full equality system has SHA-256
`5c1d5a97feb03575e1cdbf9f00a2e982361762c2db3b570bb04b2ab44bdaf463`,
and the selected gauge/core system has SHA-256
`c6134813622381b7e96f183ff5c75190a763364ad733dd0087e8ed62076f04cd`.
The raw multiplier-stream SHA-256 is
`db56349f4eed3d9325988f60fa1af5d410316c977def1b1501f1793ea83ab898`.
The fresh converter, common independent rational checker, and `(2,5)` anchor
audit all pass.  Certificate and verification-report SHA-256 values are
`4c762772492be86e1b7134a45e29756b0f09c5538f7515c1725955fba0d6d2e7`
and
`d7578b3a47e688ad1b45f32c714b9eb2996063955536733ccd8914206c8ab615`.
The checker reconstructs 18 generators and verifies 15 active multipliers,
81,299 terms, maximum multiplier size 9,750, maximum degree 8, and exact sum
`1`.

The completed core-47-alt `(4,5)` reverse-variable race independently produced
another internally checked and exactly replayed unit lift.  This alternate
subsystem comes from the offset-0 post-core-45 assignment with signature
`24c674a0f324ce9c435e1ec7516566b3982b48d3536564a426b4782d760d2b45`;
the parent full system, selected gauge/core system, and raw multiplier stream
have SHA-256 values
`bfcf685d1c40112312f26d87df3a314378c251905ac7ea7d9d9d52a7bb322dc5`,
`50bd9719717954b07f65efb088ff8fabcc8068ef3701f7b95996aef2f70b6433`,
and
`6ed954309ade2ff88c9398c8ed878fa12c166cb7faaa9f875b4b63dfca52c780`.
The fresh converter, independent checker, and `(4,5)` anchor audit pass.
Certificate and verification-report SHA-256 values are
`6a864a8a79b5e4051d631e9ad26eeccd290ffd06b6081d2fb540ff7eafe12731`
and
`ed7a47d72945174b296d972d454833df3ae43018d35deb301a31a9ddbc1a6878`.
The checker reconstructs 19 generators and verifies 16 active multipliers,
87,391 terms, maximum multiplier size 20,397, maximum degree 11, and exact sum
`1`.

Both cuts now pass the scanner's direct-positive, deletion-negative,
injective-relabel, and complete-assignment gates.  The scanner SHA-256 after
both admissions is
`7d28ecb078e96a63d7a1c6f81eed45419c3dab369f0b9592e4d83dac288417fa`.
Core 14's generated but unbuilt scalar replay and audited invariant wrapper
have SHA-256 values
`dfd439b9d1953817ddf48259e458ba6e71c04a0b296c19645a148db3e6587b0b`
and
`9f352ad42c6aa547e3945b84e1fc82f465cf77458046e50be8a969c9557ffc90`;
core 47-alt's corresponding values are
`e453bf3fa9c60326782fd589d94d72a5556f0df3751e46667f6c6edf002285c2`
and
`e9b9083f62543caac64944ff5d3196dbd4e1b9e9743f190b1298b8509b8b16dc`.
Fresh regeneration is byte-identical for all four generated files.  No Lean
build has been run.

The refreshed data census has 57 full hypergraphs, 49 admitted and eight
queued, with exact certificate statistics for all 49 admitted cuts.  The
minimum active-kernel cover number is 48; cores 07/08 remain the only shared
exact active-kernel class, and no admitted active kernel covers a queued full
core.  The full and active exact three-row motif cover numbers remain 5 and
13.  Every admitted active kernel has a mutual center-incidence pair and a
directed center 3-cycle, with 48 of 49 realizing both on one triple.  Thus the
new certificates strengthen the empirical universality of that skeleton but
still do not yield a contradiction theorem beyond the existing 07/08 shared
lift.

## Post-core-60 offset-7 survivor

The offset-7 continuation behind cores 59 and 60 returned a new bank-missing
shadow after 2,232,165 nodes, with assignment signature
`fcd2fc08ab70d72f4f2bce84848dc01690fcec64efac04c2a73d0c7d438bf92f`.
Fail-closed extraction of the pinned source row, all eleven remaining global
rows, and four shell duplicates passes exactly; the canonical row SHA-256 is
`0e54d2992804ccb671688608f641e1a2dbfb6e2c35eccb4b053ee0cd7f141c68`.
Fresh replay against the now-49-core metric bank finds no hit.  Its complete
37-equation equality ideal has SHA-256
`66a1f0a6112fb8f3af112b674b4977c511f628964bf71db1950739be53da2584`
and is `UNIT` in Singular and in both msolve variable orders.  This eliminates
the fixed equality shadow over the complex numbers; it is exact solver
evidence, not yet a Lean theorem.  Four independent row-deletion directions
are active to extract a reusable minimal subsystem.

The old saved offset-1 survivor is now recognized as containing admitted core
10 and is therefore stale; offset 1 has restarted at four million nodes behind
the full current bank.  Current saved bank-missing SAT shadows remain at
offsets 7, 9, 11, and 14.  The corrected long QF_NRA realizability races for
offsets 11 and 14 are still active.  Offsets 0 and 5 remain node-cap
`INDETERMINATE`, not coverage-UNSAT.

## Pause checkpoint — 2026-07-15

This lane is intentionally paused at the user's request.  All sixteen
solver/search jobs owned by this lane have been stopped, including the
offset-14 parent process that did not exit after its first terminal interrupt.
A host-level process check finds no remaining command under
`scratch/atail-force/unique-row-producer/`.

The durable certified bank at the pause is 49 admitted exact cuts and eight
queued patterns.  The queued set is cores 16, 32, 37, 50, 50-alt, 52, 55, and
56.  The in-flight 1,800-second Singular jobs for all eight returned `TIMEOUT`
before the pause (both variable orders for core 16 and one recorded order for
each other queued pattern); no new certificate is claimed from them.

The offset-7 post-core-59/60 full shadow remains exactly eliminated at the
full-system level by the three-engine `UNIT` result recorded above.  Its four
row-deletion directions were interrupted before writing output artifacts, so
the next action on resume is to rerun the forward/reverse row-order by
forward/reverse Singular-variable-order deletion matrix for pattern
`offset7-postunit59-60-full`.  No provisional core number has been assigned.

The refreshed offset-1 four-million-node CEGAR run was also interrupted before
writing an artifact.  Resume it behind the current 49-cut scanner bank; the
old saved offset-1 SAT shadow is already killed by core 10 and must not be
treated as live.

The corrected 1,800-second full-counterexample QF_NRA races for offsets 11 and
14 were interrupted without a durable decisive report.  The only durable
offset-11 realizability JSON remains the earlier 30-second
`UNKNOWN`/`UNKNOWN` result.  Do not promote the interrupted long runs to an
UNSAT claim.

The proof-blueprint anchor/goal was not changed.  No production source,
closure document, or metric-core module was edited, and no Lean/Lake build was
run.  Generated scalar sources and wrappers for cores 14 and 47-alt therefore
remain independently replayed, wrapper-audited, deterministic, and explicitly
unbuilt.

## 2026-07-15 resume: FA-UNIQ rename, bridge kernel-check, accepted-output reclassification

Branch labels are renamed: the first-apex unique-radius arms formerly called
U4 and U5 are now **FA-UNIQ4** and **FA-UNIQ5**, to disambiguate from the
original U-lane.  Historical sections of this file retain the old labels.

Resume state: anchor reset per `RESUME_PROMPT.md`;
`producer_coverage_census --check` passed with no selection-id drift; no
competing build or solver process was found, so the standing no-Lean-build
gate is replaced by focused checks.

**Kernel-checked this session (exit 0, direct elaboration):** focused
production builds of `ATail.CriticalPairFrontier`, `CapSelectedRowCounting`,
`RemovableVertexAxiom.PinnedSurplusGeneralM`, and `Dumitrescu.L1` against the
current dirty tree, then re-elaboration of the owned chain with fresh
`.olean`s: `card_five_interior_survivor_pair.lean`,
`card_five_cross_blocker_localization.lean`, and — for the first time —
the bridge `card_five_interior_critical_frontier.lean`.  Every `#print
axioms` in all three files reports exactly `propext`, `Classical.choice`,
`Quot.sound`.  Recipe (from `lean/`):

```bash
D=../scratch/atail-force/unique-row-producer
B="$(lake env printenv LEAN_PATH)"
lake env env LEAN_PATH="$D:$B" lean -M 16384 -R $D \
  -o $D/<f>.olean -i $D/<f>.ilean $D/<f>.lean
```

**PROVEN (existing theorems, newly recognized as refutations):** two of the
three named accepted outputs are unsatisfiable on their own branch surface,
because their terminal consumers use only fields the frontier pair supplies
unconditionally:

- FA-UNIQ4: `false_of_existsSurplusPairCriticalBlocker`
  (`card_four_parent_boundary.lean`) consumes only carrier membership, pair
  distinctness, off-surplus placement, and first-apex equidistance.  Hence
  `ExistsSurplusPairCriticalBlocker S S.oppApex1 q w` can never hold for the
  frontier pair; producing it is verbatim proving `False`.  It is an
  artificial ex-falso endpoint in the same sense as the retired K-A-PAIR
  existential, not a producible witness.
- FA-UNIQ5-distinct: `false_of_frontier_cardFive_distinct_capLocalCross`
  consumes only `F`, `hr`, `hcard`, `centers_ne`, and the hypothesis itself,
  so `CardFiveDistinctCapLocalCrossHypothesis` is likewise unsatisfiable
  given branch data.  Equivalently, on the interior surface the checked
  localization (`q_blocker_mem_firstInterior_of_cross`) plus interior/surplus
  cap disjointness refute each cap-local arm directly.

**PLANNED, NOT YET KERNEL-CHECKED (since upgraded: PROVEN, see the
finalization section below):** the analogous refutation for the
FA-UNIQ5-coincident accepted output: coincident centers with card five give
mutual membership (production
`blocker_centers_eq_iff_mutual_cross_membership_of_five_le`), placing the
common blocker on the pair's perpendicular bisector; with
`Dumitrescu.perpBisector_apex_bound` the bisector is then saturated by
`{oppApex1, blocker}`, so no residual member `x ≠ oppApex1` can carry a
`SelectedFourClass` through the common pair.  The only residual escape is
`x = oppApex1` itself (a `SelectedFourClass` support may be any four-point
subset of a radius class).

**Corrected decomposition (CONJECTURED at time of writing; the coincident
theorem is now kernel-checked — see the finalization section below):** the
three packet targets do not decompose the FA-UNIQ branches;
each is refuted by branch-local data, so any "producer" for them must already
contain the full branch contradiction.  The genuinely missing full-geometry
producer is a direct-`False` theorem on the residual configurations:

1. FA-UNIQ5, distinct blockers: interior pair with at least one directed
   cross-survival (`cross_deletion_survives_iff_not_mem_selected_support`:
   survival is exactly absence of the opposite source from the selected
   shell);
2. FA-UNIQ5, coincident blocker: interior pair with the common blocker on
   the bisector and both residual shell members off the apex circle and
   outside the pair's cap, apex-on-shell escape case included;
3. FA-UNIQ4: unchanged branch data with the surplus-pair packet route
   removed.

Next Lean step: new module `card_five_interior_bisector_localization.lean`
with (T1) bisector-center localization — every carrier center other than
`oppApex1` equidistant from the interior pair lies in
`capInteriorByIndex S.oppIndex1`; (T5) `cross_survival_of_distinct_blockers`
via the production mutual-membership theorem; (D) the coincident
no-third-bisector-center refutation above.

## 2026-07-15 finalization: T1/T5/D kernel-checked; coincident refutation PROVEN

The planned module `card_five_interior_bisector_localization.lean` is
written and kernel-checked (owned dir, recipe above, exit 0).  All eight
`#print axioms` lines report exactly `propext`, `Classical.choice`,
`Quot.sound` — no `sorryAx`, no custom axioms.  Declarations (namespace
`Problem97.ATailUniqueRowProducerScratch`):

- **T1** `interior_pair_bisector_center_mem_capInterior`: any carrier point
  `c ≠ S.oppApex1` equidistant from a strict-interior selected pair lies in
  `S.capInteriorByIndex S.oppIndex1`.  Needs neither `0 < r` nor a
  cardinality hypothesis, so it localizes bisector centers uniformly in the
  FA-UNIQ4 and FA-UNIQ5 branches.  Corollary
  `interior_pair_bisector_center_not_mem_surplusCap`: every such center
  avoids the surplus cap.
- **Card-four counting** `selectedClass_capInteriorByIndex_card_ge_two_of_card_four`,
  `firstApex_cardFour_interior_card_ge_two`, `exists_cardFour_interior_pair`:
  the exact card-four first-apex class has at least two strict-interior
  members, so the FA-UNIQ4 branch has an interior pair and T1 applies to it
  verbatim.
- **T5** `cross_survival_of_distinct_blockers`: on a survivor relocation
  packet with `5 ≤ card`, distinct chosen blocker centers force at least one
  directed cross-deletion survival (otherwise both cross memberships hold
  and `blocker_centers_eq_of_five_le_of_mutual_cross_membership` collapses
  the centers).  This replaces the refuted
  `CardFiveDistinctCapLocalCrossHypothesis` route with a proved dichotomy.
- **D** `coincident_blocker_no_third_bisector_center`: in the exact
  card-five coincident-blocker branch, `S.oppApex1` and the common blocker
  saturate `Dumitrescu.perpBisector_apex_bound`; no other carrier point is
  equidistant from the frontier pair.  Corollary
  `coincident_blocker_no_residual_class_through_pair`: no carrier point
  other than the apex and the common blocker carries a `SelectedFourClass`
  through the pair.  Both excluded points are genuine bisector escapes (the
  apex's card-five class and the blocker's own selected shell each contain
  the pair); for residual shell members the blocker escape is vacuous by
  `center_not_mem`, leaving exactly the apex-on-shell case.

**Upgrade of the PLANNED item above: PROVEN.**  With D checked, the
FA-UNIQ5-coincident accepted output (`RESUME_PROMPT.md` target (c): a
residual member `x` with a `SelectedFourClass D.A x` through the common
pair) is unsatisfiable for every `x` other than `oppApex1`, completing the
reclassification of all three named accepted outputs as ex-falso endpoints.

**Upgrade of the corrected decomposition: the reclassification claims are
now all PROVEN.**  The residual configurations stand as the genuinely
missing full-geometry producer content, now sharpened by the new theorems:

1. FA-UNIQ5, distinct blockers: interior pair, distinct blockers, and — now
   PROVEN present by T5 — at least one directed cross-deletion survival
   (equivalently, one source absent from the other's selected shell).  The
   open content is a direct-`False` theorem consuming this cross-survival
   configuration.
2. FA-UNIQ5, coincident blocker: interior pair with the common blocker on
   the bisector (localized in `capInteriorByIndex S.oppIndex1` by T1, hence
   off the surplus cap), both residual shell members off the apex circle
   and outside the pair's cap, and — now PROVEN by D — no third carrier
   bisector center.  The open content is the apex-on-shell escape case and
   a direct-`False` theorem on the two off-circle residual members.
3. FA-UNIQ4: unchanged branch data with the surplus-pair packet route
   removed; the branch has an interior pair (card-four counting) and every
   carrier bisector center of it other than the apex is localized off the
   surplus cap (T1).  The open content is a direct-`False` theorem on this
   card-four interior configuration.

No conditional wrapper and no fixed-card abstraction were introduced; all
new statements are over the live parent surface with explicit branch
hypotheses.  Census evidence: `producer_coverage_census --check` passed
this session against
`census/atail_force/producer_coverage_census_checkpoint.json` (git blob
`8ab93e1d95f7c140fcf67f8f9fcf3152b8af4fbb`, last touched by commit
`f01ff4a2`).

## 2026-07-15 continuation: T1 as shadow cut; residual witness shapes

Bank sweep for the three residual configurations: production additionally
holds `SurvivorPairRelocationPacket.blocker_dist_ne_of_cross_deletion_survives`
(cross survival puts the blocker strictly off the pair's bisector) and
`actual_blocker_ne_oppApex1_of_cross_deletion_survives` (no cardinality
needed).  The robust-four-center sinks
(`false_of_twoBlockerGlobalPairRows`,
`false_of_supportCentersBisectFrontierPair`) are the same Dumitrescu
saturation as D but require two unproduced bisector facts, which config 1
explicitly denies; no existing direct-`False` consumer matches the
cross-survival configuration.  Nothing in any bank covers a surplus-cap-
centered exact shell through a strict-O1-interior source.

Shadow experiment: added the kernel-checked T1 localization as a
combinatorial cut (`interior_pair_bisector_localization_ok`) to
`card_five_interior_shadow_search.py` (pre-pause mining state committed
first as `5f6f5c36`), and compared all three profiles under
`--bank-negative --real-cas-negative` against the pre-T1 baseline:

| profile | baseline | with T1 cut |
| --- | --- | --- |
| 554 | `EXHAUSTIVE_UNSAT_IN_FINITE_SHADOW`, 22,498 nodes | identical |
| 654 | SAT, 4,517,699 nodes, 9 node caps | identical witness |
| 555 | SAT, 104,524 nodes | identical witness |

T1 fires nowhere on the current frontier: the surviving witnesses already
route at most one interior-pair bisector center, and it is interior.  The
cut stays in the script (sound; enforced in `validate_witness` too) but
does not obsolete the paused mining queue.

Frontier witness shapes (both are config 1a, double survival, no cross
hits):

- 555 (`row_signature d48af6a7…`): pair `(6,7)`, blockers `(2,3)` — **both
  blockers in the surplus cap**, each exact shell through one interior
  pair member.
- 654 (`row_signature fa87f604…`): pair `(7,8)`, blockers `(8,4)` — **the
  blocker of source 7 is the other pair member 8** (interior, on the apex
  circle), the other blocker in the surplus cap.  Note 654 SAT is bounded
  (9 candidate five-rows hit the 500k node cap), not exhaustive.

Theorem candidates extracted from the shapes (unmined, no bank coverage):

1. {{NEEDS_PROOF}} an exact critical shell centered in the surplus cap
   cannot pass through a strict-O1-interior source (kills the 555 witness
   class and one blocker of the 654 witness);
2. {{NEEDS_PROOF}} a frontier pair member cannot serve as the other
   member's critical blocker center (kills the 654 witness class); the
   only current exclusions are `oppApex1`/`oppApex2`;
3. the coincident-blocker mode (config 2) is not yet searched: the
   distinct-blocker enumeration skips `bq == bw` by construction, and the
   D-saturation constraints are exactly the existing pair bound there.

554 remains the only fully closed profile.  The exact-oracle mining pause
stands; candidates 1–2 offer a cheaper Lean-first path than resuming the
queue.

## 2026-07-15 candidate-cut discrimination

Before proving either theorem candidate, both were wired into the shadow
search as OPT-IN flags (`--cut-surplus-blocker`, `--cut-pair-member-blocker`,
both {{NEEDS_PROOF}}, off by default; any UNSAT under them would be
conditional).  Regression first: the default 555 run reproduces
`d48af6a7…` exactly (pair `(6,7)`, blockers `(2,3)`, both in surplus).

Results (all with `--bank-negative --real-cas-negative --check`):

| profile | cuts | status | pair | blockers | blocker locations |
|---|---|---|---|---|---|
| 555 | A | SAT, same sig `d48af6a7` | (6,7) | (7,8) | pair member + third O1-interior |
| 555 | B | SAT, same sig `d48af6a7` | (6,7) | (2,3) | both surplus (unchanged) |
| 555 | A+B | SAT, same sig `d48af6a7` | (6,8) | (7,11) | third O1-interior (cross hit on 8) + O2-interior |
| 654 | A | SAT, same sig `fa87f604` | (7,8) | (8,7) | mutual pair-member blockers |
| 654 | B | SAT, same sig `fa87f604` | (7,8) | (10,4) | O2-interior + surplus |
| 654 | A+B | SAT, same sig `fa87f604` | (7,8) | (10,9) | O2-interior + third O1-interior |

654 runs remain bounded (9 candidate five-rows at the 500k node cap), not
exhaustive.

**Verdict: both theorem candidates are demoted.**  The same two row
assignments survive every cut combination; only the blocker *selection*
relocates (surplus → pair member → third interior member → O2 interior).
Any center whose row contains the source is an eligible blocker, so
excluding blocker-center shapes one at a time cannot close a signature —
it manufactures conditional consumers, which the lane objective forbids.
Candidates 1–2 of the previous section are downgraded from "cheaper
Lean-first path" to "true but not load-bearing even if proved"
({{UNVALIDATED}} as theorems either way).

The load-bearing object is each surviving row assignment itself.  The
decisive per-signature diagnostic is the exact-CAS metric audit
(`--metric`): a UNIT verdict on the pinned equality ideal kills the
signature wholesale, independent of blocker choice — the same trust path
as the 49 admitted 554 cuts.  Audits of `d48af6a7` (555) and `fa87f604`
(654) were launched; results in the next section.  Whether to resume the
iterative mine–admit–rerun loop on 555/654 remains Adam's call; these
audits are one-shot diagnosis of the two standing witnesses only.

## 2026-07-15 exact-CAS audits of the standing frontier witnesses

One-shot `--metric` audits of both standing witnesses (diagnosis only; the
iterative mine–admit–rerun loop stays paused pending Adam's decision).
Metric smoke gates (known UNIT and known NONUNIT references) passed on
both runs.

**555 `d48af6a7…`: CROSSCHECKED_UNIT.**  The pinned 37-equation equality
ideal (expanded-polynomial sha256 `618d6f58…`) is the unit ideal in
characteristic zero — Singular and msolve, both variable orders.  The
fixed shadow has no complex realization at all, independent of blocker
choice (exactness flags do not change the equality count).  Bounded row
deletion retains a 7-row core (22 equalities, itself CROSSCHECKED_UNIT):

```text
1:{0,2,6,7,8}  0:{1,2,3,4}  7:{4,6,8,9}  8:{0,7,9,10}
9:{0,3,5,10}  10:{3,7,9,11}  11:{1,5,8,10}
```

Both surplus-cap blocker rows (centers 2, 3) were deleted — the
infeasibility never touches the blocker rows.  The deletion pass is
incomplete (rows 8 and 10 hit the 45 s budget), so the core is not
confirmed irredundant, but it is a valid literal subrow cut in the
`REAL_INFEASIBLE_ROW_CORES` format, and the first such core at 555.

**654 `fa87f604…`: CROSSCHECKED_NONUNIT, but every complex realization
collapses the frontier pair.**  The equality ideal (sha256 `574867866…`)
has dimension 4, and Singular direct membership finds 53 of 66 squared
point distances forced to zero — including pair `(7,8)`, the frontier
pair itself.  Any realization with twelve distinct points is impossible;
in particular no real Euclidean witness exists.  Trust note: this is
Singular-only membership (`COMPLETED`, 30 s); the admitted-bank standard
(`CROSSCHECKED_REAL_INFEASIBLE_MEMBERSHIP`) would additionally need the
msolve reduced-basis membership crosscheck before this signature could be
admitted as a cut.

**Combined assessment.**  Both standing 555/654 witnesses are dead as
real configurations, while surviving every finite-pattern cut including
both demoted theorem candidates.  This inverts the previous section's
closing line: the Lean-first blocker-shape path is not viable (whack-a-
mole over blocker selections inside surviving row assignments), whereas
the exact-oracle mining path demonstrably kills the standing witnesses
wholesale.  Whether to resume that loop on 555/654 — admit the 555 core
and (after msolve crosscheck) the 654 membership kill, then re-search —
is Adam's call; nothing has been admitted in this session.

## 2026-07-15 mining loop resumed (Adam), both standing kills admitted

Adam authorized resuming the mine–admit–rerun loop on 555/654.

New tool `membership_crosscheck.py`: admission-grade certification of a
forced-zero pair.  It replays the canonical row signature (fail-closed),
re-verifies Singular direct reduction of `dist²(L,R)` mod `std(I)`, and
crosschecks radical membership via Rabinowitsch — `I + (1 − t·dist²(L,R))`
UNIT in Singular and in msolve under forward and reversed variable
orders.  Encoding validated with a negative control first: the
non-forced pair `(3,7)` of `fa87f604` returns NOT_CROSSCHECKED with
nonzero normal form and NONUNIT ×3.  The frontier pair `(7,8)` then
certifies: reduction `0`, UNIT ×3 —
`CROSSCHECKED_REAL_INFEASIBLE_MEMBERSHIP`.

Admissions into the shadow-search banks:

- `unit-core-555-01` into `REAL_INFEASIBLE_ROW_CORES`: the 7-row retained
  core of `d48af6a7` (22 equalities, CROSSCHECKED_UNIT; apex row
  `1:{0,2,6,7,8}` plus rows at centers 0, 7, 8, 9, 10, 11).  Fires as a
  literal subrow cut in any profile.
- `fa87f604…` into `REAL_INFEASIBLE_ROW_SIGNATURES` with
  `exact_cas_status: CROSSCHECKED_REAL_INFEASIBLE_MEMBERSHIP`, forced
  pair `(7,8)`, Singular reduction `0`, msolve Rabinowitsch radical
  membership.

Loop protocol per iteration: run all three profiles with
`--bank-negative --real-cas-negative --metric --check` (554 is the
regression control and must stay EXHAUSTIVE_UNSAT); for each new SAT
witness, admit its UNIT retained core when crosschecked, else run
`membership_crosscheck.py` on a forced-zero pair; stop at exhaustive
UNSAT on 555 and 654 or at a witness that survives exact CAS (a genuine
geometry frontier).  Iteration results follow.

## 2026-07-15 loop iterations (in progress)

Iteration log (all runs `--bank-negative --real-cas-negative --metric
--check`; every 555 audit so far CROSSCHECKED_UNIT with a crosschecked
retained core, admitted immediately):

| iter | profile | witness sig | audit | admitted as |
|---|---|---|---|---|
| 1 | 554 | — | EXHAUSTIVE_UNSAT (regression holds, 22,498 nodes) | — |
| 1 | 555 | `e93c0b50…` | UNIT; 7-row core | `unit-core-555-02` |
| 2 | 555 | `c6557e4d…` | UNIT; 7-row core | `unit-core-555-03` |
| 3 | 555 | `1560c698…` | UNIT; 6-row core | `unit-core-555-04` |
| 1 | 654 | `a4914ed2…` | NONUNIT; built-in 30 s membership audit TIMEOUT | pending scan |
| 4 | 555 | `3d9a6b04…` | UNIT; 6-row core; new apex row `{0,5,6,7,8}` (1.88 M nodes) | `unit-core-555-05` |
| 5 | 555 | `a94caeaf…` | UNIT; 7-row core; apex row `{2,6,7,8,10}`; first core with NO apex row (2.71 M nodes) | `unit-core-555-06` |
| 6 | 555 | `aab3e0b5…` | inline UNDECIDED (Singular TIMEOUT, msolve UNIT x2); settled UNIT at 900 s via `system_unit_recheck.py`; 7-row core, no apex row (2.71 M nodes) | `unit-core-555-07` |
| 7 | 555 | `84ac8d4a…` | NONUNIT (first on 555); `--scan` timed out at 900 s; SOURCE pair (6,7) certified via `--radical-only`, UNIT x3 (2.73 M nodes) | signature admitted |
| 1 | 654 | `a4914ed2…` (cont.) | scans timed out at 300 s AND 1800 s in `std(I)`; pair (7,8) certified via `--radical-only`, Rabinowitsch UNIT x3 | signature admitted |
| 2 | 654 | `9095f635…` | NONUNIT; SOURCE pair (7,8) certified via `--radical-only`, UNIT x3 (5.09 M nodes, 11 rows tried) | signature admitted |
| 8 | 555 | `79a04c0f…` | NONUNIT; SOURCE pair (6,7) certified via `--radical-only`, UNIT x3 (2.73 M nodes) | signature admitted |
| 9 | 555 | `fd874bf2…` | NONUNIT; SOURCE pair (6,7) certified via `--radical-only`, UNIT x3 (2.79 M nodes) | signature admitted |
| 3 | 654 | `cb30873e…` | NONUNIT; SOURCE pair (7,8) certified via `--radical-only`, UNIT x3 (5.69 M nodes, 12 rows tried) | signature admitted |
| 10 | 555 | `50cfcbec…` | NONUNIT; SOURCE pair (6,7) certified via `--radical-only --core`, UNIT x3; greedy deletion retained a 7-row / 21-equality forced-pair core, itself UNIT x3 (2.80 M nodes) | `forced-pair-core-555-01` + signature |
| reg | 554 | — | EXHAUSTIVE_UNSAT (regression holds after first forced-pair-core admission) | — |
| 4 | 654 | `6b5de144…` | NONUNIT; SOURCE pair (7,8) certified via `--radical-only --core`, UNIT x3; 8-row / 24-equality core | `forced-pair-core-654-02` + signature |
| retro | 555 | `84ac8d4a…` (iter 7) | `--radical-only --core` upgrade of the signature-only kill: 7-row / 21-equality core, pair (6,7) | `forced-pair-core-555-02` |
| retro | 555 | `fd874bf2…` (iter 9) | 7-row / 21-equality core, pair (6,7); differs from 555-02 only in row 4 | `forced-pair-core-555-03` |
| retro | 555 | `79a04c0f…` (iter 8) | 8-row / 24-equality core, pair (6,7) | `forced-pair-core-555-04` |
| retro | 654 | `cb30873e…` (iter 3) | 5-row / 15-equality core, pair (7,8), no row centered at 7 | `forced-pair-core-654-01` |
| retro | 654 | `a4914ed2…` (iter 1) | 10-row / 30-equality core, pair (7,8) — the ideal whose `std(I)` defeated 1800 s | `forced-pair-core-654-03` |
| retro | 654 | `9095f635…` (iter 2) | 7-row / 21-equality core, pair (7,8) | `forced-pair-core-654-04` |
| 11 | 555 | `38a642e3…` | NONUNIT; SOURCE pair (6,7) certified via `--radical-only --core`, UNIT x3; 7-row / 21-equality core | `forced-pair-core-555-05` + signature |
| 5 | 654 | `080287b2…` | NONUNIT; SOURCE pair (7,8) certified via `--radical-only --core`, UNIT x3; 8-row / 24-equality core | `forced-pair-core-654-05` + signature |
| 12 | 555 | `5d2b6e65…` | inline audit UNDECIDED (msolve NONUNIT x2, Singular TIMEOUT); pair (6,7) certified via `--radical-only --core`, UNIT x3; 7-row / 21-equality core, no row centered at 7 | `forced-pair-core-555-06` + signature |
| 6 | 654 | `f8dd433b…` | NONUNIT; SOURCE pair (7,8) certified via `--radical-only --core`, UNIT x3; 7-row / 21-equality core sharing five rows with 654-05 | `forced-pair-core-654-06` + signature |
| 13 | 555 | `78b4d1af…` | NONUNIT; SOURCE pair (6,7) certified via `--radical-only --core`, UNIT x3; 8-row / 24-equality core | `forced-pair-core-555-07` + signature |
| 7 | 654 | `e99adf80…` | NONUNIT; SOURCE pair (7,8) certified via `--radical-only --core`, UNIT x3; 7-row / 21-equality core, no row centered at 7 | `forced-pair-core-654-07` + signature |
| 14 | 555 | `67cd332a…` | NONUNIT; SOURCE pair (6,7) certified via `--radical-only --core`, UNIT x3; 7-row / 21-equality core (6 deletion TIMEOUTs retained fail-closed) | `forced-pair-core-555-08` + signature |
| 8 | 654 | `0fe506e4…` | NONUNIT; SOURCE pair (7,8) certified via `--radical-only --core`, UNIT x3; 9-row / 27-equality core (8 deletion TIMEOUTs retained fail-closed under box load) (5.87 M nodes) | `forced-pair-core-654-08` + signature |
| 9 | 654 | `9bd971a6…` | NONUNIT; SOURCE pair (7,8) certified via `--radical-only --core`, UNIT x3; 7-row / 21-equality core, no row centered at 3/4/5 (6.48 M nodes) | `forced-pair-core-654-09` + signature |
| 15 | 555 | `1e81296b…` | NONUNIT (3.33 M nodes); source-pair route FAILS — dist²(6,7) radical membership NONUNIT in all three oracles, first such witness since 555 iter-7; all-pairs `--scan` then found 49/66 pairs DIRECTLY forced (dist² ∈ I); point 6 nearly isolated in the forced graph (only (6,11)); kill pair (7,8) certified via `--radical-only --core`, UNIT x3; 8-row / 24-equality core (8 deletion TIMEOUTs retained fail-closed) | `forced-pair-core-555-09` + signature |
| 16 | 555 | `25e8cc56…` | NONUNIT; SOURCE pair (6,7) certified via `--radical-only --core`, UNIT x3; 7-row / 21-equality core (3.44 M nodes) | `forced-pair-core-555-10` + signature |
| 10 | 654 | `d515e684…` | NONUNIT; SOURCE pair (7,8) certified via `--radical-only --core`, UNIT x3; 7-row / 22-equality core — FIRST forced-pair core retaining an apex row (center 1, five-point support) (6.49 M nodes, flat vs iter 9) | `forced-pair-core-654-10` + signature |
| reg | 554 | — | EXHAUSTIVE_UNSAT (regression holds with 19 forced-pair cores, 22,498 nodes) | — |
| 17 | 555 | `09fd77b8…` | NONUNIT; SOURCE pair (6,7) certified via `--radical-only --core`, UNIT x3; 8-row / 24-equality core (3.436 M nodes, plateau vs iter 16) | `forced-pair-core-555-11` + signature |
| 11 | 654 | — | NO_WITNESS_WITHIN_BOUNDED_FINITE_SHADOW — first no-witness 654 run, but NOT exhaustive: all 15 card-five rows hit the 500 k per-row node cap (7,500,015 nodes, `node_caps` 15); re-run at `--max-nodes 5000000` in flight as iteration 12 | — |
| 18 | 555 | `0d357ae8…` | NONUNIT; SOURCE pair (6,7) certified via `--radical-only --core`, UNIT x3; 6-row / 18-equality core — SMALLEST 555 core to date, ZERO deletion timeouts (3.437 M nodes, plateau) | `forced-pair-core-555-12` + signature |
| 12 | 654 | `4846a007…` | SAT witness at `--max-nodes 5000000` — the iteration-11 cap starvation was depth, not exhaustion: witness found at only 1.139 M total nodes once the first-row subtree could pass 500 k; inline audit CROSSCHECKED_UNIT, the FIRST unit-grade 654 loop witness (all prior 654 kills were NONUNIT); `system_unit_recheck.py` 900 s pass retained a 6-row / 19-equality core incl. apex row 1:{0,2,7,8,9}, retained core CROSSCHECKED_UNIT x3 (2 deletion TIMEOUTs fail-closed) | `unit-core-654-15` |
| 19 | 555 | `717de68a…` | NONUNIT; SOURCE pair (6,7) certified via `--radical-only --core`, UNIT x3; 7-row / 21-equality core, ZERO deletion timeouts; differs from 555-10 only in row 6's support (3.437 M nodes, plateau) | `forced-pair-core-555-13` + signature |
| 13 | 654 | `1f76e0e5…` | SAT witness, sources (7,8), inline audit CROSSCHECKED_UNIT — SECOND unit-grade 654 witness in a row (1.355 M nodes, `--max-nodes 5000000`); `system_unit_recheck.py` 900 s pass retained 5 rows / 16 equalities, retained core CROSSCHECKED_UNIT x3 (1 deletion TIMEOUT fail-closed); same apex+row-2 family shape as pre-loop unit-core-654-11..14 | `unit-core-654-16` |
| 14 | 654 | `5e8d1b6f…` | SAT witness, sources (7,8), inline audit CROSSCHECKED_UNIT — THIRD consecutive unit-grade 654 witness (1.359 M nodes); `system_unit_recheck.py` 900 s pass retained 6 rows / 19 equalities, retained core CROSSCHECKED_UNIT x3 (1 deletion TIMEOUT fail-closed); near-twin of unit-core-654-15 | `unit-core-654-17` |
| 15 | 654 | `9dd49bf2…` | SAT witness, sources (7,8), inline audit CROSSCHECKED_UNIT — FOURTH consecutive unit-grade 654 witness (1.372 M nodes); `system_unit_recheck.py` 900 s pass retained 5 rows / 16 equalities, ZERO deletion timeouts, retained core CROSSCHECKED_UNIT x3; same apex+row-2 family | `unit-core-654-18` |
| 20 | 555 | `d4521f84…` | SAT witness, sources (6,7), inline audit CROSSCHECKED_UNIT — FIRST unit-grade 555 witness since iteration 6, ending a 13-iteration NONUNIT run (3.518 M nodes, above plateau); `system_unit_recheck.py` 900 s pass retained 7 rows / 21 equalities incl. Moser row 0:{1,2,3,4}, retained core CROSSCHECKED_UNIT x3 (4 deletion TIMEOUTs fail-closed) | `unit-core-555-08` |
| 16 | 654 | `3dfbe849…` | SAT witness, sources (7,8), inline audit CROSSCHECKED_UNIT — FIFTH consecutive unit-grade 654 witness (1.511 M nodes); `system_unit_recheck.py` 900 s pass retained 6 rows / 19 equalities, retained core CROSSCHECKED_UNIT x3 (2 deletion TIMEOUTs fail-closed); same apex+row-2 family | `unit-core-654-19` |
| 17 | 654 | `62a1cfb7…` | SAT witness, sources (7,8), inline audit CROSSCHECKED_UNIT — SIXTH consecutive unit-grade 654 witness (1.511 M nodes, ~same as iter 16); `system_unit_recheck.py` 900 s pass retained 6 rows / 19 equalities, retained core CROSSCHECKED_UNIT x3 (2 deletion TIMEOUTs fail-closed); differs from unit-core-654-15 only in row 10 | `unit-core-654-20` |
| 21 | 555 | `0c979445…` | SAT witness, sources (6,7), inline audit CROSSCHECKED_UNIT — second consecutive unit-grade 555 witness (3.519 M nodes, same pocket as iter 20); `system_unit_recheck.py` 900 s pass retained 8 rows / 24 equalities incl. Moser row, retained core CROSSCHECKED_UNIT x3 (5 deletion TIMEOUTs fail-closed); shares six rows with unit-core-555-08 | `unit-core-555-09` |
| 18 | 654 | `2e78700a…` | SAT witness, sources (7,8), inline audit CROSSCHECKED_UNIT — SEVENTH consecutive unit-grade 654 witness; node cost jumped 1.51 M → 2.98 M (the 1.5 M pocket appears drained); `system_unit_recheck.py` 900 s pass retained 6 rows / 19 equalities, retained core CROSSCHECKED_UNIT x3 (1 deletion TIMEOUT fail-closed) | `unit-core-654-21` |
| 19 | 654 | `978ae764…` | SAT witness, sources (7,8), inline audit CROSSCHECKED_UNIT — EIGHTH consecutive unit-grade 654 witness (2.98 M pocket); `system_unit_recheck.py` 900 s pass retained 6 rows / 19 equalities, retained core CROSSCHECKED_UNIT x3 (1 deletion TIMEOUT fail-closed); near-twin of unit-core-654-21 | `unit-core-654-22` |
| 22 | 555 | `408ff3e5…` | SAT witness, sources (6,7), inline audit CROSSCHECKED_UNIT — third consecutive unit-grade 555 witness (3.669 M nodes, creeping past the 3.52 M pocket); `system_unit_recheck.py` 900 s pass retained 7 rows / 21 equalities incl. Moser row, retained core CROSSCHECKED_UNIT x3 (5 deletion TIMEOUTs fail-closed) | `unit-core-555-10` |
| 20 | 654 | `a77c802b…` | SAT witness, sources (7,8), inline audit CROSSCHECKED_UNIT — NINTH consecutive unit-grade 654 witness (3.221 M nodes, past the 2.98 M pocket); `system_unit_recheck.py` 900 s pass retained 5 rows / 16 equalities, retained core CROSSCHECKED_UNIT x3 (1 deletion TIMEOUT fail-closed) | `unit-core-654-23` |
| 21 | 654 | `572e2d89…` | SAT witness, sources (7,8), inline audit CROSSCHECKED_UNIT — TENTH consecutive unit-grade 654 witness (3.801 M nodes, new pocket past 3.22 M); `system_unit_recheck.py` 900 s pass retained 6 rows / 19 equalities, retained core CROSSCHECKED_UNIT x3 (1 deletion TIMEOUT fail-closed); same apex+row-2 family | `unit-core-654-24` |
| 23 | 555 | `4bd55dcb…` | SAT witness, sources (6,7), inline audit CROSSCHECKED_UNIT — fourth consecutive unit-grade 555 witness (3.669 M nodes, same pocket as iter 22); `system_unit_recheck.py` 900 s pass retained 7 rows / 21 equalities incl. Moser row, retained core CROSSCHECKED_UNIT x3 (4 deletion TIMEOUTs fail-closed); near-twin of unit-core-555-10 differing only in row 8 | `unit-core-555-11` |
| 22 | 654 | `2b74db8e…` | SAT witness, sources (7,8), inline audit CROSSCHECKED_UNIT — ELEVENTH consecutive unit-grade 654 witness (4.164 M nodes, depth still climbing past the 3.80 M pocket); `system_unit_recheck.py` 900 s pass retained 6 rows / 19 equalities, retained core CROSSCHECKED_UNIT x3 (1 deletion TIMEOUT fail-closed); shares five rows with unit-core-654-24 (row 7 replaces row 8) | `unit-core-654-25` |
| 24 | 555 | `fc6e93e9…` | SAT witness, sources (6,7), inline audit CROSSCHECKED_UNIT — fifth consecutive unit-grade 555 witness (3.684 M nodes, same pocket); `system_unit_recheck.py` 900 s pass retained 6 rows / 18 equalities incl. Moser row, retained core CROSSCHECKED_UNIT x3 (4 deletion TIMEOUTs fail-closed); SMALLEST unit-grade 555 core to date | `unit-core-555-12` |
| 25 | 555 | `0f041710…` | SAT witness, sources (6,7), inline audit CROSSCHECKED_UNIT — sixth consecutive unit-grade 555 witness (3.684 M nodes, same pocket); `system_unit_recheck.py` 900 s pass retained 7 rows / 21 equalities incl. Moser row, retained core CROSSCHECKED_UNIT x3 (6 deletion TIMEOUTs fail-closed); differs from unit-core-555-10 only in rows 9 and 11 | `unit-core-555-13` |
| 26 | 555 | `ad1a8ed9…` | SAT witness, sources (6,7), inline audit CROSSCHECKED_UNIT — seventh consecutive unit-grade 555 witness (3.765 M nodes); `system_unit_recheck.py` 900 s pass retained 7 rows / 21 equalities incl. Moser row, retained core CROSSCHECKED_UNIT x3 (3 deletion TIMEOUTs fail-closed); FIRST 555 unit core with row 2:{0,1,9,11} (all earlier loop 555 unit cores carried 2:{0,1,9,10}) | `unit-core-555-14` |
| 27 | 555 | `c52e8cfd…` | SAT witness, sources (6,7), inline audit CROSSCHECKED_UNIT — eighth consecutive unit-grade 555 witness (3.776 M nodes); `system_unit_recheck.py` 900 s pass retained 7 rows / 21 equalities incl. Moser row, retained core CROSSCHECKED_UNIT x3 (4 deletion TIMEOUTs fail-closed); second consecutive core with row 2:{0,1,9,11} | `unit-core-555-15` |
| 28 | 555 | `d770d8d7…` | SAT witness, sources (6,7), inline audit CROSSCHECKED_UNIT — ninth consecutive unit-grade 555 witness (3.795 M nodes); `system_unit_recheck.py` 900 s pass retained 6 rows / 18 equalities incl. Moser row, retained core CROSSCHECKED_UNIT x3 (4 deletion TIMEOUTs fail-closed); third consecutive core with row 2:{0,1,9,11}, ties unit-core-555-12 for smallest unit-grade 555 core | `unit-core-555-16` |
| 29 | 555 | `d1bc6439…` | SAT witness, sources (6,7), inline audit CROSSCHECKED_UNIT — tenth consecutive unit-grade 555 witness (3.816 M nodes); `system_unit_recheck.py` 900 s pass retained 6 rows / 18 equalities incl. Moser row, retained core CROSSCHECKED_UNIT x3 (4 deletion TIMEOUTs fail-closed); fourth consecutive core with row 2:{0,1,9,11}, ties unit-core-555-12/-16 for smallest unit-grade 555 core | `unit-core-555-17` |
| 30 | 555 | `cb967da2…` | SAT witness, sources (6,7), inline audit CROSSCHECKED_UNIT — eleventh consecutive unit-grade 555 witness (3.816 M nodes, 11 nodes past iter 29 — same pocket); `system_unit_recheck.py` 900 s pass retained 8 rows / 24 equalities incl. Moser row, retained core CROSSCHECKED_UNIT x3 (7 deletion TIMEOUTs fail-closed — largest recent 555 core); fifth consecutive core with row 2:{0,1,9,11}, shares rows 10/11 with unit-core-555-17 | `unit-core-555-18` |
| 31 | 555 | `3c75cbfd…` | SAT witness, sources (6,7), inline audit CROSSCHECKED_UNIT — twelfth consecutive unit-grade 555 witness (3.877 M nodes, stepped past the 3.816 M pocket); `system_unit_recheck.py` 900 s pass retained 7 rows / 21 equalities incl. Moser row, retained core CROSSCHECKED_UNIT x3 (4 deletion TIMEOUTs fail-closed); sixth consecutive core with row 2:{0,1,9,11} | `unit-core-555-19` |
| 32 | 555 | `4eb64017…` | SAT witness, sources (6,7), inline audit CROSSCHECKED_UNIT — thirteenth consecutive unit-grade 555 witness (4.001 M nodes, first 555 witness past 4 M); `system_unit_recheck.py` 900 s pass retained 7 rows / 21 equalities incl. Moser row, retained core CROSSCHECKED_UNIT x3 (5 deletion TIMEOUTs fail-closed); row 2 RETURNS to the original {0,1,9,10} after six consecutive {0,1,9,11} cores | `unit-core-555-20` |
| 33 | 555 | `4e0a3c53…` | SAT witness, sources (6,7), inline audit CROSSCHECKED_UNIT — fourteenth consecutive unit-grade 555 witness (4.001 M nodes, 67 nodes past iter 32 — same pocket); `system_unit_recheck.py` 900 s pass retained 7 rows / 21 equalities incl. Moser row, retained core CROSSCHECKED_UNIT x3 (5 deletion TIMEOUTs fail-closed); near-twin of unit-core-555-20 differing only in row 6, second consecutive core with the original row 2:{0,1,9,10} | `unit-core-555-21` |
| 34 | 555 | `620dad4a…` | SAT witness, sources (6,7), inline audit CROSSCHECKED_UNIT — fifteenth consecutive unit-grade 555 witness (4.002 M nodes, same pocket); `system_unit_recheck.py` 900 s pass retained 7 rows / 21 equalities incl. Moser row, retained core CROSSCHECKED_UNIT x3 (3 deletion TIMEOUTs fail-closed); near-twin of unit-core-555-21 — identical except {2,6,10,11} moves from center 7 to center 8 | `unit-core-555-22` |
| 35 | 555 | `b8152428…` | SAT witness, sources (6,7), inline audit CROSSCHECKED_UNIT — sixteenth consecutive unit-grade 555 witness (4.004 M nodes, same pocket); `system_unit_recheck.py` 900 s pass retained 7 rows / 21 equalities incl. Moser row, retained core CROSSCHECKED_UNIT x3 (4 deletion TIMEOUTs fail-closed); differs from unit-core-555-22 by exchanging points 7 and 8 in rows 6/9/10 | `unit-core-555-23` |
| 23 | 654 | `999ff6d4…` | SAT witness, sources (7,8), inline audit CROSSCHECKED_UNIT — TWELFTH consecutive unit-grade 654 witness (4.187 M nodes, same pocket as iter 22); `system_unit_recheck.py` 900 s pass retained 5 rows / 16 equalities, retained core CROSSCHECKED_UNIT x3 (1 deletion TIMEOUT fail-closed); same apex+row-2 family | `unit-core-654-26` |
| 24 | 654 | `01edc0f1…` | SAT witness, sources (7,8), inline audit CROSSCHECKED_UNIT — THIRTEENTH consecutive unit-grade 654 witness (4.594 M nodes, nearing the 5 M cap); `system_unit_recheck.py` 900 s pass retained 6 rows / 19 equalities, retained core CROSSCHECKED_UNIT x3 (2 deletion TIMEOUTs fail-closed); same apex+row-2 family | `unit-core-654-27` |
| 25 | 654 | `08395232…` | SAT witness, sources (7,8), inline audit CROSSCHECKED_UNIT — FOURTEENTH consecutive unit-grade 654 witness (4.594 M nodes, same depth as iter 24 — plateau pocket; first run at `--max-nodes 10000000`); `system_unit_recheck.py` 900 s pass retained 6 rows / 19 equalities, retained core CROSSCHECKED_UNIT x3 (1 deletion TIMEOUT fail-closed); same apex+row-2 family | `unit-core-654-28` |
| 26 | 654 | `cbf173d2…` | SAT witness, sources (7,8), inline audit CROSSCHECKED_UNIT — FIFTEENTH consecutive unit-grade 654 witness (6.580 M nodes, big depth jump past the 4.59 M plateau); `system_unit_recheck.py` 900 s pass retained 5 rows / 16 equalities, retained core CROSSCHECKED_UNIT x3 (4 deletion TIMEOUTs fail-closed); FIRST loop 654 unit core WITHOUT row 2:{0,1,10,11} — keeps apex row 1:{0,2,7,8,9} but departs from the apex+row-2 family | `unit-core-654-29` |
| 27 | 654 | `780ac81b…` | SAT witness, sources (7,8), inline audit CROSSCHECKED_UNIT — SIXTEENTH consecutive unit-grade 654 witness (6.718 M nodes, same pocket as iter 26); `system_unit_recheck.py` 900 s pass retained 5 rows / 16 equalities, retained core CROSSCHECKED_UNIT x3 (4 deletion TIMEOUTs fail-closed); second consecutive no-row-2 core, near-twin of unit-core-654-29 differing in rows 5 and 7 | `unit-core-654-30` |
| 28 | 654 | `8f8cdfed…` | SAT witness, sources (7,8), 7.147 M nodes — inline metric audit returned UNDECIDED_ORACLE_DISAGREEMENT_OR_TIMEOUT (first non-definitive inline audit of the loop); 900 s `system_unit_recheck.py` decided it CROSSCHECKED_NONUNIT — the FIRST NONUNIT 654 witness since iteration 10, ending the 16-witness unit streak exactly as the no-row-2 family edge appeared; forced-pair certification (`--pair 7 8 --radical-only --core`) passed CROSSCHECKED_REAL_INFEASIBLE_RADICAL_MEMBERSHIP: retained 7-row / 21-equality core forcing pair (7,8), retained core Rabinowitsch UNIT x3, ZERO deletion timeouts, no apex row | `forced-pair-core-654-11` |
| 29 | 654 | `5a6fd93d…` | SAT witness, sources (7,8), 7.147 M nodes (same depth pocket as iter 28) — inline metric audit UNDECIDED_ORACLE_DISAGREEMENT_OR_TIMEOUT again (second of the loop, consecutive on 654); `system_unit_recheck.py` decided CROSSCHECKED_NONUNIT almost immediately (oracles agreed, no timeout) — SECOND consecutive 654 NONUNIT witness; forced-pair certification (`--pair 7 8 --radical-only --core`) passed CROSSCHECKED_REAL_INFEASIBLE_RADICAL_MEMBERSHIP: retained 8-row / 24-equality core forcing pair (7,8), retained core Rabinowitsch UNIT x3, ZERO deletion timeouts, no apex row — shares rows 0/6/7/10/11 with forced-pair-core-654-11 | `forced-pair-core-654-12` |
| 30 | 654 | `998d759a…` | SAT witness, sources (7,8), 7.543 M nodes (past the 7.147 M pocket) — inline metric audit decided CROSSCHECKED_NONUNIT directly (no recheck needed); THIRD consecutive 654 NONUNIT witness; forced-pair certification (`--pair 7 8 --radical-only --core`) passed CROSSCHECKED_REAL_INFEASIBLE_RADICAL_MEMBERSHIP: retained 6-row / 19-equality core forcing pair (7,8), retained core Rabinowitsch UNIT x3, ZERO deletion timeouts — second-smallest 654 forced-pair core (after 654-01); apex row 1:{0,2,7,8,9} returns (654-11/-12 had none), shares rows 6/7 with both | `forced-pair-core-654-13` |
| 31 | 654 | `1902f507…` | SAT witness, sources (7,8), 7.543 M nodes (5 nodes past iter 30 — same pocket) — inline metric audit CROSSCHECKED_NONUNIT directly; FOURTH consecutive 654 NONUNIT witness; forced-pair certification (`--pair 7 8 --radical-only --core`) passed CROSSCHECKED_REAL_INFEASIBLE_RADICAL_MEMBERSHIP: retained 7-row / 22-equality core forcing pair (7,8), retained core Rabinowitsch UNIT x3, ZERO deletion timeouts — shares rows 1/6/7/10/11 with forced-pair-core-654-13 (row 9 support changes, row 8 added) | `forced-pair-core-654-14` |
| 32 | 654 | `5b9f46c0…` | SAT witness, sources (7,8), 7.559 M nodes — inline metric audit CROSSCHECKED_NONUNIT directly; FIFTH consecutive 654 NONUNIT witness; forced-pair certification (`--pair 7 8 --radical-only --core`) passed CROSSCHECKED_REAL_INFEASIBLE_RADICAL_MEMBERSHIP: retained 6-row / 18-equality core forcing pair (7,8), retained core Rabinowitsch UNIT x3, ZERO deletion timeouts — second-smallest 654 forced-pair core (between 654-01 and 654-13); shares NO rows with the 654-11..14 cluster, a fresh NONUNIT pattern with no apex row | `forced-pair-core-654-15` |
| 33 | 654 | `ea77d602…` | SAT witness, sources (7,8), 7.559 M nodes (15 nodes past iter 32 — same pocket) — inline metric audit UNDECIDED_ORACLE_DISAGREEMENT_OR_TIMEOUT (third of the loop); 900 s `system_unit_recheck.py` ALSO returned UNDECIDED (first undecided long-budget recheck of the loop); routed to forced-pair certification (`--pair 7 8 --radical-only --core`), which passed CROSSCHECKED_REAL_INFEASIBLE_RADICAL_MEMBERSHIP as the sole self-contained kill: retained 7-row / 22-equality core forcing pair (7,8), retained core Rabinowitsch UNIT x3, ZERO deletion timeouts — SIXTH consecutive 654 NONUNIT-track witness; keeps apex row 1:{0,2,7,8,9} and shares rows 7/8/11 with forced-pair-core-654-15, so the iter-32 "fresh" pattern now clusters | `forced-pair-core-654-16` |
| 36 | 555 | `964ae2d9…` | SAT witness, sources (6,7), inline audit CROSSCHECKED_UNIT — seventeenth consecutive unit-grade 555 witness (4.004 M nodes, same pocket); `system_unit_recheck.py` 900 s pass retained 7 rows / 21 equalities incl. Moser row, retained core CROSSCHECKED_UNIT x3 (5 deletion TIMEOUTs fail-closed); near-twin of unit-core-555-23 differing only in row 6 (7→8), i.e. unit-core-555-22 with 7↔8 exchanged in rows 9/10 only — the relabel-drift family keeps enumerating its orbit | `unit-core-555-24` |
| 37 | 555 | `8702b9d4…` | SAT witness, sources (6,7), inline audit CROSSCHECKED_UNIT — eighteenth consecutive unit-grade 555 witness at 56,760 nodes, a sharp depth DROP from the 4.004 M pocket: the unit-core-555-24 admission pruned the deep region and exposed a much shallower SAT pocket; `system_unit_recheck.py` 900 s pass retained 7 rows / 21 equalities incl. Moser row, retained core CROSSCHECKED_UNIT x3 (4 deletion TIMEOUTs fail-closed); same drift family despite the depth collapse — closest to unit-core-555-20, with support {0,4,7,11} moving center 10→8 and row 9 swapping point 5→0 | `unit-core-555-25` |
| 38 | 555 | `53959a53…` | SAT witness, sources (6,7), inline audit CROSSCHECKED_UNIT — nineteenth consecutive unit-grade 555 witness (56,859 nodes, 99 past iter 37 — same shallow pocket); `system_unit_recheck.py` 900 s pass retained 8 rows / 24 equalities incl. Moser row, retained core CROSSCHECKED_UNIT x3 (7 deletion TIMEOUTs fail-closed — first 8-row 555 core after a run of 7-row cores, the timeouts kept extra rows); same drift-family anchors (rows 0/2/11), new support 10:{3,5,9,11} | `unit-core-555-26` |
| 34 | 654 | `b7de2283…` | SAT witness, sources (7,8), 7.559 M nodes (same pocket as iters 32–33) — inline metric audit CROSSCHECKED_NONUNIT directly; SEVENTH consecutive 654 NONUNIT-track witness; forced-pair certification (`--pair 7 8 --radical-only --core`) passed CROSSCHECKED_REAL_INFEASIBLE_RADICAL_MEMBERSHIP: retained 6-row / 18-equality core forcing pair (7,8), retained core Rabinowitsch UNIT x3, 3 deletion TIMEOUTs fail-closed — ties 654-15's 18 equalities for second-smallest; no apex row; bridges the two NONUNIT clusters, sharing rows 5/8/10 with 654-15 and rows 0/8/9 with 654-16 | `forced-pair-core-654-17` |
| 35 | 654 | `42949532…` | SAT witness, sources (7,8), 7.809 M nodes — past the 7.559 M pocket; inline metric audit CROSSCHECKED_NONUNIT directly; EIGHTH consecutive 654 NONUNIT-track witness; forced-pair certification (`--pair 7 8 --radical-only --core`) passed CROSSCHECKED_REAL_INFEASIBLE_RADICAL_MEMBERSHIP: retained 7-row / 21-equality core forcing pair (7,8), retained core Rabinowitsch UNIT x3, 5 deletion TIMEOUTs fail-closed — no apex row; shares three rows with EACH of 654-15/-16/-17 and swaps points 8↔9 in rows 0/5 relative to 654-17: the NONUNIT family presents as one connected orbit | `forced-pair-core-654-18` |
| 36 | 654 | `61222481…` | SAT witness, sources (7,8), 8.264 M nodes — depth advancing steadily; inline metric audit CROSSCHECKED_NONUNIT directly; NINTH consecutive 654 NONUNIT-track witness; forced-pair certification (`--pair 7 8 --radical-only --core`) passed CROSSCHECKED_REAL_INFEASIBLE_RADICAL_MEMBERSHIP: retained 7-row / 21-equality core forcing pair (7,8), retained core Rabinowitsch UNIT x3, 7 deletion TIMEOUTs fail-closed — no apex row; bridges both NONUNIT clusters, sharing 10:{0,1,4,6} with 654-13/-14 and 11:{1,5,7,10} with 654-15/-16/-18, and carries the {1,5,9,11} support (at center 4) that 654-11..14 held at center 6 | `forced-pair-core-654-19` |
| 39 | 555 | `4459e702…` | SAT witness, sources (6,7), inline audit CROSSCHECKED_UNIT — twentieth consecutive unit-grade 555 witness (57,003 nodes, same shallow pocket); `system_unit_recheck.py` 900 s pass retained 7 rows / 21 equalities incl. Moser row, retained core CROSSCHECKED_UNIT x3 (4 deletion TIMEOUTs fail-closed); a 7-row refinement of unit-core-555-26's shape — drops row 8:{2,6,10,11}, row 7 changes {0,4,5,8}→{0,4,8,11}, keeps the new support 10:{3,5,9,11} | `unit-core-555-27` |
| 40 | 555 | `7dc62b25…` | SAT witness, sources (6,7), inline audit CROSSCHECKED_UNIT — twenty-first consecutive unit-grade 555 witness (58,209 nodes, same shallow pocket); `system_unit_recheck.py` 900 s pass retained 7 rows / 21 equalities incl. Moser row, retained core CROSSCHECKED_UNIT x3 (3 deletion TIMEOUTs fail-closed); closest to unit-core-555-24 — support {0,4,8,11} moves center 10→7, row 9 swaps point 5→0, the same move-type as 555-20→555-25 | `unit-core-555-28` |
| 37 | 654 | `91c0316c…` | SAT witness, sources (7,8), 9.680 M nodes — deepest 654 witness yet, near the 10 M `--max-nodes` cap (iteration-38 relaunched at 20 M); inline metric audit CROSSCHECKED_NONUNIT directly; TENTH consecutive 654 NONUNIT-track witness; forced-pair certification (`--pair 7 8 --radical-only --core`) passed CROSSCHECKED_REAL_INFEASIBLE_RADICAL_MEMBERSHIP: retained 7-row / 22-equality core forcing pair (7,8), retained core Rabinowitsch UNIT x3, 6 deletion TIMEOUTs fail-closed; keeps the 5-support surplus row 1:{0,2,7,8,9} shared with 654-13/-14/-16, but supports 6:{1,3,4,7}, 8:{2,4,5,9}, 9:{0,3,6,8}, 11:{4,6,7,10} are new to the bank — a fresh orbit sector, not another -15..-19 neighbor | `forced-pair-core-654-20` |
| 41 | 555 | `2a4fdbbc…` | SAT witness, sources (6,7), inline audit CROSSCHECKED_UNIT — twenty-second consecutive unit-grade 555 witness (58,435 nodes, same shallow pocket; run reported `node_caps=8`, immaterial for a SAT harvest but disqualifying if a future UNSAT lands with caps>0); `system_unit_recheck.py` 900 s pass retained 7 rows / 21 equalities incl. Moser row, retained core CROSSCHECKED_UNIT x3 (4 deletion TIMEOUTs fail-closed); exactly the image of unit-core-555-27 under transposition 7↔8 (all seven rows map) — the FOURTH full-core (7 8) pair in the family: an exhaustive all-transpositions check over the 29 banked 555 unit cores also relates 555-20↔555-24, 555-21↔555-23, 555-25↔555-28; the search does not quotient by this symmetry, so the pocket enumerates both halves of each symmetric orbit | `unit-core-555-29` |
| 38 | 654 | `8bb1f421…` | SAT witness, sources (7,8), 10.155 M nodes — first witness past the old 10 M cap (run at raised `--max-nodes 20000000`, caps=0); inline metric audit UNDECIDED_ORACLE_DISAGREEMENT_OR_TIMEOUT — routed directly to the self-contained forced-pair cert per the double-UNDECIDED decision (second use of that route after iter-33); ELEVENTH consecutive 654 NONUNIT-track witness; cert passed CROSSCHECKED_REAL_INFEASIBLE_RADICAL_MEMBERSHIP: retained 8-row / 24-equality core forcing pair (7,8), retained core Rabinowitsch UNIT x3, 5 deletion TIMEOUTs fail-closed; NO 5-support surplus row (all eight rows 4-supports); shares 5:{1,4,6,8} with 654-12, 9:{0,3,6,7} with 654-13, 10:{0,1,5,6} with 654-20 — again one connected orbit; supports 2:{0,5,10,11}, 4:{2,3,6,11}, 6:{1,3,7,10} new to the bank | `forced-pair-core-654-21` |
| 42 | 555 | `9f4776ab…` | SAT witness, sources (6,7), inline audit CROSSCHECKED_UNIT — twenty-third consecutive unit-grade 555 witness (59,426 nodes, same shallow pocket, caps=8 again); `system_unit_recheck.py` 900 s pass retained 8 rows / 24 equalities incl. Moser row, retained core CROSSCHECKED_UNIT x3 (6 deletion TIMEOUTs fail-closed); NOT a transposition image of any banked 555 unit core (exhaustive check); shares six rows with unit-core-555-29 — row 6 changes {2,5,8,9}→{4,5,7,9} (support last seen in 555-06), row 7:{2,6,10,11} re-enters (as in 555-20/-21/-25) | `unit-core-555-30` |
| 39 | 654 | `8b8d49f1…` | SAT witness, sources (7,8), 10.775 M nodes (caps=0, 20 M run) — FIRST unit-grade 654 witness after the eleven-witness NONUNIT run (iters 28–38); inline audit CROSSCHECKED_UNIT; `system_unit_recheck.py` 900 s pass retained a compact 6-row / 19-equality core, CROSSCHECKED_UNIT x3 (5 deletion TIMEOUTs fail-closed); not a transposition image of any banked 654 unit core; keeps the recurring surplus row 1:{0,2,7,8,9}, shares 2:{0,5,10,11} with forced-pair-core-654-21 (the immediately preceding admission) and carries its {1,3,7,10} support at center 11 (exact row of unit-core-654-22); supports 6:{1,4,5,7}, 9:{1,2,6,10} new to the bank | `unit-core-654-31` |
| 43 | 555 | `6460bfa8…` | SAT witness, sources (6,7), inline audit CROSSCHECKED_UNIT — twenty-fourth consecutive unit-grade 555 witness (60,215 nodes, pocket depth creeping up ~1k/iteration, caps=8); `system_unit_recheck.py` 900 s pass retained 7 rows / 21 equalities incl. Moser row, retained core CROSSCHECKED_UNIT x3 (5 deletion TIMEOUTs fail-closed); not a transposition image of any banked 555 unit core; shares five rows with unit-core-555-29 — row 6 {2,5,8,9}→{4,5,8,9} and row 9 {0,4,8,10}→{0,8,10,11}, BOTH supports new to the bank | `unit-core-555-31` |
| 44 | 555 | `c586bc22…` | SAT witness, sources (6,7), inline audit CROSSCHECKED_UNIT — twenty-fifth consecutive unit-grade 555 witness, but pocket depth JUMPED 60,215→85,509 nodes and the core shape shifted: both anchor rows 2:{0,1,9,10} and 11:{0,1,5,6} of the 555-24..31 family are GONE; `system_unit_recheck.py` 900 s pass retained 6 rows / 18 equalities incl. Moser row (smallest recent 555 core, only 2 deletion TIMEOUTs), retained core CROSSCHECKED_UNIT x3; not a transposition image of any banked 555 unit core; rows reach back to the OLDER family — 7:{0,4,5,8} (555-26), 8:{2,7,9,11} (555-11, forced-pair-654-01/-08), 9:{0,3,10,11} (555-13), 10:{4,8,9,11} (555-03, forced-pair-555-10..13); row 3:{0,4,7,11} new at that center | `unit-core-555-32` |
| 45 | 555 | `c0b4b809…` | SAT witness, sources (6,7), inline audit CROSSCHECKED_UNIT — twenty-sixth consecutive unit-grade 555 witness (93,292 nodes, caps=8): one iteration after the iter-44 pocket shift the search RETURNED to the anchored family — anchor rows 2:{0,1,9,10} and 11:{0,1,5,6} are back; `system_unit_recheck.py` 900 s pass retained 7 rows / 21 equalities incl. Moser row, retained core CROSSCHECKED_UNIT x3 (4 deletion TIMEOUTs fail-closed); not a transposition image of any banked 555 unit core; closest kin unit-core-555-26/-28 (5 shared rows: 0, 2, 8, 9, 11); supports 7:{0,3,8,11} and 10:{5,7,9,11} new to the bank | `unit-core-555-33` |
| 46 | 555 | `612548dc…` | SAT witness, sources (6,7), inline audit CROSSCHECKED_UNIT — twenty-seventh consecutive unit-grade 555 witness (95,975 nodes, caps=8, anchored-family depth still creeping); `system_unit_recheck.py` 900 s pass retained 7 rows / 21 equalities incl. Moser row, retained core CROSSCHECKED_UNIT x3 (4 deletion TIMEOUTs fail-closed); not a transposition image of any banked core; closest kin unit-core-555-26/-27/-28/-33 (4 shared rows: 0, 2, 9, 11); support 5:{2,4,6,9} new to the bank (center 5 last seen in the older 555-03/-12/-15/-18 family); 8:{0,4,6,11} previously only in forced-pair-core-555-07, 10:{5,8,9,11} previously only in forced-pair-core-555-08/-09 | `unit-core-555-34` |
| 47 | 555 | `9896f0cd…` | SAT witness, sources (6,7), inline audit CROSSCHECKED_UNIT — twenty-eighth consecutive unit-grade 555 witness (105,177 nodes, caps=8, depth still creeping); `system_unit_recheck.py` 900 s pass retained 7 rows / 21 equalities incl. Moser row, retained core CROSSCHECKED_UNIT x3 (4 deletion TIMEOUTs fail-closed); exactly the image of unit-core-555-22 under transposition 6↔7 (all seven rows map) — the FIFTH full-core transposition pair in the 555 unit family and the FIRST under (6 7) (the earlier four, 555-20↔24/21↔23/25↔28/27↔29, are all (7 8) pairs); row 11 deviates from the {0,1,5,6} anchor to {0,1,5,7} (seen in 555-06/-14); supports 7:{2,5,8,9}, 8:{2,7,10,11} new to the bank | `unit-core-555-35` |
| 48 | 555 | `e2d7b37f…` | SAT witness, sources (6,7), inline audit CROSSCHECKED_UNIT — twenty-ninth consecutive unit-grade 555 witness (107,074 nodes, caps=8); `system_unit_recheck.py` 900 s pass retained 7 rows / 21 equalities incl. Moser row, retained core CROSSCHECKED_UNIT x3 (4 deletion TIMEOUTs fail-closed); exactly the image of unit-core-555-24 under transposition 6↔7 — the SIXTH full-core transposition pair, second under (6 7), one iteration after the first: the pocket is now enumerating (6,7)-images of the earlier 555-20..28 family; shares 5 rows with 555-35; support 9:{4,5,6,10} new to the bank | `unit-core-555-36` |
| 49 | 555 | `e6eae86f…` | SAT witness, sources (6,7), inline audit CROSSCHECKED_UNIT — thirtieth consecutive unit-grade 555 witness (136,868 nodes, caps=8 — a depth jump from iter-48's 107,074); `system_unit_recheck.py` 900 s pass retained 6 rows / 18 equalities incl. Moser row (deletion verdicts 6 UNIT / 4 NONUNIT / 2 TIMEOUT fail-closed), retained core CROSSCHECKED_UNIT x3; first 6-row 555 core since unit-core-555-32, matching the smallest banked 555-unit grade (555-12/-16/-17/-32); not a transposition image of any banked core; keeps anchors 0:{1,2,3,4}, 2:{0,1,9,10} and the iters-47/48 deviated row 11:{0,1,5,7} (closest kin 555-35/-36, 3 shared rows); supports 5:{2,4,7,9}, 9:{0,4,6,10}, 10:{2,5,8,11} all new to the bank | `unit-core-555-37` |
| 50 | 555 | `6035ec53…` | SAT witness, sources (6,7), inline audit CROSSCHECKED_UNIT — thirty-first consecutive unit-grade 555 witness (150,291 nodes, caps=8, depth still creeping); `system_unit_recheck.py` 900 s pass retained 8 rows / 24 equalities incl. Moser row (deletion verdicts 4 UNIT / 7 TIMEOUT fail-closed / 1 NONUNIT), retained core CROSSCHECKED_UNIT x3; exactly the image of unit-core-555-26 under transposition 6↔7 — the SEVENTH full-core transposition pair, third under (6 7), extending the (6,7)-image enumeration of the 555-20..28 family (555-22→35, 555-24→36, 555-26→38); support 6:{0,4,5,8} new to the bank; closest kin 555-35/-36/-37 (4 shared rows each) | `unit-core-555-38` |
| 51 | 555 | `b984833b…` | SAT witness, sources (6,7), inline audit CROSSCHECKED_UNIT — thirty-second consecutive unit-grade 555 witness (150,618 nodes, caps=8 — just 327 past iter-50's witness, the pocket tightening); `system_unit_recheck.py` 900 s pass retained 7 rows / 21 equalities incl. Moser row (deletion verdicts 5 UNIT / 5 TIMEOUT fail-closed / 2 NONUNIT), retained core CROSSCHECKED_UNIT x3; not a transposition image of any banked core; closest kin 555-37/-38 (4 shared rows: 0, 2, 9, 11) — the iter-49 new row 9:{0,4,6,10} reused immediately, row 8:{2,7,9,11} last seen in 555-11/-32 and fp-654-01/-08; supports 6:{0,4,8,11}, 7:{5,6,8,9} new to the bank | `unit-core-555-39` |
| 52 | 555 | `f4f99970…` | SAT witness, sources (6,7), inline audit CROSSCHECKED_UNIT — thirty-third consecutive unit-grade 555 witness (150,678 nodes, caps=8 — just 60 past iter-51's witness, the pocket still tightening); `system_unit_recheck.py` 900 s pass retained 7 rows / 21 equalities incl. Moser row (deletion verdicts 5 UNIT / 3 TIMEOUT fail-closed / 4 NONUNIT), retained core CROSSCHECKED_UNIT x3; exact image of unit-core-555-28 under transposition 6↔7 — EIGHTH full-core transposition pair in the 555 unit family, fourth under (6 7): every even member 22/24/26/28 of the 555-20..28 family now has its (6,7)-image banked (22→35, 24→36, 26→38, 28→40), and 555-28 joins 555-24 as the only cores in two image pairs; no new supports — all seven rows already banked; closest kin 555-35/-36/-38/-39 (5 shared rows each) | `unit-core-555-40` |
| 53 | 555 | `42b8c21f…` | SAT witness, sources (6,7), inline audit CROSSCHECKED_UNIT — thirty-fourth consecutive unit-grade 555 witness (154,383 nodes, caps=8 — a wider +3,705 step past iter-52 after the +327 and +60 steps); `system_unit_recheck.py` 900 s pass retained 7 rows / 21 equalities incl. Moser row (deletion verdicts 5 UNIT / 5 TIMEOUT fail-closed / 2 NONUNIT), retained core CROSSCHECKED_UNIT x3; not a transposition image of any banked core; reaches back to the 555-25..31 sector — closest kin 555-29/-30 (5 shared rows: 0, 2, 8, 9, 10), row 8:{0,4,7,11} last in 555-25/-29/-30/-31 and fp-555-09, row 9:{0,4,8,10} in 555-19/-25/-29/-30 — while keeping the 11:{0,1,5,7} anchor deviation; support 7:{2,5,6,10} new to the bank | `unit-core-555-41` |
| 54 | 555 | `adc950eb…` | SAT witness, sources (6,7), inline audit CROSSCHECKED_UNIT — thirty-fifth consecutive unit-grade 555 witness (167,139 nodes, caps=8 — a +12,756 step past iter-53, the pocket's largest jump yet); `system_unit_recheck.py` 900 s pass retained 8 rows / 24 equalities incl. Moser row (deletion verdicts 4 UNIT / 4 TIMEOUT fail-closed / 4 NONUNIT), retained core CROSSCHECKED_UNIT x3; not a transposition image of any banked core; back in the current pocket family after iter-53's reach-back — closest kin 555-38/-40 (5 shared rows: 0, 2, 8, 9, 11); THREE new supports 5:{3,6,9,11}, 7:{2,6,8,9}, 10:{4,5,9,11} | `unit-core-555-42` |
| 55 | 555 | `65d4cb45…` | SAT witness, sources (6,7), inline audit CROSSCHECKED_UNIT — thirty-sixth consecutive unit-grade 555 witness (182,797 nodes, caps=8 — a +15,658 step past iter-54, extending the widening trend); `system_unit_recheck.py` 900 s pass retained 7 rows / 21 equalities incl. Moser row (deletion verdicts 5 UNIT / 4 TIMEOUT fail-closed / 3 NONUNIT), retained core CROSSCHECKED_UNIT x3; exact (6,7)-transposition image of unit-core-555-33 — NINTH full-core transposition pair in the 555 unit family, fifth under (6 7), and the first whose preimage lies outside the even 555-20..28 members; closest same-family kin 555-38/-40/-42 (5 shared rows: 0, 2, 8, 9, 11); one new support 6:{0,3,8,11}; row 10:{5,6,9,11} previously only in 555-06 and 654-11 | `unit-core-555-43` |
| 56 | 555 | `70836825…` | SAT witness, sources (6,7), inline audit CROSSCHECKED_UNIT — thirty-seventh consecutive unit-grade 555 witness (399,458 nodes, caps=8 — a +216,661 step past iter-55, more than doubling the pocket node count, the largest jump yet); `system_unit_recheck.py` 900 s pass retained 7 rows / 21 equalities incl. Moser row (deletion verdicts 5 UNIT / 5 TIMEOUT fail-closed / 2 NONUNIT), retained core CROSSCHECKED_UNIT x3; not a transposition image of any banked core; the 11:{0,1,5,7} anchor deviation persistent through 555-35..43 is replaced by NEW support 11:{1,5,6,9}; closest kin 555-37 (5 shared rows: 0, 2, 5, 9, 10) — rows 5:{2,4,7,9} and 10:{2,5,8,11} previously only in 555-37; row 8:{0,4,7,11} from the 555-25..31 sector (also 555-41, fp-555-09) | `unit-core-555-44` |
| 57 | 555 | `55885365…` | SAT witness, sources (6,7), inline audit CROSSCHECKED_UNIT — thirty-eighth consecutive unit-grade 555 witness (465,871 nodes, caps=8 — a +66,413 step past iter-56); `system_unit_recheck.py` 900 s pass retained 7 rows / 21 equalities incl. Moser row (deletion verdicts 5 UNIT / 7 TIMEOUT fail-closed), retained core CROSSCHECKED_UNIT x3; not a transposition image of any banked core; second consecutive core with row 11 off the old {0,1,5,7} anchor; no kin above 3 shared rows — THREE new supports 7:{4,5,8,9}, 10:{0,5,6,11}, 11:{1,5,7,9}; row 8:{2,7,10,11} from the 555-35..43 pocket, row 9:{0,4,8,10} from the 555-19/-25..30/-41 sector | `unit-core-555-45` |
| 58 | 555 | `2c6db120…` | SAT witness, sources (6,7), inline audit CROSSCHECKED_UNIT — thirty-ninth consecutive unit-grade 555 witness (497,475 nodes, caps=9 — a +31,604 step past iter-57); `system_unit_recheck.py` 900 s pass retained 7 rows / 21 equalities incl. Moser row (deletion verdicts 5 UNIT / 4 TIMEOUT fail-closed / 3 NONUNIT), retained core CROSSCHECKED_UNIT x3; not a transposition image of any banked core; nearest kin unit-core-555-19 (3 shared rows 0,2,11) — a throwback core: row 2:{0,1,9,11} returns from the 555-14..19 sector (displacing the recent {0,1,9,10}), row 11:{0,1,5,6} from the 555-19..34 anchor sector; ONE new support 8:{4,5,9,10}; row 7:{2,6,8,9} previously only 555-42, row 10:{4,6,9,11} previously only 555-02, row 9:{0,3,10,11} from 555-13/-32 | `unit-core-555-46` |
| 59 | 555 | `473fb7e4…` | SAT witness, sources (6,7), inline audit CROSSCHECKED_UNIT — fortieth consecutive unit-grade 555 witness (18,799 nodes, caps=11 — a sharp collapse from the ~500k pocket after the 555-46 admission); `system_unit_recheck.py` 900 s pass retained 8 rows / 24 equalities incl. Moser row (deletion verdicts 4 UNIT / 6 TIMEOUT fail-closed / 2 NONUNIT), retained core CROSSCHECKED_UNIT x3; not a transposition image of any banked core; kin capped at 3 shared rows (555-20..34 sector via anchors 0, 2, 11; 555-38 via 0, 2, 6); 8-row grade matches 555-09/-18/-26/-30/-38/-42; row 2:{0,1,9,10} returns after 555-46 displaced it; TWO new supports 9:{0,3,7,10}, 10:{3,5,8,9}; row 6:{0,4,5,8} previously only 555-38; rows 7:{3,6,8,11} (654-10) and 8:{2,5,9,11} (654-15/-20) are cross-profile imports | `unit-core-555-47` |
| 60 | 555 | `c6f569b6…` | SAT witness, sources (6,7), inline audit CROSSCHECKED_UNIT — forty-first consecutive unit-grade 555 witness (20,348 nodes, caps=11 — +1,549 past iter-59, second witness in the shallow post-555-46 pocket); `system_unit_recheck.py` 900 s pass retained 6 rows / 18 equalities incl. Moser row (deletion verdicts 6 UNIT / 3 TIMEOUT fail-closed / 3 NONUNIT), retained core CROSSCHECKED_UNIT x3; not a transposition image of any banked core; kin capped at 3 shared rows (555-22/-23/-24/-26/-28/-33 via 0, 2, 8; 555-47 via 0, 2, 9); 6-row grade matches 555-04/-05/-12/-16/-17/-32/-37; ZERO new supports — row 9:{0,3,7,10} (new in 555-47) immediately re-used, rows 7:{0,3,6,8} (555-06, fp-555-01..04/-11/-12) and 10:{3,8,9,11} (555-05, fp-555-01/-04) return from the early forced-pair sector | `unit-core-555-48` |
| 61 | 555 | `5697fca7…` | SAT witness, sources (6,7), inline audit CROSSCHECKED_UNIT — forty-second consecutive unit-grade 555 witness (20,362 nodes, caps=11 — +14 past iter-60, third witness in the shallow post-555-46 pocket); `system_unit_recheck.py` 900 s pass retained 7 rows / 21 equalities incl. Moser row (deletion verdicts 5 UNIT / 3 TIMEOUT fail-closed / 4 NONUNIT), retained core CROSSCHECKED_UNIT x3; not a transposition image of any banked core; structurally 555-48 with row 8's support swapped ({2,6,10,11} → {2,6,9,11}) plus row 11:{0,1,5,6} appended — kin 555-48 via 5 shared rows, 555-47 via 4; 7-row/21-eq is the modal 555 grade; ZERO new supports — row 9:{0,3,7,10} (new in 555-47) used a third consecutive time, row 8:{2,6,9,11} returns from 555-10/-13 and recurs in 654 (654-13/-17/-23/-29/-30, fp-654-28/-29), row 11:{0,1,5,6} from the 555-19..34 sector and 555-46/-47 | `unit-core-555-49` |
| 62 | 555 | `ca905218…` | SAT witness, sources (6,7), inline audit CROSSCHECKED_UNIT — forty-third consecutive unit-grade 555 witness (25,330 nodes, caps=11 — +4,968 past iter-61, fourth witness in the post-555-46 pocket); `system_unit_recheck.py` 900 s pass retained 6 rows / 18 equalities incl. Moser row (deletion verdicts 6 UNIT / 4 TIMEOUT fail-closed / 2 NONUNIT), retained core CROSSCHECKED_UNIT x3; not a transposition image of any banked core; kin capped at 2 shared rows — breaks the 555-47/-48/-49 chain despite staying in the pocket; 6-row grade matches 555-04/-05/-12/-16/-17/-32/-37/-48; TWO new supports 8:{2,5,7,10}, 9:{0,3,8,10}; row 7:{2,6,9,11} is a cross-profile import previously only in 654-02/-03/-04, row 10:{3,7,9,11} returns from unit-core-555-01 | `unit-core-555-50` |
| 63 | 555 | `62c5cf71…` | SAT witness, sources (6,7), inline audit CROSSCHECKED_UNIT — forty-fourth consecutive unit-grade 555 witness (26,469 nodes, caps=11 — +1,139 past iter-62, fifth witness in the post-555-46 pocket); `system_unit_recheck.py` 900 s pass retained 8 rows / 24 equalities incl. Moser row (deletion verdicts 4 UNIT / 7 TIMEOUT fail-closed / 1 NONUNIT), retained core CROSSCHECKED_UNIT x3 on this literal row set; IS the (3,4)-transposition image of unit-core-555-26 — banked in its own right since `--bank-negative` blocks literal row sets only, and the bank already held eleven single-transposition-image pairs (e.g. 555-26/555-38, 654-29/654-30); kin 5 shared rows with 555-26 and 555-23; 8-row grade matches 555-09/-18/-26/-30/-38/-42/-47; ZERO new supports — row 7:{0,3,5,8} previously only in 555-07, row 10:{4,5,9,11} previously only in 555-42, row 9:{0,3,7,10} in four of the five admissions since 555-47 | `unit-core-555-51` |
| 64 | 555 | `b5a642f8…` | SAT witness, sources (6,7), inline audit CROSSCHECKED_UNIT — forty-fifth consecutive unit-grade 555 witness (26,491 nodes, caps=11 — +22 past iter-63, sixth witness in the post-555-46 pocket); `system_unit_recheck.py` 900 s pass retained 7 rows / 21 equalities incl. Moser row (deletion verdicts 5 UNIT / 5 TIMEOUT fail-closed / 2 NONUNIT), retained core CROSSCHECKED_UNIT x3 on this literal row set; not a transposition image of any banked core; kin unit-core-555-51 at 6 shared rows, 555-49 at 5; 7-row/21-eq grade is the modal bank shape (34 of the 51 prior 555 unit cores at 7 rows, 31 at 21 eq); ZERO new supports — row 9:{0,3,7,10} in five of the six admissions since 555-47, row 10:{4,5,9,11} previously only in 555-42/-51 | `unit-core-555-52` |
| 65 | 555 | `7234a008…` | SAT witness, sources (6,7), inline audit CROSSCHECKED_UNIT — forty-sixth consecutive unit-grade 555 witness (59,780 nodes, caps=11 — +33,289 past iter-64, breaking the ~26.5k post-555-46 pocket); `system_unit_recheck.py` 900 s pass retained 8 rows / 24 equalities incl. Moser row (deletion verdicts 4 UNIT / 7 TIMEOUT fail-closed / 1 NONUNIT), retained core CROSSCHECKED_UNIT x3 on this literal row set; DOUBLE image hit — IS both the (3,4)-transposition image of unit-core-555-38 and the (6,7)-transposition image of unit-core-555-51 (so 555-38/555-51 are related by the double transposition (3,4)(6,7), outside the single-transposition census scope) — banked in its own right since `--bank-negative` blocks literal row sets only; third admission-time image hit, first double; kin 555-38 and 555-42 at 5 shared rows; TWO new supports 6:{0,3,5,8}, 9:{0,3,6,10} | `unit-core-555-53` |
| 66 | 555 | `1bc4db7e…` | SAT witness, sources (6,7), inline audit CROSSCHECKED_UNIT — forty-seventh consecutive unit-grade 555 witness (59,875 nodes, caps=11 — +95 past iter-65, new pocket forming at ~59.8k); `system_unit_recheck.py` 900 s pass retained 7 rows / 21 equalities incl. Moser row (deletion verdicts 5 UNIT / 5 TIMEOUT fail-closed / 2 NONUNIT), retained core CROSSCHECKED_UNIT x3 on this literal row set; not a transposition image of any banked core; kin capped at 3 shared rows (555-42/-51/-53) — off the recent cluster: first 555 unit core without a center-2 row since 555-32 (8 of 53 prior lack one), center-4 rows previously only in 555-07/-16; TWO new supports 3:{1,5,8,11}, 4:{0,3,6,11}; row 9:{0,3,8,10} previously only in 555-50 | `unit-core-555-54` |
| 67 | 555 | `4caae8ca…` | SAT witness, sources (6,7), inline audit CROSSCHECKED_UNIT — forty-eighth consecutive unit-grade 555 witness (59,939 nodes, caps=11 — +64 past iter-66, third witness in the ~59.9k pocket); `system_unit_recheck.py` 900 s pass retained 8 rows / 24 equalities incl. Moser row (deletion verdicts 4 UNIT / 7 TIMEOUT fail-closed / 1 NONUNIT), retained core CROSSCHECKED_UNIT x3 on this literal row set; not a transposition image of any banked core; kin 555-51 and 555-54 each at 5 shared rows — bridges the 51/52/53 cluster and the off-cluster 555-54; ONE new support 7:{0,3,5,6} | `unit-core-555-55` |
| 68 | 555 | `cac11455…` | SAT witness, sources (6,7), inline audit CROSSCHECKED_UNIT — forty-ninth consecutive unit-grade 555 witness (59,940 nodes, caps=11 — +1 past iter-67, fourth witness in the ~59.9k pocket); `system_unit_recheck.py` 900 s pass retained 8 rows / 24 equalities incl. Moser row (deletion verdicts 4 UNIT / 7 TIMEOUT fail-closed / 1 NONUNIT), retained core CROSSCHECKED_UNIT x3 on this literal row set; not a transposition image of any banked core; kin 555-55 at 7 shared rows — tightest kin pair in the 555 bank (no prior pair shares more than 6), differing from 555-55 only in row 7's support; ONE new support 7:{3,5,6,8} | `unit-core-555-56` |
| 69 | 555 | `dec50b4a…` | SAT witness, sources (6,7), inline audit CROSSCHECKED_UNIT — fiftieth consecutive unit-grade 555 witness (59,946 nodes, caps=11 — +6 past iter-68, fifth witness in the ~59.9k pocket); `system_unit_recheck.py` 900 s pass retained 7 rows / 21 equalities incl. Moser row (deletion verdicts 5 UNIT / 7 TIMEOUT fail-closed), retained core CROSSCHECKED_UNIT x3 on this literal row set; not a transposition image of any banked core; kin 555-55 at 6 shared rows; ZERO new supports — row 7:{0,3,5,6} previously only in 555-55; modal bank shape (7 rows: 36 of 56 prior, 21 eq: 33 of 56 prior) | `unit-core-555-57` |
| 70 | 555 | `61193d31…` | SAT witness, sources (6,7), inline audit CROSSCHECKED_UNIT — fifty-first consecutive unit-grade 555 witness (93,704 nodes, caps=11 — +33,758 jump past iter-69, breaking the ~59.9k pocket after five witnesses); `system_unit_recheck.py` 900 s pass retained 6 rows / 18 equalities incl. Moser row (deletion verdicts 6 UNIT / 5 TIMEOUT fail-closed / 1 NONUNIT), retained core CROSSCHECKED_UNIT x3 on this literal row set; not a transposition image of any banked core; kin capped at 3 shared rows (off-cluster); ZERO new supports — row 10:{3,6,9,11} in a 555 core for the first time (previously only unit-cores 654-12/-15) | `unit-core-555-58` |
| 71 | 555 | `4253de5d…` | SAT witness, sources (6,7), inline audit CROSSCHECKED_UNIT — fifty-second consecutive unit-grade 555 witness (95,510 nodes, caps=11 — +1,806 past iter-70, post-pocket regime); `system_unit_recheck.py` 900 s pass retained 8 rows / 24 equalities incl. Moser row (deletion verdicts 4 UNIT / 7 TIMEOUT fail-closed / 1 NONUNIT), retained core CROSSCHECKED_UNIT x3 on this literal row set; the core IS the transposition (7,8) image of unit-core-555-55, banked anyway per policy on its literal row set; kin capped at 4 shared rows (555-21/-51/-52); ONE new support 8:{0,3,5,6}; row 11:{0,1,5,8} previously only in unit-cores 555-08/-09 | `unit-core-555-59` |
| 72 | 555 | `1886dbe2…` | SAT witness, sources (6,7), inline audit CROSSCHECKED_UNIT — fifty-third consecutive unit-grade 555 witness (133,712 nodes, caps=11 — +38,202 past iter-71, post-pocket climb); `system_unit_recheck.py` 900 s pass retained 8 rows / 24 equalities incl. Moser row (deletion verdicts 4 UNIT / 4 TIMEOUT fail-closed / 4 NONUNIT), retained core CROSSCHECKED_UNIT x3 on this literal row set; not a transposition image of any banked core; single kin at 4 shared rows (555-50); THREE new supports 6:{0,4,7,11}, 7:{3,6,8,9}, 11:{0,3,5,8}; row 9:{0,6,10,11} previously only in forced-pair-core-555-05 | `unit-core-555-60` |
| 73 | 555 | `669c15f9…` | SAT witness, sources (6,7), inline audit CROSSCHECKED_UNIT — fifty-fourth consecutive unit-grade 555 witness (159,229 nodes, caps=11 — +25,517 past iter-72, post-pocket climb); `system_unit_recheck.py` 900 s pass retained 6 rows / 18 equalities incl. Moser row (deletion verdicts 6 UNIT / 5 TIMEOUT fail-closed / 1 NONUNIT), retained core CROSSCHECKED_UNIT x3 on this literal row set; not a transposition image of any banked core; kin capped at 3 shared rows (555-10/-11, off-cluster); TWO new supports 5:{2,4,8,9}, 10:{0,3,5,8} (the latter's support set recurs from 555-60's row 11); row 8:{3,7,9,11} previously only in 654-bank cores (unit-core-654-32, fp-654-02) | `unit-core-555-61` |
| 74 | 555 | `bf3fa535…` | SAT witness, sources (6,7), inline audit CROSSCHECKED_UNIT — fifty-fifth consecutive unit-grade 555 witness (239,909 nodes, caps=11 — +80,680 past iter-73, largest post-pocket step to date); `system_unit_recheck.py` 900 s pass retained 7 rows / 21 equalities incl. Moser row (deletion verdicts 5 UNIT / 5 TIMEOUT fail-closed / 2 NONUNIT), retained core CROSSCHECKED_UNIT x3 on this literal row set; not a transposition image of any banked core; kin at 5 shared rows (555-10); ONE new support 11:{3,5,7,9}; row 7:{0,3,8,11} previously only in 555-33; row 8:{2,6,9,11} mostly 654-bank (8 of 11 prior appearances) | `unit-core-555-62` |
| 75 | 555 | `d5220e3a…` | SAT witness, sources (6,7), inline audit CROSSCHECKED_UNIT — fifty-sixth consecutive unit-grade 555 witness (140,769 nodes, caps=12 — down 99,140 from iter-74, climb reversed); `system_unit_recheck.py` 900 s pass retained 6 rows / 18 equalities incl. Moser row (deletion verdicts 6 UNIT / 4 TIMEOUT fail-closed / 2 NONUNIT), retained core CROSSCHECKED_UNIT x3 on this literal row set; not a transposition image of any banked core; kin capped at 2 shared rows — off-cluster; TWO new supports 9:{0,1,5,6} (support set recurs from the recurrent center-10 row, here at center 9), 11:{3,8,9,10}; row 2:{0,1,9,11} last seen in 555-46; row 5:{2,4,7,9} previously only in 555-37/-44 | `unit-core-555-63` |
| 76 | 555 | `502349e4…` | SAT witness, sources (6,7), inline audit CROSSCHECKED_UNIT — fifty-seventh consecutive unit-grade 555 witness (144,707 nodes, caps=12 — +3,938 past iter-75); `system_unit_recheck.py` 900 s pass retained 7 rows / 21 equalities incl. Moser row (deletion verdicts 5 UNIT / 5 TIMEOUT fail-closed / 2 NONUNIT), retained core CROSSCHECKED_UNIT x3 on this literal row set; not a transposition image of any banked core; kin capped at 3 shared rows (555-19/-46/-51/-52/-63); ONE new support 8:{0,3,5,7}; row 7:{3,6,8,9} previously only in 555-60; row 9:{0,7,10,11} previously only in forced-pair-core-555-07; row 2:{0,1,9,11} in consecutive cores (555-63 and here) | `unit-core-555-64` |
| 77 | 555 | `ac23742c…` | SAT witness, sources (6,7), inline audit CROSSCHECKED_UNIT — fifty-eighth consecutive unit-grade 555 witness (149,747 nodes, caps=12 — +5,040 past iter-76); `system_unit_recheck.py` 900 s pass retained 7 rows / 21 equalities incl. Moser row (deletion verdicts 5 UNIT / 3 TIMEOUT fail-closed / 4 NONUNIT), retained core CROSSCHECKED_UNIT x3 on this literal row set; not a transposition image of any banked core; kin 5 shared rows with the immediately preceding core 555-64 (rows 0,2,8,9,11); ONE new support 7:{0,4,8,10}; row 2:{0,1,9,11} in three consecutive cores (555-63/-64/here); rows 8:{0,3,5,7} and 9:{0,7,10,11} repeat from 555-64 | `unit-core-555-65` |
| 78 | 555 | `9e494850…` | SAT witness, sources (6,7), inline audit CROSSCHECKED_UNIT — fifty-ninth consecutive unit-grade 555 witness (164,561 nodes, caps=12 — +14,814 past iter-77, third consecutive climb since the reversal); `system_unit_recheck.py` 900 s pass retained 7 rows / 21 equalities incl. Moser row (deletion verdicts 5 UNIT / 6 TIMEOUT fail-closed / 1 NONUNIT), retained core CROSSCHECKED_UNIT x3 on this literal row set; not a transposition image of any banked core; kin capped at 3 shared rows (555-63); NO new supports — rows 8:{3,7,9,10} and 11:{3,5,8,10} previously attested only in forced-pair-core-654-22/-23 (cross-profile); row 5:{2,4,8,9} previously only 555-61; row 10:{5,7,9,11} previously only 555-33 | `unit-core-555-66` |
| 79 | 555 | `6ecb3dd9…` | SAT witness, sources (6,7), inline audit CROSSCHECKED_UNIT — sixtieth consecutive unit-grade 555 witness (224,467 nodes, caps=12 — +59,906 past iter-78, fourth consecutive climb); `system_unit_recheck.py` 900 s pass retained 7 rows / 21 equalities incl. Moser row (deletion verdicts 5 UNIT / 5 TIMEOUT fail-closed / 2 NONUNIT), retained core CROSSCHECKED_UNIT x3 on this literal row set; not a transposition image of any banked core; kin capped at 4 shared rows (555-55/-57); NO new supports — second consecutive 555 core with none; row 8:{3,7,9,10} cross-profile (555-66 + fp-654-22/-23) in consecutive 555 cores; row 2:{0,1,9,11} in its fifth consecutive core (63–67); row 7:{0,3,5,6} previously only 555-55/-57 | `unit-core-555-67` |
| 80 | 555 | `cd3e8c16…` | SAT witness, sources (6,7), inline audit CROSSCHECKED_UNIT — sixty-first consecutive unit-grade 555 witness (246,442 nodes, caps=12 — +21,975 past iter-79, fifth consecutive climb); `system_unit_recheck.py` 900 s pass retained 7 rows / 21 equalities incl. Moser row (deletion verdicts 5 UNIT / 4 TIMEOUT fail-closed / 3 NONUNIT), retained core CROSSCHECKED_UNIT x3 on this literal row set; IS the (10,11) transposition image of unit-core-555-62 (banked per single-image precedent 555-59, double 555-53); kin capped at 3 literal shared rows (555-19/-46/-64/-65); three NEW supports 7:{0,3,8,10}, 8:{2,6,9,10}, 10:{3,5,7,9} after two consecutive no-new-support cores; row 2:{0,1,9,11} in its sixth consecutive core (63–68) — ties the record streak of 6 at 555-14..-19 | `unit-core-555-68` |
| 81 | 555 | `3ea3a372…` | SAT witness, sources (6,7), inline audit CROSSCHECKED_UNIT — sixty-second consecutive unit-grade 555 witness (253,987 nodes, caps=12 — +7,545 past iter-80, sixth consecutive climb); `system_unit_recheck.py` 900 s pass retained 7 rows / 21 equalities incl. Moser row (deletion verdicts 5 UNIT / 5 TIMEOUT fail-closed / 2 NONUNIT), retained core CROSSCHECKED_UNIT x3 on this literal row set; not a transposition image of any banked core; kin capped at 3 shared rows (ten cores); two NEW supports 9:{0,3,7,11}, 11:{0,5,8,10}; row 2:{0,1,9,11} in its SEVENTH consecutive core (63–69) — new record streak, past the six-consecutive run at 555-14..-19; row 6:{2,5,7,9} cross-track (ten unit-555 cores + fp-555-05) | `unit-core-555-69` |
| 82 | 555 | `a28441e5…` | SAT witness, sources (6,7), inline audit CROSSCHECKED_UNIT — sixty-third consecutive unit-grade 555 witness (254,316 nodes, caps=12 — +329 past iter-81, seventh consecutive climb); `system_unit_recheck.py` 900 s pass retained 7 rows / 21 equalities incl. Moser row (deletion verdicts 5 UNIT / 3 TIMEOUT fail-closed / 4 NONUNIT), retained core CROSSCHECKED_UNIT x3 on this literal row set; not a transposition image of any banked core; kin 5 with the immediately preceding 555-69 (rows 0,2,6,9,10 — kin-5 precedent 555-65/-64); one NEW support 8:{0,5,7,10}; row 2:{0,1,9,11} in its EIGHTH consecutive core (63–70), extending its own record; row 9:{0,3,7,11} (new in 555-69) repeats immediately | `unit-core-555-70` |
| 83 | 555 | `356aa276…` | SAT witness, sources (6,7), inline audit CROSSCHECKED_UNIT — sixty-fourth consecutive unit-grade 555 witness (328,652 nodes, caps=12 — +74,336 past iter-82, eighth consecutive climb); `system_unit_recheck.py` 900 s pass retained 7 rows / 21 equalities incl. Moser row (deletion verdicts 5 UNIT / 5 TIMEOUT fail-closed / 2 NONUNIT), retained core CROSSCHECKED_UNIT x3 on this literal row set; not a transposition image of any banked core; kin 6 with 555-67 (rows 0,2,7,8,9,10; bank max kin is 7 at 555-55/-56); NO new supports — all seven rows previously banked (11 prior zero-new-support 555 unit cores, most recently 555-67); row 2:{0,1,9,11} in its NINTH consecutive core (63–71), extending its own record | `unit-core-555-71` |
| 40 | 654 | `9c594158…` | SAT witness, sources (7,8), 11.485 M nodes (caps=0, 20 M run) — TWELFTH NONUNIT-track 654 witness, first after the unit-grade interruption at iter-39; inline metric audit CROSSCHECKED_NONUNIT directly; cert passed CROSSCHECKED_REAL_INFEASIBLE_RADICAL_MEMBERSHIP: retained 8-row / 25-equality core forcing pair (7,8), retained core Rabinowitsch UNIT x3, 7 deletion TIMEOUTs fail-closed; keeps surplus row 1:{0,2,7,8,9}, ties broadly into the orbit — 2:{0,5,10,11} (654-21), 4:{1,5,9,11} (654-19), 7:{2,4,5,8} (654-15/-16/-18), 9:{0,2,3,6} (654-16/-17/-18), 10:{0,1,5,6} (654-20/-21); supports 8:{3,7,9,10}, 11:{3,5,8,10} new to the bank | `forced-pair-core-654-22` |
| 41 | 654 | `b2a6ec69…` | SAT witness, sources (7,8), 11,485,034 nodes (caps=0, 20 M run) — THIRTEENTH NONUNIT-track 654 witness, surfacing just 3 nodes past iter-40's (11,485,031) after the banked 654-22 core killed the neighbouring branch; inline metric audit CROSSCHECKED_NONUNIT directly; cert passed CROSSCHECKED_REAL_INFEASIBLE_RADICAL_MEMBERSHIP: retained 7-row / 22-equality core forcing pair (7,8), retained core Rabinowitsch UNIT x3, 6 deletion TIMEOUTs fail-closed; not a transposition image of any banked core; shares 6 of 7 rows with 654-22 (1, 2, 8, 9, 10, 11), drops 654-22's row 4, row 7 shifts {2,4,5,8}→{2,4,5,9} — support new to the bank | `forced-pair-core-654-23` |
| 42 | 654 | `e50b99fc…` | SAT witness, sources (7,8), 11,499,531 nodes (caps=0, 20 M run; ~14.5 k past iter-41) — FOURTEENTH NONUNIT-track 654 witness; inline metric audit CROSSCHECKED_NONUNIT directly; cert passed CROSSCHECKED_REAL_INFEASIBLE_RADICAL_MEMBERSHIP: retained 6-row / 19-equality core forcing pair (7,8) — smallest recent 654 forced-pair core; retained core Rabinowitsch UNIT x3, 6 deletion TIMEOUTs fail-closed; not a transposition image of any banked core; FRESH orbit sector — keeps surplus row 1:{0,2,7,8,9}, supports 3:{1,4,8,11}, 4:{3,5,7,11}, 5:{1,3,6,9}, 9:{0,3,4,7} all new to the bank, 11:{1,5,9,10} previously only in unit-core-654-18 | `forced-pair-core-654-24` |
| 43 | 654 | `0ddb2d5f…` | SAT witness, sources (7,8), 11,540,705 nodes (caps=0, 20 M run; ~41 k past iter-42) — FIFTEENTH NONUNIT-track 654 witness; inline metric audit UNDECIDED_ORACLE_DISAGREEMENT_OR_TIMEOUT — routed to direct `membership_crosscheck.py --pair 7 8 --radical-only --core` (third direct-cert use, decision 01KXMXK5NR11WYEYYZAS0X7RGY); cert passed CROSSCHECKED_REAL_INFEASIBLE_RADICAL_MEMBERSHIP: retained 8-row / 24-equality core forcing pair (7,8), retained core Rabinowitsch UNIT x3, deletion verdicts 4 UNIT / 4 TIMEOUT fail-closed / 4 NONUNIT — witness rows 0, 1, 2, 3 dropped, INCLUDING the surplus row 1:{0,2,7,8,9} (breaks the 654-22/-23/-24 run which all kept it; all core supports cardinality 4); not a transposition image of any banked core; continues the iter-42 fresh orbit sector — supports 4:{1,3,5,8}, 5:{1,6,9,11}, 6:{1,4,7,10}, 8:{2,3,9,10}, 11:{4,6,8,10} all new to the bank, max overlap 2 rows with any single banked core (654-28, fp-654-13, fp-654-21) | `forced-pair-core-654-25` |
| 44 | 654 | `9bc44573…` | SAT witness, sources (7,8), 11,836,418 nodes (caps=0, 20 M run; ~296 k past iter-43) — SIXTEENTH NONUNIT-track 654 witness; inline metric audit CROSSCHECKED_NONUNIT directly; cert passed CROSSCHECKED_REAL_INFEASIBLE_RADICAL_MEMBERSHIP: retained 8-row / 24-equality core forcing pair (7,8), retained core Rabinowitsch UNIT x3, deletion verdicts 4 UNIT / 6 TIMEOUT fail-closed / 2 NONUNIT — witness rows 1 (surplus), 2, 4, 6 dropped (second consecutive core without the surplus row); not a transposition image of any banked core; bridges BACK into the older orbit unlike the iter-42/-43 fresh sector — closest kin fp-654-22 (3 shared rows: 7, 9, 10), row 8:{6,7,9,11} previously only in unit-core-654-22, row 5:{1,3,6,9} links to the fresh sector via fp-654-24, row 3:{1,4,8,10} previously only in fp-654-19; supports 0:{3,4,9,10}, 11:{3,5,7,10} new to the bank | `forced-pair-core-654-26` |
| 45 | 654 | `916dab7f…` | SAT witness, sources (7,8), 11,836,421 nodes (caps=0, 20 M run — just 3 past iter-44's witness, repeating the iter-40→41 tight-pocket adjacency) — SEVENTEENTH NONUNIT-track 654 witness; inline metric audit CROSSCHECKED_NONUNIT directly; cert passed CROSSCHECKED_REAL_INFEASIBLE_RADICAL_MEMBERSHIP: retained 7-row / 21-equality core forcing pair (7,8), retained core Rabinowitsch UNIT x3, deletion verdicts 5 UNIT / 7 TIMEOUT fail-closed — witness rows 1 (surplus), 2, 4, 5, 7 dropped (third consecutive core without the surplus row); not a transposition image of any banked core; sibling variation of fp-654-26 (6 of 7 rows shared: 0, 3, 8, 9, 10, 11), dropping its rows 5:{1,3,6,9}, 7:{2,4,5,8}; support 6:{1,4,7,11} new to the bank | `forced-pair-core-654-27` |
| 46 | 654 | `4b546937…` | SAT witness, sources (7,8), 11,836,444 nodes (caps=0, 20 M run — just 23 past iter-45's witness, the tight pocket continuing) — EIGHTEENTH NONUNIT-track 654 witness; inline metric audit CROSSCHECKED_NONUNIT directly; cert passed CROSSCHECKED_REAL_INFEASIBLE_RADICAL_MEMBERSHIP: retained 7-row / 22-equality core forcing pair (7,8), retained core Rabinowitsch UNIT x3, deletion verdicts 5 UNIT / 6 TIMEOUT fail-closed / 1 NONUNIT — witness rows 0, 2, 3, 4, 7 dropped; surplus row 1:{0,2,7,8,9} RETAINED again after cores -25/-26/-27 all dropped it; not a transposition image of any banked core; kin fp-654-26 (rows 5, 10, 11), fp-654-27 (rows 6, 10, 11 — its new row 6:{1,4,7,11} reused immediately), unit-654-23 (rows 1, 8, 10); row 8:{2,6,9,11} previously only in unit cores; support 9:{0,4,6,7} new to the bank | `forced-pair-core-654-28` |
| 47 | 654 | `a170733b…` | SAT witness, sources (7,8), 11,836,463 nodes (caps=0, 20 M run — 19 past iter-46's witness, pocket steps now 3/23/19) — NINETEENTH NONUNIT-track 654 witness; inline metric audit CROSSCHECKED_NONUNIT directly; cert passed CROSSCHECKED_REAL_INFEASIBLE_RADICAL_MEMBERSHIP: retained 6-row / 19-equality core forcing pair (7,8), retained core Rabinowitsch UNIT x3, deletion verdicts 6 UNIT / 6 TIMEOUT fail-closed — witness rows 2, 3, 4, 5, 6, 11 dropped; surplus row 1:{0,2,7,8,9} retained (second consecutive); 6-row grade matches fp-654-13/-15/-17/-24 (only fp-654-01 at 5 rows is smaller); not a transposition image of any banked core; kin at 3 shared rows: unit-654-23/-30, fp-654-20/-22/-28; row 9:{0,3,6,8} previously only in fp-654-20, row 7:{2,4,5,8} returns after fp-654-27 dropped it; support 0:{4,6,7,10} new to the bank | `forced-pair-core-654-29` |
| 48 | 654 | `da21b15f…` | SAT witness, sources (7,8), 11,837,146 nodes (caps=0, 20 M run — 683 past iter-47's witness, pocket steps now 3/23/19/683) — TWENTIETH NONUNIT-track 654 witness; inline metric audit UNDECIDED_ORACLE_DISAGREEMENT_OR_TIMEOUT, so certified via direct `membership_crosscheck.py --pair 7 8 --radical-only --core` (fourth direct-cert use); cert passed CROSSCHECKED_REAL_INFEASIBLE_RADICAL_MEMBERSHIP: retained 7-row / 22-equality core forcing pair (7,8), retained core Rabinowitsch UNIT x3, deletion verdicts 5 UNIT / 4 TIMEOUT fail-closed / 3 NONUNIT — witness rows 0, 3, 4, 6, 10 dropped; surplus row 1:{0,2,7,8,9} retained (third consecutive); not a transposition image of any banked core; closest kin fp-654-26 (5 shared rows: 5, 7, 8, 9, 11); zero new supports — every retained row already appears in banked cores | `forced-pair-core-654-30` |
| 49 | 654 | `b27d13a4…` | SAT witness, sources (7,8), 11,837,149 nodes (caps=0, 20 M run — 3 past iter-48's witness, pocket steps now 3/23/19/683/3) — TWENTY-FIRST NONUNIT-track 654 witness; inline metric audit CROSSCHECKED_NONUNIT directly; cert passed CROSSCHECKED_REAL_INFEASIBLE_RADICAL_MEMBERSHIP: retained 7-row / 22-equality core forcing pair (7,8), retained core Rabinowitsch UNIT x3, deletion verdicts 5 UNIT / 5 TIMEOUT fail-closed / 2 NONUNIT — witness rows 0, 3, 4, 7, 9 dropped; surplus row 1:{0,2,7,8,9} retained (fourth consecutive); not a transposition image of any banked core; kin fp-654-28 and fp-654-30 (5 shared rows each); zero new supports — second consecutive core drawn entirely from banked rows | `forced-pair-core-654-31` |
| 50 | 654 | `fb1e0dd9…` | SAT witness, sources (7,8), 11,995,904 nodes (caps=0, 20 M run — 158,755 past iter-49's witness, the largest 654 step yet; pocket steps now 3/23/19/683/3/158,755) — TWENTY-SECOND NONUNIT-track 654 witness; inline metric audit CROSSCHECKED_NONUNIT directly; cert passed CROSSCHECKED_REAL_INFEASIBLE_RADICAL_MEMBERSHIP: retained 6-row / 18-equality core forcing pair (7,8), retained core Rabinowitsch UNIT x3, deletion verdicts 6 UNIT / 6 TIMEOUT fail-closed — witness rows 0, 1, 2, 4, 7, 9 dropped, ending the surplus row's four-core retention streak (fp-654-28..31); 6-row grade matches fp-654-13/-15/-17/-24/-29, 18-equality grade matches fp-654-15/-17 (only fp-654-01 at 5 rows / 15 eq smaller on both counts); not a transposition image of any banked core; only kin fp-654-27 (3 shared rows); TWO new supports 5:{3,6,8,11}, 8:{0,3,6,7} | `forced-pair-core-654-32` |
| 51 | 654 | `e55df416…` | SAT witness, sources (7,8), 12,011,137 nodes (caps=0, 20 M run — 15,233 past iter-50's witness; pocket steps now 3/23/19/683/3/158,755/15,233) — TWENTY-THIRD NONUNIT-track 654 witness; inline metric audit CROSSCHECKED_NONUNIT directly; cert passed CROSSCHECKED_REAL_INFEASIBLE_RADICAL_MEMBERSHIP: retained 8-row / 24-equality core forcing pair (7,8), retained core Rabinowitsch UNIT x3, deletion verdicts 4 UNIT / 7 TIMEOUT fail-closed / 1 NONUNIT — witness rows 0, 1, 8, 9 dropped, the surplus row out for a second consecutive core; not a transposition image of any banked core; nearest kin fp-654-32 (4 shared rows 3, 6, 10, 11); ONE new support 4:{3,5,7,10}; row 5:{3,6,9,11} previously banked only in unit-core-555-42 (cross-profile), row 2:{0,5,10,11} from the 654-21..23/-30/-31 sector, row 7:{2,6,8,11} from the 654-11..14/-25 sector | `forced-pair-core-654-33` |
| 52 | 654 | `e188012b…` | SAT witness, sources (7,8), 12,011,489 nodes (caps=0, 20 M run — 352 past iter-51's witness; pocket steps now 3/23/19/683/3/158,755/15,233/352) — TWENTY-FOURTH NONUNIT-track 654 witness; inline metric audit CROSSCHECKED_NONUNIT directly; cert passed CROSSCHECKED_REAL_INFEASIBLE_RADICAL_MEMBERSHIP: retained 8-row / 24-equality core forcing pair (7,8), retained core Rabinowitsch UNIT x3, deletion verdicts 4 UNIT / 7 TIMEOUT fail-closed / 1 NONUNIT — witness rows 1, 2, 3, 4 dropped, the surplus row out for a third consecutive core; not a transposition image of any banked core; nearest kin fp-654-33 (4 shared rows 5, 6, 7, 10 — chains directly off the previous admission; the ex-555-42 row 5:{3,6,9,11} consolidates in the 654 family); TWO new supports 0:{4,6,8,10}, 8:{2,3,4,5}; row 9:{0,3,6,7} from fp-654-13/-21/-25, row 11:{1,3,8,10} from 654-21/fp-654-11/-12 | `forced-pair-core-654-34` |
| 53 | 654 | `9e8fd600…` | SAT witness, sources (7,8), 13,094,386 nodes (caps=0, 20 M run — +1,082,897 past iter-52, deepest 654 witness yet) — FIRST unit-grade 654 witness since iter-39, ends the thirteen-witness NONUNIT run (iters 40-52, fp-654-22..34); inline audit CROSSCHECKED_UNIT; `system_unit_recheck.py` 900 s pass retained 6 rows / 19 equalities incl. surplus row 1:{0,2,7,8,9} (deletion verdicts 6 UNIT / 4 TIMEOUT fail-closed / 2 NONUNIT), retained core CROSSCHECKED_UNIT x3; not a transposition image of any banked core; kin capped at 3 shared rows, all forced-pair cores (fp-654-16/-22/-30 via rows 1, 7, 9 — no unit core shares more than 2); row 8:{3,7,9,11} previously only in fp-654-02; TWO new supports 0:{1,5,6,7}, 6:{2,3,4,10}; 6-row/19-eq is the modal 654 unit grade | `unit-core-654-32` |
| 54 | 654 | `6331dec6…` | SAT witness, sources (7,8), 13,095,453 nodes (caps=0, 20 M run — +1,067 past iter-53) — TWENTY-FIFTH NONUNIT-track 654 witness, first after the unit-grade interruption at iter-53; inline metric audit CROSSCHECKED_NONUNIT directly; cert passed CROSSCHECKED_REAL_INFEASIBLE_RADICAL_MEMBERSHIP: retained 8-row / 24-equality core forcing pair (7,8), retained core Rabinowitsch UNIT x3, deletion verdicts 4 UNIT / 7 TIMEOUT fail-closed / 1 NONUNIT — witness rows 1, 2, 3, 6 dropped, the surplus row out for a fourth consecutive forced-pair core; not a transposition image of any banked core; kin capped at 2 shared rows — the fp-654-33/-34 chain is broken; FIVE new supports 0:{2,4,6,11}, 4:{1,5,7,10}, 5:{1,4,6,9}, 7:{2,3,5,9}, 10:{1,3,7,11}; row 8:{6,7,9,10} from fp-654-15/-16/-17, row 9:{0,3,6,8} from fp-654-20/-29, row 11:{0,1,5,6} is the cross-profile 555-19..34-sector row (also fp-654-05/-06) | `forced-pair-core-654-35` |
| 55 | 654 | `1ff0d20b…` | SAT witness, sources (7,8), 13,095,457 nodes (caps=0, 20 M run — +4 past iter-54, the 654 pocket now as shallow as the 555 one) — TWENTY-SIXTH NONUNIT-track 654 witness; inline metric audit CROSSCHECKED_NONUNIT directly; cert passed CROSSCHECKED_REAL_INFEASIBLE_RADICAL_MEMBERSHIP: retained 8-row / 24-equality core forcing pair (7,8), retained core Rabinowitsch UNIT x3, deletion verdicts 4 UNIT / 7 TIMEOUT fail-closed / 1 NONUNIT — witness rows 1, 2, 3, 6 dropped, the surplus row out for a fifth consecutive forced-pair core; not a transposition image of any banked core; structurally fp-654-35 with row 4's support swapped ({1,5,7,10} → {1,5,8,10}) — kin fp-654-35 at 7 shared rows; ONE new support 4:{1,5,8,10} | `forced-pair-core-654-36` |
| 56 | 654 | `fcaeae53…` | SAT witness, sources (7,8), 13,348,599 nodes (caps=0, 20 M run — +253,142 past iter-55, breaking the ~13.0955M pocket) — TWENTY-SEVENTH NONUNIT-track 654 witness; inline metric audit CROSSCHECKED_NONUNIT directly; cert passed CROSSCHECKED_REAL_INFEASIBLE_RADICAL_MEMBERSHIP: retained 8-row / 24-equality core forcing pair (7,8), retained core Rabinowitsch UNIT x3, deletion verdicts 4 UNIT / 7 TIMEOUT fail-closed / 1 NONUNIT — witness rows 1, 2, 3, 6 dropped, the surplus row out for a sixth consecutive forced-pair core; IS the (10,11)-transposition image of forced-pair-core-654-35 — banked in its own right since `--bank-negative` blocks literal row sets only (precedent unit-core-555-51); second admission-time image hit, first on a forced-pair core; kin fp-654-35/-36 and unit-core-654-22 each at 3 shared rows; TWO new supports 0:{2,4,6,10}, 4:{1,5,7,11} | `forced-pair-core-654-37` |
| 57 | 654 | `ba42681d…` | SAT witness, sources (7,8), 13,349,122 nodes (caps=0, 20 M run — +523 past iter-56, a new pocket forming after the +253k jump) — TWENTY-EIGHTH NONUNIT-track 654 witness; inline metric audit CROSSCHECKED_NONUNIT directly; cert passed CROSSCHECKED_REAL_INFEASIBLE_RADICAL_MEMBERSHIP: retained 8-row / 24-equality core forcing pair (7,8), retained core Rabinowitsch UNIT x3, deletion verdicts 4 UNIT / 6 TIMEOUT fail-closed / 2 NONUNIT — witness rows 1, 2, 3, 8 dropped (drop set shifts from the 35/36/37 {1,2,3,6}), the surplus row out for a seventh consecutive forced-pair core; not a transposition image of any banked core; kin fp-654-37 at 4 shared rows (rows 4, 5, 10, 11 chain into the 35/36/37 family); TWO new supports 0:{3,6,8,10}, 6:{2,3,4,11} | `forced-pair-core-654-38` |
| 58 | 654 | `80b40893…` | SAT witness, sources (7,8), 13,349,669 nodes (caps=0, 20 M run — +547 past iter-57, second witness in the ~13.349M pocket) — TWENTY-NINTH NONUNIT-track 654 witness; inline metric audit CROSSCHECKED_NONUNIT directly; cert passed CROSSCHECKED_REAL_INFEASIBLE_RADICAL_MEMBERSHIP: retained 8-row / 24-equality core forcing pair (7,8), retained core Rabinowitsch UNIT x3, deletion verdicts 4 UNIT / 3 TIMEOUT fail-closed / 5 NONUNIT — witness rows 1, 3, 6, 8 dropped, the surplus row out for an eighth consecutive forced-pair core; not a transposition image of any banked core; kin fp-654-37 and fp-654-38 each at 5 shared rows — deep in the 35–38 family; ZERO new supports — row 0:{4,6,7,10} previously only in fp-654-29 | `forced-pair-core-654-39` |
| 59 | 654 | `8cfc23af…` | SAT witness, sources (7,8), 13,349,673 nodes (caps=0, 20 M run — +4 past iter-58, fourth witness in the ~13.349M pocket) — THIRTIETH NONUNIT-track 654 witness; inline metric audit CROSSCHECKED_NONUNIT directly; cert passed CROSSCHECKED_REAL_INFEASIBLE_RADICAL_MEMBERSHIP: retained 6-row / 19-equality core forcing pair (7,8), retained core Rabinowitsch UNIT x3, deletion verdicts 6 UNIT / 5 TIMEOUT fail-closed / 1 NONUNIT — witness rows 0, 3, 4, 5, 6, 7 dropped (six of twelve, vs four in recent cores), the surplus row 1:{0,2,7,8,9} RETAINED after eight consecutive cores without it (last seen fp-654-31); not a transposition image of any banked core; kin fp-654-29 and fp-654-39 each at 4 shared rows; ZERO new supports; 6-row cores previously 6 of 39 prior fp cores, 19-eq previously 3 of 39 | `forced-pair-core-654-40` |
| 60 | 654 | `0a20db6f…` | SAT witness, sources (7,8), 13,349,703 nodes (caps=0, 20 M run — +30 past iter-59, fifth witness in the ~13.349M pocket) — THIRTY-FIRST NONUNIT-track 654 witness; inline metric audit CROSSCHECKED_NONUNIT directly; cert passed CROSSCHECKED_REAL_INFEASIBLE_RADICAL_MEMBERSHIP: retained 7-row / 21-equality core forcing pair (7,8), retained core Rabinowitsch UNIT x3, deletion verdicts 5 UNIT / 5 TIMEOUT fail-closed / 2 NONUNIT — witness rows 1, 3, 5, 8, 9 dropped, the surplus row back out after its single-core return in fp-654-40; not a transposition image of any banked core; kin fp-654-39 at 4 shared rows; ONE new support 4:{1,3,7,10}; row 11:{4,5,9,10} in an fp core for the first time (previously only unit-cores 654-24/-25) | `forced-pair-core-654-41` |
| 61 | 654 | `48979979…` | SAT witness, sources (7,8), 13,350,142 nodes (caps=0, 20 M run — +439 past iter-60, sixth witness in the ~13.349M pocket) — THIRTY-SECOND NONUNIT-track 654 witness; inline metric audit CROSSCHECKED_NONUNIT directly; cert passed CROSSCHECKED_REAL_INFEASIBLE_RADICAL_MEMBERSHIP: retained 7-row / 21-equality core forcing pair (7,8), retained core Rabinowitsch UNIT x3, deletion verdicts 5 UNIT / 5 TIMEOUT fail-closed / 2 NONUNIT — witness rows 1, 2, 3, 6, 11 dropped; not a transposition image of any banked core; kin fp-654-26 at 4 shared rows; ONE new support 4:{3,5,8,10}; row 5:{1,4,6,9} in its sixth fp core of the last eight (fp-654-35 through -39, skipping -40/-41) | `forced-pair-core-654-42` |
| 62 | 654 | `9b85bb11…` | SAT witness, sources (7,8), 13,350,144 nodes (caps=0, 20 M run — +2 past iter-61, seventh witness in the ~13.35M pocket) — THIRTY-THIRD NONUNIT-track 654 witness; inline metric audit CROSSCHECKED_NONUNIT directly; cert passed CROSSCHECKED_REAL_INFEASIBLE_RADICAL_MEMBERSHIP: retained 7-row / 21-equality core forcing pair (7,8), retained core Rabinowitsch UNIT x3, deletion verdicts 5 UNIT / 7 TIMEOUT fail-closed — witness rows 0, 1, 2, 5, 7 dropped; not a transposition image of any banked core; kin capped at 3 shared rows (654-26/-27/-42, off-cluster); ONE new support 4:{3,5,9,10}; row 3:{1,4,7,10} previously only in fp-654-11 | `forced-pair-core-654-43` |
| 63 | 654 | `e2fca9d5…` | SAT witness, sources (7,8), 13,350,167 nodes (caps=0, 20 M run — +23 past iter-62, eighth witness in the ~13.35M pocket) — THIRTY-FOURTH NONUNIT-track 654 witness; inline metric audit CROSSCHECKED_NONUNIT directly; cert passed CROSSCHECKED_REAL_INFEASIBLE_RADICAL_MEMBERSHIP: retained 8-row / 25-equality core forcing pair (7,8), retained core Rabinowitsch UNIT x3, deletion verdicts 4 UNIT / 5 TIMEOUT fail-closed / 3 NONUNIT — witness rows 0, 3, 4, 6 dropped; not a transposition image of any banked core; kin at 5 shared rows (fp-654-22/-30/-42); ONE new support 11:{3,5,9,10}; surplus row 1:{0,2,7,8,9} retained (last fp appearance fp-654-40); second 25-equality fp-654 core (prior: fp-654-22); row 5:{1,4,6,9} in its seventh fp core of the last nine | `forced-pair-core-654-44` |
| 64 | 654 | `cdd23026…` | SAT witness, sources (7,8), 13,350,337 nodes (caps=0, 20 M run — +170 past iter-63, ninth witness in the ~13.35M pocket) — THIRTY-FIFTH NONUNIT-track 654 witness; inline metric audit CROSSCHECKED_NONUNIT directly; cert passed CROSSCHECKED_REAL_INFEASIBLE_RADICAL_MEMBERSHIP: retained 8-row / 24-equality core forcing pair (7,8), retained core Rabinowitsch UNIT x3, deletion verdicts 4 UNIT / 4 TIMEOUT fail-closed / 4 NONUNIT — witness rows 1, 2, 4, 8 dropped; not a transposition image of any banked core; kin capped at 4 shared rows (fp-654-34/-42/-43); NO new supports — all eight rows previously banked; row 5:{1,4,6,9} in its eighth fp core; row 9:{0,3,6,7} returns (last fp appearance fp-654-34) | `forced-pair-core-654-45` |
| 65 | 654 | `4999f098…` | SAT witness, sources (7,8), 13,350,350 nodes (caps=0, 20 M run — +13 past iter-64, tenth witness in the ~13.35M pocket) — THIRTY-SIXTH NONUNIT-track 654 witness; inline metric audit CROSSCHECKED_NONUNIT directly; cert passed CROSSCHECKED_REAL_INFEASIBLE_RADICAL_MEMBERSHIP: retained 8-row / 24-equality core forcing pair (7,8), retained core Rabinowitsch UNIT x3, deletion verdicts 4 UNIT / 4 TIMEOUT fail-closed / 4 NONUNIT — witness rows 0, 1, 8, 11 dropped; not a transposition image of any banked core; kin at 6 shared rows with fp-654-45 (three banked pairs already share 6; bank max is 7, fp-654-35/-36); NO new supports — all eight rows previously banked (as in fp-654-45); row 5:{1,4,6,9} in its ninth fp core; row 4:{3,5,8,10} previously only in fp-654-42 | `forced-pair-core-654-46` |
| 66 | 654 | `ebce302f…` | SAT witness, sources (7,8), 13,350,373 nodes (caps=0, 20 M run — +23 past iter-65, eleventh witness in the ~13.35M pocket) — THIRTY-SEVENTH NONUNIT-track 654 witness; inline metric audit CROSSCHECKED_NONUNIT directly; cert passed CROSSCHECKED_REAL_INFEASIBLE_RADICAL_MEMBERSHIP: retained 7-row / 22-equality core forcing pair (7,8), retained core Rabinowitsch UNIT x3, deletion verdicts 5 UNIT / 7 TIMEOUT fail-closed — witness rows 2, 3, 4, 5, 7 dropped; not a transposition image of any banked core; kin capped at 4 shared rows (fp-654-45); NO new supports — third consecutive fp core with all rows previously banked (-45/-46/-47); surplus row 1:{0,2,7,8,9} returns (last fp appearance fp-654-44); row 11:{3,5,9,10} previously only in fp-654-44; row 5:{1,4,6,9} absent for the first time since fp-654-43 | `forced-pair-core-654-47` |

Redel600 sweep FINAL (13/13 harvested): the two relaunched jobs
completed. `iter4_654` retained a core identical to banked
`forced-pair-core-654-02` (8 rows / 24 equalities, zero TIMEOUTs) —
no change. `iter10_555` produced the sweep's ONLY shrinkage: at
600 s per deletion attempt (zero TIMEOUTs) the greedy pass retained
6 rows / 18 equalities vs the banked 7 rows / 21, status
CROSSCHECKED_FORCED_ZERO_PAIR_CORE; `forced-pair-core-555-01` has
been superseded in place with the smaller core (rows 3, 6, 7, 8, 9,
10; the 60 s core's rows 0 and 11 dropped, row 8:{2,3,4,10} enters).
Final sweep tally: 12 unchanged, 1 shrunk, 0 supersessions at equal
size.

554 regression re-verified after the unit-core-654-24 admission wave:
`EXHAUSTIVE_UNSAT_IN_FINITE_SHADOW` at 22,498 total nodes with
`node_caps == 0` — identical node count to every prior verification.

The loop has settled into a NONUNIT regime: since iteration 7 every
witness on both profiles dies by forced coincidence of its source
pair, certified at radical grade in under a minute each.  The
signature bank only removes one complete assignment per iteration
(unlike the transferable unit cores), so 555 witnesses are arriving
as near-neighbours of each other on the same apex row `{2,6,7,8,10}`;
node cost is roughly flat on 555 (~2.7-2.8 M) and climbing on 654
(5.1 M → 5.7 M).

To convert these point-kills into family-kills,
`membership_crosscheck.py` gained `--core` (with `--pair`): after the
full system certifies, greedy one-pass row deletion where the deletion
test is "Rabinowitsch of the sub-ideal is still UNIT in Singular",
then a three-oracle crosscheck of the retained subset (status
`CROSSCHECKED_FORCED_ZERO_PAIR_CORE`).  Soundness is monotonicity of
radical membership: `I_sub ⊆ I` implies `√I_sub ⊆ √I`, so any complete
assignment containing the retained rows forces the same pair
coincidence.  Such cores can be admitted into
`REAL_INFEASIBLE_ROW_CORES` (the firing predicate only checks row
containment; the kill justification is provenance metadata).  Syntax
checked; first live run — which is also the fail-closed smoke test —
is against 555 iteration-10 witness `50cfcbec…` (NONUNIT, sources
(6,7), hash `e9b8d85d…`, 2.80 M nodes), in flight as this session
wraps, together with 654 iteration 4.

The early uniformity (shared apex row `1:{0,2,6,7,8}`, Moser row
`0:{1,2,3,4}`) broke at iteration 4: iteration 4 moved to apex
`{0,5,6,7,8}` / Moser `{1,2,3,5}`, and iteration 5's retained core
(21 equalities across seven non-apex centers) does not use the apex
row at all — the contradiction lives entirely in the O1/O2 row
network.  Search cost is rising (0.2 M → 1.9 M → 2.7 M nodes).
`membership_crosscheck.py` gained a `--scan` mode (one `std(I)`,
reduce all 66 squared pair distances, longer timeout) for NONUNIT
witnesses whose built-in audit times out; the 300 s scan of
`a4914ed2…` TIMED OUT in `std(I)` (its predecessor `fa87f604…`
finished well inside 120 s, so this ideal is materially heavier) — a
1800 s retry is running alongside 555 iteration 6.

555 iteration 6 (witness `aab3e0b5…`, apex row `{2,6,7,8,10}`, 2.71 M
nodes) hit the first inline-audit capacity failure: msolve UNIT under
both variable orders but inline Singular TIMEOUT, so the combined
verdict degraded to UNDECIDED_ORACLE_DISAGREEMENT_OR_TIMEOUT and
nothing was admissible.  New lane tool `system_unit_recheck.py`
replays a witness fail-closed (row signature AND rebuilt
equality-system hash must both match the search report) and re-runs
the three-oracle crosscheck plus the one-pass row deletion and
retained-core crosscheck under caller-chosen budgets.  Smoke gate
against the known-UNIT iteration-5 witness `a94caeaf…`: reproduces
CROSSCHECKED_UNIT, the hash `require` passes, and the deletion pass
returns a crosschecked 7-row core.  The 900 s recheck of `aab3e0b5…`
settled it: CROSSCHECKED_UNIT, 7-row / 21-equality retained core
(centers 0,3,4,7,9,10,11 — again no apex row), core CROSSCHECKED_UNIT;
admitted as `unit-core-555-07`.

555 iteration 7 (witness `84ac8d4a…`, apex row `{2,6,7,8,10}`, 2.73 M
nodes) is the profile's first CROSSCHECKED_NONUNIT — the kill route is
a forced-zero pair, as for 654; a 900 s `--scan` is running.  The
1800 s `--scan` retry of 654 witness `a4914ed2…` ALSO timed out in
`std(I)`, so `membership_crosscheck.py` gained `--radical-only`: skip
the `std(I)` direct reduction and certify from the Rabinowitsch UNIT
crosscheck alone (Singular + msolve forward/reverse — still
dual-oracle, and radical membership is exactly the property the
forced-zero conclusion consumes; the extended ideal is unit when the
pair is forced, and unit Gröbner runs collapse without computing
`std(I)`).  Emitted status for this grade:
`CROSSCHECKED_REAL_INFEASIBLE_RADICAL_MEMBERSHIP`.  Smoke gates
against the fa87f604 controls both pass (pair (7,8) certifies at
radical grade; pair (3,7) rejected, NONUNIT x3).  The radical-only
attempt on `a4914ed2…` pair (7,8) certified in minutes — Rabinowitsch
UNIT x3 where `std(I)` had defeated 1800 s — and the signature is
admitted (equality hash `4a75ebc1…`); 654 iteration 2 is running.

The 555 iteration-7 `--scan` also timed out at 900 s; the radical-only
route certified in under a minute again, and this time the forced-zero
pair is the SOURCE pair (6,7) itself — every complex realization of
that shadow collapses the two strict-O1-interior sources.  Signature
admitted (equality hash `9b395b64…`); 555 iteration 8 is running.
Pattern worth noting: both NONUNIT witnesses so far die by forced
coincidence of a pair adjacent to the frontier construction (654:
frontier pair (7,8); 555: source pair (6,7)), and in both cases the
Rabinowitsch UNIT computation is light where `std(I)` is heavy.

The first live `--core` run (its fail-closed smoke test) passed
against 555 iteration-10 witness `50cfcbec…`: the full 12-row system
certified at radical grade on pair (6,7) (hash `e9b8d85d…` matched the
search report), and greedy deletion removed 5 of 12 rows (5 UNIT
deletions, 2 NONUNIT, 5 TIMEOUT — timed-out attempts retain their row
fail-closed, so the core is valid but possibly non-minimal), leaving a
7-row / 21-equality core with the pair-(6,7) Rabinowitsch ideal UNIT
in Singular and msolve under both variable orders
(`CROSSCHECKED_FORCED_ZERO_PAIR_CORE`).  Admitted as
`forced-pair-core-555-01` alongside the point-kill signature; this is
the first transferable cut extracted from the NONUNIT regime.  The
`REAL_INFEASIBLE_ROW_CORES` header now documents both admissible
grades.  554 regression after the admission: EXHAUSTIVE_UNSAT holds.
555 iteration 11 and the 654 iteration-4 `--radical-only --core`
certification (witness `6b5de144…`, pair (7,8), hash `bbdbf705…`) are
running.

With more cores made available, the six earlier signature-only NONUNIT
kills were retroactively upgraded in one parallel `--core` sweep: all
six certified `CROSSCHECKED_FORCED_ZERO_PAIR_CORE` (each retained core
Rabinowitsch UNIT x3), admitted as `forced-pair-core-555-02..04` and
`forced-pair-core-654-01..04` alongside `forced-pair-core-555-05`
(iteration 11) and `forced-pair-core-654-02` (iteration 4).  Notable
shapes: the 654 iteration-3 core is only 5 rows / 15 equalities and
contains no row centered at 7 — the (7,8) coincidence is forced from
five rows centered elsewhere; the 555 iteration-7 and iteration-9
cores are identical except in row 4, giving direct structural evidence
for the near-neighbour observation.  Deletion attempts that hit the
60 s budget retain their row fail-closed (1–7 TIMEOUTs per run), so
the cores are valid cuts but not confirmed minimal; a longer-budget
re-deletion pass could shrink them.  The bank now carries nine
transferable forced-pair cores; each future witness containing any of
them is pruned in-search rather than mined, certified, and admitted.

654 iteration 5 (witness `080287b2…`) and 555 iteration 12 (witness
`5d2b6e65…`) continued the pattern and were admitted as
`forced-pair-core-654-05` and `forced-pair-core-555-06` with their
signatures — eleven forced-pair cores total.  Iteration 12 is the
second witness whose inline audit came back UNDECIDED, this time with
msolve NONUNIT x2 (iteration 6 had msolve UNIT x2): the pair route
certified directly, so no long-budget UNIT recheck was needed.  Its
core again avoids any row centered at 7.

654 iteration 6 and 555 iteration 13 continued the one-witness-per-run
NONUNIT pattern (`forced-pair-core-654-06`, `forced-pair-core-555-07`,
thirteen cores total).  Node-cost trend with the forced-pair cores
firing in-search (`exact-algebraic-unit-core` stage hits 81 → 104 on
555, 180 → 191 on 654 across recent runs): 555 total nodes 2.80 M →
3.10 M → 3.22 M → 3.22 M (iterations 10–13), 654 flat at ~5.72 M
(iterations 3–6).  The cores prune, but each run still reaches one
fresh near-neighbour witness; no convergence signal yet in node
counts.

With the box idle (Adam cleared up to 24 cores), a 13-job re-deletion
sweep was launched over every admitted forced-pair-core witness:
`membership_crosscheck.py --radical-only --core` rerun with
`--deletion-timeout 600` (vs 60).  Attempts that timed out at 60 s
retained their row fail-closed, so the longer budget can only delete
more rows; any strictly smaller retained core supersedes its bank
entry under the same ID (a subset core fires on strictly more
assignments).  Outputs land in the session scratchpad as
`iterN_PPP_redel600.json`.

654 iteration 7 and 555 iteration 14 continued the source-pair
pattern (`forced-pair-core-654-07`, `forced-pair-core-555-08`,
fifteen cores total; 654-07 is the second 654 core with no row
centered at 7, and 555-08 retained six deletion TIMEOUTs
fail-closed).

555 iteration 15 (witness `1e81296b…`, 3.33 M nodes) broke the
source-pair pattern: dist²(6,7) radical membership came back
NONUNIT in all three oracles — a definitive negative, the first
witness since iteration 7 whose source pair is not forced.  The
witness is still not a survivor: the all-pairs `--scan` (whose
`std(I)` completed quickly here, unlike the 654 iteration-1 ideal)
found 49 of 66 squared pair distances DIRECTLY in the ideal.  Any
one directly-forced pair kills every real distinct-point
realization, since a real isotropic difference vector is zero.
Structurally, point 6 is nearly isolated in the forced-pair graph
(only (6,11) is forced), while {0,2,3,4,5,8,9} form a forced
clique; the complex variety collapses almost everything except the
neighbourhood of point 6.  Kill route: pair (7,8) certified at the
radical grade with core extraction — 8-row / 24-equality core,
Rabinowitsch UNIT x3, admitted as `forced-pair-core-555-09`.  The
loop's kill criterion is therefore now explicitly "some pair is
forced", not "the source pair is forced"; when the source-pair route
fails, the all-pairs `--scan` picks the replacement pair.

The anomaly did not recur immediately: 555 iteration 16 and 654
iteration 9 both certified on their source pairs (7-row / 21-equality
cores each; `forced-pair-core-555-10`, `forced-pair-core-654-09`,
nineteen cores total).  Node cost is now rising on both profiles:
555 3.22 M → 3.33 M → 3.44 M (iterations 14–16), 654 5.72 M → 5.87 M
→ 6.48 M (iterations 7–9).

First four 600 s re-deletion results (555 iters 7/8/9, 654 iter 3):
NO shrinkage — every retained core is row-for-row identical to its
60 s bank entry, with most former deletion TIMEOUTs now resolving to
definite retain verdicts (1–3 TIMEOUTs remain per run vs 1–7).  The
60 s greedy pass appears to be finding the stable retained set;
supersession has not yet fired.

Five more 600 s re-deletion results (654 iters 1/2/5, 555 iters
11/12; zero deletion TIMEOUTs in all five): still NO shrinkage.
654-03, 654-04, 555-05 and 555-06 are row-for-row identical to
their bank entries.  654 iter-5 is the one variation: the 600 s
greedy pass retained a DIFFERENT 8-row / 24-equality set than
banked `forced-pair-core-654-05` (drops banked row 4:{2,3,7,11},
keeps 5:{2,4,6,9} instead) — same size, so no supersession; the
minimal-core landscape at this witness has at least two stable
8-row plateaus.  Nine of thirteen re-deletion jobs harvested, zero
supersessions.  Remaining four: 555 iters 10/13, 654 iters 4/6
(654-6 and 555-13 processes still alive; 555-10 and 654-4 have
0-byte outputs and no live process — to re-examine).

Re-deletion results ten and eleven (654 iter 6, 555 iter 13; zero
deletion TIMEOUTs): 555-07 row-for-row identical to its bank entry;
654 iter-6 is a second same-size variation — a DIFFERENT 7-row /
21-equality set than banked `forced-pair-core-654-06` (drops banked
row 7:{2,5,8,11}, keeps 10:{0,4,8,11} instead), same size, no
supersession.  The two silently-died jobs (555 iter 10, 654 iter 4)
were relaunched.  Running tally: 11 of 13 harvested, zero
supersessions, two witnesses (654 iters 5 and 6) each showing two
stable same-size greedy plateaus.
