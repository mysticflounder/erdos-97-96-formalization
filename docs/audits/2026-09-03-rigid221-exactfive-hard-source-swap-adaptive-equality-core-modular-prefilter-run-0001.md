# Adaptive equality-core modular prefilter run-0001 result audit — 2026-09-03

Status: completed, replayed, and inconclusive.

## Outcome

All four mandatory PIQD Singular controls returned the expected diagnostics:

| Control | Expected | Returned | Wall time |
|---|---:|---:|---:|
| linear unit | `UNIT` | `UNIT` | 111 ms |
| linear nonunit | `NONUNIT` | `NONUNIT` | 54 ms |
| distance unit | `UNIT` | `UNIT` | 60 ms |
| distance nonunit | `NONUNIT` | `NONUNIT` | 59 ms |

All four `GF(32003)` targets contain 18 variables and 13 polynomials. The
Z3-origin `slimgb` run `c30fe1de-1d98-4b35-9ff1-7de69230330c` timed out after
300128 ms, and the Z3-origin `std` run
`93cef725-5a87-4707-afc3-fe610b0f96aa` timed out after 300029 ms. The
cvc5-origin `slimgb` run `bd5ca3b1-9c56-412d-bc3b-e35aaf97ea1b` timed out
after 300173 ms, and the cvc5-origin `std` run
`6b3164af-ccca-4c2a-82ae-9af4a91186f9` timed out after 300020 ms.

Each target has empty stdout and stderr, both with SHA-256
`e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855`.
No target has basis size, dimension, vector-space dimension, or reduction
metadata. The terminal status is therefore `MOD_ALL_TIMEOUT`. Neither gauge
has a selected basis algorithm.

## Launcher history

The completed launcher measurement was 1223.38 seconds real time. An immediate
completed replay revalidated the retained tree without constructing a
transport or making a solver request and finished in 0.41 seconds.

## New-data mine

The completed wave added only four finite-field timeout records. It supplied
no unit or nonunit target diagnostic, no nonempty target transcript, and no
selected algorithm. Consequently it produced no concrete theorem candidate,
and the repository Lean-corpus reuse search was not triggered.

## Custody

The run is bound to `GF(32003)`, monomial order `dp`, one sequential worker, a
300-second timeout, and run-manifest base
`24f982d5e1d56525719cc6b499e044451ea921ac`. The run-manifest file SHA-256 is
`0cac96a2c73548ff1fdfa2eb55f249c9be8ef1f9ce2cd9fe3a06a3dc0cacd129`
and its internal self-hash is
`825ea7ab1da5d3471af460027dca52fc8e010af2f60730be225a100d77b5f9e3`.
The launch file SHA-256 is
`27bca156ff6fe9d5de0e3513cf42d63485a6b160e40e8ee35c4dcd7b26fd6ece`
and its internal self-hash is
`7798614de90f88182efd08f506c958d41cc0ed1383ffa19abdf35629da080e7c`.
The terminal file SHA-256 is
`9591eceea6633fe4bfad0eac514876cb8caf6347d6ab6b9d301e40fa3f542e6c`
and its internal self-hash is
`4e2f7156411e8d76df290e10023dcc2141d7eedf71f137979575e42823c13095`.

The sparse machine-readable receipt is
`docs/computation/exactfive-hard-source-swap-adaptive-equality-core-modular-prefilter-20260903/run-0001-summary.json`.
It binds the per-query request, receipt, artifact, result, source-context,
script, and stream digests without republishing the scripts or transcripts.

## Claim boundary

This run is only a basis-route diagnostic over `GF(32003)`. Its timeouts supply
no mathematical verdict, no conclusion over `QQ`, no source claim, no Lean
claim, no promoted claim, and no theorem candidate. Every claim flag in the
authenticated terminal and sparse summary remains false.
