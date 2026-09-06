# Exact-13 witnessed-key Boolean root audit

Lane: `exact13-witnessed-key-root-20260906`
Base: `d405f50b4575bd9b3a3e5e7d817b7ac81851d973`
Source: `lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/CardGeThirteenExact13SourceIndexedFiniteKey.lean`

This is a solver-only discovery artifact. It makes the source `Key.Valid`
finite predicate explicit as Boolean witnesses; it is not a realizability or
Lean proof claim.

## Root coverage

`scripts/cardge13_exact13_witnessed_key_root_piqd.py` emits raw membership bits
for `C0,C1,K,L,T,G2,...,G12`, orientation, one-hot `b0,b1,z,s0,s1,d,ell,a,b`,
the `.c0/.c1` selector, and explicit `U,E,C,pair,chosen` witness bits. It
encodes, field-by-field:

* `CenterValid`: fixed K/L/T/global centers, distinct non-apex blockers, empty
  blocker global rows, and cardinality four for every other global row;
* `RowValid`: center exclusion, five cardinality-four base rows, disjointness,
  K/L disjointness, and the C0/C1/K partition of all labels except `z`;
* `CoarseValid`: `z` in the five-label interior and L, K/L interior cover,
  the (2,3)/(3,2) split, and both L intersections at most two;
* `RoleValid`: explicit `s0,s1,d` witnesses; and
* `OccurrenceValid`: explicit `ell,E,C,U,pair,chosen` witnesses, the selected
  other-row equalities, the opposite-row C equality, and the raw `a,b` roles.

The order map is the direct/mirror source order pair from the Lean bridge.
There are no metric, Kalmanson, distance, learned-conflict, or path-CEGAR
clauses in the root.

## Existing encoder comparison

`cardge13_exact13_global_source_cell_csp_piqd.py` has the finite row/role
scaffold, but omits every occurrence conjunct and adds a non-source root
requirement that T contains raw labels 6 and 7. Its strict mode also adds
metric/Kalmanson constraints. Consequently its projected models are not the
same universe as `Key.Valid`, and no containment claim is justified: it both
admits occurrence-invalid projections and can reject valid keys on the extra T
requirement (and, in strict mode, on metric constraints).

`...boolean_slice_piqd.py`, `...boolean_path_pair_cegar_piqd.py`, and the
related pinned/resume scripts inherit that finite scaffold and append learned
row cuts. They likewise omit occurrence witnesses. Their models are therefore
not the new valid-key universe. A learned cut can be called conservative only
after an independent proof that it is a consequence of `Key.Valid`; this lane
does not assume that. The new root intentionally contains none of those cuts.

## Bounded PIQD smoke

The root contains 432 Boolean variables and 29,464 clauses. A fresh PIQD SAT
session used `piqd-satworker-cadical-3.0.1` (solver SHA pinned in the session
receipt) and one 120,000 ms solve. Session:
`73a6cd2a-8b19-44dd-98b2-56001498e489`. Result: SAT, `solve_ms=0`, 88 positive
model literals. Independent replay reports:

```text
CNF satisfied:       true
CenterValid:          true
RowValid:             true
CoarseValid:           true
RoleValid:             true
OccurrenceValid:       true
OrderValid:            true
Key.Valid:             true
```

### DIMACS/session-journal custody repair

The producer now records two distinct byte identities:

* emitted DIMACS artifact: 894,075 bytes,
  SHA-256 `18ff5514bed6bdc05791a4782328a2c81d456e1d54c828fe024cc3479f069a4c`;
* PIQD-normalized clause journal: 893,899 bytes,
  SHA-256 `35d66a8cab1be7230654fc25905b8b5967106fbb5f1a6843d8739d7972d75d8d`.

The 176-byte difference is exactly three leading DIMACS comment lines and one
`p cnf` header line. The verifier removes those four lines and requires every
remaining clause-body byte to equal the existing PIQD session journal. It then
requires the retained receipt's `base_bytes`, `base_clauses`, and `base_sha256`
to match that journal, and binds the retained model by session and result hash.
The normalized journal is retained as
`artifacts/piqd-normalized-journal.cnf`; `events/piqd-custody.json` and the
repaired `events/piqd-run.json` record both identities and self-hashes.

This repair reused the exact existing journal, receipt, and model. It made no
new solver request and records `rebound_without_solver_rerun=true`.

Retained artifacts are under
`scratch/runs/exact13-witnessed-key-root-20260906/run-0001/`, including the
emitted DIMACS, normalized PIQD journal, map, PIQD model and receipt JSON,
root/model-replay/custody events, and hashes.
This was one bounded smoke, not enumeration; no commit was made.

## Projection-only blocking and enumeration design

`projected_key_block` blocks only the 215 signed literals for the projected
`Key`: orientation, all 16 raw row supports, `b0,b1` (which determine the
center map), `z,a,b`, and `other`. It excludes `s0,s1,d,ell,E,C,U,pair,chosen`
and all auxiliary/intersection bits. A bounded driver can use:

```text
piqc session new --solver piqd-satworker-cadical-3.0.1 --lane sat --label exact13-enum
piqc session add <sid> --file .../exact13-witnessed-key-root.cnf
piqc session solve <sid> --timeout-ms 120000
piqc session add <sid> --clause "<projected_key_block literals>"
```

After each SAT model, decode and replay `Key.Valid` independently, append one
projected block, and stop at a predeclared model bound. Any CEGAR refinement
must append a separate, source-audited clause; it must not be placed in this
root.

## Structural size estimate

The Boolean state is 432 variables (`2^432 ≈ 1.11·10^130` unconstrained
assignments), while one projected block has 215 literals. Before partition,
coarse, role, and occurrence restrictions, the row-cardinality envelope is

```text
C(13,4)^5 · C(12,4)^9 ≈ 3.33·10^38
```

Allowing the free orientation, ordered non-apex blockers, five interior z
choices, ordered a/b choices, and other selector gives an intentionally loose
structural envelope of about `1.14·10^44`. The actual valid-key count is not
estimated by the smoke and remains to be measured by bounded enumeration.

## Mapping learned clauses to Key fields

`m_<row>_<raw>` maps to raw membership in `Key.rawSupport`; positional support
uses the selected order index. `is_b0_raw` and `is_b1_raw`, together with
orientation, determine `centerOf .c0/.c1`; `is_z_raw`, `is_a_raw`,
`is_b_raw`, and `other_c0/c1` map directly to the corresponding Key fields.
`s0,s1,d,ell,E,C,U,pair,chosen` are witnesses and must not appear in a
projected-key block. Existing learned row cuts must be rechecked against this
mapping and `Key.Valid` before being retained.
