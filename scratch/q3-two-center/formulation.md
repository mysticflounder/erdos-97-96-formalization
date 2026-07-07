<!--
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Author: Adam McKenna <adam@mysticflounder.ai>
-->

# Q3 two-center probe — formulation (FORMULATION FIRST)

Register U4 / ledger row 4: route analysis for the named residual
`DoubleApexOffSurplusSharedRadiusPairCard12Up` (|A| ≥ 12 tail of
`Problem97.U1LargeCapRouteBTailMetricResidualTarget.DoubleApexOffSurplusSharedRadiusPair`,
`lean/Erdos9796Proof/P97/U1LargeCapRouteBTail.lean:2383`). Deliverable:
verdict tables that shrink strategy freedom. No Lean production. Run inline
by the orchestrating session (Adam directive 2026-07-07: no subagents).

Successor of `scratch/candidate-d-probe/` (read its formulation.md first —
all window semantics below inherit from it verbatim). Q1/Q2 established:
per-type (single-center) kills cannot close the tail (13/19 classes
REALIZED at the decorated minimal window; obstruction D1 confirmed
token-level at every n = 12–16). A viable Candidate D must couple
constraints ACROSS centers. Q3 probes the smallest cross-center object:
the {V,W} two-center window.

Dead-ends compliance: identical to the D-probe (no bare vesica windows;
(D-msolve) exact semantics; (D-caps) no cap treated as a circle; no
free-frame QF_NRA claims beyond labeled KILLED-QFNRA).

## 1. The two-center window — grounding

### 1.1 Centers and classes

The DoubleApex leaf carries `HasNEquidistantProperty 4 A` (K4 everywhere):
EVERY a ∈ A — including the three Moser vertices — is the center of a
radius class of card ≥ 4 (`SelectedClass A a ρ = A.filter (dist a · = ρ)`,
`N8/N8bEndpointPair.lean`). Fix the two chord-sharing vertices V := v2,
W := v3 (gauge below) and choose 4-subsets K(V), K(W) of their classes
(radii ρ_V, ρ_W > 0; the center is never in its own class). Every
constraint below is implied by the real leaf configuration for ANY such
choice — exclusion-sound; SAT verdicts are minimal-window realizations,
never full-configuration claims (semantics identical to D-probe
formulation §3).

Cap/vertex conventions (D-probe formulation §1.1): S := C1 (endpoints
v2 = V, v3 = W; apex v1 = U), O1 := C2 (endpoints W, U), O2 := C3
(endpoints U, V). Caps are CLOSED; interiors exclude the two endpoint
vertices; every non-Moser A-point is in exactly one cap
(`nonmoser_in_one`); no collinear A-triples (CGN5b).

### 1.2 The H1 location bound (PROVEN, in-tree)

`SurplusM44Packet.lean:423` ff:
`leftAdjacentCap_at_opposite_card_le_one_of_convexIndep` and
`rightAdjacentCap_at_opposite_card_le_one_of_convexIndep`: for each Moser
vertex, its radius class meets each of its two CONTAINING closed caps in
≤ 1 point (any radius; the vertex itself is excluded from its class since
ρ > 0). Verified against source this probe (2026-07-07).

### 1.3 Location partition and the forced members

A ∖ {V} partitions as (S∖V) ⊔ (O2∖V) ⊔ intO1, where S∖V = {W} ∪ intS and
O2∖V = {U} ∪ intO2 (U is an endpoint of O1 and O2, W of S and O1 — neither
is in intO1). V's containing caps are S and O2, so by §1.2:

    |K(V) ∩ ({W} ∪ intS)| ≤ 1,  |K(V) ∩ ({U} ∪ intO2)| ≤ 1,
    ⟹ |K(V) ∩ intO1| ≥ 2.

Mirror at W (containing caps S and O1):

    |K(W) ∩ ({V} ∪ intS)| ≤ 1,  |K(W) ∩ ({U} ∪ intO1)| ≤ 1,
    ⟹ |K(W) ∩ intO2| ≥ 2.

This recovers the D-probe report's "H1 already forces |K(V)∩O1-int| ≥ 2,
|K(W)∩O2-int| ≥ 2" from in-tree theorems.

