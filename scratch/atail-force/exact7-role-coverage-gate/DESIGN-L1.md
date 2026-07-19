# L1 layer design — first-apex rows + one-hit region families

Date: 2026-07-19.  Session fd7b0078.  Prerequisite: identification layer
decided (REPORT Findings 4-6, commit 2ba87c82).

## New pinned facts (verified this session, exact statements read)

### One-hit region bounds (the L0 sweep missed these — they live in
### `P97/U2NonSurplusOneHit.lean`, outside the ATail sweep scope)

For any radius r, the exact-radius class at an apex meets each ADJACENT
closed cap in at most ONE point:

| Fact | Statement | Provenance |
|---|---|---|
| EA-surplus one-hit | `(A.filter (dist · EA = r)) ∩ surplusCap` card ≤ 1 | `U2NonSurplusSqueeze.oppApex1_surplusCap_one_hit` (U2NonSurplusOneHit.lean:213); generic-S composition at CriticalPairFrontier.lean:1296-1306 (`DS` packet rebuild) |
| EA-physical one-hit | `… ∩ oppCap2` card ≤ 1 | `oppApex1_otherCap_one_hit` (:312); generic-S: `selectedClass_inter_oppCap2_card_le_one` (FirstApexShellRoleExtractor.lean:111-117) |
| O-surplus one-hit | `(A.filter (dist · O = r)) ∩ surplusCap` card ≤ 1 | `oppApex2_surplusCap_one_hit` (:352); generic-S via same `withPacket` rebuild (pattern at FrontierCommonDeletionSurplusEscape.lean:93) |
| O-opp1 one-hit | `… ∩ oppCap1` card ≤ 1 | `oppApex2_otherCap_one_hit` (:392); generic-S via same rebuild |

No W-centered analogue exists in the codebase (searched); W families are
NOT asserted (upgrade candidate, needs a new composition).

Encoding: pairwise `rad_ne` disequalities.  Region dictionary (closed
caps, from the Round-188 normal form + endpoint memberships):

- closed surplus  = {EA, O} ∪ S-bag
- closed physical = {EA, W} ∪ {s0,b0,s1,b1,s2}
- closed opp1     = {O, W} ∪ O1-bag

Families (over every pair of distinct schema points in the same region):

- `rad_ne|EA|x,y` for x,y ∈ closed surplus ∖ {EA}, and for
  x,y ∈ closed physical ∖ {EA};
- `rad_ne|O|x,y` for x,y ∈ closed surplus ∖ {O}, and for
  x,y ∈ closed opp1 ∖ {O}.

Immediate consequence (solver-level, 3-constraint cores): the exact-five
extras cannot BOTH land in {S-bag, EA} nor both in {O1-bag, W}.  Only 4 of
the 8 L0 e-landing patterns survive: S-O1, S-W, EA-O1, EA-W.  This
retroactively halves the L0 residual (see retro census below).

### First-apex rows (`FirstApexShellRolePacket`, FirstApexShellRole.lean:48-129)

Both rows are `SelectedFourClass D.A S.oppApex1` (U1CarrierInjection.lean:405):
exactly 4 support points, all at distance `radius` from EA, center ∉ support,
support is a 4-SUBSET of the ambient class (`sameRadius_six` proves the
ambient class can be strictly larger) — so rows enter as `row_eqs`
(equalities only), NEVER as `exact_classes` (no exclusions).

Retained row {q, w, c1, c2}:

- q,w ∈ row (`q/w_mem_retainedRow`); completion card exactly 2
  (`retained_completion_card_eq_two`);
- q,w ∉ closed surplus cap AND dist(EA,q) = dist(EA,w) = retained radius
  (`SurvivorPairRelocationPacket.q/w_mem_marginal`,
  CriticalPairFrontier.lean:295-298 — filter at radius r minus surplusCap);
- q,w ∈ closed physical cap ∨ O1-bag (`q_role`/`w_role`); physical-cap
  A-points are exactly the 7 named ones (Round 188), so a physical landing
  IS a named identification, and q,w ≠ EA (marginal);
- role cover: every row member ∈ closed surplus ∪ closed physical ∪ O1-bag
  (`retainedRow_role_cover`; also generically for ANY EA-radius class:
  `selectedClass_subset_roleCover`, FirstApexShellRoleExtractor.lean:95);
- one-hits ⇒ per row: ≤1 member in closed physical, ≤1 member in closed
  surplus, hence ≥2 members in O1-bag (subsumes `retainedInterior₁/₂`,
  `one_frontier_source_strict`).

