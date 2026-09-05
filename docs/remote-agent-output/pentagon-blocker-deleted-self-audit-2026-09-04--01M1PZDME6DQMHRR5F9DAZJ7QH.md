# Self-audit of the Pentagon blocker-deleted reduction

**Project:** Erdős 97–96 formalization  
**Date:** 2026-09-04  
**Audited thread:** the work leading to the summary of
`Problem97.ATailFrontierLiveClosure.false_of_exactFourRigid221_sourceHeavy_secondOppositeLarge_pentagonBlockerDeleted`, together with the immediately adjacent generic helpers and proof-design claims I directed from that work.

## 1. Executive verdict

The work produced several genuine and useful reductions, but my prior summary assigned some of them a stronger status than the evidence justified.

The following core conclusions survive the audit:

- the apparent `fiveCycle` shortcut is circular and cannot close the target;
- the target-specific exact-cap-seven normal form is source-clean and correctly identifies the five-point strict interior;
- the cap-at-least-eight “sixth physical point” shortcut is invalid because the physical class itself has exactly five points;
- the source-neutral affine nine-hit kernel is a clean landed theorem, although no occurrence has been found in this branch;
- the exact rational local controls show that the two remaining cap-seven center cases are locally realizable, so any contradiction must use additional global cap, MEC, support-completion, or global-K4 information;
- the target remains open.

The most important corrections are:

1. The fresh-survivor/five-row-cover trichotomy was **source-audited and Lean-shaped, but not integrated into the target module**. I described it too much like a checked target theorem.
2. The bound `13 ≤ |A| ≤ 15` applies **only to the support-cover arm**, not to either fresh-survivor arm.
3. The blocker-fiber capacities and card-fifteen residue identities are **conditional finite consequences** of a pointwise four-color classification and blocker distinctness. They were not yet target-level facts.
4. I twice mixed the blocker-`v` sibling with the live blocker-deleted branch. The later arithmetic happened to remain numerically unchanged after correcting the label, but the source-label error was real and potentially dangerous.
5. I focused too heavily on the exact-cap-seven arm even though no source theorem reduces the general target to cap seven; the cap-at-least-eight part remains open.
6. A proposed general recovery corollary for the color-preserving theorem was false as stated, and one neighboring B1 proof idea I endorsed was later retracted. A separate Pro report also used a circular derivation of blocker inequality. These did not invalidate the blocker-deleted conclusions, but they reveal that I did not consistently proof-check theorem signatures before promoting proof plans.

## 2. Status taxonomy

| Result or claim | Correct status after audit |
|---|---|
| Circularity of `...fiveCycle` shortcut | **Checked and decisive** |
| Exact-cap-seven normal form | **Checked target-specific subcase** |
| Generic two-point deletion-survival helper | **Landed, source-neutral** |
| Generic fresh-survivor/support-cover helper | **Landed, source-neutral** |
| Generic color-preserving fresh/support helper | **Landed later, source-neutral** |
| Specialization of those helpers to `pentagonBlockerDeleted` | **Source-audited, not target-wired** |
| `13 ≤ |A| ≤ 15` | **Checked counting consequence in cover arm only** |
| Thirteen support-completion overlap profiles | **Conditional hand/exhaustive finite classification; not a Lean target theorem** |
| Blocker-fiber capacities `(3,2,3,3)` | **Conditional finite consequence of an unintegrated pointwise classification** |
| Card-fifteen exact fiber identities | **Conditional finite consequence; not a current target theorem** |
| Card-fourteen/card-thirteen deficit counts `4` and `10` | **Conditional combinatorics, not integrated** |
| Affine nine-hit kernel | **Landed and source-clean; no branch occurrence** |
| Closure of either fresh-survivor arm | **Open: stops at faithful-carrier/metric-core coverage** |
| Closure of support-cover arm | **Open** |
| Reduction of the whole target to cap seven | **Not proved and presently false as a status claim** |
| Main blocker-deleted target | **Still `by sorry`** |

## 3. Detailed errors and overstatements

### 3.1 High severity: I presented an unwired specialization as though it were a checked target reduction

The full-target audit found that the intended application of
`two_point_row_fresh_boundary_or_support_cover` has all of its mathematical premises available after mapping the named rows and survivor centers. However, the first literal source mismatch was that `Rigid221SourceHeavy.lean` did not import the source-neutral module. No compiled specialization theorem or target-body integration was produced.

