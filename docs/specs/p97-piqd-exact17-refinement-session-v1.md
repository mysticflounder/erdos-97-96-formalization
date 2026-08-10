# P97 PIQD exact-17 refinement-session replay v1

Date: 2026-08-09

## Purpose

This adapter onboards the frozen exact-17 Rank-Four DirectSix refinement chain
to PIQD's stateful SAT-session journal. It authenticates custody and ordered
replay of a base CNF plus learned clauses. It does not invoke a solver and does
not establish source completeness, finite coverage, a universal lift, theorem
closure, or a Lean proof.

The implementation is
`census/p97_search/phase3_piqd_exact17_refinement_session.py`. Its frozen input
contract is the manifest validated by
`phase3_piqd_exact17_refinement_chain.py`.

## Replay contract

Given a validated chain manifest and an existing PIQD job whose blob is the
exact root CNF, the adapter must:

1. create a SAT session seeded from that root job;
2. export the initial session CNF and compare it byte-for-byte with the root;
3. append every manifest refinement in order;
4. check the returned sequence number, appended-clause count, cumulative
   clause count, and maximum variable after every append;
5. reject an append request larger than 64 MiB;
6. reconstruct the expected final DIMACS locally from the authenticated root
   and fragments;
7. export the final session CNF and compare it byte-for-byte with that expected
   aggregate;
8. close the session, clean temporary files, and write an immutable,
   self-hashed observational receipt.

Any counter drift, export mismatch, malformed response, unexpected session
state, or cleanup failure prevents a successful receipt. The adapter attempts
to close a created session on both success and failure.

## Live qualification

The first production-scale replay used root job
`90f06766-0bc6-489c-94cd-0ded6f170991` and session
`0e9760fd-aff7-46c9-9630-79f2b5fd1f67`. The root export matched:

- 74,813 variables;
- 4,118,501 clauses;
- 170,482,491 bytes; and
- SHA-256 `b9784eb8f14cc0f2c30f08e0d7da3c7617a9e8a8e64e97f6a46c0490c05cad95`.

Eight ordered appends added 135,675 clauses. The final export matched:

- 74,813 variables;
- 4,254,176 clauses;
- 196,106,545 bytes; and
- SHA-256 `2aa85c2368c3f271caebe47c4a6b861cc7e64d177cd349e58697a724c4b43605`.

The session was closed without a solve. The immutable receipt is
`scratch/p97-exact17-direct6-piqd-refinement-replay-v1/replay.json`; its file
SHA-256 is
`ac0a0a92ae8cc56fbc6d0d1f85cb55ba5bac85cd5c97827092f60877efe9330e`
and its receipt self-hash is
`2a21c44b69066fa1020afc5442d13479037a7665b36e3456d3c2fe721540cb10`.

## Next acceptance gate

The next stateful gate is not another replay of the frozen bank. A newly
theorem-backed learned delta must be regenerated over this exact aggregate,
source-classified, appended through the same checked journal, and exercised by
a solve/restart fixture. Any terminal UNSAT state must then be handed to the
immutable static PIQD proof path for independent proof checking and Lean
ingress.
