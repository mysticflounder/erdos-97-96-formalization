# Exact-13 witnessed-Key CEGAR wave 1 audit (2026-09-06)

Lane: `exact13-witnessed-key-cegar-wave1-20260906`

Base HEAD: `0c60d03ae2390e0cf404af0f05821b16298141bc`

Run: `scratch/runs/exact13-witnessed-key-cegar-wave1-20260906/run-0001`

## Scope and claim boundary

This is solver-only discovery and custody evidence. It makes no Lean theorem,
kernel-checking, promotion, or formula-independent UNSAT claim. No Lean source
was edited. The run used only PIQD sessions: CaDiCaL 3.0.1 for the Boolean SAT
wave, with cvc5 reserved for the required first-survivor full-cone diagnostic.
No survivor was reached, so the cone diagnostic was not launched.

The configured bounds were 1,000 admitted refinements, 120 seconds per solve,
and 1,800 seconds wall time. The closed resumed session spans 120 seconds in
PIQD's retained status record.

## Effective exact root

The inherited `cardge13_exact13_witnessed_key_root_piqd.py` root exposed a
fail-closed defect during independent replay. For each blocker it encoded
`bᵢ ≠ 0 ∧ bᵢ ≠ 1` as the single redundant clause
`¬is_bᵢ_0 ∨ ¬is_bᵢ_1`. At refinement 198, PIQD returned a satisfying assignment
with `b1 = 1`: the emitted CNF replayed true, while `CenterValid` replayed false.
No cut was learned from that assignment.

This lane does not edit the inherited producer. Its effective root is the
inherited body plus the four intended `ROOT_STATIC` units:

- `-is_b0_0` (variable 209), `-is_b0_1` (210);
- `-is_b1_0` (222), `-is_b1_1` (223).

The effective root has 432 variables and 29,468 clauses. It has no metric,
Kalmanson, or learned clause in the root. Identity:

- emitted DIMACS: 894,115 bytes,
  SHA-256 `a93163e7342405bad06772269ea8f54726c1fabd4467e55d4a6efecd4c87181f`;
- PIQD-normalized root clause journal: 893,927 bytes,
  SHA-256 `b9de440ef5a6856a6b0cebbe5f7e5e3b66ad983019c3cfaabf5774a3fb696080`.

The 198 cuts learned before the defect surfaced were not trusted merely because
they existed. The migration replayed each retained parent assignment against
the corrected root and every exact `Key.Valid` field, then reconstructed each
path, zero sum, atom set, and clause. The final producer rebind repeated that
procedure for all 1,000 cuts. The migration event reports all checks true.

## Learner and cut semantics

Each independently valid Key is translated in raw labels. Orientation selects
the direct or mirror cyclic order. Active `C0`, `C1`, `K`, `L`, `T`, and
non-blocker `Gᵢ` rows generate the established provider-tagged equality graph.
The wrapper intentionally bypasses the legacy cell validator because that
validator additionally requires `T ⊇ {6,7}`, which is not a conjunct of the new
`Key.Valid`. Tests show graph identity with the existing learner on cells where
the legacy predicate is applicable.

The learner first searches one strict Kalmanson form, then positive sums of two
strict forms. It uses the existing deterministic shortest-incidence-path
routine. Before admission, a separate replay:

1. checks every path step against the named active provider, its center, and
   its two raw row memberships;
2. checks that the pairings cover the positive and negative form terms exactly;
3. unions only the equalities named by those steps and recomputes the projected
   integer coefficient sum, requiring the empty zero vector;
4. reconstructs the exact atom set and requires every atom true in the parent
   SAT assignment; and
5. requires the learned clause to be only the negation of those atoms and to
   eliminate the parent model.

`C0`/`C1` paths include their projected `is_b0_*`/`is_b1_*` center-binding atom.
That atom is necessary for the equality to remain justified for every Key
sharing the clause's incidences. All other cut atoms are `m_<provider>_<label>`.
No cut mentions `s0`, `s1`, `d`, `ell`, `E`, `C`, `U`, pair/chosen bits, or any
other existential-only witness variable. No exact-Key enumeration block was
used.

## Result

The run stopped at `REFINEMENT_BUDGET`:

- 1,001 SAT models retained and independently replayed; every model certificate
  records `Valid = true`;
- all 1,001 selected mirror orientation (a solver traversal fact, not a
  restriction of the formula);
- 1,000 admitted one-form cuts and zero two-form cuts;
- every cut uses 2 equality-path steps;
- cut atom counts: minimum 4, maximum 5, mean 4.01;
- the terminal model is cancellable, but no 1,001st cut was admitted because
  the configured refinement budget was exhausted;
- no UNSAT conclusion and no uncancellable survivor.

The resumed corrected-root PIQD session
`f327f8d4-b092-4ae7-bf7e-4baad585e177` began with 198 authenticated cuts and
recorded 803 solves. Its final SAT receipt binds 30,468 clauses. Custody was
completed without rerunning solve after an export-parser repair:

- PIQD exported DIMACS: 914,006 bytes,
  SHA-256 `42b290dd5d9d9ae7efb3674f1dba5119db35408962d4ae71462bf755493c76ee`;
- removing exactly its canonical 16-byte `p cnf 432 30468` header yields the
  clause journal: 913,990 bytes,
  SHA-256 `160fab3f841965f2f10e3a42bca5b0023114d15deee4d789ccf358e477a551af`;
- all 803 receipt prefixes independently match exact byte, clause, and SHA-256
  identities; and
- PIQD reports the session closed.

The run root contains 3,022 retained files and occupies approximately 17 MiB.
The append-only cut bank is 319,591 bytes with SHA-256
`ab759ceba74daf8d3cc3eb06daf18e8144e88098ae1a48b5df33d7f3ba06906f`.

## Verification

Focused tests cover source-faithful row translation, equality-graph identity,
one/two-form zero replay, projected-only cut admission, tamper rejection,
effective-root repair, append-only bank binding, receipt prefixes, and both
root/session normalization relations. The inherited root and incidence-learner
tests are included in the final gate. Ruff, `git diff --check`, exact-path staged
hygiene, and the read-only lane report are required before review.
