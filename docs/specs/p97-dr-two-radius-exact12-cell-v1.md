# D-R two-radius branch: exact-12 full-carrier cell specification (v1)

Date: 2026-09-01. Lane `dr-two-radius-20260901`. Plan
`docs/plans/2026-09-01-dr-two-radius-branch-closure.md`, Phase 1b. Target
`Problem97.ATailFrontierLiveClosure.false_of_exactFourPostCardElevenTwoRadiusBranch`
(`Rigid221Closure.lean`).

Status: specification only. Nothing here is a verdict. Encoding 1a (named-role
quotient) is SAT by exact witnesses (`docs/audits/2026-09-01-dr-two-radius-quotient-wave.md`),
so this encoding adds exactly what the quotient omits: a blocker for every
carrier point, the carrier count, and full-class exactness for every incidence.

## 1. Carrier at card 12

From the plan's Section 4 (arithmetic of checked lemmas, Lean statement is
Phase 2 item L1, still {{NEEDS_PROOF}}): profile `(surplus, opp1, opp2) = (5, 4, 6)`,
growth arm `secondOpposite` only.

| role | points | source |
|---|---|---|
| apexes | `a1 = oppApex1`, `a2 = oppApex2`, `a3 = surplusApex` | `SurplusCapPacket` |
| `Is` (surplus interior) | `s1, s2, s3` | `surplusCap.card = 5` |
| `I1` (first-opposite interior) | `iq = interior_q`, `iw = interior_w` | `oppCap1.card = 4`, `OriginalUniqueFourResidual.interior_q_mem/interior_w_mem` |
| `I2` (second-opposite interior) | `t1, t2, t3, t4` | `oppCap2.card = 6` |

Twelve points, all distinct, in convex position, cyclic order
`a1, Is, a2, I1, a3, I2` counterclockwise (cap `i` has endpoints
`v_{i+1}, v_{i+2}`; see the 1a ledger). Within-cap orders are cell data.

## 2. Incidence structure

Boolean incidence variable `E(c, r, z)`: point `z` lies on the class with
label `r` about center `c`. Classes are full radius classes (`CriticalFourShell.support_eq`):
two points equidistant from `c` are in the same class. The structural layer
carries at most the classes the binders name; the metric layer makes every
other equidistance a strict inequality (exactness).

Named classes:

- `C`, `C'` at `a2` (radii `rho ≠ otherRadius`): `firstRow`, `secondRow`
  (`SelectedFourClass D.A S.oppApex2`, `support_card = 4`, supports disjoint).
  At card 12 with `_hnoFive`, every class at `a2` has at most 4 points.
- `U` at `a1`: `R.class_card_eq_four`, `U = {iq, iw, p2, ps}` with
  `p2 ∈ closed I2 = {t_i} ∪ {a3}`, `ps ∈ closed Is = {s_j} ∪ {a2}`
  (adjacent-cap one-hit lemmas at `oppApex1`). Frontier pair `q, w ∈ U`,
  `q, w ∉ Is`.
- `B1` at `c1 = χ(source)` (`U5QDeletedK4Class`, card 4, `deleted ∉ B1`,
  `c1 ∉ B1`, `source ∈ B1` by `no_qfree`), `B2` at `a2` (card 4,
  `deleted ∉ B2`), `|B1 ∩ B2| ≤ 2` (`CommonDeletionTwoCenterPacket`).
- For every carrier point `z`: blocker `χ(z) ∈ A \ {z}` with its unique
  four-class containing `z`; every other class at `χ(z)` has at most 3 points
  (`CriticalShellSystem.shellAt`, `no_qfree`). `χ(z) ≠ a2` for every `z`
  (two disjoint four-classes at `a2`). Under `lateFirstApexSystem`, `χ(u) = a1`
  for every `u ∈ U`; `χ(source) ∉ {a1, a2}`
  (`outsideFirstApexFiber`, `blocker_ne_secondApex`).
- K4 everywhere: every point has at least four equidistant points
  (`CounterexampleData.K4 : HasNEquidistantProperty 4 A`,
  `U1TwoShortCapReduction.lean`).
- Deletion facts: `FullyDeletionRobustAt D a2` (automatic from the two
  disjoint four-classes); packet `survives₁`: `B1` witnesses K4 at `c1` after
  deleting `deleted`; `survives₂` likewise at `a2`.

## 3. Structural cell

