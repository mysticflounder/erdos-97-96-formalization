# ATAIL Stage-I short-facing-cap output consumer assessment

Date: 2026-07-14

## Verdict

Neither short-facing-cap incidence is presently an antecedent of a checked
contradiction consumer:

```text
c := rows.uRow.center
B := {q,t1,t2,t3}
R := rows.uRow.selected.toCriticalFourShell.support

dangerous-endpoint short arm: c in B
u-row-endpoint short arm:     p in R
```

The first output names the `u`-row **center** but gives no dangerous point in
the `u`-row **support**.  The second output gives one support point outside the
dangerous four-set.  Since the source `u` is also in `R` and outside `B`, this
second arm leaves at most two support slots in `B`; it therefore cannot feed
the existing three-dangerous-membership sink without a different radius
class or additional geometry.

No production source, protected source, LIVE-T1/card-11 source, generated
blueprint, or main closure document was changed.  The only Lean addition is a
scratch dependency countermodel which strengthens both outputs simultaneously
and shows that they still do not imply a dangerous support hit on the exact
common-incidence interface.

## Exact consequences of the two outputs

The live fields already prove

```text
p != c
u in R
c notin R
p notin B
u notin B
card R = 4.
```

Together with the exact dangerous row at center `p`, the first short arm gives

```text
c in B
dist p c = dist p q.
```

It does **not** give any member of `B intersect R`.  Expanding the finite-set
membership only yields

```text
c = q or c = t1 or c = t2 or c = t3.
```

The common critical-system provenance does not turn “the center of the row
sourced at `u` equals a dangerous source label” into a support incidence.
Same-center support locking would require equality between two *chosen blocker
centers*, not equality between one blocker center and another row's source.

The second short arm gives

```text
p in R
dist c p = dist c u,
```

using `u in R`.  This equality concerns the outside pair `p,u`; it is not one
of the two dangerous equalities consumed by
`false_of_fixedTriple_secondCenter_q_t1_t3_equalities`.  Moreover `p,u` are
distinct and both outside `B`, so cardinality four leaves at most two members
of `B` in `R`.  This agrees with the already checked
`SelectedFourClass.inter_card_le_two` boundary for the distinct centers
`p,c`.

## Checked-consumer match table

| Candidate consumer | Required input | What the short output supplies | First absent field |
|---|---|---|---|
| `false_of_fixedTriple_secondCenter_q_t1_t3_equalities` | `dist c q = dist c t1` and `dist c q = dist c t3` | no equality among dangerous points | either dangerous equality |
| `false_of_fixedTriple_q_t1_t3_mem_uRow_support` | `q,t1,t3 in R` | `c in B` is center membership; `p in R` is outside `B` | first dangerous support hit, followed by two more |
| Triple-perpendicular-bisector sink in `stage1_bisector_producer_boundary.lean` | reciprocal cross-incidences for a pair and three distinct bisector centers | one diagonal source incidence plus one endpoint incidence | first reciprocal cross-incidence |
| `U2NonSurplusSqueeze.oppCap2_escape_gen` | a distinct off-surplus pair co-radial at both non-surplus apices | no pair from either bare incidence | after the cross-cap refinement, the contradiction-strength other-apex equality |
| LIVE-C named-center leaves | a statement about `f2CriticalRow.center`, with the entire LIVE-C source-slot packet | a statement about `rows.uRow.center` | `f2CriticalRow.center = rows.uRow.center`, itself requiring the missing source/slot identification |
| Banked U1 source-unit contradictions | a complete `RowSlotLabelPacket` plus many occurrence and metric-core fields | one center label or one support member | the first required row-slot occurrence; many further fields remain |
| Sibling U5/M44 banks | `D.IsM44`, minimal/U2/U3 or bounded-audit packets | the live lane assumes `not exists S, S.IsM44` | antecedent polarity and packet mismatch |

The LIVE-C leaves are additionally open `sorry` declarations in the protected
production file, so they are not checked consumers.  Even after those leaves
are proved, the row/source mismatch above prevents direct application from
`c in B`.

## The banked interior pair has the wrong polarity

`oppositeEndpoint_interiorPairFields` does produce two off-surplus facing-cap
interior points co-radial at the facing opposite apex.  It cannot be the
double-apex pair.  When the short cap index is non-surplus, the other
non-surplus apex is one of `leftOuterVertexByIndex k` or
`rightOuterVertexByIndex k`, and the same theorem proves the two interior
points have **unequal** distances to both outer vertices.

Thus this is not merely “one equality still unknown”: for that particular
pair, the required other-apex equality is kernel-checked false under the
packet hypotheses.

