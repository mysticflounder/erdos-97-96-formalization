# Blocker-annotation existence — resolution by minimal-counterexample deletion (2026-07-28)

Author: orchestrator. Status: AUDITED-WITH-PATCHES (math-skeptic
audit 2026-07-28, verdict NEEDS WORK with patches F1-F9; all patches
applied 2026-07-28, re-audit not required per the skeptic's own
verdict — patches were exact and verified against source before
application). Resolves the `{{NEEDS_PROOF}}` item "blocker-annotation
existence lemma" from
`docs/p97-counterexample-search-design-2026-07-28.md` §6/§8 and the
R-FIBER4 citation caveat (`census/p97_search/rules.py`), by REPLACING
the per-configuration existence claim with a composition theorem that
is what the lane actually needs. Citable as of this status.

## 1. What the census needs

A blocker annotation (`census/p97_search/annotations.py`) on a node
(n, k, S) is a total map c with (B1) x ∈ S[c(x)] and c(x) ≠ x for all
x. Blocker-annotated cells enumerate only annotated objects, so their
published per-cell claims are conditional on annotation EXISTENCE.
Two observations pin what "existence" means here:

- **(E1) B1-map existence ⟺ min in-degree ≥ 1.** Define
  indeg(x) = |{y : x ∈ S[y]}|. If every x has indeg(x) ≥ 1, choose
  c(x) = any y with x ∈ S[y]; then x ∈ S[c(x)], and c(x) ≠ x is
  automatic from (D1) x ∉ S[x]. Conversely a B1 map witnesses
  indeg(x) ≥ 1 at every x. PROVEN (immediate).
- The per-configuration claim "every convex K4 configuration, with
  every witness system, has min in-degree ≥ 1" is NOT provable by
  counting (total incidence Σ|S[y]| ≥ 4n says nothing about
  concentration) and is not needed. It remains CONJECTURED at fixed
  n > 9 (Corollary D9, §3, PROVES it unconditionally at n = 9) and is
  not used below.

## 2. Setting

A **K4 configuration** is a finite nonempty A ⊂ ℝ² with ConvexIndep A
(convex position) and HasNEquidistantProperty 4 A (every point of A
has ≥ 4 points of A equidistant from it). A **witness system** S for A
chooses, for each y ∈ A, one class S(y) ⊆ A ∖ {y}, |S(y)| ≥ 4, all of
S(y) on one circle centered y. Every K4 configuration admits at least
one witness system (choice per point). The census node of (A, S) is
its incidence abstraction (`census/p97_search/node.py`). Exact census
cells (`cells.py`) admit only nodes with |S[p]| == k exactly; a
witness system's classes must be chosen 4-element to land in one.

Banked floor (cited, not reproven): a K4 configuration has |A| ≥ 9 —
`counterexample_card_ge_nine` (design doc §6, k = 4-specific,
unconditional).

## 3. Deletion lemma

**Lemma D.** Let A be a K4 configuration with witness system S, and
suppose x ∈ A has indeg(x) = 0, i.e. x ∉ S(y) for every y ∈ A ∖ {x}.
Then A′ = A ∖ {x} is a K4 configuration, and S restricted to A′ is a
witness system for it.

*Proof.* A′ ⊆ A is in convex position (a subset of a convex-independent
set is convex-independent: p ∉ conv(A ∖ {p}) ⊇ conv(A′ ∖ {p}) for
p ∈ A′; membership in a smaller hull would contradict membership in
the larger). For each y ∈ A′: its class S(y) satisfies x ∉ S(y) by
hypothesis, so S(y) ⊆ A′ ∖ {y} with |S(y)| ≥ 4 unchanged, all on one
circle centered y — so y still has ≥ 4 equidistant points of A′, and
S(y) is an unchanged witness class. A′ ≠ ∅: pick any y ∈ A ∖ {x} (A is
nonempty and, since x has indeg 0, x cannot be A's only point — S(y)
alone contributes |S(y)| ≥ 4 points of A ∖ {y} distinct from x), so
|A| ≥ 5 and A′ = A ∖ {x} has ≥ 4 points. ∎

