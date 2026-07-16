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
- Item 5's final logical implication is valid and kernel-checked here.  The
  geometric bridge from the current cap packet to its crossing inequality was
  not found in the theorem bank or current source.  Even if that bridge is
  proved, no current on-spine consumer accepts the resulting strict disk
  inequalities.

Accordingly, this is **not** a reason to replace the current
common-critical-map/direct-parent-contradiction route.  Item 5 is a possible
long-horizon metric ingredient, not an immediate producer.

## Scope and epistemic labels

This audit owns only
`scratch/atail-force/global-minimality-connectivity-audit/`.  It makes no
production or closure-document edits and runs no full build.

- **PROVEN (production):** the exact named production results below.
- **PROVEN (scratch):** the two declarations in
  `GlobalMinimalityConnectivityAudit.lean` under their stated hypotheses.
- **EXACT WITHIN THE STORED FINITE ABSTRACTION:** the 101-survivor closure
  result reported by the existing incidence-surplus audit.
- **NOT YET FORMALIZED:** deriving item 5's crossing inequality from the
  current `CapTriple`/cyclic-order surface.
- **NO CONSUMER FOUND:** converting item 5's strict containments into a current
  terminal contradiction.

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
the proposed global minimality consequence.  Any useful use of minimality now
has to carry additional metric, cap-order, exact-filter, or critical-map data
along the escape/reachability path.

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

Keep item 5 as a separate, explicitly conditional metric lead.  If pursued,
the next honest theorem target is the cap-membership-to-crossing bridge, not a
new abstract containment packet.  Before promoting it to production, require
an explicit downstream theorem showing how the resulting strict inequality,
together with the shared critical map or a source-faithful successor, produces
one exact antecedent of a current consumer.  Without that consumer, proving
the bridge would add geometry but would not close a `sorry`.

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
