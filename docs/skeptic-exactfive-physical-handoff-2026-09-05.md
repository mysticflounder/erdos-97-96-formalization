# Math Skeptic Audit: physical handoff and uniform strategy

**Targets:** `docs/references/exactfive-physical-handoff-original-2026-09-05/` and
`docs/references/exactfive-uniform-closure-strategy-2026-09-05.md`.
**Date:** 2026-09-05.
**Verdict:** NEEDS WORK — ten additional Lean theorems check; production integration and the uniform geometric theorem remain open.
**Claims audited:** ten Lean declarations and eight grouped geometry, graph, algebra, and evidence claims below.

## Summary and provenance

All eight ZIP manifest entries verify. The nine original files are preserved
byte-for-byte. The separately supplied uniform strategy is also preserved
byte-for-byte. Its script/output payload hashes and both embedded negative-control
payload hashes verify after extraction.

The supplied retained-double-deletion draft fills the missing artifact noted in
the [earlier audit](skeptic-cap-radius-drop-proofs-and-formalization-2026-09-05.md).
All five of its theorems elaborate against the current project imports, and
all five new circle-power theorems elaborate as well. Every named axiom closure
contains exactly `propext`, `Classical.choice`, and `Quot.sound`.
The bypass draft has one missing-module-docstring warning; the circle-power
draft has one unused-`hleg` warning. Archived bytes were not edited.

The radius-drop scalar file is byte-identical to the six-theorem source checked
in the earlier checkpoint; it was not checked again. The new validation record
is [here](audits/2026-09-05-exactfive-physical-handoff-validation.json).
The lane base is `c4ac26b1ea8e08dd74d0e1d4f7bf497c315339ba`. The handoff,
bypass header, and strategy cite different historical revisions; the receipt
records those pins separately from current source hashes.

## Checked Lean declarations

These are **PROVEN — Lean-formalized**, with the exact supplied signatures.
They are preserved as reference sources, not installed in the production
aggregate.

| Namespace | Declarations |
|---|---|
| `Problem97.ExactFiveRetainedDoubleDeletion` | `exists_selectedFourClass_of_doubleDeletion`; `secondApex_doubleDeletion_of_normalForm`; `exists_secondApex_row_omitting_originalPair`; `exists_third_full_radius_of_hardSourceSwap`; `exists_physicalNormalForm_reselection` |
| `ExactFiveCirclePowerScalar` | `circle_power_identity`; `first_power_eq_of_second_circle`; `first_radius_sq_lt_of_second_circle_of_chord_side`; `first_center_outside_second_disk`; `leg_lt_base_of_nonacute` |

The first group is already checked with the project data types, rather than
only a scalar abstraction. Its final statement still returns a weak normal
form. The second group assumes its coordinate and sign hypotheses explicitly.

## Findings

### F1: The bypass compiles, but its final consumer must regenerate strict freshness

- **Location:** `ExactFiveRetainedDoubleDeletion.lean:182` and `:230`; `formalization-request.md:8`.
- **Quote:** “Rebuild the dependent common-deletion packet/normal form; regenerate the strict fresh source after changing the row.”
- **Stated label:** unelaborated integration candidate.
- **Actual label:** PROVEN — Lean-formalized intermediate; integration remains open.
- **Verdict:** OK, with a precise remaining caller step.

The extractor preserves both omissions inside the double-erased carrier.
`secondApex_doubleDeletion_of_normalForm` transports the existing witness
through either orientation. `replaceSecondRow` preserves the first row and
canonical retained-blocker support while replacing the second row.

`physicalNormalFormWithSecondRow` intentionally sets `fresh := deleted`.
This is permitted by the weak normal-form type; it is not strict freshness.
Apply `nonempty_strictThreeCenterAlternative` to the newly constructed packet
and normal form, then dispatch its new strict-fresh or tight-cover alternative.
Do not reuse the former fresh point or its omission proof. The draft's return
type does not claim this last integration step, so this finding is not a
refutation of the checked theorem.

The draft has no backward import of `Rigid221Closure`. No production caller
was changed during this audit. In particular, the five-incidence dependency
has not been removed. Audit the existing tight-cover consumer's approved
native trust separately when wiring that branch; the small helpers' core-only
closures do not certify the resulting aggregate.

