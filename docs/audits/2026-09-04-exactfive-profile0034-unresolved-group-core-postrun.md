# Profile 0034 unresolved group-core postrun

Date: 2026-09-04

## Outcome

The four-cell Z3 campaign completed through PIQD. The positive control returned SAT and passed exact semantic replay. The negative control returned UNSAT with the expected one-group assumption core. Both mathematical targets returned `UNKNOWN` at the fixed 60-second solve policy, so the wave produced no target core.

The result is still useful: the Boolean implication encoding erased the roughly 14.5-second behavior of the physical full formulas. The next search should therefore use only physical hard assertions and remove blocks from the known full UNSAT systems while keeping each exact reduced base fixed.

## Custody

- Lane: `exactfive-hard-source-swap-profile0034-unresolved-group-core-piqd-20260904`
- Run: `run-0001`
- Execution commit: `200d362ed5abc75312991ba6a2cc52eddcd2d589`
- Run-manifest self-hash: `6805cabc752d31fc980cd32e11c93d39532c8cedba7eb7d0e3bc6823e64c2409`
- Launch self-hash: `6a4db50380ede193a61940a418aa6d5369c5c15a73f39b20f8ba3675f615747a`
- Terminal self-hash: `c06bd1902fa1c64efa6fd15b04d85ab69de7758fb170d97fc49739061220b491`
- Queries: four fresh, unique, closed PIQD sessions; one solve per session
- Independent postrun audit: passed

The audit recomputed all manifest, launch, terminal, and result hashes; matched every source and input digest; checked the recorded execution commit; verified exact runtime inventories; and checked solver, session, receipt, close, and one-solve state. The three prelaunch manifests remain in move-only quarantine with valid receipts and zero external references.

No second full offline replay was run. The independent audit checked the complete immutable state after the original verifier completed. Repeating the same verifier would add redundant evidence at an observed cost near eleven minutes.

## Results

| Cell | Raw status | Disposition | Solve time |
|---|---:|---|---:|
| positive control | SAT | `SAT_REPLAYED` | 2 ms |
| negative control | UNSAT | `UNSAT_GROUP_CORE` | 2 ms |
| mirror radius `<` | UNKNOWN | `UNKNOWN` | 66,896 ms |
| mirror radius `>` | UNKNOWN | `UNKNOWN` | 62,209 ms |

The `<` target guarded edge groups 00, 03, 04 and row groups 01, 05. The `>` target guarded edge groups 00, 03 and row groups 00, 01, 03, 05. Every other group was physically hard asserted. Supplying every branch-local assumption recreated the complete source target, but neither guarded query produced an UNSAT answer or a core.

## Verifier performance defect

The campaign process took about eleven minutes even though the longest solve was under 67 seconds. A read-only profile localized the excess CPU to repeated exact replay of the positive control:

- preparing and replaying the positive model entered the full predecessor authentication chain twice per semantic check;
- the fresh campaign repeated that semantic check before result construction, before publication, after publication, and during final inventory;
- one profiled replay made 2 supporting-edge predecessor authentications, 6 equilateral-frame authentications, 54 gauge-split authentications, 594 source-order authentications, and 984 journal normalizations.

Terminal construction, source hashing, group-system rebuilding, and source-snapshot volume were minor costs by comparison. The safe repair is versioned forward: the next lane will use small self-contained controls, capture one exact semantic verdict per immutable result, and keep later passes to artifact digest and token checks. The completed producer remains unchanged because its committed bytes authenticate this run.

## Next action

Run a physical block-deletion conflict search. For each branch, keep the exact reduced base fixed and begin with every omitted group present, a formula already known UNSAT. Recursively test physical removal blocks through PIQD/Z3. Accept a removal only after a custody-valid UNSAT result; retain any block whose probe is SAT, unresolved SAT, or UNKNOWN. This preserves an UNSAT invariant without Boolean implications and directly searches for a small interaction conflict.

A 41-cell one-group addition screen remains a useful fallback, but it can miss a contradiction that requires two or more added groups. The block-deletion route targets that interaction directly.

No Lean-corpus search was triggered by this wave: no target core or stable geometric antecedent set was produced. All live-source, minimal-core, source-realization, Lean-ingress, live-closure, promotion, and theorem claims remain false.
