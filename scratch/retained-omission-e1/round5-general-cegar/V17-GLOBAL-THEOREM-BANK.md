# V17 global theorem-bank audit

Date: 2026-08-02

Target:
`Problem97.ATailFrontierLiveClosure.false_of_retainedOmission_triApexAllLarge_core`

Artifact root:
`artifacts-v17-canary2/20260802T135700.908575Z-case-pid33476`

## Verdict

| Proposed action | Verdict | Reason |
| --- | --- | --- |
| Keep the V17 equality-closure projected blocker lane | **GO** | Each emitted 7/8-literal blocker was replayed UNSAT against the frozen raw formula. The mathematical contradiction is an instance of the already-banked `Census554.EqualityCore.ExactOffCircleCore` schema. |
| Promote a new universal metric theorem from these 11 blockers | **NO-GO** | All 11 are duplicates of one existing exact-off-circle/equality-closure theorem, with only source-row variants and label substitutions. |
| Claim the exact `(6,6,6)` slice or the live R/Q/G target closed | **NO-GO** | The run stopped at its 11-assignment budget. It is not a covering result, and the target remains a `sorry`. |
| Generalize the old V16 iteration-10 replay into a short rule | **NO-GO** | It authenticated only the complete 825-literal assignment. No tracker core was obtained. |
| Next theorem work | **GO** | Derive a positive source/coverage bridge from live `R/Q/G` to an `ExactOffCircleCore` (or `ShellMetricCoreAlternative`); do not prove another equality theorem. |

## Exact scope and authentication

The canary searched one normalized exact-cardinality-15 case only:

- arm/profile/case: `fresh`, `DDD`, `kept=0`, `deleted=2`, `fresh=1`;
- exact cap profile: `(6,6,6)`;
- semantic Boolean variables: 825;
- assignment checks: 11;
- blockers emitted: 11;
- elapsed: 61.761 seconds for the case, 63.727 seconds overall;
- terminal status: `budget`, `complete=false`;
- frozen formula SHA-256:
  `bce451bab18921a6c0d0d29d5307c8aab59be1c1fc937d991c6b40a8d7ca2720`;
- cumulative blocker SHA-256:
  `efd4c51aaa0da5481887f94e7cf95e8a1d0e59ba041af341f7c395cbca26f5ad`.

Every V17 blocker came from `equality_closure_raw_replay`: the proposed
projected core was freshly asserted against the frozen raw formula and Z3
returned UNSAT. This authenticates the cuts as external QF_LRA/SMT artifacts.
It is not a DRAT/LRAT certificate and it is not a Lean kernel proof.

## The common contradiction

Every blocker instantiates the same mathematical schema. For an exact row at
center `c`, choose a row member `a` and a point `z` excluded from the row. Two
other selected rows yield a chain of distance-edge equalities connecting
`(c,a)` to `(c,z)`. Exactness says those two distances cannot be equal.

In the production abstraction this is exactly:

```lean
ExactOffCircleCore P :=
  a_mem : a ∈ P c
  z_not_mem : z ∉ P c
  closure : EdgeClosure P (c, a) (c, z)

false_of_exactAt_of_exactOffCircleCore :
  Realizes P pointOf → ExactOffCircleCore P →
  ExactAt P pointOf core.c → False
```

The relevant production declarations are:

- `Census554/EqualityCore.lean:104-134`: `EdgeClosure`, soundness, `ExactAt`;
- `Census554/EqualityCore.lean:153-173`: `ExactOffCircleCore` and its consumer;
- `Census554/GeneralCarrierBridge.lean:194-224`: `exactAt_blocker` from a
  faithful pattern and critical-shell system;
- `Census554/ExactShellBridge.lean:26-45`: direct critical-shell adapter
  (source-proved, but not in the default-root import closure).

`EqualityCore` is transitively imported by the current project root. The
general theorem therefore already exists; the missing work is a producer.

## Eleven-core census

The authenticated cores sometimes retain an additional K4 anchor literal
because the implementation explains equality through the first true member of
a selected row. Only the exact replayed 7/8-literal cores are claimed here.

| Iteration | Size | Exact row `(c; a in, z out)` | Equality-chain rows | Family |
| ---: | ---: | --- | --- | --- |
| 0 | 8 | critical `(4; 5, 11)` | K4 at 11 and 5 | critical + K4 + K4 |
| 1 | 7 | rich `(13; 10, 0)` | K4 at 0 and 10 | rich + K4 + K4 |
| 2 | 8 | critical `(6; 8, 10)` | K4 at 10 and 8 | critical + K4 + K4 |
| 3 | 8 | critical `(10; 0, 12)` | K4 at 0 and 12 | critical + K4 + K4 |
| 4 | 8 | critical `(10; 0, 12)` | K4 at 0, rich at 12 | critical + K4 + rich |
| 5 | 8 | same as iteration 4 | same; different blocker activation | duplicate |
| 6 | 8 | same as iteration 4 | same; different blocker activation | duplicate |
| 7 | 8 | same as iteration 4 | same; different blocker activation | duplicate |
| 8 | 7 | critical `(0; 12, 2)` | K4 at 12 and 2 | critical + K4 + K4 |
| 9 | 7 | rich `(12; 3, 9)` | K4 at 3 and 9 | rich + K4 + K4 |
| 10 | 7 | critical `(10; 1, 0)` | K4 at 0 and 1 | critical + K4 + K4 |

