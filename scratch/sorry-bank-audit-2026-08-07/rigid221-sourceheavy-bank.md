# Rigid221SourceHeavy theorem-bank applicability audit

Date: 2026-08-07.  Scope is the six `sorry` declarations at lines 3508,
10378, 13643, 13693, 14001, and 14120 of
`lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/Rigid221SourceHeavy.lean`.
The active leaves near 10106 and 10142 were deliberately excluded.  This is a
read-only audit; no production edit or build was performed.

## Bank/provenance baseline

`Rigid221SourceHeavy` imports the exact-15 and exact-16 BlockerV four-row
coverage files, but does not import the exact-12 ordered-cut/three-row/
Kalmanson modules.  The exact-15/16 consumers require concrete finite boundary
data, an injective label map, `PositionEmbedding`, `RealizesRows`, and
`PairwiseSeparated`; they are not consumers of an abstract `CarrierVertex`
residual.  The Kalmanson schemas likewise require explicit cyclic order and
shell equalities.  A scoped search of all four canonical P97 registries found
no `Rigid221`, source-heavy, exact-12, or BlockerV theorem matching any of the
six targets (only unrelated general-bank entries).  The exact-12 indexed
modules are useful possible consumers, but their finite replay/coverage is not
an aggregate closure and still needs source/placement ingress.

## Findings

| line / declaration | exact closer | useful candidate and first missing bridge |
|---|---|---|
| 3508 `...pentagonBlockerDeleted` | No exact bank hit. | Local `orderedCap_center_equidistant_three_points` and four-cycle consumers are only downstream geometric consumers: the hypotheses expose two row traces and `centerAt xv = deleted`, not the third equality/cycle they require. Missing a source-faithful five-cycle (or third-incidence) producer and ordered-cap adapter. |
| 10378 `...pentagonBlockerV_vRowBlockerOffClass` | No exact bank hit. | The imported exact-15/16 BlockerV consumers apply to the separate branch `centerAt v = deleted`, with deleted-center interior/off-class hypotheses, cardinality/profile data, and row realizations. This target has only `centerAt v ∉ SelectedClass ...`; the excluded exact-17 leaves are in that other branch too. Missing an off-class blocker identity/transport and a finite profile or new universal consumer. |
| 13643 `...exactTwelve...commonDeletion_missingIncidence` | No exact closer. | The committed placement transport supplies the 42-placement domain and admissible relabeling infrastructure, but is not imported here and does not consume the negative five-incidence packet. Remaining bridge: source-faithful exact-12 row/certificate materialization, then checked orbit coverage and a universal representative-cell contradiction. |
| 13693 `...exactTwelve...nextRowOnlyHit` | No exact closer. | Same: the committed transport helps with placement/relabeling only. `xu ∈ Kc.support`, `u,xv ∉ Kc.support` still needs a concrete ordered-row/certificate producer, followed by checked orbit coverage and universal representative-cell contradiction. |
| 14001 `...uDeletion_fixedPhysicalPair_missingIncidence` | No exact closer. | The adjacent checked theorem `...uDeletion_false_of_tetrahedron_incidences` closes only the positive five-incidence conjunction; this declaration is exactly its negated residual and has only `13 ≤ card`. Exact-12 and BlockerV banks do not match. Missing a universal producer/consumer for the negated fixed-pair incidence pattern. |
| 14120 `...threeCenterDeletion_xv_missingIncidence` | No exact closer. | The adjacent checked `...xvDeletion_false_of_tetrahedron_incidences` closes only the positive conjunction. This residual has two abstract source witnesses and survival-after-erasure hypotheses, not finite ordered labels or BlockerV rows. Missing a crossed-row/source producer (or universal negative-incidence consumer) for the negated pattern. |

## Re-audit after `f33e2b40`

`ExactTwelveRigid221PlacementTransport.lean` is now present, but it is not
imported by `Rigid221SourceHeavy`; its import chain is
`ExactTwelveRigid221PlacementTransport` → `ExactTwelveRigid221Ingress`, with
`ExactTwelveRigid221PlacementOrbits` and `ExactTwelveRigid221NormalizedSafeIngress`
as downstream users.  Thus there is no import-reachability route from either
SourceHeavy leaf to the adapter without a production import change (not made
here).

The committed adapter materially helps the exact-12 lane: it proves the
42-element ordered `(deleted,v)` placement domain, row-pattern reindexing, and
preservation of the frozen source labeling under an admissible relabeling.
The 21-representative orbit cover and `NormalizedSafeIngress` are present only
as untracked concurrent work as of this audit, so they are not classified as
available theorem-bank declarations.  Even if promoted, they would not close
either SourceHeavy leaf: no theorem consumes `commonDeletion` missing incidence
or the `nextRowOnlyHit` predicate, and there is no checked contradiction for
every representative cell.

Consequently the first remaining antecedent for line 13643 is a
source-faithful exact-12 row/certificate producer connecting its common-
deletion negative-incidence packet to a `FrozenSafeCubeOK`/concrete-row
certificate and then checked orbit coverage plus a universal contradictory
finite coverage result.  For
line 13693 it is the analogous producer for the concrete “only `xu` hits the
next row” pattern, followed by the same universal representative-cell
coverage/contradiction.  The committed placement transport is therefore a
checked transport producer, not a closer or a closure theorem.

## Conclusion

No one of the six declarations is theorem-bank-closable as stated.  The exact-
12 and exact-15/16/17 material is producer/consumer infrastructure, not a
drop-in proof: the first missing bridges are source-faithful ingress/material-
ization for lines 13643/13693, an off-class blocker transport for 10378, and
new universal negative-incidence or five-cycle producers for 3508/14001/14120.
