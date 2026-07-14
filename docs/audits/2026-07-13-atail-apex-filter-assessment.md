# ATAIL apex-filter assessment (2026-07-13)

## Verdict

The separate apex-filter route does **not** contain a missing local
pigeonhole lemma.  The checked geometry proves the opposite:

- a K4 radius at either opposite apex has at least three carrier points
  outside the surplus cap;
- those points have pairwise distinct radii from the other opposite apex; and
- for every fixed radius pair `(r, rho)`, the corresponding joint full-filter
  fiber outside the surplus cap has cardinality at most one.

Thus a theorem asserting that one such joint fiber has cardinality at least
two is already a contradiction, not a locally realizable producer fact.  Any
proof of K-A-PAIR must use the full two-large-cap/critical-row hypotheses to
derive inconsistency.  It cannot arise from an upper bound on the
opposite-radius image of one apex class: that image is provably at least three
for the K4 marginal selected below.

The reusable positive result of this audit is that the existing U2
cover/one-hit infrastructure transfers to the exact `leafSurplusPacket`
without a new CP-to-`D.packet` identification theorem.  Rebuild a
`CounterexampleData` with the same carrier, convexity, and K4 fields and with
the leaf packet as its `packet`; the public U2 theorems then apply directly.

## Required bank preflight

Before deriving these facts, the audit checked the AGENTS-listed registries:

- `docs/general-n-certificate-bank-mining-2026-07-09.md`, including the
  sibling `p97-rvol` section;
- `certificates/p97_rvol_general_n_mining.md` and
  `certificates/p97_rvol_general_n_mining.json`;
- `certificates/erdos97_legacy_general_n_mining.md` and its JSON inventory;
  and
- `certificates/erdos_general_theorem_p97_mining.md` and its JSON inventory.

The indexed Lean searches included:

```text
two points outside surplus cap equal distances to both opposite apices
full exact radius class at apex card four opposite radius collision
endpoint radius strict adjacent escape surplus cap
double apex shared radius pair no M44
exact radius class cap cardinality lower upper opposite apex
distance image of ordered cap from external apex monotone
two selected four classes intersection off cap
full shell opposite cap endpoint
```

No bank contains the producer.  The useful hits are consumers or marginal
bounds:

- `SelectedFourClass.inter_card_le_two`;
- `CapSelectedRowCounting.outsidePair_unique_capCenter`;
- `U2NonSurplusSqueeze.oppApex{1,2}_surplusCap_one_hit`;
- `U2NonSurplusSqueeze.oppApex{1,2}_otherCap_one_hit`;
- `U2NonSurplusSqueeze.oppApex{1,2}_exactRadiusClass_cover`;
- `U2NonSurplusSqueeze.oppApex{1,2}_containment_or_strict_adjacent_escape`;
- the M44-only endpoint-radius and long-shell pruning results; and
- sibling `U3OverlapBound.offcap_ge_two`, which is another two-circle
  marginal bound, not a joint-fiber producer.

The legacy theorem
`Problem97.three_common_equidistant_centers_eq` is also a uniqueness consumer,
not a source of the needed equalities.

## Checked scratch theorems

The file
`scratch/atail-force/apex_filters/joint_fiber_upper_bound.lean` contains the
following solver-free theorems.  All statements are uniform in an arbitrary
`S : SurplusCapPacket D.A`, hence apply to the leaf packet used by K-A-PAIR.

### 1. The desired joint fiber is always a singleton at most

```lean
theorem doubleApexJointFiber_sdiff_surplus_card_le_one
    (D : CounterexampleData) (S : SurplusCapPacket D.A) (r ρ : ℝ) :
    (((D.A.filter fun x => dist x S.oppApex1 = r) ∩
        (D.A.filter fun x => dist x S.oppApex2 = ρ)) \
          S.surplusCap).card ≤ 1
```

The proof expands two hypothetical members and calls the already proved
`oppCap2_escape_gen`: two intersections of the two circles are
reflections across the opposite-apex line, while two off-surplus carrier
points lie strictly on the same side of that line.

**Status: PROVEN.**  Direct Lean check passes; axiom closure is exactly
`propext`, `Classical.choice`, and `Quot.sound`.

### 2. Each apex has a three-point off-surplus K4 marginal

```lean
theorem exists_oppApex1_radius_three_le_sdiff_surplus
    (D : CounterexampleData) (S : SurplusCapPacket D.A) :
    ∃ r : ℝ, 0 < r ∧
      3 ≤ ((D.A.filter fun x => dist x S.oppApex1 = r) \
        S.surplusCap).card

theorem exists_oppApex2_radius_three_le_sdiff_surplus
    (D : CounterexampleData) (S : SurplusCapPacket D.A) :
    ∃ r : ℝ, 0 < r ∧
      3 ≤ ((D.A.filter fun x => dist x S.oppApex2 = r) \
        S.surplusCap).card
```

Proof: use global K4 at the corresponding Moser vertex, repacket `D` with
`S`, apply the public surplus-cap one-hit bound, and use
`card(sdiff) + card(inter) = card(filter)`.

