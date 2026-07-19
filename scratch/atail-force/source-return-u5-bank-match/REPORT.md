# Source-return U5 bank-match audit

Date: 2026-07-17

Scope: scratch-only audit of
`ATailRetainedMatchingSourceReturnRadiusSplit`, with no production, plan-doc,
generated-file, or protected-lane edits.

## Result

No source-return subarm is closed by the currently supplied U5 ingress alone.
The audit does, however, determine the exact incidence normal form and rules
out two tempting but non-load-bearing bank matches.

The decisive facts are kernel-checked in
`SourceReturnU5BankMatch.lean`:

1. In the joint-deletion arm, the supplied actual q-critical row meets its
   dangerous triple in **at most one** point:

   ```lean
   joint_actualCritical_inter_dangerous_card_le_one
   ```

2. On either side of the exact-four arm, the supplied q-critical row meets
   the corresponding dangerous triple in exactly one point, while the
   opposite q-deleted blocker row meets it in exactly two:

   ```lean
   exactFour_firstCritical_inter_dangerous_eq_singleton
   exactFour_firstDeleted_inter_dangerous_eq_pair
   exactFour_secondCritical_inter_dangerous_eq_singleton
   exactFour_secondDeleted_inter_dangerous_eq_pair
   ```

3. The remaining dangerous point is not merely unproved in the opposite
   q-deleted row.  It is forced absent by the source-return omission edge:

   ```lean
   exactFour_first_not_mem_oppositeRow
   exactFour_second_not_mem_oppositeRow
   ```

Consequently, the source-return ingress is not already one of the imported
U5 contradiction leaves.  Closing it through the U5 bank still requires a
new cross-row center/support producer.

## Search performed before proving

The required registries were inspected before adding the scratch lemmas:

- `docs/general-n-certificate-bank-mining-2026-07-09.md`, especially the
  sibling `p97-rvol` bank section;
- `certificates/p97_rvol_general_n_mining.md` and its JSON companion;
- both legacy JSON/Markdown registries required by `AGENTS.md`; and
- the indexed Lean corpora via `nthdegree docs search --lean` and a focused
  `erdos-97-96-formalization-lean` search.

The sibling JSON contains 159 source-proved `False` declarations mentioning
`U5DangerousTriple`.  Twelve have the same coarse row-count signature as one
side of the ingress—one `U5QCriticalTripleClass` and two
`U5QDeletedK4Class` hypotheses.  Two of those twelve are already present in
the current formalization; ten are sibling-only.  Neither legacy registry
contains a contradiction consumer using these three U5 interface types.

These are source-level census facts, not kernel-closure claims for every
sibling declaration.

## Exact bank matches

### Imported arbitrary-center q-critical consumer

The smallest imported consumer that does not first require identifying the
q-critical center with a dangerous-triple label is

```lean
Problem97.U5QCriticalTripleClass.two_triple_points_incompatibility
```

Its implication direction is:

```text
dangerous triple
+ q-critical row at a center different from p
+ two distinct dangerous points in that row
=> False
```

This is not a live producer target here.  The joint arm proves that the
relevant intersection has cardinality at most one, and each exact-four side
computes it to a singleton.  Thus the consumer's two-point antecedent is
structurally negated by the current provenance.

### Imported common-bisector consumer

The most compact support-level consumer is

```lean
Problem97.u5_common_bisector_triple_incompatibility
```

Its implication direction is:

```text
one q-deleted four-point row containing p and all three dangerous points
=> False
```

The joint arm has source-clean adapters from either exact support-containment
claim to this theorem:

```lean
joint_false_of_firstBlocker_dangerousClosure
joint_false_of_secondBlocker_dangerousClosure
```

In the exact-four arm, the opposite blocker row already contains two of the
three dangerous points.  The corresponding adapters show that adding the
first apex and the remaining dangerous point would close immediately:

```lean
exactFour_first_false_of_apex_and_first_mem_oppositeRow
exactFour_second_false_of_apex_and_second_mem_oppositeRow
```

But the remaining-dangerous-point premise is exactly what
`exactFour_{first,second}_not_mem_oppositeRow` disproves.  The common-bisector
route is therefore a regression/diagnostic endpoint, not the missing
producer.

### The one-critical/two-deleted sibling family

The two locally present members are

```lean
Problem97.U5QCriticalTripleClass
  .qcritical_exact_selected_antipodal_incompatibility
Problem97.U5QCriticalTripleClass
  .qcritical_exact_exact_selected_antipodal_incompatibility
```

Both require their q-critical center to be a named dangerous-triple point.
The first also requires the second q-deleted center to be a dangerous point
and the third to be a selected point; the second requires both q-deleted
centers to be dangerous points.  The exact-four ingress's third supplied
q-deleted row is centered at `p`, which is excluded from the dangerous triple
and from the selected-candidate skeleton.  Hence neither local theorem is a
direct match.

Among the ten sibling-only one-critical/two-deleted consumers, the only one
whose auxiliary q-deleted row can be the supplied physical row centered at
`p` without immediately requiring `p` to belong to its own support is

```lean
Problem97.U5QCriticalTripleClass
  .qcritical_exact_collinear_tail_incompatibility
```

It is in sibling module
`RVOL.P97.U5GlobalIncidenceQCriticalCollinearTail` and is not import-reachable
from this repository today.  Its exact implication direction is:

```text
dangerous triple T at (q,p)
+ selected u outside T
+ t1,t2,t3 in T, with t1 != t3
+ q-critical row at t1 containing p,t2,u
+ q-deleted row at t2 containing p,t3,u
+ q-deleted row at auxiliary center a containing t2,t3,u
=> False
```

For either source-return ingress, set `a := p` and use the supplied physical
q-deleted row.  The remaining producer must still do all of the following:

- identify the supplied actual q-critical blocker with a point `t1` of the
  dangerous triple;
- identify one supplied q-deleted blocker with a point `t2` of the dangerous
  triple;
- choose the remaining `t3` and a selected `u` outside the triple; and
- prove the nine listed support incidences across the q-critical, opposite
  blocker, and physical rows.

The ingress currently proves none of those center identifications or cross-row
support incidences.  This is a bounded center/support-confinement producer,
not a row-packaging adapter.

## Consequence for the parent strategy

The U5 bank does not presently turn either source-return subarm into a short
direct `False`.  The exact-four arm is especially rigid: its supplied rows
have the `singleton / forced-pair / forced-absence` pattern above.  Mining a
consumer that asks the opposite row to contain all three dangerous points
would be mining the wrong object.

If this lane remains on the U5 route, the smallest honest next theorem target
is a **source-indexed center/support confinement split** whose positive leaves
are the exact antecedents of a named consumer such as
`qcritical_exact_collinear_tail_incompatibility`.  Otherwise the direct
parent geometric contradiction remains the lower-dependency route.

## Validation

Fresh file check:

```text
cd lean
lake env lean \
  ../scratch/atail-force/source-return-u5-bank-match/SourceReturnU5BankMatch.lean
```

Result: success, with no Lean warnings or errors.

Every printed declaration below has exactly the axiom closure

```text
propext, Classical.choice, Quot.sound
```

and no `sorryAx`:

- `joint_actualCritical_inter_dangerous_card_le_one`;
- both `joint_false_of_*_dangerousClosure` adapters;
- all four exact intersection equalities;
- both exact forced-absence lemmas; and
- both exact common-bisector adapters.

The scratch source contains no `sorry`, `admit`, custom `axiom`,
`native_decide`, or `unsafe` declaration.
