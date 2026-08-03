# V19 full-blocker metric-core analysis

Date: 2026-08-02

Scope: scratch-only analysis of the first 12 completed assignments (iterations
0--11) in
`artifacts-v19-production1/20260802T153331.017335Z-case-pid34172/fresh_DDD_k0_d2_f1/assignment-journal-v19`.
No production source, Lean source, or certificate bank was edited. Solver runs
were sequential, `nice +10`, one Z3 thread, and fail-closed.

## Result

The 12 recorded full blockers are authenticated and independently replay as
primary plus fresh-context QF_LRA UNSAT under their complete 825-literal
assignments. No smaller blocker was authenticated.

In particular, the observed 21-variable enumeration pattern is **not** a
sound master-relative projection: the Boolean master does not entail the other
804 observed literals. Both the base master and the live journal-state master
have fresh SAT countermodels to the proposed invariant conjunction. All 12 raw
formula replays using only the 21 varying fixes returned `unknown` (`canceled`)
at 30 seconds. No projected blocker was admitted.

## Journal authentication

A read-only snapshot at `2026-08-02T15:59:56Z` contained 167 consecutive JSON
records (`000000.json`--`000166.json`) and no extra or temporary files. For the
first 24 records (12 proposal/outcome pairs), all 348 mechanical checks passed:

- sequences, iterations, and proposal/outcome alternation are consecutive;
- every canonical payload hash, record hash, and previous-record link
  recomputes;
- all proposals are distinct, ordered, unique, complete 825-Bool assignments;
- all share semantic-universe hash
  `cc924f5fff0675896986228c7a85432e18b1a5d032e39ef407e73aac84678848`;
- all share frozen raw-formula hash
  `bce451bab18921a6c0d0d29d5307c8aab59be1c1fc937d991c6b40a8d7ca2720`;
- every outcome is `unsat`; every recorded projected core is exactly the full
  proposal; every 825-literal blocker text and blocker hash recomputes.

Chain anchors are record 0
`9dea22203c6fe317d9e6153cb80ec9696106a7e60b9d7fd56eb68a12536cacef`
and record 23
`56d2cc53248d9cf1b3524354b3f83d9d0e9f5b1e73ec2f2c446ecef7e1781604`.
The aggregate hash of the first 24 record hashes is
`eacb844edd3181c0c148f24ff31cf5cc95a7888a07873eb25bc370cfa1215f26`;
the aggregate hash of their raw-file hashes is
`7c6003a95d76060947c0ab0c75d1d78a1ce5ef54ca5c563bfadbbeb4b11bf0`.

The journal alone does not contain the full dynamic check objects. It commits
to each via `full_check_sha256`, but does not retain the QF_LRA audit,
normalization identity, or fresh-replay record. The scratch replays below fill
that evidence gap independently; they do not retroactively make those dynamic
objects journal-authenticated.

## Full normalized replay

Fresh source reconstruction exactly matched the journal formula identity:

- 52 raw assertions: 26 tracker assertions and 26 non-tracker source assertions;
- 825 semantic Bools;
- 4,768 frozen raw PB nodes;
- no learned prepass cuts for this case;
- normalization substitutes all 825 fixes and all 26 trackers as true,
  simplifies, exactly rewrites the audited weighted PB shapes, applies
  `card2bv`, and performs the QF_LRA audit;
- normalized SMT was neither serialized nor `sexpr`-hashed.

For each of iterations 0--11, both the primary and translated fresh-context
normalizations had:

- status `unsat`;
- lane `fixed_assignment_qf_lra`, `generalized = false`;
- 26 source assertions, 648 pre-normalization PB nodes, and 38,623 normalized
  assertions;
- accepted QF_LRA audit: zero PB, quantifier, nonlinear, integer, bitvector,
  array, ITE, or uninterpreted-function violations;
- equal primary/replay compositional identities tied to the exact assignment,
  frozen formula, normalizer source/spec, and inventories.