### 1.4 Joint completion types

K(V)'s type: (α, φα, β, φβ) with α = |K(V) ∩ ({W}∪intS)| ∈ {0,1}
(φα ∈ {W, s-pt} when α = 1), β = |K(V) ∩ ({U}∪intO2)| ∈ {0,1}
(φβ ∈ {U, o2-pt} when β = 1), and γ = 4 − α − β ∈ {2,3,4} members in
intO1 (the "p-points"). 9 types. Mirror for K(W): (α′, φα′ ∈ {V, s-pt},
β′, φβ′ ∈ {U, o1-pt}), γ′ = 4 − α′ − β′ members in intO2 (the
"q-points"). 9 types. Joint: 81; the v2 ↔ v3 relabeling composed with the
gauge-restoring reflection across x = 1/2 (D-probe formulation §2.4(b),
same proof — every constraint class is preserved, S ↦ S, O1 ↔ O2) maps
joint type (t, t′) realizations bijectively to (t′, t): **45 mirror
classes**.

Identification sub-cases (each a separate conjunctive case):
- φβ(V) = o2-pt: that member is either one of the q-points (then it
  carries BOTH radius equalities) or a distinct intO2 point; distinct ⇒
  its position in the q-block is a case split (within-block order is WLOG
  only among identically-constrained points).
- φβ′(W) = o1-pt: mirror (identified with a p-point or distinct).
- α = α′ = 1 with φα = φα′ = s-pt: the two S-interior members coincide or
  not (coincide ⇒ both radius equalities on one point; C2 admits ≤ 2
  shared members — with U-sharing counted, enforce |K(V) ∩ K(W)| ≤ 2 per
  case; C2 grounding as in D-probe formulation §6).
- φβ(V) = U and φβ′(W) = U: U shared (one shared member).

### 1.5 Constraints per case (all leaf-implied)

Gauge v2 = V = (0,0), v3 = W = (1,0) (similarity-invariance per D-probe
formulation §2.4(a)); U = v1 = (ux, uy) above the axis; O = (1/2, oy),
R2 = 1/4 + oy² substituted is NOT used — E-MEC kept as equations exactly
as the D-probe encoder does (O_x = 1/2 substituted, v1/v2 boundary
equations kept, v3 redundant).

| tag | constraint |
|---|---|
| E-MEC | ‖v1−O‖² = R2, ‖v2−O‖² = R2 (Ox = 1/2) |
| E-KV | ‖t−V‖² = ρV² for every t ∈ K(V) (vertex members give ρV² = 1 for W, ρV² = ‖V−U‖² for U) |
| E-KW | ‖t−W‖² = ρW² for every t ∈ K(W) |
| I-POS | R2 > 0, ρV² > 0, ρW² > 0 |
| I-DISK | ‖p−O‖² ≤ R2 for every non-vertex window point |
| I-OBT | the three inner-product conditions |
| I-CAP | strict 3-chord signs per non-Moser window point, own cap = its location category |
| I-ORD | all cyclic triples of σ positive; σ = (V, [intS pts], W, [intO1 block], U, [intO2 block]) CCW |

Blocks: intO1 block = p-points (γ of them) ∪ possibly K(W)'s o1-pt;
intO2 block = q-points ∪ possibly K(V)'s o2-pt; intS block = 0–2 s-pts.
Within a block, identically-constrained points are WLOG in arc order (one
representative order); a differently-constrained member's slot among them
is enumerated. Cap contiguity + arrangement + orientation WLOG: D-probe
formulation §2.3/§2.4(a), proofs unchanged (any window ⊆ A is
convex-independent; the arrangement (v2-block boundary) argument is
verbatim).

Distinctness/noncollinearity of window points: implied by I-ORD (all
triples strictly positive). The equality-only ladder step adds pairwise
Rabinowitsch separators explicitly.

NOT constrained (deliberate, exclusion-sound): class exactness (other
A-points may lie at ρ_V from V), cap sizes / surplus designation (carries
no data at this scale — same note as D-probe formulation §3), MEC
minimality beyond containment, the leaf's row/liveData structure, and any
relation between ρ_V, ρ_W beyond what vertex membership forces.

### 1.6 Verdict semantics