The later theorem

```text
Problem97.ATailTwoPointRowColorPreservingFreshOrSupport.
  two_point_row_color_preserving_fresh_or_support
```

was landed at commit `d07392f52`, but it likewise remains a generic helper with no Rigid221 wiring.

My prior wording—“the full blocker-deleted hypotheses support the two-point deletion-survival construction” and “this gives the honest trichotomy”—was mathematically suggestive but status-imprecise. The correct statement is:

> A complete source audit mapped the target hypotheses to a Lean-shaped specialization of the generic two-point theorem. The generic theorem now exists, but the target specialization has not been imported, compiled, or installed in the target proof.

### 3.2 High severity: I underqualified the cardinality bound

The inequality

```text
13 ≤ D.A.card ≤ 15
```

belongs only to the no-fresh support-cover arm.

- The lower bound comes from the checked exact-card-six contradiction combined with the source lower bound.
- The upper bound comes from five card-four rows, each having exactly two points in the five-point physical cycle and therefore at most two completion points outside that cycle.

The two fresh-survivor arms do not inherit this upper bound. My old paragraph placed the bound immediately after the trichotomy and could be read as a bound on the whole target.

### 3.3 High severity: blocker-`v` and blocker-deleted source labels were confused twice

The live target has

```text
hblockerEqDeleted : centerAt xv = deleted.
```

I initially audited a sibling residual with

```text
centerAt xv = v.
```

Later, in the cap/interior occupancy calculation, I again used the blocker-`v` field and treated `v` as the fixed blocker-interior point. The correct blocker-deleted membership table is:

```text
u, xu, xv, deleted ∈ I₂,
v is the variable point in the general cover calculation,
and v ∉ I₂ in the exact-cap-seven normal form.
```

The five physical-edge interior counts are therefore, in source row order,

```text
Ku         {u,xu}:          2
Kv         {v,xv}:          1 + δ
Kxv        {xv,u}:          2
Kxu        {xu,deleted}:    2
Kdeleted   {deleted,v}:     1 + δ
```

with `δ = 1_{v ∈ I₂}`.

The numerical formulas from the mistaken report survived because swapping which one of `v` and `deleted` was fixed in the interior left the aggregate `4+δ` count unchanged. That numerical accident does not excuse the semantic mistake: source labels control which row memberships and blocker equalities may be used downstream.

### 3.4 High severity: blocker-fiber saturation was promoted beyond its premises

Let

```text
T = D.A \ Kxu.support,
β(t) = centerAt t.
```

The audited capacities are correct **provided** one already has the pointwise classification

```text
β(t) ∈ {xv, cd, cv, deleted}
```

for every `t ∈ T`, together with the required pairwise inequalities among those blocker values. Under those premises:

```text
|F_xv|      ≤ 3
|F_cd|      ≤ 2
|F_cv|      ≤ 3
|F_deleted| ≤ 3.
```

At `|A|=15`, `|T|=11`, so equality is forced in all four bounds and the row-residue identities follow.

The error was status, not arithmetic. At the time of the summary there was no target-level theorem packaging the entire four-value classification and all blocker inequalities. The later generic color-preserving theorem retains blocker colors, but it still does not by itself specialize, discharge the target-specific exclusions, or wire the residue identities into the live branch.

Thus these equations should have been labelled:

> conditional finite consequences of the desired color-preserving specialization,

not facts already forced by the current target proof.

### 3.5 High severity: I over-focused on cap seven without a global cap upper bound

The target yields a checked lower bound

```text
7 ≤ S.oppCap2.card
```

after eliminating the exact-six branch. It does **not** yield equality with seven.

A source search found no uniform upper bound on `oppCap2.card` from the current robust-surface/blocker-deleted hypotheses. The exact profile theorem available for card thirteen requires extra exact-cardinality/two-radius hypotheses absent from the generic target.

Therefore the cap-seven normal form is a valuable subcase, but it is not the full residual. My summary gave the cap-seven analysis disproportionate prominence and did not clearly state that the cap-eight-and-above branch remains entirely live.

### 3.6 Medium severity: “five surviving rows” obscured a distinctness obligation

The generic survival boundary can carry five rows whose centers are not automatically known to be pairwise distinct. The downstream faithful-carrier constructors require a separate distinctness proof, using the fresh blocker and the named survivor quad.

