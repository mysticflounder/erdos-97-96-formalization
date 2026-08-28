# Rigid221 Card18 custody refresh v2 review

**Status: ALL CUSTODY-REFRESH PUBLICATION GATES COMPLETE.**

Lane: `rigid221-card18-custody-refresh-v2-20260828`.

Lane base: `6d0fcc389255ac24be267636abb8f7545d63bcb7`.

## Scope

This checkpoint repairs the source-custody drift caused by the Exact-A2 edit
to `Rigid221SourceHeavy.lean`. It must preserve every v1-v3 custody and
predicate-coverage module, test input, receipt, and manifest byte-for-byte.
The active refresh consists of labeled-projection custody v2,
crossed-incidence custody v2, and predicate coverage v4.

The historical diagnostic packet remains frozen. Its predecessor suites run
against the exact predicate-coverage-v3 source snapshot at
`9abb3417c06fd973dfa502009d5f517f0b25c24c`; the new suites attest the live
tree. This keeps historical live-attestation checks meaningful without
rewriting their expected source bytes.

## Dependency-custody finding

Fresh kernel mining against the post-Exact-A2 build reports:

- diagnostic source custody: `UNCHANGED 30 modules`;
- labeled-projection custody: `UNCHANGED 26 modules`; and
- crossed-incidence custody: `UNCHANGED 27 modules`.

`ExactA2CapMetric` is a new import of `Rigid221SourceHeavy`, but it is not
declaration-reachable from any of these Card18 roots. It therefore does not
belong in their kernel-mined dependency tuples. The sole frozen source-row
delta is:

| Field | Historical v1 | Active v2 |
|---|---:|---:|
| bytes | 880,556 | 882,910 |
| SHA-256 | `c5e46308208ac2ae75fdf7e6a21db18fd03825af7f44bed7f3f47ffc630b542b` | `f2a5b2bf20dd6063177a2622f86751ce8a3a8549d8c9c386d660193bf4a54530` |

## Evidence

- Historical v1-v3 source/custody/coverage suites in the pinned snapshot:
  **348 passed**.
- Current v2 custody suites: **121 passed**.
- Current predicate-coverage-v4 suite: **10 passed**.
- Full Card18 runner: Ruff clean; **348 historical passed**; **131 live
  passed**.
- Aggregate Lean build: **complete, 10,887 jobs**.
- Independent custody-v2 adversarial review: **GO**.
- Independent historical-runner isolation review: **GO**.
- Independent predicate-coverage-v4 adversarial review: **GO**.
- Exact-path staged hygiene: **PASS**, zero lane issues and no foreign staged
  path.

## Review verdict

**GO.** No review found a source-custody, historical-isolation,
coverage-delta, trust-boundary, or admission defect.
