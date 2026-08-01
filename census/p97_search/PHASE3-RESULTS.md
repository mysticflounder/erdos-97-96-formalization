# P97 counterexample search -- Phase 3 results

Version 0.1, 2026-07-28.  This ledger records the gate-scale implementation
and validation of `PHASE3-SPEC.md` v0.1.  It does **not** claim production
coverage of any P97 range.

## Implemented surface

`sat_generate.py` provides a CaDiCaL-backed enumerator for exact `Cell`
instances.  Its semantic variables are exactly the off-diagonal shell
memberships `s[p,q]`, optional total B1 blocker choices `b[x,d]`, and optional
fixed-Moser-set cap choices `f[x,i]` for `M = {0,1,2}`.  Cap-profile clauses
allow every distinct permutation of the requested strict-size multiset.
Selector variables used by that encoding are auxiliary and are not included
in model blocking.

The hard-clause registry is limited to:

- `S-D1`, `S-EXACT`, and `S-CIRC2`;
- optional `B-TOTAL` and `B-MEM`; and
- optional `CAP-TOTAL` and `CAP-PROFILE`.

No `R-P1`--`R-P4` clause is emitted.  `R-FIBER4` is checked defensively after
decode rather than emitted as an independent constraint.

Every SAT model is decoded through the validating `Node`,
`BlockerAnnotation`, `CapAnnotation`, and `AnnotatedNode` constructors and is
then rechecked for exact row sizes, R-CIRC2, B1, blocker fibers, profile
multiset, and the truth value of every semantic variable.  Enumeration blocks
the complete raw semantic assignment, not a canonical orbit.  Canonicalization
is used only for the bank passed through `iterate_cell`.

The run statuses are fail-closed:

- `PARTIAL` records validated models but makes no completeness claim;
- `COMPLETE` requires terminal UNSAT plus a `drat-trim` log containing the
  exact line `s VERIFIED`; and
- every solver, decode, artifact, or checker failure stops at `UNKNOWN`.

Run artifacts are written atomically.  Resume is admitted only for a verified
`PARTIAL` directory after checking the manifest, base-CNF hash, every prior
model, every raw blocking clause, and the reconstructed canonical bank.

## Gate results

The final control run passed all gates:

| Gate | Result | Audited fact |
| --- | --- | --- |
| `G-P1-REGRESS` | PASS | Phase 1 controls: 7 PASS rows |
| `G-P2-REGRESS` | PASS | Phase 2 controls: 18 PASS rows |
| `G-CANON-JOINT-INVAR` | PASS | 120/120 random cases; all modes also pass on a node with 24 canonical labelings |
| `G-CANON-JOINT-EXACT` | PASS | 972 combined annotations partition into the same 42 orbits as independent brute-force isomorphism |
| `G-ITER-COMBINED` | PASS | The required `(k,n,profile)=(4,10,(4,4,5))` fixture banks OPEN and publishes blocker plus frame hypotheses |
| `G-CLAUSE-AUDIT` | PASS | Only the seven Phase 3 clause tags occur; `R-P1`--`R-P4` are absent |
| `G-SAT-K3-SEED` | PASS | SAT model decodes to the complete S-K3-9 shell assignment |
| `G-SAT-COMBINED` | PASS | SAT model decodes to the specified shell, B1 blocker, and cap assignment |
| `G-SAT-CARD-UNSAT` | PASS | Forced `k+1` row memberships are UNSAT with verified DRAT |
| `G-SAT-CIRC2-UNSAT` | PASS | Forced three-point intersection is UNSAT with verified DRAT |
| `G-SAT-B1-UNSAT` | PASS | Forced `b[0,1]` with false `s[1,0]` is UNSAT with verified DRAT |
| `G-SAT-PROFILE-UNSAT` | PASS | Forced strict cap fiber outside `(2,2,3)` is UNSAT with verified DRAT |
| `G-SAT-TINY-COMPLETE` | PASS | SAT enumeration and independent brute force agree on all 81 raw assignments; 6 canonical banks; terminal DRAT reverified |
| `G-SAT-PARTIAL` | PASS | A one-model limit publishes `PARTIAL`, never `COMPLETE` |
| `G-RESUME-TAMPER` | PASS | A verified one-model `PARTIAL` run resumes to `COMPLETE` with all 8 raw models; altered base-CNF and model artifacts are rejected |
| `G-ATOMIC-INTERRUPT` | PASS | Interruption after one decoded model publishes atomically revalidatable `PARTIAL` artifacts |
| `G-FAIL-CLOSED` | PASS | Solver unknown, malformed SAT model, missing DRAT, and an actual failed `drat-trim` all publish `UNKNOWN` |

