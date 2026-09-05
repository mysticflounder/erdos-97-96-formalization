# Exact-five profile 0034 new mirror supporting-edge postrun audit

Date: 2026-09-04

Status: authenticated diagnostic complete; target inconclusive.

## Scope

This PIQD wave split the previously untested mirror source-order formula on
the two strict orientations of one new supporting edge. Each target retains
20 real variables, 143 directed supporting-edge constraints, 11 source row
equalities, the authenticated source order, and one strict radius branch. The
two targets contain 156 assertions and 177 SMT-LIB commands apiece.

The result concerns only these two submitted formulas. It does not establish
source realization, live source completeness, all-order elimination, a Lean
ingress, a theorem, promotion, or live closure.

## Custody

- Run root:
  `scratch/runs/exactfive-profile0034-new-mirror-supporting-edge-qfnra-piqd-20260904/run-0001`.
- Run-manifest self-hash:
  `966b9cfcb90f8542e19d613d4817a733ae766c74635ace3b3e83a328c3731c05`.
- Launch self-hash:
  `95e49630f86c2e7cd7961cd45302fd672b228c999f69fcdfffd51d2f6a9e0648`.
- Terminal self-hash:
  `621c8f7f8bd435e63004b238b28ba108e291078157e3a164c3c2b7a931b30204`.

The independent postrun audit found 145 regular files in four query trees,
zero symlinks, no unsafe or multiply linked artifacts, matching owner/base
metadata, nine authenticated source digests, and eleven bound input digests.
The manifest-to-launch-to-terminal hash chain verifies. A second
`--verify --verbose` pass returned exit code 0 without contacting a solver.

The positive control was `SAT/SAT`, with both models semantically replayed.
The negative control was `UNSAT/UNSAT`; those UNSAT answers remain diagnostic
only.

## Results

| Target | Z3 | cvc5 | Disposition |
|---|---:|---:|---|
| `mirror-radius-lt` | UNSAT, 84 ms | UNKNOWN, 90,009 ms | inconclusive |
| `mirror-radius-gt` | UNSAT, 84 ms | UNKNOWN, 90,012 ms | inconclusive |

Z3 supplied no proof core, so its two answers are
`UNSAT_DISCOVERY_ONLY`. cvc5 reached the daemon deadline in both branches and
is recorded as `INCONCLUSIVE_UNKNOWN`. The terminal status is therefore
`TARGET_INCONCLUSIVE`; no target proof, model, Lean theorem, or promotion is
authorized.

## Completed-wave mine

The strict-radius split sharply improves the signal over the preceding coarse
mirror run: Z3 closes both branches quickly. Cross-solver confirmation is
still absent, and the artifacts contain no target model, proof core, or
partial algebraic stream. The wave therefore yields no concrete reusable Lean
theorem candidate, so it does not trigger another Lean-corpus search.

The exact target bytes supplied to Z3 and cvc5 match within each branch. The
cvc5 answers came from PIQD interruption at its 90,000 ms effective daemon
deadline, not a solver-produced `unknown` reason. The highest-leverage next
action is therefore a new, immutable PIQD replay of these exact two query bytes
with a 300-second requested timeout and a 330-second effective daemon deadline.
Only if that replay remains inconclusive should the next wave normalize shared
polynomial terms or reorder assertions under a fresh authenticated encoding.
Merely treating the Z3 answers as proof evidence is outside the claim boundary.
