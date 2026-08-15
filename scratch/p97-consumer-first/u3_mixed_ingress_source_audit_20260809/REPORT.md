# U3 mixed-confined ingress source audit (2026-08-09)

Scope: read-only inspection of `U3ToU5Terminal.lean`,
`U5GlobalIncidenceSupport.lean`, `U5GlobalIncidenceBasic.lean`, and
`U1CarrierInjection.lean`. No Lean build was run. The inspected sources have
no `sorry`/`axiom` declaration in the relevant path.

## Proposed proposition and theorem signatures

The desired packet can be stated without adding antecedents:

```lean
def MixedConfinedAuditPacket
    {D : CounterexampleData} {q p t1 t2 t3 : ℝ²}
    (H : U3FixedTripleAuditFrame D q p t1 t2 t3) : Prop :=
  ∀ x ∈ U5BoundedAuditCenters D q p ({t1, t2, t3} : Finset ℝ²)
      H.u H.a0 H.a1,
    (∃ B : Finset ℝ²,
      Nonempty (U5QDeletedK4Class D q x B) ∧
        B.card = 4 ∧
        B ⊆ U5BoundedSupport D q p ({t1, t2, t3} : Finset ℝ²)
          H.u H.a0 H.a1) ∨
    ∃ K : CriticalFourShell D.A q x,
      K.support ⊆ U5BoundedSupport D q p ({t1, t2, t3} : Finset ℝ²)
        H.u H.a0 H.a1

theorem exists_escaping_shift_or_mixedConfinedAuditPacket
    {D : CounterexampleData} {q p t1 t2 t3 : ℝ²}
    (H : U3FixedTripleAuditFrame D q p t1 t2 t3)
    (hexact :
      (((D.skeleton q).erase p).filter
        (fun z => dist p z = dist p q)).card = 3) :
    (∃ F' : U3FixedTripleAuditFrame D q p t1 t2 t3,
      F'.u ∉ U5BoundedSupport D q p ({t1, t2, t3} : Finset ℝ²)
        H.u H.a0 H.a1) ∨
    MixedConfinedAuditPacket H
```

The proposition uses the six centers exactly: `U5BoundedAuditCenters` is
`insert H.u (insert H.a0 (insert H.a1 {t1,t2,t3}))`
(`U5GlobalIncidenceBasic.lean:543-547`). The old support is exactly
`insert p (insert q (insert H.u (insert H.a0 (insert H.a1 T))))`
(`U5GlobalIncidenceBasic.lean:492-496`).

## Proof sketch from current APIs

1. Start `classical`; `by_cases hEsc` on the theorem's first existential.
   In the true branch return `Or.inl hEsc`.

2. In the false branch, introduce `x hx` for the packet. Apply
   `H.auditCenter_qDeleted_or_criticalFourShell hx`
   (`U3ToU5Terminal.lean:250-265`). Its internal proof obtains
   `x ∈ D.skeleton q` from
   `H.dangerous.audit_center_mem_skeleton H.selected H.a0_mem H.a1_mem hx`
   (`U5GlobalIncidenceSupport.lean:23-40`), then invokes
   `U5QDeletedK4Class.exists_card_four_or_qCritical_of_globalK4`
   (`U5GlobalIncidenceBasic.lean:430-452`). Thus no separate center-membership
   premise is needed.

   The only center distinctness needed by the existing metric APIs is `x ≠ p`;
   `H.auditCenter_ne_dangerousCenter hx` (`U3ToU5Terminal.lean:294-309`)
   proves it by decomposing the six-center insertion and using the erase
   memberships of `u,a0,a1,T`. The frame's other label non-collisions are
   already fields (`selected.candidate_notin_T`, `a0_notin_base`,
   `a1_notin_base`); `T.card = 3` is `H.dangerous.T_card`. No guessed
   pairwise-distinctness premise is needed.

3. In the q-deleted arm, destruct
   `⟨B, hB : Nonempty (U5QDeletedK4Class D q x B), hcard : B.card = 4⟩`.
   By cases on `hconf : B ⊆ oldSupport`, return
   `Or.inl ⟨B, hB, hcard, hconf⟩` when true.

4. If `¬hconf`, use `Finset.not_subset.mp hconf` to obtain
   `y ∈ B` and `y ∉ oldSupport`; choose `K` from `hB`. The exact current
   outside-to-candidate API is
   `H.dangerous.candidate_of_not_mem_boundedSupport K hyB hyOutside hexact`
   (`U5GlobalIncidenceSupport.lean:1369-1400`), yielding both
   `U5SelectedCandidateSkeleton ... y` and `dist p y ≠ dist p q`.
   Then `H.shiftOfEscape hy hyOff hyOutside`
   (`U3ToU5Terminal.lean:412-451`) is the shifted frame. Its new `u` escape
   field is discharged exactly as in the existing theorem:
   `simpa [shiftOfEscape] using hyOutside`. This contradicts `hEsc`.

5. In the critical-shell arm, destruct `⟨K : CriticalFourShell D.A q x⟩`.
   By cases on `hconf : K.support ⊆ oldSupport`, return
   `Or.inr ⟨K, hconf⟩` when true.

6. If the shell is not confined, use
   `Finset.not_subset.mp hconf` for `y ∈ K.support` and
   `y ∉ oldSupport`. Apply
   `H.dangerous.candidate_of_criticalFourShell_not_mem_boundedSupport K
   hyK hyOutside hexact`
   (`U5GlobalIncidenceSupport.lean:1455-1470`). This API internally converts
   the shell with `K.toU5QAllowedK4Class` and proves the q-allowed support
   obligation by simp; no extra shell card/radius premise is required.
   The shell's exactness and cardinality are already structure fields
   `K.support_eq` and `K.support_card` (`U1CarrierInjection.lean:638-652`);
   the packet only needs the support subset relation.
   Shift with `H.shiftOfEscape` and contradict `hEsc` as in step 4.

The only classical uses are the local subset case splits, finite-set
`not_subset` witness extraction, and the existing noncomputable shift
construction. `hexact` is the sole new premise and is exactly the premise
required by both outside-to-candidate APIs. It can be supplied by
`U3LocalizedNoQFreePacket.exact_radius_class_card_eq_three` or
`exact_radius_class_card_eq_three_of_dangerousTriple` (U3ToU5Terminal.lean:
526-558) when the surrounding localized packet is available.

## Missing API and comparison

There is no missing API for the displayed theorem: every antecedent and both
escape constructions are already available. The missing source declaration is
only the universal mixed packet/theorem itself; it can be proved directly by
the six-center argument above. If the next consumer requires a
`U5BoundedAuditSupport`, that is a separate gap: a confined critical shell
contains `q` and is not a q-deleted exact class, so the current support
constructor cannot consume the shell branch without a new shell-row consumer or
a theorem eliminating that branch.

This is strictly stronger than
`exists_escaping_shift_or_confinedCriticalFourShell`
(`U3ToU5Terminal.lean:472-503`): the latter gives escape or one confined shell,
whereas the proposed conclusion gives, simultaneously for every one of the
six centers, an exact confined q-deleted row or a confined shell. The proposed
packet implies the older conclusion under the existing false consumer: if no
center supplies a shell, all six q-deleted rows are confined and
`false_of_rowwiseConfinedQDeletedClasses` (`U3ToU5Terminal.lean:347-379`)
derives `False`. The converse is not available: one confined shell says
nothing about the other five centers. The stronger packet is therefore useful
as an ingress/case packet, but it is not by itself U5 support closure while a
critical-shell row remains possible.
