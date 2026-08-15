# U3 simultaneous six-center post-bank audit (2026-08-09)

## Scope and method

This is the mandatory fresh theorem-bank pass after the single completed
simultaneous six-center CEGAR wave.  The wave artifacts remain finite
diagnostics (`RESULTS.md`: SAT abstraction for the live branch, semantic-UNSAT
for the all-confined branch), not a universal Lean closure.  I read the wave
artifacts and the U3 section of
`docs/computational-closure-plan-2026-07-28.md` before searching.

The required agentic indexed searches were attempted first.  They failed to
produce results because the agentic backend hit its usage limit (gpt-5.3-
codex-spark, then gpt-5.6-luna).  Normal scoped searches over
`erdos-97-96-formalization-lean` were then run for each live gap and for the
four canonical theorem-bank registries.  No solver or code run was performed.

## Results by requested gap

| Gap | Relevant declarations | Classification | Result |
|---|---|---|---|
| Return/collision of an escaping q-deleted row | `U3FixedTripleAuditFrame.exists_qDeleted_escape_or_criticalFourShell` (`lean/Erdos9796Proof/P97/U3ToU5Terminal.lean:371`); endpoint/FreshThird escape producers in `ATail/FrontierLiveClosure` | Current producer; adjacent routes are adapter-only/irrelevant | No theorem returns an escape to bounded support or gives a six-center collision/provenance. The current theorem explicitly disclaims repeated-return content. |
| Confine all six audit rows | `RowwiseConfinedQDeletedClasses` and `false_of_rowwiseConfinedQDeletedClasses` (`U3ToU5Terminal.lean:333,347`); `SixSurvivorExactRowsBoundary.false_of_u3ExactRadiusAuditObstruction_of_rowwiseConfined` (`ATail/FrontierLiveClosure/TwoSourceClosure.lean:1242`) | Exact missing proposition plus source-clean consumer; six-row theorem is adapter-only | No universal producer establishes the confinement premise. |
| CriticalFourShell named/dangerous-circle/blocker provenance | `CriticalFourShell` support fields and `support_eq_radius`, `q_mem_A`, `off_row_named_label_forbidden` (`P97/U1CarrierInjection.lean:638-710`); `U5QDeletedK4Class.inter_dangerous_p_circle_card_le_two` (`P97/U5GlobalIncidenceSupport.lean:545`) | Shell support facts are exact reusable; dangerous-circle theorem is q-deleted-only; bounded-support wrappers are downstream/circular | No theorem links a shell at the audit center to `{q} ∪ T`, a blocker fiber, a named source/collision label, or the six-center boundary. |
| Direct consumer for the full simultaneous escape-or-shell packet | `SixSurvivorExactRowsBoundary.exists_u3AuditObstruction` (`TwoSourceClosure.lean:1156`) and `exists_u3ExactRadiusAuditObstruction` (`:1209`) | Adapters/packet producers only | No direct `False` consumer exists for the full packet. Generic shell consumers require extra `ExactOffCircleCore` or `ShellMetricCoreAlternative`; FreshThird and U1 consumers concern different routes. |

## Canonical bank outcome

`docs/general-n-certificate-bank-mining-2026-07-09.md`,
`certificates/p97_rvol_general_n_mining.{md,json}`,
`certificates/erdos97_legacy_general_n_mining.{md,json}`, and
`certificates/erdos_general_theorem_p97_mining.{md,json}` were inspected.
The RVOL registry contains adjacent U3-family source-proved declarations and
endpoint/FreshThird/U1 routes, but no declaration with the current
`U3FixedTripleAuditFrame` six-center hypotheses that closes one of the four
gaps.  The legacy and general theorem registries have no exact relevant hit.
“Source-proved” in the registry is not a transitive consumer/axiom-closure
claim.

The current U3 producer and its rowwise terminal consumer have only core Lean
axioms under `proof-blueprint axioms`; this does not close the surrounding
`TwoSourceClosure` residual, which still contains the load-bearing terminal
`sorry` at line 2796.

## Narrowest missing producer

The narrowest general-cardinality producer is a source-level theorem that, for
the U3 escape witness `(x, B, z)` with `z ∉ U5BoundedSupport`, either returns an
exact q-deleted row to a relevant bounded audit center or proves a named
collision/incidence with the six-center source provenance.  The independent
shell-arm producer must link
`Nonempty (CriticalFourShell D.A q x)` at the audit center to named dangerous-
circle/blocker provenance.  Equivalently, a universal producer of
`RowwiseConfinedQDeletedClasses` for every exact-radius frame emitted by the
six-row boundary would close the existing consumer.  A finite 468-pattern
UNSAT result cannot supply either general-cardinality producer.
