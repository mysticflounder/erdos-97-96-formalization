# Rigid221 S0 literal-blocker-`v` exact-five probe

## Status

**EMPIRICAL, FORMULA-SCOPED.**  This record concerns one fixed-order
13-role QF_NRA formula.  It establishes no source-universal claim, Lean
theorem, or proof-spine progress.

## Formula boundary

The probe fixes the Moser triple and the role order

`O, au, av, delta, m1, v, u, xu, m2, xv, bv, bu, cv`.

It requires the literal blocker equality `centerAt source = v`, exact source
and opposite rows, the exact `J = {u, xu, v}` interior, the physical and
source-cap membership conditions, strict convexity, non-obtuse constraints,
and the two deletion multiplicity conditions.  The complete construction is
in `scripts/rigid221_s0_blockerv_exactfive_probe.py`; its semantic contract is
`docs/specs/p97-rigid221-s0-blockerv-exactfive-probe-v1.md`.

## Encoding repair

The first PiQD ingress attempt exposed a serializer issue: Z3 encoded the
per-role exact-one cap condition as the nonstandard pseudo-Boolean operator
`pbeq`.  PiQD's strict SMT worker rejected that input before a solver result.

The probe now emits the exact-one condition as one standard Boolean
at-least-one assertion plus the three pairwise at-most-one assertions.  Its
smoke path rejects `pbeq`, `pbge`, and `pble` in the serialized SMT-LIB.
Focused regression tests pass (`5 passed`) and Ruff reports no issue.

## Recorded attempts

| Run | Input | Engine | Outcome |
| --- | --- | --- | --- |
| v1 | 990 assertions; `18d06b73…` | local Z3 | `UNKNOWN` under 120 s; no result artifact was produced by that early direct wrapper. |
| v2 | same v1 bytes | PiQD Z3 ingress | rejected before solving because of `pbeq`; this identified the encoding defect. |
| v3 | 1,020 assertions; `141c0b9e…` | PiQD Z3 4.17.0 | `UNKNOWN` after 120,046 ms; one no-model receipt, fresh closed session. |
| v4 | query-free session bytes `047c018e…` | PiQD cvc5 1.3.3 | `UNKNOWN` after the 150,000 ms daemon deadline; one no-model receipt, fresh closed session. |

The v3 PiQD candidate was normalized by the driver to
`e233f8c7730cec034b1556fa60d237945145fba693346b1c361a478dd4b35efa`
(1,085,536 bytes, 1,053 commands).  Its receipt has result digest
`a3bfe134a25a1170ba0ad0ff4529cbc84061e3456e3384cc0272c2eea6f48ddf`.

The v4 cvc5 receipt names session
`903916a8-6b13-474d-b051-1dc96291e08c`, records 1,050 base commands and
1,085,425 bytes, and has result digest
`beff21f8ac8e0d1f15e4f2fc020b3c717ba7b520cb91e001e49ac8d2f5096f3a`.
The session was closed after receipt capture.  PiQD's isolated database,
journals, and receipts remain below the declared v2 generated root; the
query-free v4 input is retained below the v4 generated root.

## Interpretation and next action

Both solver outcomes are fail-closed `UNKNOWN` results.  They neither supply a
model nor rule out the fixed formula.  Increasing the same whole-formula
timeout is not justified by this evidence.

The next mathematical step is to factor the exact-five source-row branch into
a smaller algebraic obstruction with a stated consumer on the closure spine,
then test that reduced formula independently before any Lean promotion.  In
particular, do not add an orphan exact-five normal-form helper merely because
the broad finite probe remains unresolved.
