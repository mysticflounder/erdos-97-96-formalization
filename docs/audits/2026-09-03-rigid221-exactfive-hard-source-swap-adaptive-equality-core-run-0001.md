# Adaptive equality-core run-0001 result audit — 2026-09-03

Status: completed, replayed, and inconclusive.

## Outcome

All four mandatory PIQD Singular controls returned the expected verdicts:

| Control | Expected | Returned | Wall time |
|---|---:|---:|---:|
| linear unit | `UNIT` | `UNIT` | 56 ms |
| linear nonunit | `NONUNIT` | `NONUNIT` | 51 ms |
| distance unit | `UNIT` | `UNIT` | 57 ms |
| distance nonunit | `NONUNIT` | `NONUNIT` | 50 ms |

Both characteristic-zero gauge targets contain 18 variables and 13
squared-distance row polynomials. The Z3-origin gauge run
`de577999-7ce0-427a-9cc5-25d55620208f` timed out after 900043 ms, and the
cvc5-origin gauge run `3f149f92-fdc5-484e-a862-741ddeda6e4b` timed out after
900028 ms. Each target has empty stdout and stderr, both with SHA-256
`e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855`.
The terminal status is therefore `TARGET_INCONCLUSIVE`.

## Launcher history

The initial launcher expired after 1201.18 seconds while the first control was
still queued. That event records PIQD queue starvation only; it is not a
Singular result. The same first control later ran in 56 ms and its authenticated
artifact is marked `replayed=true`.

The completed launcher measurement was 2723.67 seconds real time. An immediate
completed resume revalidated the retained tree without constructing a transport
or making a solver request and finished in 0.43 seconds.

## New-data mine

The completed wave added only the two timeout records. It supplied no unit or
nonunit target verdict, no nonempty target transcript, and no new mathematical
antecedent. Consequently it produced no concrete theorem candidate, and the
repository Lean-corpus reuse search was not triggered.

## Custody

The run is bound to profile 1697, one sequential worker, a 900-second timeout,
and run-manifest base
`0e8431336b2a0713621877829ba9570effc2c67e`. The run-manifest file SHA-256 is
`b0561b77ab463275a3ba9dae17df45a001f95fb6de1f0d1c26a9eb9fb07cc6e5`
and its internal self-hash is
`f296d49688c4563b1f1b81214e87229dfcd288db63bba59ad1cb3958f23451b7`.
The launch file SHA-256 is
`f465d05246a2dea90e5065f2357689df12c7b1bf4877d4175544f302d456dce2`
and its internal self-hash is
`d958216f456f8589b9298215bbe7f98ba96f58b61ec116367a8634172d227f6e`.
The terminal file SHA-256 is
`0ee31efc5b4cbce0dcaf45e12a2ca9f0acc26d92498b4b998f0ff0669a18ecda`
and its internal self-hash is
`faf1ecce822e88542413e0717fc6ff9d0d4ab4610ac492a1edb070d30eed578b`.

The sparse machine-readable receipt is
`docs/computation/exactfive-hard-source-swap-adaptive-equality-core-20260903/run-0001-summary.json`.
It binds the per-query receipt, artifact, result, source-context, script, and
stream digests without republishing the scripts or transcripts.

## Claim boundary

This run supplies no mathematical verdict, no Lean or source claim, no promoted
claim, and no theorem candidate. Every mathematical, source, Lean, theorem, and
promotion flag in the authenticated terminal remains false.
