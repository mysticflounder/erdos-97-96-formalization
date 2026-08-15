# Source origins and shell-distribution audit

This successor preserves the predecessor ingress and source-derived finite
schema.  Its fresh namespace is required because the shell representation is
new semantics.  The active source hashes are in `manifest.json`; the
predecessor/current comparison is retained in
`predecessor_source_hashes.tsv` and `successor_source_hashes.tsv`.

## Licensed source clauses

| Encoded object or clause | Exact source | Scope in this wave |
|---|---|---|
| Six labels `t1,t2,t3,u,a0,a1` and their audit-center roles | `Problem97.U3FixedTripleAuditFrame`, `lean/Erdos9796Proof/P97/U3ToU5Terminal.lean` | Fixed six-center finite labels |
| Each audit center is q-deleted or a critical shell | `Problem97.U3FixedTripleAuditFrame.auditCenters_qDeleted_or_criticalFourShell` | Modes 0/1/2; at least one non-confined mode |
| All-confined q-deleted arm is impossible | `RowwiseConfinedQDeletedClasses`, `false_of_rowwiseConfinedQDeletedClasses` | Bounded all-confined classification only |
| q-deleted dangerous-circle distribution | `Problem97.U3FixedTripleAuditFrame.qDeletedRow_dangerousCircle_distribution` | Preserved predecessor q-deleted cut |
| Shell dangerous-circle intersection | `Problem97.CriticalFourShell.inter_dangerous_p_circle_card_le_two` in `U5GlobalIncidenceSupport.lean:87` | Every emitted mode-2 shell: Boolean sum ≤ 2 |
| Shell off-circle cardinality | `Problem97.CriticalFourShell.two_le_sdiff_dangerous_p_circle_card` in `U5GlobalIncidenceSupport.lean:100` | Every emitted mode-2 shell: aggregate outside count ≥ 2 |
| U3 shell distribution consumer | `Problem97.U3FixedTripleAuditFrame.criticalFourShell_dangerousCircle_distribution` in `U3ToU5Terminal.lean:333` | Consumer audit tying both inequalities to this frame |
| Shell support cardinality | `CriticalFourShell.support_card` in `U1CarrierInjection.lean:650` | Aggregate equation circle-count + outside-count = 4 |
| Pair overlap bound | `SelectedFourClass.inter_card_le_two` and predecessor finite wrapper | Finite pair constraints, unchanged |
| Seven finite prefilters | `U5FiniteAudit.prefilterReason` and `exact_prefilter_exhaustion` | 468 q-deleted patterns and all 12 prior cases |

For a shell center `c`, the representation is:

```text
shell_pc_c_q, shell_pc_c_t1, shell_pc_c_t2, shell_pc_c_t3 : Bool
shell_outside_c : Int
sum(shell_pc_c_*) ≤ 2
shell_outside_c ≥ 2
sum(shell_pc_c_*) + shell_outside_c = 4
```

`shell_pc_c_q` is forced true by `CriticalFourShell.q_mem_support`.  Points
outside `insert q T` are intentionally aggregated; no arbitrary ambient point
or Euclidean coordinate is invented.  Shell support does not acquire the
predecessor's q-deleted label no-goods.

## Unavailable facts retained

No same-center identity for arbitrary q-deleted witnesses, boundary-center
projection, blocker-fiber bound, canonical return/collision, Euclidean
coordinates, or universal finite-to-cardinality lift is encoded.  A shell
distribution constraint is a source-level necessary cut, not a realization.