My wording risked conflating:

- five surviving exact row objects; and
- five pairwise-distinct surviving centers.

The latter is an additional proof obligation.

### 3.7 Medium severity: hand/exhaustive combinatorics were not distinguished from Lean theorems

The following finite classifications are useful and appear correct, but were not promoted as checked target declarations:

- one completion-overlap profile at `|A|=15`;
- two profiles at `|A|=14`;
- ten profiles at `|A|=13`;
- four labelled blocker-fiber deficit profiles at `|A|=14`;
- ten labelled blocker-fiber deficit profiles at `|A|=13`.

I should have explicitly said “finite enumeration/hand classification,” rather than allowing them to sit next to kernel-checked results without a status marker.

### 3.8 Medium severity: a requested general recovery corollary was false

I requested that the color-preserving theorem recover the older outside-`U` fresh/support theorem from a supplied alias map. The audit found a logical obstruction: a globally fresh witness may still lie in `U`, so the alias hypothesis says nothing about it. A general-`U` recovery theorem does not follow from the proposed trichotomy alone.

The implemented module correctly provides only a scoped/raw recovery corollary. This was a genuine theorem-design mistake in my request.

### 3.9 High severity: I briefly used an invalid “safe second physical deletion” count

In intermediate reasoning I suggested that sufficiently many points outside three supports would supply another safe deletion point. Two problems invalidate that shortcut:

1. a point outside the three supports can itself be one of the row centers unless those centers are separately excluded;
2. even after repairing that count, a safe point outside the physical class cannot serve as the required second **physical** deletion.

I withdrew this route in-channel, but it should be recorded because it was exactly the kind of plausible counting shortcut that can silently change the theorem being proved.

### 3.10 Low severity: a polynomial sign typo exists in the historical local checkpoint

The local historical file

```text
pentagonblocker-doublecheck-and-reduction-2026-09-04.md
```

contains the negative-control equation

```text
8c^3 - 6c - 1 = 0.
```

The actual SMT/replay used

```text
8c^3 - 6c + 1 = 0.
```

The numerical witness and replay were based on the correct `+1` equation, so this is a documentation/custody typo rather than a mathematical failure. The historical file already notes the correction, but the displayed erroneous formula remains in its narrative and should not be copied forward.

### 3.11 Medium severity: I blurred authorship and verification

The affine kernel was implemented by a Luna lane and committed at `0d985145c`. I coordinated the request and audited the result; I did not personally author the source. My old wording, “a new reusable affine terminal was also completed and committed,” was not literally false, but in a self-report it was too easy to read as personal authorship.

The accurate attribution is:

> I identified/requested the kernel; a Luna agent implemented it; independent compile and axiom checks passed.

### 3.12 Medium severity: the delivered checkpoint was already becoming stale

The v2 checkpoint with SHA-256

```text
d9c0ea38174ec2c20e8757bfd87306918a0d4da30e5f9db5042be1fe487b44f2
```

was an honest historical checkpoint and explicitly said the target remained open. Soon afterward, however, the color-preserving theorem landed and further cap/fiber audits changed the exact current frontier. I should have called it a historical checkpoint rather than the current authoritative state.

### 3.13 Medium severity: I omitted unresolved exact consumer checks

At the point of the prior summary, the following cap-seven checks had been explicitly requested but had not been completed:

- whether cap-intersection bounds exclude `cx` from `Ku` and `Kxv`, sharpening the cover to `cx ∈ Kdeleted ∨ cx ∈ Kv`;
- whether the three known cap-ordered equidistance relations instantiate `false_of_orderedCap_three_equidistant_betweenness_cycle`;
- whether either sharpened row triple feeds the geometric core behind the proved blocker-`v` `vRowCircleWedge` theorem;
- whether the target-specialized pointwise color theorem yields `centerAt cx = cd ∨ centerAt cx = cv`.

I should have listed these as pending rather than ending the summary as though the remaining reduction had been fully de-risked.

### 3.14 Separate neighboring error: an invalid B1 apex-nonmembership proof spine was endorsed and retracted

This does not alter the Pentagon blocker-deleted analysis, but it is part of the immediately adjacent proof-design work I directed.

The proposed premise

```text
S.oppApex2 ∉ first.uPacket.B₁
```

