# F1/D8 exact-row query contract — run 0001

## Question

Do the already-exposed exact-row and omission consequences of
`EndpointDistinctBlockerThreeStepDeletionCycle` force at least one of these
candidate bridges?

1. `k` lies in the retained first-apex row;
2. `c` lies in the canonical shell sourced by `j`;
3. `d` lies in the canonical shell sourced by `j`; or
4. `j` lies in the canonical shell sourced by `k`.

The solver asks for a model in which all four are false.

Execution commit: `2fe695039a3ddfd82bcc3b25ac6269dd60f52e27`. The
embedded per-file digests additionally authenticate the exact dirty-source
state read by the query.

## Role map

| Query role | Lean source role |
|---|---|
| `o` | `S.oppApex1` |
| `d` | `O.deleted` |
| `c` | `O.kept = Q.C` |
| `j` | `Q.J` |
| `k` | `Q.K = C.fresh` |
| `b` | `H.centerAt d ...` |
| `x` | `H.centerAt j ...` |
| `a` | `H.centerAt k ... = H.centerAt c ...` |

The four sources `c,d,j,k` are pairwise distinct. The blocker centers
`o,a,b,x` are pairwise distinct. Only the audited own-source disequalities
`b != d`, `x != j`, and `a != k` are added between those two families.

## Rows

Every represented support has exactly four distinct members and omits its
center.

- `retained_o` is `Q.row.support`; only the proved incidences `c,j` are pinned.
- `shell_d_b` is the canonical critical shell sourced by `d`; `c,d` are
  pinned and `j,k` are omitted.
- `shell_j_x` is the canonical critical shell sourced by `j`; `j` is pinned
  and `k` is omitted.
- `shell_k_a` is the canonical critical shell sourced by `k`; `c,k` are
  pinned and `d` is omitted.
- `delete_j_at_o`, `delete_k_at_o`, and `delete_d_at_o` are the three first
  rows of the cycle packets and omit their respective deletion sources.

The second row of each packet is represented by its canonical shell above.
This uses
`ATailFiveCenterDeletionBoundary.qDeletedK4Class_support_eq_selectedShell`,
not an equality guessed by the abstraction.

Rows with distinct centers overlap in at most two points. The three packet
overlap bounds are also named explicitly. No equal-or-disjoint condition is
placed on the four witness rows centered at `o`.

## Status semantics

- `SAT_ABSTRACTION`: a complete finite equality-class model avoids all four
  bridges. This proves only that these incidence consequences are
  insufficient; it is not a geometric counterexample.
- `UNSAT_RELAXATION`: the abstraction itself is inconsistent. It is not a
  theorem until the contract is independently audited and the result has a
  checked certificate or a direct Lean proof.
- `UNKNOWN`: no conclusion.

The result embeds SHA-256 digests of the query and all Lean files used for the
contract. SAT readback is replayed by pinning every equality-class variable in
a fresh solver instance.
