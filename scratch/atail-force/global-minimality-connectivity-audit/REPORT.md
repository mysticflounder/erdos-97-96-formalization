# Global minimality, selected-witness connectivity, and cap crossing audit

Date: 2026-07-16

## Verdict

The deep-model proposal is mathematically useful as a consolidation, but it
does not currently supply the missing A-TAIL producer.

- Items 1--4 are essentially already represented by source-clean production
  theorems.  The selected-witness strong-connectivity statement is valid, and
  production already contains the stronger closed-subcarrier theorem from
  which it follows.
- The current corrected structural census does not gain a new cut from that
  fact: all 101 stored survivors have full selected-row closure from every
  one-point seed.
- Therefore the selected-row/minimality route is **BLOCKED AT THE CURRENT PURE
  STRUCTURAL ABSTRACTION**, rather than merely awaiting another reachability
  refinement.  This does not rule out a metric-enriched use of minimality.
- Item 5 splits into a geometric producer and a consumer.  Its final
  strict-containment implication is valid and kernel-checked here, but
  containment alone is nonterminal.  The stronger ordinal Kalmanson consumer
  rejects all 101 stored corrected shadows, including the formerly bank-clean
  terminal shadow; the terminal has an independently replayed two-inequality
  integer Farkas certificate.

Accordingly, this is **not** a reason to replace the current
source-faithful direct-parent route on the strength of the containment
alternative alone.  The Kalmanson result is a strong new cut.  Its
prefix-monotone continuation now exhausts the corrected fixed fourteen-role
`PROFILE = (8,4,5)` surface, but that surface is not yet a proved extraction
from every live parent packet or every carrier/cardinality profile.

## Scope and epistemic labels

The structural and finite audits live under
`scratch/atail-force/global-minimality-connectivity-audit/`.  Their reusable
strict-distance bridge and selected-row terminal have since been promoted to
`Erdos9796Proof.P97.ATail.CapCrossingKalmanson`.  No full build was required.

- **PROVEN (production):** the exact named production results below.
- **PROVEN (scratch):** the two declarations in
  `GlobalMinimalityConnectivityAudit.lean` under their stated hypotheses.
- **EXACT WITHIN THE STORED FINITE ABSTRACTION:** the 101-survivor closure
  result reported by the existing incidence-surplus audit.
- **BLOCKED AT THAT ABSTRACTION:** no further theorem using only selected-row
  closure/strong connectivity can separate those 101 stored systems.
- **PROVEN IN PRODUCTION LEAN:** both strict crossed-quadrilateral Kalmanson
  inequalities and the direct five-point selected-row terminal now live in
  `Erdos9796Proof.P97.ATail.CapCrossingKalmanson`.
- **EXACT WITHIN THE STORED PREFIX:** quotienting named distances by the
  selected-shell equalities and adding cyclic strict comparisons rejects
  101/101 stored shadows.  The terminal exact LRA/Farkas replay also rejects
  the full Kalmanson system, with or without triangle inequalities.
- **EXACT FIXED-SURFACE CONTINUATION:** enforcing the ordinal filter during
  enumeration makes the corrected fourteen-role `PROFILE = (8,4,5)` DFS
  exhaustively UNSAT.
- **NOT PARENT COVERAGE:** the fixed surface is theorem-discovery data, not a
  Lean theorem that every live parent packet instantiates that profile and
  its named rows.

## Bank preflight

Before adding the scratch lemmas, I checked the registries required by
`AGENTS.md`:

- `docs/general-n-certificate-bank-mining-2026-07-09.md`, including the
  sibling `p97-rvol` section;
- `certificates/p97_rvol_general_n_mining.{md,json}`;
- `certificates/erdos97_legacy_general_n_mining.{md,json}`; and
- `certificates/erdos_general_theorem_p97_mining.{md,json}`.

I also searched the indexed Lean corpus with `nthdegree docs search --lean`
for selected-witness connectivity, proper witness-closed subsets, cap-distance
monotonicity, cross-cap pair injectivity, quadrilateral crossing, and strict
disk containment.  The search exposed the existing carrier-closure and cap
counting stack described below.  It did not expose an existing theorem with
the item 5 cap-to-crossing interface or an on-spine consumer of its strict
containments.

## 1. Arbitrary selected-witness digraphs are strongly connected

The exact minimality predicate is
`CounterexampleData.Minimal` in
`lean/Erdos9796Proof/P97/U1TwoShortCapReduction.lean`:

```lean
def CounterexampleData.Minimal (D : CounterexampleData) : Prop :=
  ∀ B : Finset ℝ², B.Nonempty → ConvexIndep B →
    HasNEquidistantProperty 4 B → D.A.card ≤ B.card
```