A cell fixes: the within-cap orders; the support of `C`, `C'` (2 + 2 split of
`I2`, one pick in each adjacent closed cap each, all 8 distinct); `p2, ps`;
`(q, w)` and `deleted`; `source` and `c1`; `B1`; `B2 ∈ {C, C'}`; the blocker
`χ(z)` and its four-class support for every `z`; the remaining incidence
variables. The structural stage enumerates cells as models of a CNF over the
incidence variables under the cardinality and exclusion clauses above; the
reuse of the B1 lane's `CoverInstance` and static layers is recorded in the
encoder module once the reuse map is settled.

Structural negative control (plan guardrail, counting): the closed sibling
`false_of_exactFourRigid221_sourceHeavy_secondOppositeLarge_pentagonOffClassBlocker_exactTwelve_twoRadiusPartition`
closes by `hfive` against `_hnoFive`; the control asserts a five-class at
`a2` and must be UNSAT at the structural stage.

## 3a. Reuse map (audited 2026-09-01) and structural-first plan

Audit of `census/card_head/b1_exact12_structural.py`, `sat_encoding.py`,
the three `b1_exact12_static_*.py` layers and `b1_exact12_metric_piqd.py`:

- `sat_encoding.CoverInstance` selects exactly one four-row per center
  (`sat_encoding.py:135-142`). D-R needs two disjoint four-classes at `a2`
  plus the packet row, so the row model is not reusable. Its profile table
  (`profiles.py`, minimum `(5,5,4)`) has no `(5,4,6)`; the model-slot
  profile `(5,6,4)` with `a2 = V` is the theorem-order `(5,4,6)`.
- The E/G/C static layers check exact types
  (`b1_exact12_static_equality.py:233-240`), so their installers are not
  reusable; their clause generators are: the equality relation over the 66
  edges with transitivity and duplicate-three-point-center clauses
  (`static_equality.py:339-389`), `_cached_geometry_clause_delta(edges,
  relation_variable_items)` (`static_geometry.py:336-676`, every rule names
  its Lean theorem) and `_convex_clause_delta` (`static_convex.py:133-155`)
  take only edges and the relation map.
- `b1_exact12_metric_piqd.py` is pinned to the B1 lane, profile, run id,
  cell index and producer path throughout; only the generic
  `metric_realizability_piqd.build_stage_smt2` (rows with `exact` flags plus
  cyclic order) is reusable.
- Not present anywhere: no-five at `a2`, blocker existence and uniqueness
  (`CriticalShellSystem`), `FullyDeletionRobustAt`, distinct radii, the
  ingress packet fields, cyclic order at the SAT level. These are new D-R
  clause blocks.

Decision. Encoding 1b is built structural-first as one CNF over the
edge-equality relation `eq(e, e')` on the 66 edges of the 12 points (as in
the B1 E-layer), with the D-R blocks from Section 2 stated as cardinality
and exclusion constraints on that relation (class of `z` at `c` = edges
`cz'` equal to `cz`), plus the reusable G and C deltas. CaDiCaL through
PIQD with DRAT capture decides it. Structural UNSAT at card 12 would be a
finite incidence result with a checked proof and no coordinates, the same
shape the B1 certificate ingress consumes; structural SAT yields explicit
equality patterns, enumerated under a cap with blocking clauses, for the
metric stage. New module: `census/card_head/dr_exact12_structural.py`
(to be added to the lane's owned paths before it is written).

## 4. Static and metric stages

Static layers (order and convexity consequences that need no coordinates)
prune cells; every prune names its theorem or is a relaxation recorded in the
cut admission record.

Metric stage per surviving cell: every incidence `E(c, r, z)` is an equality
`|z − c|² = ρ_{c,r}`, every non-incidence is a strict inequality, convex
position is the 12·10 orientation atoms, MEC and non-obtuse atoms as in 1a.

Instruments. The 1a wave showed Z3 QF_NRA one-shot through PIQD cannot settle
an 18-atom geometric UNSAT; it is not the UNSAT oracle here.

- SAT side: the 1a constructive search (rational circle points, frozen-order
  trust-region least squares, exact replay), extended to per-cell incidence
  lists. A replayed configuration is a witness for that cell.
- UNSAT side: either a Lean-provable counting or order argument at the cell
  level (preferred; feeds Phase 3 directly) or an algebra engine
  (Gröbner/CAD; needs Adam's per-task approval before any run). Until one of
  these runs, a cell that the constructive search cannot realize is
  `OPEN`, not UNSAT.

## 5. Claim boundary

Every stage result is a statement about this encoding at card 12. It carries
no Lean closure, coverage, or promotion claim; `promotion_eligible = false`.
Phase 3 (certificate ingress) is the only path to the spine.
