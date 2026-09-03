# B1 MEC completion-row omission Q2 audit

Date: 2026-09-03

## Purpose

Q1 showed that the nine physical/live-label MEC disk atoms admit a raw
algebraic model without convexity, while adding any one completion pair makes
the tested systems hard.  Q2 asks whether the global contradiction is already
visible from any two complete completion rows.

For each `i = 0,1,2`, this wave removes `c_i0,c_i1` and the two row equalities
that use them.  It retains the associated physical two-point row, both other
complete rows, the six-point common-radius row, pairwise distinctness, all
remaining MEC disk atoms, the three nonobtuse support atoms, and the
stage-specific induced convex order.

These are finite diagnostic systems.  They do not carry deletion minimality,
retained-deletion survival, or the full Problem 97 counterexample context.

## Source construction

The existing `p97-endpoint-direct-metric-system-source-v2` producer accepts a
two-point non-exact support row and emits its one physical equality without any
completion equality.  No new solver feature was required.  Each branch uses an
induced 16-label order `[0,...,15]`, MEC support `[1,14,0]`, the full MEC
component selector, and the one-height-quadratic parameterization.

| branch | removed old labels | system ID | shortened row after relabeling |
|---|---|---|---|
| `omit-d0-v1` | 3, 4 (`c00,c01`) | `d6d74f9d1b02faecf476` | center 3, support `[2,4]` |
| `omit-d1-v1` | 9, 10 (`c10,c11`) | `2238ecab2914b924a690` | center 8, support `[7,9]` |
| `omit-d2-v1` | 12, 13 (`c20,c21`) | `5c8ceca3265d5b8430a4` | center 13, support `[12,15]` |

The v2 record authenticates each numeric row system, order, and MEC support.
It does not attach role names or a named omission reason.  The role
interpretation above is therefore audit metadata, not a claim exposed by the
solver source schema.  That is sufficient for this diagnostic gate; a future
consumer that depends on named roles would need a role-bearing source record.

The durable sources are the `source.json` files under
`scratch/runs/b1-mec-row-omission-q2-20260903/`.  Their SHA-256 digests are:

- `omit-d0-v1`: `324a33f758bdc46f4999db80f1ff112182828165778b948b2b63a76d0d32f68b`;
- `omit-d1-v1`: `111b4feb72810f33376ff59b24ae9c378ee6b814abf17801b6b0a1434afcab4b`;
- `omit-d2-v1`: `30490831fe6b425be9993f649bfb58c542f07c73f69ead16c2d64c09fbc5a114`.

## Results

Each PIQD/Z3 stage had a 120-second budget.

| branch | exact metric | full convex | convex-only | accepted result |
|---|---:|---:|---:|---|
| `omit-d0-v1` | UNKNOWN at 157 | UNKNOWN at 381 | UNKNOWN at 381 | UNKNOWN |
| `omit-d1-v1` | UNKNOWN at 157 | UNKNOWN at 381 | UNKNOWN at 381 | UNKNOWN |
| `omit-d2-v1` | UNKNOWN at 157 | UNKNOWN at 381 | UNKNOWN at 381 | UNKNOWN |

All raw statuses are `UNKNOWN`; all effective statuses are
`INCONCLUSIVE_UNKNOWN`.  There is no decisive stage, accepted model, saved SAT
assignment, UNSAT core, unsat-assumption set, or terminal UNSAT record.  The
SAT smoke fixtures are diagnostic controls only.

Official offline publication validation passed for every target bundle and
every smoke bundle.

## Post-wave mining and decision

The required direct mining pass compared all three new source, result, and
artifact trees.  It found no sound theorem candidate and no materially changed
Lean search key, so it did not trigger a global Lean-corpus search.

Q2 supplies no evidence for a contradiction from only two complete rows and
does not justify longer timeouts on the same packet.  The static-row lane has
therefore reached its usefulness gate.  The next B1 computation should carry
the retained-deletion source information identified by the formal residual:
outside-first-apex-fiber provenance, survival after the retained `q` or `w`
deletion, and the exact source/live-row orientation.  That is the information
the current five/six normal form and these row-only systems omit.
