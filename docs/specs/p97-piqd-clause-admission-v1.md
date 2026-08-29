# P97 PIQD clause-admission contract v1

## Purpose

PIQD stores and solves an incremental formula.  It does not decide whether a
P97 clause is mathematically entitled, new, or guaranteed to eliminate the
model that caused it.  The P97 adapter therefore applies a fail-closed
admission gate before `POST /sessions/{id}/clauses`.

The reusable formula-facing implementation is
`census/p97_search/phase3_piqd_clause_admission.py`.  The first consumer is
`scratch/rigid221-blockerv-exact17-20260806/append_piqd_two_kalmanson_label_cuts_v2.py`.

## Inputs

An admission attempt is bound to:

- one authenticated root DIMACS file and its exact variable/clause counts;
- an ordered chain of prior PIQD cut receipts;
- one complete captured SAT assignment for that exact formula;
- a nonempty proposed clause batch; and
- a lane-owned source analysis and theorem-backed clause generator.

The generic admission module authenticates the formula-facing properties.  The
calling lane remains responsible for source provenance and the soundness of its
mathematical clause generator.

## Required checks

For every proposed clause, the gate requires:

1. only nonzero integer literals within the declared variable domain;
2. no repeated literal and no complementary literal pair;
3. no duplicate candidate clause;
4. no candidate subsumed by another clause in the same proposed batch;
5. falsification by the captured total SAT assignment; and
6. no root or prior-receipt clause that subsumes the candidate.

The complete DIMACS stream is parsed, including clauses split across lines.
The header, variable domain, actual clause count, clause termination, and lack
of trailing unterminated data must all agree with custody metadata.  Every
prior receipt batch is subjected to the same literal-domain validation.

The subsumption condition is deliberately stronger than exact deduplication.
If an existing clause `E` satisfies `E ⊆ C`, then proposed clause `C` cannot
be credited as a new formula-facing clause addition and the batch is rejected.  This check does
not claim general logical irredundancy: an arbitrary collection of existing
clauses may still imply a candidate even when no single clause subsumes it.

## Atomic admission

After the audit, the lane rehashes its frozen generator sources, reads the live
PIQD session, and requires exact agreement on session identity, state, clause
count, and variable count.  It submits one batch, then requires PIQD's response
and a fresh session read to show exactly the proposed clause-count increment
with no other state drift.  The receipt binds:

- the root and ordered parent receipts;
- the solve receipt, model, and source analysis;
- generator source hashes and the named Lean consumer;
- the exact appended clause sequence and digest;
- the full-root/prior admission audit; and
- the before/after PIQD session records.

A daemon restart that detaches the session causes rejection before append.  A
fresh session must be authenticated instead; the adapter does not silently
relax its live-custody requirement.

## Promotion boundary

Passing this contract establishes formula-facing clause admission: the
admitted clauses are tied to the recorded generator and consumer metadata,
were absent under the specified subsumption test, and eliminate the captured
assignment. It does not establish source preservation, a source-connected
refinement, or clause class `SEMANTIC_REFINEMENT`. Those claims require a
`p97-cegar-semantic-refinement/v1` receipt carrying accepted typed F1--F7
evidence under `p97-cegar-semantic-contract/v2`.

It does not establish exact-cardinality coverage, a universal theorem, UNSAT,
proof-producing solver replay, Lean ingress, or closure of a production
obligation.  Terminal UNSAT still requires a static proof-producing handoff and
the relevant finite-coverage and source-lift theorems.

Precedence: clause-admission status and receipt fields are custody evidence
only. If they conflict with a semantic-authority gate or semantic terminal
receipt, the semantic contract controls, and absent semantic evidence keeps
source, abstract, and theorem promotion blocked.

The proof-producing handoff must not assume that PIQD session clause positions
are already LRAT input-clause identifiers.  PIQD currently detautologizes a
submitted CNF before certificate generation: tautological clauses can be
dropped and repeated literals can be deduplicated.  The lane therefore requires
the proof job's explicit session-clause-to-certificate-clause map, including
dropped entries, before it may bind candidate-clause provenance to certificate clause
IDs.  This admission gate rejects tautological and repeated-literal *new cuts*,
but that does not establish that the frozen root has identity numbering through
certificate preparation.