was called sufficient to close a minimality-center arm. The independent audit correctly observed that the erase obstruction also requires the apex to lie in the unique four-class at that center, while the canonical support identifies that class with `B₁`. The proposed nonmembership gives the opposite fact. The sufficiency claim was retracted and no theorem was formalized.

### 3.15 Separate neighboring error: a Pro two-deletion residual used circular reasoning

A Pro report proposed:

1. obtain a directed cross-deletion omission using
   `exactFour_twoDeletion_crossOmission`;
2. use that omission to prove the deleted-source blockers are unequal.

But `exactFour_twoDeletion_crossOmission` already requires deleted-blocker inequality as an input. The derivation was circular. The honest current split is:

```text
blockers equal
or
(blockers unequal and one-way cross omission).
```

Again, this did not contaminate the blocker-deleted conclusions, but it reinforces the main process lesson of this audit: theorem signatures must be checked before a proof plan is promoted.

## 4. Claims that survive, with corrected boundaries

### 4.1 The `fiveCycle` shortcut is genuinely circular

The target is declared before `...fiveCycle`, so a literal application also fails declaration visibility at the target’s source location. More importantly, the dependency graph is:

```text
fiveCycle
  → pentagon
  → pentagon_blockerCenterSplit
  → pentagonBlockerDeleted.
```

The relevant declarations all inherit `sorryAx` through this cycle. Reordering or wrapping does not remove the mathematical dependency.

### 4.2 The cap-at-least-eight sixth-physical-point route is refuted

The “present sixth point” arm searches inside

```text
C = SelectedClass D.A S.oppApex2 P.rho,
```

while the live target assumes `C.card = 5` and already names five distinct physical points. A larger opposite cap does not enlarge this selected physical class. Hence `oppCap2.card ≥ 8` does not activate that arm.

### 4.3 The exact-cap-seven normal form is solid

Under

```text
S.oppCap2.card = 7,
```

the checked theorem

```text
exactFourRigid221_sourceHeavy_pentagonBlockerDeleted_card_eq_seven_normal_form
```

provides, with `cx = centerAt xu` and `I = capInteriorByIndex oppIndex2`:

```text
I.card = 5,
cx ∉ C,
cx ∈ I,
v ∉ I,
I = {u, deleted, xv, xu, cx},
Kxu.support ∩ C = {xu, deleted}.
```

Thus `cx` is the unique strict-interior point outside the physical five-class in this exact-cap-seven subcase.

A subtle point I should continue to preserve: the tagged off-class theorem is a disjunction over which named center has the off-class/strict-interior role; it does not assert simultaneous equalities among `cx`, `cd`, and `cv`.

### 4.4 The local two remaining center cases are realizable

Exact rational controls verify strict convexity, the stated direct cyclic orders, and all displayed equal-distance relations in both cases:

```text
centerAt v = u
```

and

```text
centerAt v = xu.
```

Therefore no proof using only those local circle equalities and the immediate five-point order can close either arm. A valid closure must use additional source information: exact cap cardinality/occupancy, MEC/surplus structure, support completions, minimality, or a named global-K4 row.

### 4.5 The affine kernel is clean but currently unused

At commit `0d985145c`, the following source-neutral declarations compile with only the standard project axioms:

```text
Problem97.ATailFrontierLiveClosure.equal_radius_two_circle_opposite_sum
Problem97.ATailFrontierLiveClosure.false_of_nine_hit_affine_pattern
Problem97.ATailFrontierLiveClosure.false_of_nine_selected_four_classes_affine_pattern
```

Repository and indexed searches found no downstream occurrence. It is a valid theorem-bank asset, not progress on the live target until a source-faithful nine-membership pattern is produced.

### 4.6 The cover-arm cardinality and profile arithmetic are valid

For the support-cover arm, the exact cap possibilities are:

| `|A|` | `(oppCap2, oppCap1, surplusCap)` | strict interiors `(I2,I1,Is)` |
|---:|---|---|
| 13 | `(7,4,5)` | `(5,2,3)` |
| 14 | `(8,4,5)` | `(6,2,3)` |
| 14 | `(7,5,5)` | `(5,3,3)` |
| 14 | `(7,4,6)` | `(5,2,4)` |
| 15 | `(9,4,5)` | `(7,2,3)` |
| 15 | `(8,5,5)` | `(6,3,3)` |
| 15 | `(7,6,5)` | `(5,4,3)` |
| 15 | `(8,4,6)` | `(6,2,4)` |
| 15 | `(7,5,6)` | `(5,3,4)` |
| 15 | `(7,4,7)` | `(5,2,5)` |

