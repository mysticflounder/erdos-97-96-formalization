# FreshThird U3 LeanSatIr differential run

Date: 2026-08-19

Status: EMPIRICALLY VERIFIED finite-ingress experiment; no universal closure
claim.

## Scope

The exporter represents the explicit U3 audit frame already present in the
corrected v10 emitter:

- `I = Fin 17` carrier indices;
- eight distinct named carrier roles `q, p, t1, t2, t3, u, a0, a1`;
- a four-slot dangerous-base selector whose image is exactly
  `{q, t1, t2, t3}`;
- an eight-slot bounded-support selector;
- six injective four-slot q-deleted row selectors, each omitting its center;
- same-index three-point dangerous-circle distribution for every row; and
- an existential outside-bounded-support row obstruction.

Euclidean realizability, exact metric equalities, `classAt`, source-row
transport, minimality, and the universal FreshThird theorem remain deliberately
outside this finite formula. The selector functions are a compact finite-model
normal form, not a new source theorem.

## Encoding and solver results

The first explicit ground IR was 64,959,533 bytes. The piqd prepare endpoint
returned HTTP 413; `piqc prepare` surfaced only `error decoding response body`.
The exporter was then changed to use finite selector functions, avoiding the
large repeated cardinality AST while keeping the same finite conditions.

The selector IR is 197,025 bytes and hashes to
`a7c04e9b0771c9db976556c02a874cec85b922b359ba2d28d30180ba5a7f1cec`.
piqd accepted it as job
`19b9e018-1d3d-4bd2-949a-99458ee7ae39`, with identity hash
`dc5516b8dd4d93287e5644046268cee4535c1079218881a8cb227aebfa5455ac`.
The bridge emitted 710,182 variables and 2,143,629 clauses; the stored CNF
hash is `7566cde0cc72c147f38a85c71a69fa9a2e51300757311d4ec3cf8a7ef21664e9`.
CaDiCaL returned `SAT` in 616 ms.

The complete solver log is 5,612,014 bytes. Reassembling the documented
chunked log endpoint produced all 710,182 signed assignments. An independent
streaming replay checked all 2,143,629 clauses: zero malformed or unsatisfied
clauses.

Decoded stable function cells give the following witness:

```text
q=16, p=15, t1=14, t2=13, t3=12, u=11, a0=10, a1=9
dangerous={12,13,14,16}
bounded={9,10,11,12,13,14,15,16}
row_u ={10,13,14,15}
row_a0={11,13,14,15}
row_a1={11,13,14,15}
row_t1={11,12,13,15}
row_t2={11,12,14,15}
row_t3={8,13,14,15}
```

Every row is q-deleted, omits its center, has at most two dangerous points,
and `row_t3` supplies the outside witness at index 8.

## Differential conclusion

The selector encoding and corrected v10 encoding express the same named U3
finite conditions in different representations; their CNF bytes are not
expected to match. The piqd result is a valid SAT witness for this weakened
finite abstraction. It does not close `SixSurvivorU3ExactRadiusAuditObstruction`
or any FreshThird `sorry`.

The bridge removed hand-written clause polarity and cross-product generation
from this test. It therefore addresses the two v10 emitter failure modes, but
source-faithful Lean ingress still has to be supplied before the experiment can
be promoted.

## piqd findings reported in `#piqd` (#7150)

1. Large valid LeanSatIr bodies receive HTTP 413 at `/jobs/prepare`, while the
   client hides the status behind `error decoding response body`.
2. `piqc lean model` only inspects the final 1 MiB of the solver log. It rejects
   this valid 710,182-variable SAT job even though chunked full-log retrieval
   and independent replay succeed. The model route needs a persisted model or
   bounded full-log streaming.
