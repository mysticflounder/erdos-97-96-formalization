# Shared blocker deletion/radius boundary

Date: 2026-07-15

Status: **KERNEL-CHECKED EXACT PRODUCER EQUIVALENCE, ROLE-COLLAPSE, AND
UNIFORM CAP-FIVE OPPOSITE-APEX ROLE IMPOSSIBILITY; NO FULL-PARENT PRODUCER OR
DIRECT CONTRADICTION FOUND.**

## Scope

This lane owns only
`scratch/atail-force/blocker-distinct-radius/`.  It does not edit production
Lean, shared closure documentation, `SurplusM44`, or the unique-row lane.

## Theorem-bank preflight

Before deriving the shared equivalence, the required current, sibling, and
legacy theorem-bank registries were searched, including their JSON
inventories.  Focused `nthdegree docs search --lean` queries covered deletion
survival, source-omitting rows, exact critical shells, distinct positive
four-capable radii, reverse-mixed blocker roles, and second-large-cap/apex
alignment.

The closest current declarations were:

- `criticalShellOmission_iff_distinctRadiusClass`;
- `deletedApexOmission_iff_distinctApexRadiusClass`;
- `cross_survival_unique_radius_and_exact_support`;
- `exists_secondLargeCap_of_noM44`; and
- the cap-five opposite-apex radius-rigidity family.

No indexed or inventoried theorem identifies the second-large-cap witness's
opposite Moser apex with one of the selected reverse-mixed blockers
`x,u,y,v`, nor does one identify the existential second-large-cap index with
the particular `oppApex2` role used by the cross-apex residual.

## Kernel-checked exact equivalence

`SharedDeletionRadiusBoundary.lean` proves, for any exact critical shell
`C : CriticalSelectedFourClass A source center`, that the following four
interfaces are equivalent:

1. `HasNEquidistantPointsAt 4 (A.erase source) center`;
2. `Nonempty (CriticalShellOmissionRow C)`;
3. `Nonempty (CriticalShellDistinctRadiusClass C)`; and
4. existence of `K : SelectedFourClass A center` whose support differs from
   `C.toCriticalFourShell.support`.

The named theorems are:

```text
deletionSurvives_iff_criticalShellOmission
deletionSurvives_iff_criticalShellDistinctRadius
deletionSurvives_iff_exists_selectedSupport_ne_shell
```

The converse direction missing from the earlier radius consumer is
constructive: trim four witnesses on the erased carrier, then lift that row
to the ambient carrier.  Its support automatically omits the erased source.

The exact collapse theorem is:

```text
selectedFourClass_support_eq_shell_of_blocked
```

If deletion is certified to block K4, **every** selected four-row at the
critical center has the exact shell support.  Therefore invoking global K4
again at that center cannot manufacture the producer; a proof must force a
genuinely different support/radius or direct deletion survival using some
additional parent geometry.

## Cross-apex specialization

The existing apex packet now has the full three-way equivalence:

```text
deletedApexSurvives_iff_omissionPacket
deletedApexSurvives_iff_distinctApexRadiusClass
```

Thus the cross-apex missing datum is exactly one object with three
presentations: deletion survival, a row omitting the oriented endpoint, or a
distinct positive four-capable radius at `S.oppApex2`.  The certificate's
`blocked` field rules all three out; this is a consumer boundary, not a new
producer.

## Four reverse-mixed aligned arms

`reverseMixedAligned_survives_iff_roleDistinctRadius` specializes the same
equivalence to all four active center roles:

```text
center = x  relative to P.rowX
center = u  relative to Ku
center = y  relative to P.rowY
center = v  relative to Kv
```

The role-specific datum is named
`ReverseMixedAlignedDistinctRadiusProducer`.  The theorem does not merge the
four arms or lose which retained row supplies the baseline radius.

`reverseMixedAligned_selectedRow_collapses` proves the corresponding exact
global-K4 audit: under the blocked certificate, any selected row at `center`
has support exactly `P.rowX`, `Ku`, `P.rowY`, or `Kv` in the active arm.