Double row {g1..g4}: same shape (`doubleRow_*`), plus g ≠ q and g ≠ w
(`doubleRow_subset_doubleErase`).  Completion/double members may land on
O (∈ closed surplus — consumes the surplus budget).

Radius split (`sameRadius_six` / `distinctRadius_disjoint`):

- same arm: doubleRadius = retainedRadius.  Both rows lie in ONE ambient
  radius class ⇒ one-hit budgets are JOINT over the union; rows may share
  completion points (same named landing merges roles); ambient-class
  card ≥ 6 is witnessed by the ≥6 distinct union members (no assertion).
- distinct arm: budgets per row; rows disjoint (automatic: a point has one
  EA-distance); cross-row same-named landings pre-filtered (documented:
  one point cannot carry two distinct EA-radii).

### Class-O tooth

`CriticalPairFrontier.secondApexDouble` (CriticalPairFrontier.lean:573-575,
unconditional field): a 4-class at O survives erasing BOTH q,w.  With
`unique_K4_radius` + `class_card_eq_five` (LargeCapUniqueFive.lean:30-39)
this forces |class(O) ∖ {q,w}| ≥ 4, i.e. AT MOST ONE of q,w ∈ class(O) =
{s0,s1,s2,e1,e2}.  All-fresh consequence: q,w not both in {s0,s1,s2}
(subsumed there by the EA-physical one-hit); bites independently in
q/w ~ e identification cases.

### Production terminal (the rad_ne-at-EA consumer)

`false_of_fullParentExactFiveAllReverseData_of_firstApexOccurrence`
(ParentExactFiveAssembler.lean:335) via
`false_of_transitionReverseOutsidePair_coRadial_firstApex`: on the
all-reverse arm, ANY source whose transition-reverse outside pair {a,b} is
co-radial at EA (dist(EA,a) = dist(EA,b)) yields False.  Encoding:
`rad_ne|EA|p·a,p·b` for each of the three L0 rows' outside pairs.  Inert
without other EA-distance structure; fires against the L1 rows.  An
identification pattern placing BOTH outside points of one row inside one
EA-row is dead by direct citation (`FirstApexNamedRowTransitionReversePairOccurrence`).

### Facts checked and found redundant

`FirstApexSplit`/`SecondApexSplit` (CriticalPairFrontier.lean:544-565):
disjunctions already resolved by unconditional packet/residual fields
(`R.common.firstApexDouble`, `secondApexDouble`) in the all-reverse
consumer context.  Nothing new to encode.

## Census plan

0. **Encoder**: add `radius_rel` field ([{"rows":[r1,r2],"relation":"eq"|"ne"}],
   label `radrel|r1,r2|eq/ne`) tying `row_eqs` base radii.  Region rad_ne
   emitted by enumerators via a shared `regions.py` helper (no encoder change).
1. **Smokes** (new, plus full regression of the 7 existing gates):
   H: e-pattern kill (e1,e2 both O1 → UNSAT, core ⊆ {cls_eq×2, rad_ne});
   I: row surplus one-hit kill (c1 ∈ S-bag, c2 = O → UNSAT);
   J: radius_rel semantics (shared named point: ne → UNSAT, eq → SAT);
   K: 15-point fixture must SATISFY all four region families (validates
   the region dictionary against a real configuration).
2. **Retro-L0 census**: re-run the 1752 identification-layer survivors with
   the region families added.  Expect exactly the 4 dead e-patterns
   (876 kills) unless p-interactions add more.
3. **L1a** (39 schemas): named base + retained row {q,w,c1,c2}, all-fresh,
   no e/p roles.  Site patterns: {q,w} ∈ {(O1,O1)} ∪ {(n,O1): n ∈ 6 named
   cap points}; {c1,c2} from {O1, S-bag, O, named6} under budgets
   (physical ≤1 row-wide incl. q,w; surplus ≤1; no duplicate named).
4. **L1b**: L1a survivors × double-row profiles × radius arm, joint
   budgets in the same arm, cross-row named landings per arm rules.
5. **L1c**: retro-L0 survivors × L1b survivors (p's and e's restored,
   outside-pair rad_ne at EA active).  Scale decided after L1b; flux
   available.
6. **L1-id**: identification layer (q/w~e, c/g~e, c/g~p·, q/w~p·, c~g);
   mini-schema local cores as in the merge layer; both-p's-on-one-row
   patterns recorded as terminal-killed by citation (no solver).

Coverage contract unchanged: every asserted constraint traces to a row
above; discrete filters cite their killing fact; K4-escape/trivialization
rules unchanged; dropped constraints are relaxations (sound for kills).