### F2: Circle-power signs are correct; geometric transport remains necessary

- **Location:** `proofs-and-formalization.md:63–176`.
- **Quote:** “The same source-global subchord theorem places every carrier point outside the closed first cap on the `O` side of the chord.”
- **Stated label:** prose theorem and proposed source bridge.
- **Actual label:** PROVEN conditional pen-and-paper implications; CONJECTURED at the assembled source interface.
- **Verdict:** CLARIFY.

For `h>0` and `x<u`, the checked identity gives first-circle power
`2*h*(x-u)<0`. The source theorem still needs the actual reflected coordinates,
opposite chord sides, strictness from convex independence, and transport of
every exterior carrier point. The opposite-apex disk exclusion needs the
strict acute-apex inequality from the preceding handoff. Endpoint exclusions
need the ordered placement `L<q<e<w<R` and the corresponding cap nonacute
inequalities. No false inequality direction was found, but none of these
source adapters was elaborated here.

### F3: Minimum-pair results must retain admissibility and rebind the source roles

- **Location:** `proofs-and-formalization.md:178–241`.
- **Quote:** “This result must be used **upstream**, before fixing the dependent source pair.”
- **Stated label:** prose selection argument and reconstruction requirements.
- **Actual label:** PROVEN conditional pen-and-paper argument; formal selector remains unimplemented.
- **Verdict:** OK with explicit guards.

Minimize among distinct pairs in the strict first-class slice whose joint
deletion preserves the second-apex row. An intermediate class point gives a
shorter admissible pair because a row omitting it cannot contain both endpoints
at their distinct second-apex distances. Individual deletion survival alone
is not the admissibility condition.

Consecutiveness is within the class slice, not the entire carrier. The
cap-cardinality-five double-hit exclusion applies only after this reselection.
For the consequences about actual blocker rows, retain blocker/apex inequality
and canonical-support equality. Rebuild the frontier, reclassify the actual
blockers, and regenerate freshness; the old named blockers need not survive.

### F4: The extra MEC-vertex blocker is a producer, with an open consumer

- **Location:** `proofs-and-formalization.md:243–265`.
- **Quote:** “It is **not yet a terminal contradiction**.”
- **Stated label:** source-owned global witness.
- **Actual label:** PROVEN conditional pen-and-paper producer; source bridge and terminal are open.
- **Verdict:** OK.

The argument uses total `CriticalShellSystem H`, a named MEC vertex in its
actual row, robust-apex exclusions, and canonical support equality when
centers coincide. These are essential inputs. After pair reselection, rebind
the source and blocker names before asserting exclusion from the old center
set. A row through a point outside the small disk is not itself contradictory.

### F5: The thirty-point control is verified and still fails global K4

- **Location:** `exact-evidence.md:3–12` and `:363–500`.
- **Quote:** “NOT global K4, NOT a total CriticalShellSystem, NOT CounterexampleData.”
- **Stated label:** exact local negative control.
- **Actual label:** EMPIRICALLY VERIFIED — exact rational finite model.
- **Verdict:** OK.

Extracting the documented JSON and checker reproduces their advertised hashes.
The checker passes all 840 strict supporting-edge tests and recomputes every
positive heavy radius class. Its record matches the embedded expected record.
The unit MEC has exactly `O,L,R` on its boundary; closed-cap sizes are 9, 13,
and 11. Exactly seven named centers have K4; the other 23 do not. The only
unique-four centers have supports covering seven points and omitting the MEC
vertices. Thus the data cannot supply total `H` or `CounterexampleData`.

The fresh-source/retained-blocker alias is explicit and passes the local
contract. The erased source-center must not be counted as a remaining carrier
point. The checker is embedded executable code, not a separate ZIP member;
run its extracted copy without `python -O` and inside the declared run tree.

### F6: The uniform strategy has a valid conditional graph reduction, not a geometric barrier

- **Location:** uniform strategy lines 47–83 and 103–115.
- **Quotes:** “Under D.Minimal, every vertex e of R has an incoming edge.”
  “This target is OPEN.”
- **Stated label:** graph reduction and unproved geometric target.
- **Actual label:** PROVEN conditional pen-and-paper reduction; CONJECTURED uniform geometric barrier.
- **Verdict:** OK, with source packaging still required.

