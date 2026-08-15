# Full-deletion-provenance named-role quotient audit

Date: 2026-08-11  
Anchor: `Problem97.ATailFrontierLiveClosure.TwoSourceExactCollisionRowsTerminal.exists_freshThird_firstNonHit_selectedRow_overlap_card_ge_three`

## Preflight result

There is a cardinality-independent **named-packet skeleton**: it can retain
the four P/Pρ endpoints, the two Q sources, the two canonical C sources, their
actual blocker centers, and every deletion-survival fact supplied by the
current packets.  This is suitable as a diagnostic FOL/SMT abstraction.

There is not, however, a cardinality-independent finite **source-faithful
quotient of the live leaf** using only those named roles.  The target negation
quantifies over every `CriticalShellSystem.CarrierVertex D.A`, including
anonymous sources and their rows.  A named skeleton drops those rows; adding a
single symbolic source role merely asks for the missing producer and does not
prove that all concrete sources are represented.  Therefore the closure gate
is **NO-GO** until a source extraction/lift theorem or a uniform bounded-core
theorem lands.

## Candidate universe and relations

The largest honest named-packet signature is:

* `Pt`: carrier points, with named constants `p₁,p₂,r₁,r₂,q₁,q₂` and the
  source-point values of `c₁,c₂`; all are required to be in `D.A`.
* `Src`: named source vertices `p₁,p₂,r₁,r₂,q₁,q₂,c₁,c₂`, represented as
  `CriticalShellSystem.CarrierVertex D.A` rather than bare points.
* `Ctr`: carrier centers, with `cen : Src → Ctr` for
  `H.centerAt source.1 source.2` and `blk : Src → Src` for
  `H.blockerVertex source`.  The quotient must retain the source-level
  value/center relation rather than silently identifying these two APIs.
* `mem : Src × Pt → Prop`, abbreviating membership in
  `(H.selectedAt source.1 source.2).toCriticalFourShell.support`.
* `survives : Pt × Ctr → Prop`, abbreviating
  `HasNEquidistantPointsAt 4 (D.A.erase w) center`; `blocked` is its logical
  negation, not an independent unconstrained predicate.
* `cap_i : Pt → Prop` for `i : Fin 3`, plus `inInterior_i` where the C packet
  requires cap-interior membership.
* `before : Pt × Pt → Prop` or a full `BoundaryIndexing D.A`; the finite named
  packet does not by itself supply the latter for anonymous points.
* optional exact-radius/equidistance predicates.  These may not be replaced
  by arbitrary incidence labels if a metric consumer is used.

The finite named skeleton can have a finite table for `mem` and `survives`.
It cannot use that table as a quotient of all source rows unless a theorem
maps every anonymous source to one of these named rows or to a proved finite
type with the same relations.

## Hard clauses and exact Lean origins

The following clauses are the minimum deletion-preserving source packet.

| Clause | Exact source | What must be retained |
|---|---|---|
| `q₁ ≠ q₂` | `ATailBlockerMultiplicityGeometry.FreshThirdBlockerFiber.sources_ne`, `BlockerMultiplicityGeometry.lean:79–81` | Source-vertex distinctness, not merely unequal point labels |
| `blk(q₁)=blk(q₂)` | `FreshThirdBlockerFiber.blockers_eq`, `BlockerMultiplicityGeometry.lean:82–83` | Actual blocker equality; derive center equality only through the source API |
| Q blocker differs from both retained collision blockers | `blocker_ne_first`, `blocker_ne_second`, `BlockerMultiplicityGeometry.lean:84–89` | Both P and Pρ blocker distinctions |
| Q sources avoid all four P/Pρ endpoints | `source₁_ne_*` and `source₂_ne_*`, `BlockerMultiplicityGeometry.lean:90–105` | All eight inequalities, including source-vertex coercion proofs |
| Q mutual selected-row membership | `source₁_mem_source₂_shell`, `source₂_mem_source₁_shell`, `BlockerMultiplicityGeometry.lean:106–111` | `mem(q₁,q₂)` and `mem(q₂,q₁)` |
| Equal actual blockers give equal selected supports | `ATailSurvivalCover.selectedSupports_eq_of_actualBlockers_eq`, `SurvivalCover.lean:47–83` | Support equality, not just same center label |
| Actual blocker fibers have size ≤4 | `ATailSurvivalCover.actualBlockerFiber_card_le_four`, `SurvivalCover.lean:85–104` | The fiber bound and its source-to-support injection |
| C source is in the strict first cap, fresh, and center-separated | `CapSourceThirdCanonicalRowWitness`, `TwoSourceCanonicalSurface.lean:110–130` | Cap-eight bound, four endpoint exclusions, P/Pρ/apex center inequalities |
| C selected support is exact four | `CapSourceThirdCanonicalRowWitness`, `TwoSourceCanonicalSurface.lean:125–128` | Support subset of `D.A` and exact cardinality 4 |
| C cross-pair deletion provenance | `CrossPairDeletionView`, `CrossPairDeletionSurvival`, `TwoCollisionGlobalProducer.lean:494–543`; consumed by `CapSourceThirdCanonicalRowWitness` | For each C source and each P/Pρ pair, retain the disjunction of the two exact `survives` facts; do not retain only a derived omission bit |
| Survival/omission equivalence at a source blocker | `cross_deletion_survives_iff_not_mem_selected_support`, `CriticalPairFrontier.lean:779–826` | `survives(w,cen(s)) ↔ ¬ mem(s,w)` for every encoded source `s` and deletion `w` |
| Blocked deletion forces selected-row membership | `source_mem_critical_support_of_no_qfree`, `CriticalPairFrontier.lean:157–180` | `blocked(w,center(s)) → mem(s,w)` with the exact-four support witness |
| Non-hit omission carries actual survival | `FreshThirdCapSourceNonHit.sourceRowOmission`, `TwoSourceFreshThirdFiber.lean:2067–2087` | The deleted source is exactly Q₁ or Q₂, omission and `survives(deleted,cen(source))` both remain |
| Non-hit center separation from Q | `freshThirdCapSourceNonHit_center_ne_of_sourceRowOmission`, `TwoSourceFreshThirdFiber.lean:2089–2118` | This is a proved adapter, not an assumption to be rediscovered by the quotient |
| Distinct-center row intersections are ≤2 | `selected_support_inter_card_le_two_of_not_mem_other_selected_support`, `CriticalPairFrontier.lean:847–863` | The exact selected-four class geometry and center inequality |