The executed commands were:

```bash
uv run python -m py_compile \
  census/p97_search/sat_generate.py \
  census/p97_search/controls3.py
uv run python census/p97_search/controls3.py
```

## Generated evidence

The gate artifact root is `census/p97_search/out/phase3-gates/` (105 files,
752 KiB in this run).  Six logical positive checks contain `s VERIFIED`
(the tamper gate also copies its verified run twice before alteration):

- the four independent UNSAT rule-family gates; and
- the terminal proofs for the tiny complete and resume-complete enumerations.

The deliberately corrupt proof in the fail-closed gate instead records
`s NOT VERIFIED`, and its manifest remains `UNKNOWN`.

The tiny complete manifest records 12 semantic variables, 16 base clauses,
81 raw models, 6 canonical bank records, 97 terminal clauses, and verified
terminal UNSAT.  Artifact SHA-256 values, solver/checker versions, rule-bank
hash, clause counts, timeout, and model-limit data are recorded in each run
manifest.

## Claim boundary and limitations

The SAT positive gates establish only that their emitted structural CNFs have
validated structural witnesses.  They do not establish Euclidean
realizability.  The four small UNSAT gates establish only that each exact
test CNF is inconsistent.  The tiny `COMPLETE` gate is exhaustive only for
its exact tiny cell; it is a complete survivor census relative to that CNF,
not a P97 non-existence theorem.

## First bounded production probes

The first explicitly bounded production probes both reached their 100-model
limit and therefore publish `PARTIAL`, not completeness:

| Cell | Mode | Raw | Canonical | Bank status | Base CNF |
| --- | --- | ---: | ---: | --- | --- |
| exact `(k,n)=(3,9)`, FRAMELESS | bare | 100 | 29 | 29 OPEN | 72 variables, 2,142 clauses |
| exact `(4,10,(4,4,5))` | cap+blocker | 100 | 100 | 100 OPEN | 204 variables (201 semantic), 5,532 clauses |

At production time both artifact directories passed `verify_run_artifacts`;
neither has a terminal CNF or DRAT proof, and both record
`unsat_verified=false`.  The result is
diagnostic but clear: the current exact-shell/incidence CNFs have many
survivors before Euclidean realization is imposed.  Increasing the raw-model
limit alone is not presently a plausible proof-closing move.

After the rule bank changed later on 2026-07-28, the original
`k4-n10-profile-445-combined-bounded100` directory correctly became stale:
`verify_run_artifacts` rejects its pinned rule-bank hash. The prefix was
regenerated under the current bank as
`k4-n10-profile-445-combined-bounded100-current-20260728`. The strict verifier
passes the new directory, and its 100 canonical digests are exactly the same
set as the original prefix. Realization work must consume the current
directory; the original remains historical evidence only.

There is still no finite-range closure, geometric infeasibility certificate,
exact realization, new rule-bank admission, or Lean consumer composition in
this result.  Cap and blocker coverage remains conditional on the frame
theorem and Theorem C interfaces stated in the specification, and every
production survivor remains OPEN.

## 2026-07-29 continuation addendum

This addendum supersedes the earlier gate-era ledger only for the named runs
below.  It does not make the bounded source census complete and does not claim
a Problem 97 or Lean theorem.