## Cap-five role follow-up: uniformly impossible on aligned arms

The precise role identification needed to apply the cap-five Moser-apex bank
at a selected blocker is packaged as:

```text
CapFiveOppositeApexBlockerRole S center
```

It contains an index `j : Fin 3` with

```text
j != S.surplusIdx
(S.capByIndex j).card = 5
center = S.oppositeVertexByIndex j.
```

If this role were supplied abstractly, the checked adapters

```text
selectedClass_card_le_five_of_capFiveBlockerRole
K4_radius_unique_of_capFiveBlockerRole
```

transport the existing cap-five class bound and unique-radius theorem to a
selected blocker.  The follow-up classification in
`CapFiveRoleClassification.lean` proves that this role cannot occur for any
of the four aligned reverse-mixed blockers.  Its named results are:

```text
reverseMixed_candidates_ne_oppApex1
reverseMixed_candidates_ne_oppApex2
reverseMixedAligned_center_ne_nonSurplusOppositeVertex
not_capFiveOppositeApexBlockerRole_of_reverseMixedAligned
```

The total theorem says that, for every non-surplus cap index `j`, an aligned
center is different from `S.oppositeVertexByIndex j`.  The proof uses only
the current strict-cap, outside-cap, and retained-row incidence fields:

- `x,y` lie in `oppCap2` but outside `surplusCap`, separating them from both
  non-surplus Moser apices;
- `u,v` lie outside `oppCap2`, separating them from `oppApex1`; and
- the retained-row non-membership fields separate `u,v` from `oppApex2`.

Thus the role is not merely missing from the full parent: it is **overstrong
and uniformly impossible** on these four arms, independently of cap
cardinality.  Exact card five cannot repair the identification.

This negative classification is specific to the four aligned reverse-mixed
centers.  It does not classify the cross-apex center, which is
`S.oppApex2` itself.  On that separate route,
`exists_secondLargeCap_of_noM44` still returns only

```text
exists j, j != i and 5 <= (CP.capAt j).card.
```

and therefore does not:

- identify `j` with the particular `oppIndex2` cross-apex role; or
- refine `5 <= cap.card` to `cap.card = 5` in the general-cardinality parent.

Moreover, even an applicable cross-apex exact-card-five rigidity theorem is
not by itself a closing producer: it gives a unique K4 radius and class
cardinality at most five, while the blocked critical shell realizes the
four-point alternative.

The first valid missing field for the reverse-mixed lane is therefore a
non-apex-specific coupling theorem that forces direct source deletion
survival, a selected row omitting the source, or a distinct positive
four-capable radius.  The cap-five opposite-apex rigidity family cannot be
transported to the aligned blockers.  No existing theorem was found that
supplies any of the three equivalent producer presentations from the
second-large-cap witness.

## Full-parent verdict

The full-parent no-`IsM44` output remains a **parallel cap-cardinality fact**.
For the reverse-mixed arms, the attempted opposite-apex bridge is now
kernel-refuted by the role-classification theorem.  There is still no
kernel-checked implication from the current MEC/cap/no-`IsM44`/global-K4
hypotheses to deletion survival, a source-omitting selected row, or a
distinct positive four-capable radius at the chosen cross/reverse-mixed
blocker.

This is not an independence theorem for the full geometric parent.  It is an
exact audit of the current theorem graph, a kernel-checked elimination of an
overstrong role target, and an identification of the remaining coupling
field.  The earlier exact
`Q(sqrt(3))` reverse-mixed regression remains only a metric-plus-incidence
partial model, not a `CounterexampleData`/MEC/global-K4 countermodel.

## Validation

Focused single-file checks were run from `lean/` against current production
source and isolated scratch oleans.  `CapFiveApexRigidity.lean`,
`SharedDeletionRadiusBoundary.lean`, and `CapFiveRoleClassification.lean`
all elaborated successfully.

Every printed theorem in this lane has axiom closure exactly:

```text
propext, Classical.choice, Quot.sound
```

There is no `sorryAx`, declared axiom, `admit`, or `native_decide`.  No
production target build, full `lake-build`, or publication gate was run.