`FaithfulCarrierPattern` in
`lean/Erdos9796Proof/P97/U1CarrierInjection.lean` selects an arbitrary
`SelectedFourClass` at every point of the carrier.  Production already proves
the stronger theorem

```text
FaithfulCarrierPattern.eq_carrier_of_nonempty_closed
```

which says that a nonempty subset of a minimal carrier, closed under every
selected row centered in it, is the whole carrier.  It also proves the
contrapositive-style escape theorem

```text
FaithfulCarrierPattern.exists_row_escape_of_proper_subset.
```

The scratch theorem

```text
GlobalMinimalityConnectivityAudit.selectedWitnessEdge_reflTransGen
```

applies the production closure theorem to the vertices reachable from an
arbitrary seed.  For every two carrier points `source` and `target`, it proves

```lean
Relation.ReflTransGen (SelectedWitnessEdge P) source target.
```

This is precisely strong connectivity of the chosen directed witness graph.

### Sink-SCC proof audit

The proposed sink strongly connected component proof has no hidden fatal
gap:

1. If the finite graph is not strongly connected, its condensation has a
   nonempty proper sink component `B`.
2. Every selected support point of a center in `B` is an outgoing neighbor,
   so sinkness puts all four selected witnesses back in `B`.
3. Those four points are distinct, lie at one positive radius from the center,
   and lie in the ambient carrier.  Therefore they witness K4 for that center
   inside `B`.
4. `ConvexIndep.mono` gives convex independence of `B` from `B subset D.A`.
5. Minimality gives `D.A.card <= B.card`, while inclusion gives the reverse
   inequality.  Thus `B = D.A`, contradicting properness.

The center does not need to lie in its own selected support; indeed
`SelectedFourClass.center_not_mem` says it does not.  K4 only requires four
same-radius support points for each center.  The reachable-set proof in the
scratch artifact avoids needing a separate finite-condensation library.

## 2. Items 1--4 are already in the production stack

The operative content of the proposed cap deductions maps to current source
as follows.

| Proposal | Current production result | Status |
|---|---|---|
| Ordered triples in a minor cap are nonacute at the middle point | `CGN.CGN6b_nonacute_of_minorCapChainModel` in `CGN/CGN6.lean` | PROVEN |
| Distances from a cap point are injective on either side | `CGN.oneSidedDistanceInjective_of_mecCapPacket` in `CapSelectedRowCounting.lean` | PROVEN and transported to the original cap |
| An interior-center selected class uses at most two cap points; endpoints use at most one | the `selectedFourClass_inter_orderedCap_*_card_le_*` stack in `CapSelectedRowCounting.lean` | PROVEN |
| Every cap has at least four points | `U1OppositeCapLowerBounds.capTriple_caps_card_ge_four` | PROVEN |
| One outside unordered pair cannot be equidistant from two ordered-cap centers | `CapSelectedRowCounting.outsidePair_unique_capCenter` | PROVEN |
| Outside-pair incidences inject into all complement pairs | `CapSelectedRowCounting.orderedCap_outsidePairCount_sum_le` | PROVEN |
| The lower count `m + 4` is bounded by complement pairs | `CapSelectedRowCounting.orderedCap_card_add_four_le_choose_outside` | PROVEN |
| Arbitrary selected-witness graph is strongly connected | stronger production closure theorem plus the scratch corollary above | PROVEN |

Thus inequalities (3)--(5) in the proposal are not a new mathematical
frontier.  They are the existing ordered-cap outside-pair double count, and
the report's observation that balanced cap triples survive agrees with the
current route history.

This mapping must not be confused with the false local route recorded in
`docs/dead-ends.md`: generic apex-centered distance monotonicity is false, and
the one-sided `cap_arc_midpoint_inequality` does not pin arbitrary K4
witnesses.  The valid production result is cap-chain/endpoint-side
injectivity, not arbitrary apex-distance monotonicity.

## 3. Exact impact on the current 101 structural survivors

The existing audit
`scratch/atail-force/incidence-surplus-producer/REPORT.md` checks the canonical
corrected robust MARCO checkpoint.  Its exact stored-abstraction result is:

```text
survivors                                 101
total blocker maps                        101
sharpened live target avoided             101
every one-seed row closure is full        101
proper one-seed closure found               0
```

For a finite selected-row system, full closure from every seed is exactly the
strong-connectivity consequence proved above.  Therefore a new
minimality/closure cut removes **0 of 101** current survivors.

This is exact only for the stored incidence systems.  It does not assert that
those systems are Euclidean realizations or models of the full Lean parent.
It does show that the current pure incidence abstraction already accommodates
the strongest available selected-row closure consequence.  Thus the
selected-row/minimality route is blocked at that abstraction.  Any useful use
of minimality now has to carry additional metric, cap-order, exact-filter, or
critical-map data along the escape/reachability path.