Per joint class (mirror-reduced, with identification/slot sub-cases):

- KILLED-PROVEN: exact certificate (msolve `[-1]` + sympy GB = {1} on the
  saturated equality ideal) or an elementary hand proof from leaf-implied
  facts. Kills transfer to every |A| ≥ 12 configuration containing the
  joint type.
- KILLED-QFNRA: z3 UNSAT on the full decorated system (query file kept).
- REALIZED: exact rational witness verified in exact arithmetic
  (Fraction), all constraints strict/exact as required. Kills the
  exclusion hope for that joint class at this window size.
- unresolved: everything else (timeouts, unknown). Never claimed either
  way.

Falsifier gate (mandatory before reporting any kill): the W20 ring
witness and the d3-formulation lattice/ring witnesses must not realize a
claimed-killed joint type — extract their (V,W)-joint types per chord
pair and check the claimed kill against each.

## 2. Vertex-center geometry — what transfers from the K-toolkit

### 2.1 Q3-A′ — corner-max FAILS for opposite-vertex centers (PROVEN)

For the opposite vertex V and lens L2 (cap O1's region): V is ON the MEC
(‖V−O‖ = R), so the point of the disk farthest from V is V's antipode
2O − V at distance 2R. The circle's two arcs cut by chord (W, U) are the
arc containing V and the O1 arc; the antipode of V lies on the CLOSED O1
arc ⟺ the inscribed angles at W and at U are ≤ π/2 — exactly
non-obtuseness. So under I-OBT the antipode is IN closed L2 and
sup_{p ∈ L2} ‖V − p‖ = 2R, attained in the arc interior generically —
K-A's corner-max mechanism does NOT transfer to the forced (opposite-cap)
members. Distances from V into L2 fill [dist(V, chord WU), 2R]; no
corner-max kill exists for p-points. (This is why non-obtuseness helped
in K-A — center below the axis, antipode above — and hurts here.)

### 2.2 Q3-B/Q3-C — corner-max HOLDS from a lens corner (PROVEN)

V is a corner of lens L1 (cap S; corners V, W) and of lens L3 (cap O2;
corners U, V). For a corner, the farthest lens point is the OTHER corner:
max over the chord segment is at an endpoint (strictly convex quadratic);
max over the arc is at the endpoint nearest the antipode direction — the
antipode of V lies on the O1 arc (§2.1), which meets closed arc S only at
W and closed arc O2 only at U, so on each of those arcs the unimodal
distance peaks at that shared endpoint. Hence:

  Q3-B: sup_{p ∈ L1} ‖V − p‖ = ‖V − W‖ = 1, attained only at W
        ⟹ an intS member of K(V) forces ρV < 1.
  Q3-C: sup_{p ∈ L3} ‖V − p‖ = ‖V − U‖, attained only at U
        ⟹ an intO2 member of K(V) forces ρV < ‖V − U‖.

(Mirrors at W.) Neither yields a standalone kill — H1 already prevents
{U, o2-pt} ⊆ K(V) — but both are exact strict inequalities available as
kill ingredients and admissibility cuts in the sweep.

### 2.3 Imported unchanged

K-B (bisector-position identity) and K-E (min-corner identity, with the
recorded WARNING that its one-sided-sup extension is FALSE — not
re-derived) apply verbatim to any own-lens center appearing in enriched
windows. m ≤ 2 / vertex-pair ⇒ s = 0 / straddle-only are packet facts
about non-Moser centers; they do not constrain K(V), K(W) directly but
are available for composition tests.

## 3. Sweep plan

Tier 0: the minimal forced window (anchors + 2 p-points + 2 q-points, no
optional members) — contained in EVERY joint class; REALIZED here means
no kill can come from the forced content alone.
Tier 1/2: all 45 mirror classes with identification/slot sub-cases,
escalation ladder per case: (i) msolve+sympy equality ideal (saturated),
(ii) z3 QF_NRA 60 s → 300 s on unresolved, (iii) exact witness factory on
SAT models (rational reconstruction + exact verification). Solver calls
bounded ≤ 300 s; no detached long-wall chains.
If any kill lands: token-level composition retest (q2_token.py pattern
extended with two-center types) at n = 12–16.