**Status: PROVEN.**  Neither theorem uses `IsM44`, the second-large-cap
hypothesis, a critical row, or the open K-A-PAIR theorem.  The first theorem's
audited axiom closure is the three standard core axioms above; the second is
its checked symmetric proof.

### 3. Each marginal has two points in its own strict opposite-cap interior

```lean
theorem exists_oppApex1_radius_two_le_own_strict_interior
    (D : CounterexampleData) (S : SurplusCapPacket D.A) :
    ∃ r : ℝ, 0 < r ∧
      2 ≤ ((D.A.filter fun x => dist x S.oppApex1 = r) ∩
        (S.oppCap1 \ (S.surplusCap ∪ S.oppCap2))).card

theorem exists_oppApex2_radius_two_le_own_strict_interior
    (D : CounterexampleData) (S : SurplusCapPacket D.A) :
    ∃ r : ℝ, 0 < r ∧
      2 ≤ ((D.A.filter fun x => dist x S.oppApex2 = r) ∩
        (S.oppCap2 \ (S.surplusCap ∪ S.oppCap1))).card
```

Proof: the exact-radius-class cover puts the full filter in the union of the
surplus cap, the other opposite cap, and the indicated strict own-cap
interior.  The first two pieces each contribute at most one; K4 contributes
at least four in total.

**Status: PROVEN.**  The first theorem's audited axiom closure is again the
three standard core axioms, and the symmetric theorem checks in the same
scratch file.

This is the strongest local cap-side lower bound obtained from the current U2
scaffold without `IsM44`.  It sends the two guaranteed subsets into different
strict cap interiors for the two apexes; it does not make them overlap.

### 4. The opposite-radius image is large, not small

```lean
theorem exists_oppApex1_radius_three_le_oppApex2_distance_image
    (D : CounterexampleData) (S : SurplusCapPacket D.A) :
    ∃ r : ℝ, 0 < r ∧
      3 ≤ (((D.A.filter fun x => dist x S.oppApex1 = r) \
        S.surplusCap).image fun x => dist x S.oppApex2).card

theorem exists_oppApex2_radius_three_le_oppApex1_distance_image
    (D : CounterexampleData) (S : SurplusCapPacket D.A) :
    ∃ ρ : ℝ, 0 < ρ ∧
      3 ≤ (((D.A.filter fun x => dist x S.oppApex2 = ρ) \
        S.surplusCap).image fun x => dist x S.oppApex1).card
```

For a fixed first-apex radius, equality of the two second-apex distances would
give two members of one prohibited double-apex fiber.  Hence the second-apex
distance map is injective on the off-surplus marginal, so its image has the
same cardinality and in particular at least three.  The symmetric statement
is identical.

**Status: PROVEN.**  The first theorem's audited axiom closure is the three
standard core axioms, and the symmetric theorem checks.

Validation from the Lake root `lean/`:

```bash
lake env lean -M 16384 \
  ../scratch/atail-force/apex_filters/joint_fiber_upper_bound.lean
```

The command exited zero.  Temporary `#print axioms` checks were then removed
from the scratch source after recording the closures above.

## Why the M44 endpoint machinery does not transfer into a kill

The packet transfer itself is routine; the cardinal squeeze is not.

For an apex-1 radius class `T`, the checked no-M44 information is:

```text
|T| >= 4
|T intersect surplusCap| <= 1
|T intersect oppCap2| <= 1
T subset surplusCap union oppCap2 union strictInterior(oppCap1)
```

Therefore `|T intersect strictInterior(oppCap1)| >= 2`.  In the M44 branch,
the strict interior has cardinality exactly two, so `fourClass_of_cover`
turns all inequalities into equalities.  In the present branch the relevant
opposite cap may have cardinality at least five, so its strict interior has
cardinality at least three.  The equality squeeze is unavailable and
containment of a four-point class in that larger cap is consistent with these
local facts.

Likewise,
`endpointRadius_of_selectedClass_subset_capByIndex_of_cap_card_eq_four`
requires the containing cap to have cardinality exactly four.  The
`containment_or_strict_adjacent_escape` dichotomy does not close either arm in
the two-large-cap regime:

- containment in a cap of cardinality at least five does not identify the
  full cap or force its endpoints onto the selected radius; and
- the radical-axis theorem forbids strict escape only after both endpoint
  radius equalities have already been produced.

The sibling long-shell bound also assumes `IsM44`; its proof uses the
two-point strict opposite cap.  It supplies no uniform no-M44 replacement.

**Conclusion: PROVEN as an applicability audit.**  The endpoint/strict-escape
surface is useful in the exact-four cap branch but does not supply the missing
`CARD-GE-12` producer.

## Circularity audit

The checked scratch theorems use only:

- `D.K4` and membership of the Moser vertices in `D.A`;
- the public U2 cover and one-hit theorems after repacketing;
- finite-set cardinal arithmetic; and
- the proved reflection/sign theorem `oppCap2_escape_gen`.

They do not use:

- `DoubleApexOffSurplusSharedRadiusPair`;
- `exists_removableVertex_of_twoLargeCaps`;
- `false_of_twoLargeCaps_pCentered_t2Source`;
- any LIVE-Q/T1/T3/C helper;
- `hNoM44`, `hj5`, `hcritical`, the five source rows, or live-data fields; or
- a solver, generated certificate, `native_decide`, or a new axiom.

There is therefore no circularity in the upper and marginal bounds.  By
contrast, any proposed lemma that bounds the other-apex distance image by at
most two on the three-point marginal would contradict the checked
injectivity theorem and, together with K4, would already prove `False`.  Such
a lemma must not be described as an independent local geometric ingredient.

## Smallest honest missing ingredient

### Rejected local target

The tempting statement

```text
some first-apex K4 marginal has at most two second-apex distance values
```

is **DISPROVED under the current local hypotheses** by the checked image lower
bound.  More generally, the desired joint-fiber lower bound `>= 2` directly
contradicts the checked joint-fiber upper bound `<= 1`.

### Ranked remaining targets

1. **Critical-row/full-filter outside-pair collision (CONJECTURED).**  Use the
   actual critical-shell system and row provenance to force two distinct cap
   centers on one ordered cap to share a two-point support subset outside that
   cap.  The immediate proved consumer is
   `CapSelectedRowCounting.outsidePair_unique_capCenter`.  This target is more
   natural than first identifying those centers with the two Moser apexes:
   the critical system already supplies exact four-shell centers, while no
   current hypothesis pins a critical blocker center to an opposite apex.

   A theorem-facing shape is:

   ```lean
   ∃ c₁ c₂ x w,
     c₁ ∈ S.capByIndex k ∧ c₂ ∈ S.capByIndex k ∧ c₁ ≠ c₂ ∧
     x ∈ D.A ∧ w ∈ D.A ∧ x ≠ w ∧
     x ∉ S.capByIndex k ∧ w ∉ S.capByIndex k ∧
     dist c₁ x = dist c₁ w ∧ dist c₂ x = dist c₂ w
   ```

   It must be derived from hypotheses actually threaded on the five-row pair
   surface or the stronger six-row live surface.  The present incidence-only
   census shows that support/source facts alone do not force it, so metric or
   global-order information is load-bearing.

2. **Direct two-large-cap/critical-system contradiction (CONJECTURED).**  Prove
   `False` from the exact K-A-PAIR hypotheses (or a verified subset) for
   `12 <= D.A.card`, and eliminate into the existential.  This is logically
   honest: the requested existential is itself impossible.  A uniform theorem
   at card at least 15 would still require the declared AHEAD cover for cards
   12--14.

3. **Critical-row forcing of a banked metric core (CONJECTURED).**  Rather than
   force the apex pair, show that the five-row or six-row full exact-shell
   network contains one of the already proved two-center/order kernels or the
   seven equalities consumed by `u1TwoLargeCapObstruction`.  This needs an
   exhaustive producer, not another selected-four sink.

The separate endpoint-radius/strict-escape route is not ranked: no current
large-cap hypothesis produces its endpoint equalities, and containment in a
large cap is not contradictory.

## Smallest deciding computation if the critical-row route stalls

The next finite computation should be a **`CARD-EQ-12` exhaustive critical-row
system census**, not another selected-four Q3 or scalar-kernel scan.  Card 12
has only the cap profiles `(6,5,4)` and `(5,5,5)` after the existing ordered
cap inequality.  For both profiles, quotient by simultaneous carrier/cap
symmetry and retain:

1. one common cyclic order and all cap signs;
2. the exact four-point full shell selected for every source by the
   `CriticalShellSystem`;
3. the blocker map, source-in-shell condition, center/source inequality, and
   no-qfree consequence;
4. the full-filter exactness inequalities excluding every off-row point at
   the same radius;
5. the five K-A-PAIR source rows, or preferably the stronger live sixth-row
   provenance; and
6. the real coordinate equalities, disk/nonobtuse conditions, and
   distinctness separators.

The decision question is whether every such `CARD-EQ-12` system contains either:

- a repeated outside pair at two ordered-cap centers;
- one of the already formalized metric cores; or
- a directly contradictory exact subsystem with an independently replayable
  certificate.

This is materially stronger than the completed incidence-only census and the
two saved finite-shadow candidates: those candidates were individually
excluded by exact Singular computations, but they were not an exhaustive
critical-row inventory.  A SAT output must be a genuine real, convex,
full-filter model before it can refute a theorem; an UNSAT output must be
certificate-replayed before it can be promoted.  Until that exhaustive
producer exists, the global critical-row collision remains **CONJECTURED**.

## Bottom line

The CP/leaf-packet transport and all separate apex marginals are now routine
and checked.  The missing ingredient is not “one more apex class bound.”  It
is a global coupling theorem that turns the critical full-shell network and
two-large-cap order into a forbidden repeated outside pair or another banked
metric core.  That is the narrow research target for closing K-A-PAIR.