## 4. Item 5: semicomplete strict disk containment

The geometric argument proposed for item 5 is credible.  If
`v_i, v_j, x, y` occur in cyclic convex order, the two witness segments
`v_i--x` and `v_j--y` are diagonals.  The strict crossed-quadrilateral
inequality gives

```text
dist v_i x + dist v_j y > dist v_j x + dist v_i y.
```

After replacing the two diagonal lengths by witness radii, negating both
whole-set strict containments supplies one `x` and one `y` whose cross
distances are at least the opposite radii, contradicting that inequality.

The scratch theorem

```text
strictContainment_or_strictContainment_of_crossingInequality
```

kernel-checks exactly this last implication for arbitrary finite sets `P` and
`Q`.  It deliberately takes the crossing inequality as a hypothesis.  What
remains unformalized is the geometry-specific bridge:

```text
x in the i-th opposite core and y in the j-th opposite core
  -> v_i, v_j, x, y have the required cyclic order
  -> the strict crossing inequality.
```

No exact theorem packaging that bridge from the current `CapTriple` surface
was found in the bank/source audit.  Consequently item 5 is **not yet a
source-level theorem about the current cap packet**; only its final logical
step is checked here.

Even after that bridge, the conclusion is not contradictory.  The pairwise
alternative is semicomplete, not a strict global order: cyclic orientations
and even bidirectional containments of the finite witness sets can occur.
Consequently the containment packet is only a producer.

The smallest plausible consumer uses the stronger crossed-quadrilateral
inequalities directly.  First quotient all distance terms by the selected-row
equalities and close the induced strict comparisons transitively.  If a
strict cycle or a strict comparison inside one equality class appears, the
certificate is a short sequence of crossing lemmas plus `lt_trans` and
`lt_irrefl`.  If ordinal closure leaves survivors, add both strict Kalmanson
inequalities for every cyclic quadruple, symmetry, positivity, and optionally
triangle inequalities.  This is a homogeneous linear feasibility problem in
abstract distance variables: a finite strict solution can be scaled so every
strict slack is at least one, while an infeasible instance admits a rational
Farkas certificate suitable for `linarith`.

This audit ladder must run against the exact 101-survivor checkpoint, report
the terminal 101st bank-clean shadow separately from the first 100 already
matched by current bank consumers, and preserve the checkpoint hash and hull
order.  If a shadow remains feasible even under the full linear system, item
5 is blocked at the convex-distance linear abstraction and requires genuinely
Euclidean, MEC, full-filter, or critical-map information.

That first ladder is now complete.  The pinned audit in
`kalmanson-consumer/` reports:

```text
stored corrected prefix                  101
ordinal Kalmanson contradictions         101
ordinal survivors                          0
shortest cycles of length one             89
shortest cycles of length two             12
terminal exact Kalmanson LRA            UNSAT
terminal Kalmanson plus triangles LRA   UNSAT
```

The terminal certificate uses only the selected rows centered at `O`, `A`,
and `Y`.  In the pinned order `O < A < Y < E < C`, the `Y`-row equality
`OY = YE` and the quadruple `O,A,Y,E` imply `OA < AE`.  The `O`-row equality
`OE = OC`, the `A`-row equality `AC = AO`, and the quadruple `O,A,E,C` imply
`AE < OA`.  Summing the two normalized inequalities gives `0 ≥ 2`; the
integer multipliers are both one.

The audit independently pins checkpoint SHA-256
`b307fed8cf6c30508a615553f5a1caf8a836859f3d70f1907eb3f34b9196c8b9`,
the fourteen-role cyclic order, the current generator sources, all stored row
assignments, and the old bank-match split.  Its `--check` replay passes.

The 101-source checkpoint status remains
`SAT_PRODUCER_BANK_CLEAN_CORRECTED_SHADOW`; those observations alone were not
coverage.  The independent continuation adds the ordinal filter to every
partial assignment and returns:

```text
status                         UNSAT_EXHAUSTIVE_FINITE_DFS
DFS nodes                                                0
prefix checks                                          110
Kalmanson prefix rejections                             82
formal-bank-cut rejections                               0
```

The fixed ambient row and fixed selected rows at `O`, `A`, `D`, and `t1` are
ordinally consistent by themselves.  However, every admissible singleton row
at each of three centers is already inconsistent with that fixed packet:

```text
center   candidates   Kalmanson-killed   surviving
X               401                 401           0
I               328                 328           0
F               328                 328           0
```

After the preexisting compatibility and pair-capacity gates, the new
Kalmanson cut is load-bearing on `70/70`, `69/69`, and `65/65` candidates at
`X`, `I`, and `F`.  The 70 `X` candidates compress to four named-row
footprints and five `(footprint, shortest-cycle-length)` schemas.  Thus the
old 524 producer-bank cuts are not responsible for the continuation UNSAT.
An independent verifier reconstructs the candidate domains from the pinned
generator, recomputes every stored 101-prefix certificate, and replays the
three empty singleton domains.