Thus there is one theorem family, three encoder/source-row presentations, and
four exact logical duplicates at iterations 4-7. No blocker is a universal cut
stronger than the existing `ExactOffCircleCore` schema. Computationally, the
V17 rule is useful because it recognizes and authenticates instances early.

## Registry audit

### Current project and Census554

The direct reusable consumer is
`Problem97.Census554.EqualityCore.false_of_exactAt_of_exactOffCircleCore`.
The general-n bank document records the generic equality-closure transport and
its ambient-label-type independence at
`docs/general-n-certificate-bank-mining-2026-07-09.md:695-723`. It explicitly
does not find witnesses or prove finite coverage. The exact-off-circle extension
is present in the live Lean source even though that snapshot does not name it.

`CapSelectedPinnedShellBridge.false_of_exactOffCircleCore_patternCode` and the
`GeneralCarrierBridge` metric-core alternatives are additional consumers, not
the missing R/Q/G source producer. `U1CarrierInjection` can pin one or two rows,
or an exact and critical row, after the corresponding actual classes have been
chosen; it does not derive the required positive triangle of incidences.

### Sibling p97-rvol bank

The nearest source-proved, sibling-root-reachable results are:

- `U5QCriticalTripleClass.qcritical_exact_selected_selected_qcritical_aux_radius_chain_incompatibility`;
- `u5_qcritical_exact_selected_selected_qcritical_aux_radius_chain_metric_incompatibility`.

They occur in `certificates/p97_rvol_general_n_mining.json:37064-37101`.
Both need a U5 dangerous-triple packet with seven points and a substantially
longer named class/equality chain. Neither consumes live `R/Q/G`, and no theorem
produces those packets from retained omission. They are specialized near-hits,
not preferable replacements for the current generic equality core.

The registry's `source-proved` classification is a source/no-`sorry` census,
not a current-project kernel or transitive-axiom audit.

### Legacy banks

Both legacy registries contain the source-proved/reachable theorem
`Problem97.three_common_equidistant_centers_eq`:

- `certificates/erdos97_legacy_general_n_mining.json:3047-3061`;
- `certificates/erdos_general_theorem_p97_mining.json:2979-2993`.

It says that two centers equidistant from the same three noncollinear points
coincide. The V17 cores use an exact row and a two-row equality chain, not a
three-common-point/two-center configuration. No live producer supplies its
hypotheses, and archive reachability is only within the archive's own root.

## The V16 iteration-10 replay is different

`original-v16-iter10-theory-replay.json` authenticated the old hard assignment:

- status: UNSAT;
- lane: `fixed_assignment_qf_lra`;
- generalized: false;
- core size: 825;
- assignment SHA-256:
  `e606e5870c041e7b97271a9cbc6391b70a1268987718540b189be5355dafe3d4`;
- expected blocker SHA-256:
  `6c566d17b54d65315ae377d259e4aa0f289823e3ebc7df23e5a7b26678918cdb`;
- wall time: 22.934 seconds.

After exact PB-to-If normalization, the query was audited QF_LRA and solved
quickly, but tracker-family extraction did not yield a core. This is an exact
external replay of one complete assignment only. It supplies neither a short
family theorem nor a universal rule, and it is not the canary2 iteration-10
assignment.

## Exact missing source bridge from R/Q/G

The live inputs are:

- `R : FrontierCommonDeletionParentResidual`;
- `Q : RetainedOmissionAllLargeNormalForm R`;
- `G : TriApexAllLargeContext R`.

`Q` supplies exact critical shells and excluded points (`kept` in the paired
arm, `fresh` in the fresh arm). `G` supplies all-large/rich/cap-cover data.
What they do not currently supply is the positive row incidence triangle that
turns an excluded point into an `EdgeClosure` witness.

A suitable general producer would have the shape

```lean
∃ F : FaithfulCarrierPattern D.A,
  ∃ q hq core : Census554.EqualityCore.ExactOffCircleCore (rowPattern F),
    core.c = blockerLabel H q hq
```

or, equivalently, produce the exact-off branch of a
`ShellMetricCoreAlternative`. A more local bridge would select
`a ∈ reverseShell` and prove

```lean
EdgeClosure (rowPattern F)
  (blockerLabel H O.deleted ..., label a)
  (blockerLabel H O.deleted ..., label offPoint)
```

where `offPoint` is `O.kept` in the paired arm or the named fresh point in the
fresh arm. Existing pinning constructors become useful only after the actual
positive memberships/classes have been obtained.

An exact-n15 finite producer may assume `card = 15`, exploit the exact
S6/D44 profiles, and prove a certified finite disjunction covering every Boolean
assignment. Such a theorem would close only that exact-cardinality slice unless
the universal R/Q/G target is separately reduced to it.

## Trust boundary and final recommendation

- The generic Lean consumer is source-inspected and source-proved in the tree;
  no Lean build or transitive axiom audit was run for this report.
- The 11 V17 blockers are external Z3 fresh-replay certificates for the encoded
  frozen formula, not kernel certificates.
- The V16 hard replay is likewise external and assignment-specific.
- The canary exhausted its budget, so neither exact n=15 nor the universal
  retained-omission target is closed.

Keep the V17 projected equality-closure rule as a fail-closed CEGAR optimization:
emit a blocker only after fresh replay. Bank no new theorem for the contradiction
itself. Redirect theorem work to the positive R/Q/G-to-`ExactOffCircleCore`
coverage bridge.