No profile is eliminated by this arithmetic alone, and none of the thirteen completion-overlap profiles is immediately excluded without further completion-to-interior incidence information.

## 5. Corrected current branch tree

The strongest honest current description is:

```text
open blocker-deleted target
│
├─ checked exact-six contradiction
│    └─ therefore 7 ≤ oppCap2.card
│
├─ source-audited use of generic two-point deletion-survival machinery
│    ├─ fresh/color-preserving survivor after deleting xu
│    │    └─ generic exact-row / faithful-carrier producer
│    │         └─ OPEN: no MetricCoreAlternative/source-specific terminal
│    │
│    ├─ fresh/color-preserving survivor after deleting deleted
│    │    └─ generic exact-row / faithful-carrier producer
│    │         └─ OPEN: no MetricCoreAlternative/source-specific terminal
│    │
│    └─ no-fresh support/color residual
│         ├─ support cover by Ku,Kxu,Kdeleted,Kv,Kxv
│         │    └─ 13 ≤ |A| ≤ 15 in this arm only
│         ├─ conditional completion-overlap classification
│         └─ conditional blocker-fiber saturation
│              └─ OPEN: target specialization and terminal absent
│
└─ exact-cap-seven subcase
     ├─ checked five-point interior normal form
     ├─ remaining center cases locally realizable
     └─ OPEN: needs extra global support/cap/MEC/K4 input
```

The cap-at-least-eight branch is not removed by any current source theorem.

## 6. What I missed in the strategic assessment

### 6.1 Neither survivor arm was close to a terminal

The existing generic consumers can package faithful-carrier or six-center residuals, and one U3 obstruction packet is also available. None gives `False`. The first missing object is a source-faithful `MetricCoreAlternative` occurrence or an equivalent finite classifier with enough named support/order data.

I should not have described the fresh arms merely as “five surviving rows”; their downstream closure problem is substantial.

### 6.2 The no-fresh arm needs information preservation before counting becomes useful

The ordinary support-cover theorem loses the pointwise blocker color. The later color-preserving theorem fixes the generic information-loss problem, but the live branch still needs:

- a target specialization;
- exclusions of the impossible blocker colors for the chosen source, using cap/row bounds;
- exact support transport;
- a terminal pattern or finite classifier.

The counting alone does not close the arm.

### 6.3 There is no current path from the affine theorem to this branch

I found a powerful source-neutral affine obstruction, but no concrete row-role assignment in the blocker-deleted packets supplies its nine required memberships. This should have been stated more prominently.

### 6.4 The cap-seven geometry should be used as a negative boundary, not as the presumed main closure route

The rational controls show that the obvious local bisector/order contradiction does not exist. Further local theorem mining without adding global source data is low leverage.

### 6.5 The general cap-at-least-eight residual needs an independent strategy

Because exact-five physical cardinality kills the sixth-physical-point shortcut and there is no opposite-cap upper bound, the larger-cap branch cannot be treated as a minor extension of cap seven. It needs either:

- a cardinality-independent color/support classifier;
- a global K4/MEC consequence that grows stronger with the cap;
- or a new cap-profile/row-completion theorem.

## 7. Corrected proof ledger

### Landed and checked

- Source-neutral two-point selected-row deletion-survival helper, reported at commit `817fdeba`.
- Source-neutral fresh-survivor/support-cover helper, reported at commit `448dc6a`.
- Source-neutral color-preserving fresh/support helper:
  `Problem97.ATailTwoPointRowColorPreservingFreshOrSupport.two_point_row_color_preserving_fresh_or_support`, commit `d07392f52`.
- Affine nine-hit kernel, commit `0d985145c`.
- Target-specific exact-cap-seven normal form in `Rigid221SourceHeavy.lean`.
- Target-specific exact-six contradiction and resulting lower bound `7 ≤ oppCap2.card`.

### Source-audited but not integrated

- The target-specific two-point deletion-survival specialization.
- The two fresh-survivor branches with the named four-center survivor quads.
- The five-row support-cover arm.
- The target-specific color-preserving specialization.
- Distinctness needed to turn surviving rows into a faithful carrier.

### Conditional finite consequences