The sibling `kalmanson-terminal-bank-adapter/` checks the exact selected-row
interface.  Its forward-only direct matcher finds the production five-point
schema in all 101 saved witnesses, with 383 embeddings.  The sibling
`kalmanson-parent-order-adapter/` then isolates the live gap: two strict
first-opposite-cap points admit one shared boundary and a two-arm internal
order, but the current parent exports neither the finite role `E` in that
strict cap nor a named `Y`, the directed arm, or the three selected rows.
Boundary indexing itself is therefore not the remaining producer.

The clean direct-schema-only corrected CEGAR in
`../kalmanson-bank-cegar/` cuts 51 successive matches and then returns
`SAT_DIRECT_SCHEMA_AVOIDING_CORRECTED_SHADOW` at iteration 52.  This is the
required regression: the single five-point theorem explains the saved prefix
but is not fixed-surface coverage.  The exhaustive result above genuinely
uses the generic ordinal strict-cycle filter.

This is exhaustive only for the fixed fourteen-point profile and its stated
candidate semantics.  It does not prove that an arbitrary larger carrier has
a selected row supported on these fourteen named roles, nor that every live
parent packet produces the fixed `O/A/D/t1` packet and global order.

## 5. Relation to generated successors and common deletion

`CommonDeletionTwoCenterPacket` is explicitly not a terminal contradiction.
Its two q-deleted rows can be re-expressed as ambient selected four-classes,
and production/scratch carrier constructors can preserve prescribed classes
inside a global `FaithfulCarrierPattern`.  Strong connectivity then supplies
an unspecified directed selected-row path between carrier points.

That path does **not** supply any of the extra facts consumed by the current
terminal interfaces:

- reuse of one outside pair at two ordered-cap centers for
  `outsidePair_unique_capCenter`;
- a specific common-deletion source at both named centers;
- prescribed-deletion criticality or exact-support equality;
- the seven named equalities of `u1TwoLargeCapObstruction`; or
- a cap-placement statement for the next path vertex.

Current generated-successor work already obtains a sharper normal form from a
common deletion: a successor common-deletion packet at the same centers or a
two-source aligned prescribed-critical arm.  The branch-coverage layer also
retains `ApexDoubleCriticalResidual` and `DeletedBlockerApexAlignment` cases.
These are source-faithful and carry more usable information than arbitrary
selected-row reachability.

Likewise, item 5 yields strict inequalities, while the present sinks consume
equalities, incidences, support identities, or deletion behavior.  A source
search found no current on-spine theorem whose antecedent is the proposed
semicomplete strict-containment packet.

## 6. Recommended disposition

Do not pivot the active closure lane to selected-witness connectivity:

1. Its graph theorem is correct but already subsumed by production.
2. The current 101 structural survivors all satisfy it.
3. It does not refine a common-deletion successor into a current consumer.

Keep item 5 as a separate metric lane.  Do not promote another abstract
containment packet.  Its remaining acceptance gates are:

1. produce either a third actual center whose selected row contains the
   frontier pair, or the complete five-point actual-role packet with its
   directed order and six row memberships; and
2. replace the Python candidate-domain exhaustion by a kernel-checkable
   classifier/coverage theorem, or prove one uniform theorem covering the
   empty `X`, `I`, or `F` row domain.

The sibling `frontier-kalmanson-match/` audit discharges the previously open
"different consumer" check.  It kernel-checks the four-role terminal using
the actual first apex, blocker, and frontier pair, but no live arm supplies
both cross membership and the required adjacent-center order.  The
cross-membership branch instead has alternating opposite-side geometry, and
the survival branch lacks the row equality.  The five-point terminal also
lacks a source-valid assignment of its two extra roles and six incidences.
Therefore further literal 555/654 core mining is not an acceptance gate for
this route; new computation must target one of the complete antecedents above
or a formal coverage theorem.

The fixed-surface finite gate passed, but it is not a parent coverage gate.
Without the source adapters and kernel coverage, the result remains theorem
discovery rather than a `sorry` closure.

## Validation

Focused scratch validation from `lean/`:

```bash
lake env lean -M 16384 \
  ../scratch/atail-force/global-minimality-connectivity-audit/GlobalMinimalityConnectivityAudit.lean
```

Result: exit 0.

Both printed declarations report only:

```text
propext, Classical.choice, Quot.sound
```

The source scan finds no `sorry`, `admit`, `unsafe`, or `native_decide`; its
only matches for `axiom` are the two intentional `#print axioms` commands.