The named skeleton should also carry the constructor data for
`FreshThirdCapSourceInteraction` (`TwoSourceFreshThirdFiber.lean:1980–2042`)
and the two source rows in `TwoCapSourceThirdCanonicalRowSurface`
(`TwoSourceCanonicalSurface.lean:138–144`).  Omitting those fields changes the
live antecedent and is not a harmless weakening when claiming a source-level
UNSAT result.

## Target and target negation

The live target is the theorem at
`TwoSourceFreshThirdResidual.lean:1321–1335`:

```lean
∃ source : CriticalShellSystem.CarrierVertex D.A,
  H.centerAt source.1 source.2 ≠
      H.centerAt Q.source₁.1 Q.source₁.2 ∧
  3 ≤ ((H.selectedAt source.1 source.2).toCriticalFourShell.support ∩
    (H.selectedAt Q.source₁.1 Q.source₁.2).toCriticalFourShell.support).card
```

Its negation, which a countermodel query must assert, is:

```lean
∀ source : CriticalShellSystem.CarrierVertex D.A,
  H.centerAt source.1 source.2 =
      H.centerAt Q.source₁.1 Q.source₁.2 ∨
    ((H.selectedAt source.1 source.2).toCriticalFourShell.support ∩
      (H.selectedAt Q.source₁.1 Q.source₁.2).toCriticalFourShell.support).card ≤ 2
```

The current named C-source classification proves this only for the named
non-hit source rows (`freshThirdCapSourceNonHit_centerEq_or_inter_card_le_two`,
`TwoSourceFreshThirdResidual.lean:1161–1202`).  It does not quantify over the
anonymous carrier sources required by the displayed negation.

## Compactness and finite-model soundness

There are two different claims, and only one is sound with the current
packet:

1. A **finite named-packet UNSAT** can soundly validate the logical adapter
   from a supplied three-blocked-deletions producer to the clean two-circle
   terminal, provided every clause in the table is translated and replayed.
   This is a diagnostic/consumer check.
2. It cannot establish the live universal target.  A named-role encoding is an
   under-approximation of the source rows: a concrete model may contain an
   anonymous source whose row is not named.  UNSAT of that under-approximation
   therefore does not lift to Lean.

FOL compactness does not fix this.  A complete FOL refutation is sound without
   a finite-model assumption, but the current source-mapped incidence theory
   has a recorded finite model and therefore does not entail the target
   producer.  Mace4 SAT only establishes a finite abstraction model; Mace4
   UNSAT over selected finite sizes is not an arbitrary-cardinality theorem
   unless a finite-model property or bounded-core theorem is proved.

## FOL versus finite SMT

* **FOL/Vampire:** best for checking the relational adapter after the source
  clauses and a producer are supplied.  It can prove the clean terminal from
  three blocked Q deletions, but it cannot invent the missing anonymous-source
  witness or prove that named roles cover all sources.
* **Mace4:** useful for finding finite countermodels to a proposed named-role
  abstraction.  It does not search infinite models and cannot certify the
  universal P97 leaf.
* **Finite SMT (Z3/cvc5):** useful for an exact finite core with all
  `survives`/`mem` provenance, malformed controls, independent readback, and
  replay.  Without a Lean extraction theorem showing that every live model
  has that core, UNSAT proves only the chosen finite quotient.
* **Presburger/type-count SMT:** may be sound after a source theorem provides
  a finite type basis and relation-completeness proof.  Counts alone cannot
  encode the unbounded source-to-row relation, Euclidean radius witnesses, or
  the full boundary order.

## GO/NO-GO and smallest missing theorem

**NO-GO for a closure wave.**  A full-deletion-provenance named-role package is
worth retaining as a consumer regression artifact, but it is not a universal
producer.  Do not launch Vampire/Mace4/SMT as though its UNSAT could close the
anchor.

The smallest enabling theorem is one of:

* a Lean extraction/lift theorem asserting that every live counterexample has
  a bounded finite source core (including all anonymous rows, centers,
  `mem`, `survives`, cap, order, and metric relations); or
* directly, the source-level three-blocked-deletions producer consumed by
  `exists_selectedRow_overlap_card_ge_three_of_blocked_deletions`.

Until one lands, a new solver process would only rediscover the existing
named-incidence gap.