All 12 assignment-dependent normalization identities are distinct, as expected.
Primary solve time after normalization was 0.072--0.100 seconds; primary
normalization time was 6.84--7.48 seconds. The per-entry JSON files retain the
complete primary and fresh-replay records.

## Arithmetic-core attempts

The source-preserving normalizer tracks every normalized assertion back to its
raw source index without normalized serialization or `sexpr` hashing. It
reproduced the same 38,623-assertion inventory and accepted QF_LRA audit.

No small arithmetic core was obtained within the bounded tranche:

1. `assert_and_track` over the normalized assertions returned fail-closed
   `unknown: canceled` at both 30 seconds and 120 seconds.
2. Direct deletion over the 26 exact source groups did not converge within the
   bounded probe and was terminated without retaining a core.
3. Direct delta minimization over the standard normalized assertion vector
   (with structural AST-to-source matching, not textual hashing) likewise did
   not converge within the bounded probe and was terminated without retaining
   a core.

Consequently there is no normalized/source arithmetic core, no induced
semantic-Bool dependency set, and no arithmetic-core projection to admit. The
scratch extractor remains as a reproducible fail-closed experiment, not as a
certificate generator.

## The 21-variable master-relative proposal

At the later analysis snapshot (265 journal records, 132 completed assignments,
one pending), exactly 21 of 825 semantic Bools varied:

`block_12_3`, `block_12_4`, `block_14_10`, `block_14_3`, `block_1_11`,
`block_1_3`, `block_1_6`, `block_5_11`, `block_5_4`, `block_6_10`,
`block_6_11`, `block_9_1`, `block_9_6`, `k4_14_10`, `k4_14_11`,
`k4_14_12`, `k4_14_2`, `k4_14_4`, `k4_14_6`, `k4_14_8`, `k4_14_9`.

The reconstructed Boolean master contained 22,338 assertions, including the
15,684 theorem-sound static length-two equality implications for profile DDD
(descriptor hash
`0b6a64872273b44b656089f384128267beeca2d8c83382c4431f8b34fde673d7`).

Let `M` be that master and `I` the conjunction of the 804 observed invariant
literals. The required premise `M -> I` is false:

- base `M and not I`: SAT in both original and fresh contexts; the two models
  violate 183 and 181 of the proposed invariant literals;
- journal-state master (base master plus all 132 authenticated full blockers)
  with `not I`: SAT in both original and fresh contexts; the two models violate
  170 and 192 proposed invariant literals.

Thus the pattern is an enumeration artifact, not a master backbone. Under
`M -> I`, a full contradiction `F and I and V` would justify the projected
master blocker `not V`; here that premise has explicit countermodels. The
script therefore did not add any 21-literal blocker. Independently, all 12
fresh raw-formula replays with the corresponding 21 fixes returned
`unknown: canceled` at 30 seconds and were rejected.

## Reusable family and v20 status

No reusable blocker family is established. The full 825-literal blockers are
the only authenticated blockers from this tranche.

No v20 theorem/certificate shape is justified. In particular, v20 must not
encode the 804 observed literals as a backbone or admit the 21-literal
projection. A future master-relative certificate would need, at minimum, an
authenticated UNSAT proof of `M and not I` tied to the exact master/static-bank
hash, plus the existing replay-authenticated full contradiction; this run
instead produced SAT countermodels to the first requirement.

No Lean theorem-bank search was run because no candidate lemma survived raw or
master-relative authentication. This is external exact-n15 Z3 evidence only,
not a Lean or kernel-checked proof.

## Artifacts

- `v19_metric_core_analysis/master-relative-summary.json`: projection census,
  master hashes, original/fresh entailment countermodels, and 12-entry summary.
- `v19_metric_core_analysis/master-entry-00.json` through
  `master-entry-11.json`: complete primary/fresh normalized replays and bounded
  21-fix raw replays.
- `v19_metric_core_analysis/master_relative_projection.py`: reproducible
  master-relative audit.
- `v19_metric_core_analysis/extract_metric_cores.py`: bounded source-preserving
  arithmetic-core experiment; no core artifact was produced.
