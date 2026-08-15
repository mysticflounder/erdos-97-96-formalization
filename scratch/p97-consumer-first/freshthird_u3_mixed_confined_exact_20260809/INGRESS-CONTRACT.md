# U3 mixed confined packet: ingress contract

This wave uses only the eight distinct labels forced by
`U3FixedTripleAuditFrame`: `p,q,u,a0,a1,t1,t2,t3`.  Distinctness follows from
the `erase` memberships, `candidate_notin_T`, `a0_notin_base`, and
`a1_notin_base` fields (and the three-point card/distinctness facts of
`U5DangerousTriple`).  The old support is exactly
`insert p (insert q (insert u (insert a0 (insert a1 {t1,t2,t3}))))`.

## Audited source facts

* `U3FixedTripleAuditFrame.auditCenter_qDeleted_or_criticalFourShell` (lines
  250–265 of `lean/Erdos9796Proof/P97/U3ToU5Terminal.lean`) gives, for each
  `x ∈ U5BoundedAuditCenters`, either an existential `U5QDeletedK4Class` with
  `B.card = 4`, or `CriticalFourShell D.A q x`.
* `U5QDeletedK4Class` (U5GlobalIncidenceBasic lines 243–250) supplies
  `B ⊆ (D.skeleton q).erase x`, `q ∉ B`, radius positivity, and equal radius;
  it does **not** make `B` the whole ambient radius class.
* `CriticalFourShell` (U1CarrierInjection lines 638–652) supplies
  `x ∈ A.erase q`, `q ∈ support`, `support.card = 4`, and exact
  `support = A.filter (dist x · = radius)`.
* `qDeletedRow_dangerousCircle_distribution` and
  `criticalFourShell_dangerousCircle_distribution` (U3ToU5Terminal lines
  311–345) license intersection with `{q,t1,t2,t3}` ≤ 2 and at least two
  off-circle points for the exact four-point rows.
* `SelectedFourClass.inter_card_le_two` is applicable after converting a
  q-deleted exact row or a CriticalFourShell to `SelectedFourClass`, and gives
  pairwise support intersection ≤ 2 for distinct centers.  The bounded support
  structure records the same consumer-facing pair cap in
  `U5BoundedAuditSupport.two_circle_overlap` (U5GlobalIncidenceBasic lines
  549–564).

## Pointwise no-shift gap

`exists_escaping_shift_or_confinedCriticalFourShell` in
`scratch/U3EscapeShiftScratch.lean` typechecks (see `lean-check.log`).  Its
conclusion is only

```
(∃ F', F'.u ∉ oldSupport) ∨
(∃ x ∈ boundedCenters, ∃ K : CriticalFourShell ..., K.support ⊆ oldSupport)
```

It is not the intended universal six-row packet.  The exact missing producer
needed by the no-shift branch is:

```
theorem noShift_forall_confined_row
  (H : U3FixedTripleAuditFrame D q p t1 t2 t3)
  (hexact : (((D.skeleton q).erase p).filter
      (fun z => dist p z = dist p q)).card = 3)
  (hno : ∀ F' : U3FixedTripleAuditFrame D q p t1 t2 t3,
      F'.u ∈ oldSupport → False) :
  ∀ x ∈ U5BoundedAuditCenters D q p {t1,t2,t3} H.u H.a0 H.a1,
    (∃ B, Nonempty (U5QDeletedK4Class D q x B) ∧ B.card = 4 ∧
      B ⊆ oldSupport) ∨
    (∃ K : CriticalFourShell D.A q x, K.support ⊆ oldSupport)
```

The displayed `hno` is schematic: Lean should use the exact escaping-shift
predicate/antecedent, not a stronger or weaker guessed substitute.  The
existing theorem proves the needed shift for an escaping q-deleted point or
an escaping shell point, but does not package the six pointwise applications.
No universal no-shift ingress is claimed in this wave.

## Encoding boundary

The exact census enumerates only support membership and the source-entitled
incidence guards above.  Critical-shell rows additionally carry an equality /
disequality closure annotation for every ambient label: membership means
`dist x label = radius`, omission means `≠`, by `support_eq` and
`dist_ne_radius_of_mem_A_not_mem_support`.  **No q-deleted row receives those
off-support disequalities**, because its source class is an arbitrary exact
four-subset, not the full radius class.  No nonlinear geometry is encoded.