**Corollary D9 (n = 9 unconditional existence).** Every K4
configuration with |A| = 9 has, for every witness system, min
in-degree ≥ 1 (hence a B1 map, by E1): an in-degree-0 point would give
an 8-point K4 configuration by Lemma D, contradicting the |A| ≥ 9
floor. PROVEN (given the banked floor).

## 4. Composition theorem (what discharges the conditional claims)

**Theorem C.** Fix N ≥ 9. Suppose that for every n with 9 ≤ n ≤ N the
census coverage proves: no B1-annotatable realizable census node with
n points and k = 4 exists — where "coverage at n" means (i) at n = 9
and any other frameless-covered n, the FRAMELESS exact cell (4, n),
and (ii) at n > 9, all cap-profile cells (4, n, profile) for every
profile in `profiles_for(n, 4)`, whose completeness as a frame is the
banked `nonempty_surplusCapPacket_of_K4` (9 < |A|, no minimality).
Then NO K4 configuration with |A| ≤ N exists — unconditionally, with
no annotation-existence caveat.

*Proof.* Suppose not; among K4 configurations with |A| ≤ N pick A of
MINIMUM cardinality n, and pick a witness system S with |S(y)| = 4
exactly for every y ∈ A (possible: A's HasNEquidistantProperty gives
each y a class of ≥ 4 equidistant points; any 4-element subset of it
is still a subset of one circle centered y, so still a valid class —
this is the choice the exact census cells require, §1). By the floor,
n ≥ 9. If some x ∈ A had indeg(x) = 0 under S, Lemma D would give a
K4 configuration of size n − 1 ≤ N, still with |S(y)| = 4 exactly for
every surviving y (Lemma D does not alter surviving classes): if
n = 9 this contradicts the floor, and if n > 9 it contradicts
minimality of n. So min in-degree ≥ 1, and by E1 the node of (A, S) is
B1-annotatable. It is realizable by construction, has n points, k = 4,
exact witness classes, and (for n > 9) carries some closed cap profile
in `profiles_for(n, 4)` by frame completeness — so it lies in a cell
the coverage hypothesis (i)/(ii) requires to be covered, contradicting
that cell's claim. ∎

**Scope notes (load-bearing, keep with any published claim).**

- Theorem C needs coverage of the FULL range 9..N. A single covered
  cell (fixed n, fixed profile) discharges nothing by itself: the
  minimal counterexample may live at a smaller n or another profile.
  Per-cell claims therefore REMAIN annotation-conditional as stated;
  only the range-closure composes them into an unconditional claim.
- The witness-system choice is quantified correctly, but not
  arbitrarily: Theorem C picks ONE witness system for the minimal A,
  with |S(y)| = 4 exactly for every y (the exact-4 choice, forced by
  what exact census cells admit, §1) — any 4-element subset of a
  ≥4-point equidistant class is still a valid witness class, so this
  choice always exists and its resulting single node lands in an
  exact cell. No "for all systems" existence claim is used anywhere.
  Census cells enumerating all canonical B1-annotatable nodes with
  exact witness classes is a REQUIREMENT the coverage hypothesis
  places on Phase-2/3 generation, not a property already established:
  Phase-2 generators are partial and completeness is Phase-3 work.
- Deletion is used only inside the minimality argument. No claim is
  made that deletion preserves cap profiles or cell membership (it
  does not); minimality, not iterated deletion, carries the proof.
- Lemma D deletes ONE point and does not touch any surviving class,
  so no re-choice of witness classes is needed.
- k-generality: Lemma D and Theorem C use k = 4 only through the
  banked floor and the cap-profile frame. `card_ge_five_of_K4`
  (`Counting.lean:27`) is HARD-CODED to k = 4, not k-general — it is
  NOT the source of a k = 3 floor. The general counting argument gives
  floor k+1 (= 4 at k = 3, not 5). For the k = 3 control arm, the same
  Lemma D / Theorem C proofs hold with this k+1 floor in place of the
  k = 4 floor's 9, giving the same composition with 4 in place of 9 —
  PROVIDED a k = 3, floor-4 statement is proven first (trivial: same
  counting shape as the k = 4 floor, at the smaller bound); no such
  statement is banked yet, so the k = 3 composition is not usable
  until it is.

## 5. Consequences for lane bookkeeping