The facing-interior/other-adjacent-cap cross-cap pair is still a useful
*payload reduction*, and its specialization is being handled in the one-apex
producer lane.  But it does not evade the global polarity theorem:
`oppCap2_escape_gen`, equivalently the joint-fiber injectivity theorem, proves
that **every** distinct off-surplus pair co-radial at one non-surplus apex has
unequal distances at the other.  The cross-cap pair therefore fixes the
witnesses and first equality, but its remaining equality is already the whole
branch contradiction rather than a benign geometric field waiting to be
looked up.

## Kernel-checkable dependency countermodel

`stage1_short_cap_output_incidence_countermodel.lean` modifies only the `u`
row of the existing common-critical-incidence shadow.  It retains:

- one source-indexed common system;
- exact support cardinality four;
- source membership and center exclusion;
- same-center support equality; and
- the distinct-center support-intersection bound of two.

In that model both outputs hold at once:

```text
centerOf u in dangerousBase
p in supportOf u,
```

yet

```text
supportOf u intersect dangerousBase = empty.
```

Therefore no argument using only those common-incidence fields can turn either
short output into even one dangerous support hit.  This is a dependency
countermodel only: it does not assert a Euclidean realization, convexity,
MEC/cap geometry, exact full filters, global K4, or the complete K-A-PAIR
antecedent.

## Smallest remaining producer fields

There are two honest next targets, depending on the intended consumer.

1. For the checked dangerous-equality sink, the producer must visibly use the
   omitted convex/MEC/cap geometry to create two same-center dangerous
   equalities.  Neither short incidence is progress toward the first equality
   without an additional cross-row localization theorem.

2. For `oppCap2_escape_gen`, the useful payload refinement is a *different*
   cross-cap pair: one facing-interior point and the forced singleton hit in
   the other non-surplus adjacent cap.  This works in **both** endpoint arms:
   pair that singleton with `c` in the dangerous-endpoint arm and with `p` in
   the `u`-row-endpoint arm.  The short selector supplies their equality at
   `oppositeVertexByIndex k`; cap-intersection uniqueness plus exclusion of
   the positive-radius center puts the singleton off surplus.  The exact
   remaining producer is equality at the other non-surplus apex.  By
   `oppCap2_escape_gen` that equality is contradiction-strength and its
   negation for the produced pair is already checked.  This specialization
   covers both short non-surplus orientations and neither large-facing-cap
   branch.

Consequently the bare outputs `c in B` and `p in R` should be treated as
checked localization facts, not closure producers.  The next named producer
should expose either the first dangerous cross-row equality or the cross-cap
pair's other-apex equality; adding more case splits to the bare incidences
does not reduce a current checked consumer.

## Required theorem-bank preflight and epistemic status

Before this assessment, all registries required by `AGENTS.md` were checked:

- `docs/general-n-certificate-bank-mining-2026-07-09.md`;
- `certificates/p97_rvol_general_n_mining.{md,json}`;
- `certificates/erdos97_legacy_general_n_mining.{md,json}`; and
- `certificates/erdos_general_theorem_p97_mining.{md,json}`.

Targeted `nthdegree docs search --lean` queries covered short opposite-cap
selected classes, cross-row membership, one-hit incidence, and mutual-center
membership.  The closest sibling theorem,
`short_endpoint_shell_meets_adjacent_cap_card_le_one`, is subsumed by the live
`moserCapCoreSelectorAt`/`moserSelectorShapeAt_of_convexIndep` surface and does
not produce the missing equality or cross-row incidence.

- **PROVEN in current source:** the two short incidences, their stated metric
  consequences, the support-cardinality obstruction, and the wrong-polarity
  interior-pair inequalities.
- **CHECKED-SCRATCH:** the finite common-incidence dependency countermodel.
  Both printed endpoints have exactly
  `[propext, Classical.choice, Quot.sound]`.  Source SHA-256:
  `ff6537354ae2d511bbf07dfaaf053d0a903fe729f18cc3f75f05854881c81fea`.
- **NOT CLAIMED:** independence from convexity, the MEC/cap packet, no-M44, or
  the complete K-A-PAIR hypotheses.
- **OPEN-PROOF:** derive the first dangerous cross-row equality, or derive the
  contradiction-strength other-apex equality (equivalently an
  `ApexAlignedTwoHit`) from the full K-A-only coupling.

Source hygiene found no `sorry`, `admit`, `axiom`, or `native_decide` token in
the new scratch Lean file.  After the shared lane became idle, its scratch
dependency was emitted to a temporary olean and the target was checked against
that temporary `LEAN_PATH`; both commands exited 0.  Consolidated record:
`stage1_scratch_validation_2026-07-14.md`.