- `13 ≤ |A| ≤ 15` in the support-cover arm.
- Thirteen completion-overlap profiles.
- Four blocker fibers with capacities `(3,2,3,3)`.
- Exact card-fifteen row-residue identities.
- Four/card-fourteen and ten/card-thirteen deficit profiles.

### Still open

- Every terminal after the two fresh-survivor branches.
- Every terminal after the no-fresh support/color branch.
- The general cap-at-least-eight target.
- A source occurrence of the affine kernel.
- The precise cap-intersection/ordered-cap/wedge checks requested in the final cap-seven audit.
- The main target theorem itself.

## 8. Revised confidence assessment

- **High confidence:** circularity rejection; exact-cap-seven five-point interior identity; cap-at-least-eight sixth-physical-point refutation; affine kernel trust status; target remains open.
- **Moderate-to-high confidence:** source audit of the generic two-point specialization and cover cardinality bound, provided they are explicitly labelled unwired.
- **Moderate confidence:** thirteen completion profiles and fiber deficit classifications; the arithmetic is straightforward and audited, but they remain conditional and unformalized in the live branch.
- **Low confidence as a closure route:** local cap-seven circle geometry alone, affine occurrence without further source data, or any argument that silently reduces the full target to cap seven.

## 9. Corrected replacement summary

The blocker-deleted leaf is still open. The later `fiveCycle` theorem cannot close it because its no-sixth branch recurses through `pentagon → blockerCenterSplit → pentagonBlockerDeleted`, and the declarations inherit `sorryAx`.

A family of clean source-neutral two-point deletion-survival theorems now exists, including a color-preserving version at commit `d07392f52`. A complete source audit indicates that the blocker-deleted hypotheses should specialize to two fresh/color-preserving survivor alternatives or a five-row support/color residual. That specialization has not been imported or compiled in `Rigid221SourceHeavy`, so it is not yet a theorem on the live target.

Only the support-cover alternative gives `13 ≤ |A| ≤ 15`. The two survivor alternatives have no comparable upper bound and presently stop at faithful-carrier/metric-core coverage obligations.

In the exact-cap-seven subcase, the checked normal form proves

```text
I = {u, deleted, xv, xu, centerAt xu},
```

with `v ∉ I`, and `centerAt xu` is the unique strict-interior point outside the five-point physical class. Exact rational controls realize both remaining `centerAt v = u` and `centerAt v = xu` local cases, so the local equal-distance/order data alone are nonterminal.

In the no-fresh branch, the capacities `(3,2,3,3)`, the card-fifteen residue identities, and the card-fourteen/card-thirteen deficit counts are valid only after supplying the target-specific pointwise blocker classification and blocker distinctness. They are not current facts of the target proof.

The affine nine-hit kernel at `0d985145c` is source-clean and reusable, but no occurrence has been found in this branch.

The full unresolved frontier is therefore:

- target-wiring and source specialization of the color-preserving two-point theorem;
- a terminal or finite classifier for each fresh-survivor arm;
- a terminal or finite classifier for the five-row support/color residual;
- an independent treatment of the cap-at-least-eight branch;
- and the remaining exact cap-seven cap-intersection/order/wedge checks.

## 10. Evidence references

The principal nthdegree reports used in this audit are channel messages:

- `#12224`, `#12231`: exact `fiveCycle` call graph, visibility, and `sorryAx` cycle;
- `#12248`: full-target two-point specialization audit and cover-only `13–15` bound;
- `#12264`: true residual tree and separation from the off-class sibling branches;
- `#12268`, `#12282`: survivor-arm consumer audit and missing metric-core coverage;
- `#12287`, `#12298`: exact rational cap-seven negative controls;
- `#12322`: rejection of the cap-at-least-eight sixth-physical-point route;
- `#12373`, `#12374`, `#12381`: cap arithmetic, blocker-label error, and correction;
- `#12375`: conditional blocker-fiber capacities and saturation caveat;
- `#12378`: exact cap-seven normal form and target/source status;
- `#12405`, `#12416`: color-preserving theorem, recovery-corollary obstacle, and landed module;
- `#12406`, `#12407`: retraction of the neighboring B1 apex-nonmembership proof spine;
- `#12417`, `#12427`, `#12450`: absence of a global cap-seven reduction/upper bound;
- `#12529`, `#12533`: circularity correction in the neighboring two-deletion Pro residual.