| Run | Audited result | Exact trust scope and status |
| --- | --- | --- |
| `phase3_survivor_metric_100_20260729` | 1,209/2,400 ordered leaves are Z3 `UNSAT`; 1,191 are `UNKNOWN`; 0 are `SAT`; 0 are `ERROR` | Complete screening of the saved 100 structural survivors and their 24 supplied cap-compatible orders under the encoded row systems, with `MetricRow.exact=false`.  The `UNSAT` rows are incomplete external Z3 evidence, not replayed certificates or Lean closure.  Every source survivor retains at least one `UNKNOWN` order. |
| `phase3_survivor_cvc5_48_20260729` | 15/48 deduplicated ordered systems are `UNSAT` under `cvc5 --nl-cov`; 33 timed out; 0 are `SAT`; 0 are `ERROR` | Independent but incomplete external cvc5 screening of the exact SMT2 queries.  These verdicts are not replayed certificates or Lean closure, and a timeout is no verdict. |
| `phase3_survivor_singular_cert_2_20260729` | 2/2 equality-only systems have exact rational unit certificates; both standalone fresh-process SymPy replays verify `sum_i cofactor_i * generator_i = 1` over `QQ` | Exact external certificate evidence only for the two saved equality ideals.  No inequalities, off-support exactness, blockers, phase-wide completeness, or P97 closure are included.  Both certificates are now in the source-clean Lean bank: `Phase3SurvivorSingularSystem00` and `Phase3SurvivorSingularSystem01`, collected by `Phase3SurvivorSingularCertificates`; the focused Lake build and transitive axiom audit passed with no `sorryAx`. |
| `phase3_sixcut_depth4_shards_v1_20260729` | 11/16 shards are terminal structural `UNSAT`: `03`, `05`, `06`, `07`, and `09`--`15` | Each listed shard has `terminal_drat_verified=true` and a `terminal.drat.check` containing the exact line `s VERIFIED`.  This is terminal only for the shard's structural CNF, not a P97 or Lean theorem.  Shards `00`, `01`, `02`, `04`, and `08` remain nonterminal; their fleet was resumed later and those five processes were live at the 2026-07-29 16:55 PDT audit.  The 16-shard fleet is not complete. |
| `phase3_structural_cegar_projected_sequential_global_v2_20260729` | `INTERRUPTED` checkpoint: 33,211 solver-log records, 56,223 learned certificates, and 163 saved survivors | The stale `RUNNING` manifest was corrected after a process-table audit found no live process targeting the run directory.  `terminal_drat_verified=false`; there is no terminal-clause count and no completion claim.  The interruption cause is unknown. |

### Lean ingress audit (2026-07-31)

The two equality-only UNIT systems from `phase3_survivor_singular_cert_2_20260729`
are reachable through the import-only registry
`Erdos9796Proof.P97.Phase3SurvivorSingularCertificates`.  Their checked handoffs
are `Problem97.Phase3SurvivorSingularSystem00.false_of_facts_eval_zero` and
`Problem97.Phase3SurvivorSingularSystem01.false_of_facts_eval_zero`.  The
focused Lake build passed, and the transitive axiom audit found no `sorryAx`;
the remaining dependencies are the approved compiler-trust boundary of the
`native_decide` checker.  This banks the two exact ideals only, not the 100-
survivor coverage or a Problem 97 closure.

The separate CEGAR pattern named
`two_triple_row_six_point_euclidean` is now banked in
`Erdos9796Proof.P97.ATail.TwoTripleRowSixPointEuclideanObstruction`.  The
source-clean theorem
`Problem97.TwoTripleRowSixPointEuclideanObstruction.metric_orientation_incompatibility`
proves the exact signed-area coordinate contradiction for
`BA=BC=BD` and `FA=FD=FE`; its boundary-order adapter is
`false_of_six_ccw_two_triple_row_equalities`.  The focused Lake build passed
and the transitive axiom audit found no `sorryAx`.  This closes that exact
9-literal pattern, not all 100 survivors or Problem 97 as a whole.

Both artifact families now also have a single import-only ingress at
`Erdos9796Proof.P97.Phase3MetricCertificateBank`.

## 2026-07-31 hermetic replay checkpoint

`tests/fixtures/phase3_structural_survivors_100_current` pins a current-code
replay checkpoint with status `SURVIVOR_LIMIT`: 8,129 raw SAT assignments were
classified, 8,029 dynamic certificates were learned, 100 structurally
unresolved survivors were retained, and zero raw assignments were left
unclassified.  Its source artifact is hash-pinned provenance; the fixture does
not dereference an external output directory at test time.

This is a test fixture for the saved bounded prefix, not an exhaustive census.
It makes no Euclidean-realizability, Problem 97, or Lean-kernel claim.  The
downstream metric fixture exhaustively visits these 100 saved survivors and
their 2,400 supplied cap-compatible orders, but its solver `UNKNOWN` outcomes
remain no verdict.

The earlier Z3 screen directory
`census/p97_search/out/phase3-realization/k4-n10-profile-445-bounded100-local-current`
is superseded by `phase3_survivor_metric_100_20260729` and must not be resumed
or aggregated with it.  The abandoned directory has only a valid append-only
251/2,400-record prefix (35 `UNSAT`, 168 `TIMEOUT`, 48 `UNKNOWN`, 0 `SAT`) and
no `screen-summary.json`; it is not a completed screen.  Its source manifest
also records a `PARTIAL` 100-model census.