1. R-FIBER4's citation caveat stays TRUE as written (per-cell claims
   are annotation-conditional) but the {{NEEDS_PROOF}} existence
   lemma is PARTIALLY superseded for the lane-level target claim: "no
   counterexample with n ≤ N" follows from covered cells via
   Theorem C with no unproven annotation-existence hypothesis — for
   the BARE-B1 semantics this note actually proves (E1: x ∈ S[c(x)],
   c(x) ≠ x). It does NOT supersede any richer semantics a rule might
   need; the R-FIBER4 caveat's "intended geometric semantics" phrase
   is broader than BARE-B1 and stays open. Standing rule (new, binding
   on future rule design): no annotated-node census rule may assume
   more of a blocker annotation than BARE-B1 without its own existence
   proof for that richer semantics — this note discharges BARE-B1
   only.
2. Publishing rule: any published unconditional non-existence claim
   must state its range [9, N] and cite coverage of every cell in the
   range plus Theorem C. Kernel gate applies to the floor plus the
   three frame declarations cited (`counterexample_card_ge_nine`,
   `nonempty_surplusCapPacket_of_K4`, `capTriple_caps_card_ge_four`,
   `Problem97.SurplusCapPacket.capSum`) — four Lean theorems, not two.
   The floor is cited at `docs/97-rvol-full-prose-proof-2026-07-13.md:219`
   (stale record) and was kernel re-checked fresh 2026-07-28
   (`proof-blueprint axioms Problem97.counterexample_card_ge_nine` →
   exactly {propext, Classical.choice, Quot.sound}); the three frame
   declarations were kernel-checked to the same core-axiom set per
   HANDOFF-2026-07-28.md §1 (R-CAPGE4 kernel gate).
3. Lean target (follow-up, well-scoped): formalize Lemma D
   (`K4_delete_of_indeg_zero`: ConvexIndep (A.erase x) +
   HasNEquidistantProperty 4 (A.erase x) from indeg-0) and Corollary
   D9. Theorem C's census-coverage hypothesis is a statement about
   the Python bank, so C itself stays a paper theorem over banked
   Lean inputs, like the per-cell claims themselves.
4. Profiled cells currently admit cap-annotated objects only
   (`iterate.py` raises on cap+blocker combined). Theorem C's coverage
   hypothesis (ii) requires, at n > 9, covering all cap-profile cells
   as B1-annotatable nodes; if a future Phase-3 profiled encoding also
   needs blocker structure on the same node, a combined cap+blocker
   annotation mode must be added to `iterate.py` first — it does not
   exist yet.

## 6. Honest gap list

- The banked floor `counterexample_card_ge_nine` and frame
  `nonempty_surplusCapPacket_of_K4` are cited, not reproven here;
  both are kernel-checked (core axioms only, 2026-07-28).
- HasNEquidistantProperty semantics VERIFIED against the formal
  definition (2026-07-28, orchestrator):
  `HasNEquidistantPointsAt n A p := ∃ r > 0, ((A.filter fun q ↦
  dist p q = r).card ≥ n)` and `HasNEquidistantProperty n A :=
  ∀ p ∈ A, HasNEquidistantPointsAt n A p` (formal-conjectures
  `FormalConjectures/ErdosProblems/97.lean:34,41,48`); per-point
  existential radius, p auto-excluded since r > 0. Lemma D re-checked
  against it: for y ∈ A′ the filter set over A′ at the same r_y
  contains y's chosen class S(y) (which avoided x), so its card stays
  ≥ 4 whether S(y) is the full circle set or a chosen subset.
- Per-configuration min-in-degree ≥ 1 at fixed n > 9 remains
  CONJECTURED and unused (n = 9 is PROVEN, Corollary D9).
- AUDITED 2026-07-28 (math-skeptic, verdict NEEDS WORK, patches
  F1-F9); all patches applied same day (§1 exact-4 witness system and
  scope-note rewrite = F4/F9, Lemma D's A′≠∅ argument = F2, §5 items
  1/2/4 = F1/F6/F5, k-generality floor = F7, §1 wording = F8).
  Theorem C is now citable by published claims (status header, top of
  file); re-audit not required per the skeptic's own verdict.