Given common rows away from `O` and each of the five rows `E.erase e` at `O`,
strong connectivity supplies a simple path from `O` to `e`. The last anchor
before `e` gives a return edge, so the finite return relation has a cycle of
length two through five. `GeneralCarrierAbstractRowSystem.system_supportMinimal`
and `.system_supportStronglyConnected` supply the corresponding source APIs.

Implement the family by taking one baseline `FaithfulCarrierPattern` with
gauge center `V ≠ O` and overriding only `classAt O`, preserving every other
row. Its gauge fields are in `U1CarrierInjection.lean:1492–1503`; the
prescribed-row constructor at `:1663` chooses the other rows globally. Its
public conclusion does not expose the gauge-center equality, so the new
interface must retain that equality or an explicit `gaugeCenter ≠ O` proof.
The unchanged gauge row preserves its witness. This is a Lean packaging step,
not a counterexample to the abstract graph argument. A blocker-map cycle
alone does not preserve K4 at every retained carrier center.

At most five anchors does not bound the lengths or overlap of their return
paths. The angular-order lemma needed for the eleven sign intervals also
requires an explicit boundary-order proof. Even with that lemma, finite sign
labels do not permit deletion or contraction of repeated states. The decisive
no-return cut, path invariant, or sound shortening theorem is still absent.

### F7: The ten-bisector bound needs a separate blocker/apex exclusion

- **Location:** uniform strategy lines 89–115.
- **Quote:** “Thus at most TEN carrier points other than O have any tie among their five distances to E.”
- **Stated label:** geometric deduction.
- **Actual label:** PROVEN conditional pen-and-paper bound; source lemmas not elaborated here.
- **Verdict:** OK with an explicit guard for the blocker-count corollary.

Each anchor-pair bisector contains `O`; convex independence permits at most
one other carrier point on that line. Ten pairs give the stated bound.
Before deducing at least three distinct actual blockers, exclude `O` as an
anchor's blocker: deleting one point of the five-class leaves four points at
`O`, contradicting `H.no_qfree_at` if that blocker were `O`. The existing
`actual_blocker_ne_of_deletion_survives` interface supports this step.

### F8: Split algebra and finite regressions do not certify the reported finite UNSAT cases

- **Location:** uniform strategy lines 121–171 and 212–364.
- **Quote:** “The proof is the argument in Sections 3 and 5, not inference from these finite tests.”
- **Stated label:** general algebraic proof strategy, exact regressions, and certificate design.
- **Actual label:** PROVEN conditional multiplier contradiction; general split-basis argument remains unformalized; EMPIRICALLY VERIFIED finite regressions.
- **Verdict:** OK at that scope.

The rational multiplier criterion is sound under strictly positive split
weights: `Mw=0` and nonzero componentwise-nonnegative `Mᵀy` contradict each
other. The general inverse requires the stated split/slack dual-basis
calculation for arbitrary size. Its finite regression is not a substitute
for that calculation or its Lean formalization.

The strategy script and expected output pass both advertised hashes. Replay
reproduces the output byte-for-byte: 2,296 coefficient identities for sizes
4–24; 65,536 abstract graphs; 165,888 reachability implications; and 29,346
graphs strongly connected for every omitted-anchor choice. The toy multiplier
certificate also passes. Separately, the circle-power checker reproduces 243
rational circle cases and 86 strict inner-side cases.

No independently checked n=12 or n=13 UNSAT certificate was supplied or
validated in this checkpoint. The strategy refers to solver-reported results
from another handoff. The present exact regressions do not certify them,
bound the physical carrier size, or establish an all-cardinality contradiction.

## Source state, upgrade drift, and next step

No production Lean source, proof-spine edge, or admission changed. No full
build, fresh aggregate axiom audit, or promotion was performed. Historical
“unelaborated” statements remain untouched in the source archives; the new
receipt records the ten checked statements and their two warnings explicitly.

The immediate implementation supported by this audit is to install the
checked bypass with strict-fresh reconstruction and inspect the resulting
caller dependencies. For the uniform route, first formalize the five row
overrides/return-cycle interface and blocker/apex exclusion. The remaining
research target is a source-derived barrier to those return paths. A new
broad cardinality census has no uniform closure force without a proved bound.
The physical terminal and its omission branches remain open.
