# P97 exact-17 cap-nine all-core replay audit

Date: 2026-08-08

## Route supersession — 2026-08-10

All replay, SAT, exact-linear, and theorem-bank results below remain valid
finite checkpoints. They no longer define the production closure route. The
required replacement is the Lean-first contract in
`docs/specs/p97-exact17-cap9-lean-to-sat-route-v1.md`: prove a finite normal
form with explicit labels and the actual next-row center, export a checked CNF,
obtain a PIQD terminal certificate, and aggregate all placements in Lean before
consuming the unchanged cap-nine leaf. The existing Python source adapter is
not a substitute for those ingress and coverage theorems.

## Scope

This note records the soundness repair and successor search for the exact-17
cap-nine Rigid221 CEGAR lane.  It is a finite search checkpoint for
`false_of_exactFourRigid221_sourceHeavy_secondOppositeLarge_pentagonBlockerV_vRowBlockerDeleted_deletedRowBlockerOffClass_card_eq_seventeen_secondCapNine`.
It is not exact-17 closure, closure of the parent Rigid221 production leaf, or
full P97 closure.

## Repaired replay contract

The prior two-Kalmanson stage checked only that some member of the theorem
family was present.  Its equality-label exporter could then substitute a
different core from the minimized row system.  That authenticated a family
hit without proving that the exact labels, rows, cyclic order,
quadrilaterals, and cancellation path used by the exported clause were the
certified theorem instance.

The repaired bank now fails closed through two operations:

1. `certify_two_kalmanson_cancellation` reconstructs and checks the exact
   serialized core, including boundary and source labels, selected rows, both
   inequality forms and quadruples, endpoint comparison, permutation, and
   complete cancellation path.
2. `enumerate_two_kalmanson_cancellations` deterministically enumerates every
   exact admissible core in the complete verified row system.  It never uses a
   minimized family representative as a proxy for the source model.

The focused regression suite passes: 36 tests and 42 subtests.  Ruff and the
Python compile check also pass.

## Historical-bank migration

The direct-six bank was migrated by rechecking parent-artifact hashes and the
current exact certifiers.  It rescanned 274 legacy two-Kalmanson occurrences
into 408 exact cores before bank-level deduplication.  The resulting bank has
1,111 deduplicated records: 938 formalized records, 173 positive weighted
records, and 63 distinct two-Kalmanson records.

Exhaustive inspection of the twenty v10 source models found 750 exact
serialized cores and 596 distinct endpoint-comparison clauses.  The earlier
first-hit export had retained only twenty of those cuts.

## Corrected v11 round

The v11 artifact has:

- 74,813 variables;
- 2,503,787 clauses;
- 1,108 learned nogoods;
- 640 equality-label cuts; and
- CNF SHA-256
  `aede44af37dd7e157a6f289deedcdf7f75b41a9501d01729dec5969152ca31d7`.

The independent validator regenerated it byte-for-byte, replayed a CaDiCaL
model, checked three source Z3 models and 145,975 structural clauses, and
replayed all twelve static theorem families plus the transitive
convex-five-point digests.  It terminated `PASS`.

A fresh 24-seed CaDiCaL portfolio (seeds 1201--1224, `nice +10`) returned 24
`SAT` assignments.  Every assignment passed DIMACS checking, source-Z3
pinning, the independent source model checker, and exact theorem-bank replay.
All 24 contained an already formalized two-Kalmanson cancellation; two also
contained a six-point two-circle arc-overtake obstruction.

Across those models the complete-model census found:

- 900 exact serialized two-Kalmanson cores; and
- 684 distinct endpoint-comparison clauses.

These are additional instances of existing mathematics, not new theorem
schemas.  Consequently the v11 round did not close the finite target.

## v12 configuration guard and corrected v12t successor

The first v12 exporter invocation replayed all 44 authenticated analyses
(twenty v10 and twenty-four v11), but omitted the admitted
`--transitive-two-circle` family.  Its independent validation passed for the
candidate actually requested, but comparison with the v11 manifest exposed
the non-monotone configuration immediately: the candidate had only 285
variables and no transitive label variables.  No solver wave was launched
from it.  It is retained as a diagnostic artifact, not a successor result.

The corrected v12t invocation preserves every v11 clause family and adds the
new exact cores.  It produced:

- 74,813 variables;
- 2,504,349 clauses;
- 1,132 learned nogoods.

Its equality-label block contains 1,178 clauses, compared with 640 in v11.

The independent validator regenerated v12t byte-for-byte, replayed a CaDiCaL
model, checked three source Z3 models and 145,975 structural clauses, and
replayed the complete static bank.  It terminated `PASS`.

A fresh 24-seed CaDiCaL portfolio (seeds 1301--1324, `nice +10`) then returned
24 `SAT` assignments.  Every assignment passed DIMACS checking, source-Z3
pinning, the independent source model checker, and exact theorem-bank replay.
Twenty-two assignments had one bank hit and two had two hits.  Every assignment
again contained an exact two-Kalmanson cancellation.

The all-core census over these assignments found:

- 642 exact serialized two-Kalmanson cores;
- 499 model-local endpoint clauses; and
- 498 distinct endpoint clauses globally.

Only one endpoint clause recurred across the entire portfolio.  Thus a further
round that merely appends these 498 concrete endpoint clauses would eliminate
the observed assignments, but the near-total lack of reuse is evidence against
blind clause-by-clause convergence.  The next step must generalize this theorem
family in the encoding or otherwise integrate the global linear metric theory;
v13 should not be launched solely as another accumulation round.

A future `UNSAT` result would additionally require an exact proof replay and
the existing source-to-finite Lean ingress before it could close the on-spine
cap-nine theorem.

## Cyclic schema H and the v13 canary

The recurring-motif audit isolated a source-clean six-point obstruction,
schema H.  In increasing cyclic order `a < b < c < d < e < f`, it uses the
four selected-row incidences

- row `a` contains `b,d`;
- row `c` contains `e,f`;
- row `e` contains `d,f`; and
- row `f` contains `b,e`.

Three strict Kalmanson inequalities and the four shell equalities contradict
by linear arithmetic.  Increasing- and decreasing-order metric theorems,
direct selected-row consumers, and cyclic-shift adapters are banked in
`KalmansonFourEqualitySchemas.lean`.  Their declarations do not depend on
`sorryAx` or compiler trust.

The authenticated v13 export added 148,512 schema-H clauses.  It has 74,813
variables and 2,652,861 clauses; independent regeneration and validation
terminated `PASS`.  Four fresh CaDiCaL seeds (2101--2104) remained `SAT`.

## Analyzer audit and canonical replay

An obsolete scratch analyzer was found to mark exact rows from the legacy
fixed-center list and to scan the legacy default cyclic order.  It did not
decode the selected fifth exact row from the DIMACS assignment.  This defect
affected only that diagnostic analyzer, not the source CNF or its independent
validator.

The production analyzer is
`analyze_source_faithful_boolean_model.py`.  It pins the complete DIMACS
assignment back into the source Z3 model, derives exactness from the decoded
metric rows, runs the independent model checker, and records the normalized
cyclic order.  Replaying all four v13 canaries through this canonical path
passed every gate.  Their selected fifth exact centers are respectively
`6, 7, 7, 6`, and all four still hit the source-clean generic
two-Kalmanson-cancellation consumer.

The cyclic motif census gives a useful negative strategic result.  The four
v13 canaries contain 87 exact cancellations across 62 normalized motifs, but
none requires a new motif class: motifs already seen in v10 cover all four.
A greedy historical cover uses three motifs.  This supports compiling exact
generic cancellation certificates rather than continuing a one-schema-at-a-
time staircase.

## Corrected all-history v14b replay

The first v14 all-history export was internally sound and independently
validated, but its input list contained only 48 analyses: the twenty v10,
twenty-four v11, and four v13 reports.  It accidentally omitted all twenty-four
v12t reports.  It is therefore retained as a valid but incomplete diagnostic,
not as the intended monotone all-history successor.

The corrected v14b export replayed all 72 authenticated analyses.  It produced:

- 74,813 variables;
- 2,653,460 clauses;
- 1,160 learned nogoods;
- 1,749 equality-label clauses; and
- CNF SHA-256
  `6ea9fec71c7bb85f8260593a33bc4f22e28b7088d3c454bea0237a9d112b03da`.

The independent validator regenerated the candidate exactly, checked all
145,975 structural clauses and thirteen static theorem families, round-tripped
three source models, and terminated `PASS`.  Four fresh CaDiCaL seeds
(2201--2204) remained `SAT`.  All four assignments passed DIMACS checking,
source-Z3 pinning, the independent source checker, and the direct-CNF theorem
bank check.  Thus v14b still does not close exact 17.

## Cyclic schema I and the v15 successor

Although each v14b assignment still had an exact two-Kalmanson cancellation,
the normalized historical motif census found a stronger reusable fact: one
six-point motif already present in v10 occurs in all four v14b assignments.
For cyclic order `a < b < c < d < e < f`, schema I uses

- row `a` containing `b,e`;
- row `d` containing `b,e`;
- row `b` containing `c,f`; and
- row `e` containing `c,f`.

The Kalmanson inequalities on `(a,b,e,f)` and `(b,c,d,e)` reduce under these
four shell equalities to the contradictory strict comparisons `ec < bc` and
`bc < ec`.  Increasing- and decreasing-order metric theorems, direct
selected-row consumers, and both cyclic-shift adapters are now banked in
`KalmansonFourEqualitySchemas.lean`.  Lean elaboration is clean; all six new
declarations have axiom closure exactly `propext`, `Classical.choice`, and
`Quot.sound`.

The direct exporter and independent validator now generate schema I as a
separate static clause family.  The exporter additionally fails closed unless
the named increasing, decreasing, and cyclic-shift Lean consumers for schemas
G, H, and I are present, hashes that Lean source into the artifact provenance,
and records the consumer names in `cut_admission`.

The authenticated v15 export replayed all 72 analyses and added 74,256
schema-I clauses.  It has 285 variables and 2,328,167 clauses, with CNF
SHA-256
`b2e94d13ac45a54e497d4967af24c9a6fa0c785d508c8aa3e1fe50dfb5b40d15`.
The independent validator regenerated the candidate exactly, checked all
145,975 structural clauses and fourteen static theorem families, round-tripped
three source models, and terminated `PASS`.  Four fresh CaDiCaL seeds
(2301--2304) remained `SAT`.  Every assignment passed DIMACS checking,
source-Z3 pinning, the independent source checker, and the direct-CNF theorem
bank check.  The four seeds normalized to the same selected-row model, with
fifth exact center `6`.

## Cyclic schema J and the v16 successor

Mining that canonical v15 survivor produced another source-clean six-point
obstruction.  In cyclic order `a < b < c < d < e < f`, schema J uses

- row `a` containing `b,d`;
- row `b` containing `a,c`;
- row `e` containing `a,b`; and
- row `f` containing `c,d`.

The strict Kalmanson inequality on `(a,b,d,e)` reduces under the first and
third shell equalities to `bd < ab`.  The complementary strict Kalmanson
inequality on `(b,c,d,f)` reduces under the second and fourth shell equalities
to `ab < bd`.  Increasing- and decreasing-order metric theorems, direct
selected-row consumers, and both cyclic-shift adapters are banked in
`KalmansonFourEqualitySchemas.lean`.  Lean elaboration is clean; all six
declarations have axiom closure exactly `propext`, `Classical.choice`, and
`Quot.sound`.

The authenticated v16 successor added schema J as an independently regenerated
static clause family and replayed the 72 inherited analyses plus the four
authenticated v15 canaries.  It has 285 variables and 2,476,680 clauses, with
CNF SHA-256
`3000260a6d56798a27c6c5b3f094e6bed772786e44644e7a3a6dc06c4b3301b3`.
The independent validator regenerated the candidate exactly, checked all
145,975 structural clauses and fifteen static theorem families, round-tripped
three source models, and terminated `PASS`.

Four fresh CaDiCaL seeds (2401--2404) remained `SAT`.  All four assignments
passed DIMACS checking, source-Z3 pinning, the independent source checker, and
the direct-CNF theorem-bank check.  They normalized to the same selected-row
model, with fifth exact center `4`.  Unlike the preceding rounds, that model
needs no new geometric schema: it has eight hits in the existing formalized
bank, including two-circle bisector-order, convex-five-point, metric-alternative,
generic two-Kalmanson, exact-off-circle, duplicate-center, and perpendicular-
bisector consumers.  The v17 successor therefore replays those existing
consumer-backed cuts rather than adding another large static motif family.

## Existing-bank v17 replay

The authenticated v17 successor replayed all 80 inherited analyses.  Because
the four v16 canaries normalize to the same first bank witness, their replay
adds exactly one distinct learned nogood, increasing the learned block from
1,161 to 1,162 clauses.  The resulting formula has 285 variables and
2,476,681 clauses, with CNF SHA-256
`c916bb858c3bad95c81d0e95250d20c6182e52b748923b57c7cf3d5bae118042`.
The independent validator regenerated the candidate exactly, checked all
145,975 structural clauses and fifteen static theorem families, round-tripped
three source models, and terminated `PASS`.

Four fresh CaDiCaL seeds (2501--2504) remained `SAT`.  They again normalized
to one selected-row model, with fifth exact center `4`, and passed DIMACS
checking, source-Z3 pinning, the independent source checker, and the direct-CNF
theorem-bank check.  Each model has nine existing formalized-bank hits.  The
first replayable witness is a four-row two-circle bisector-order obstruction;
the other hits include its reverse-order arm, both convex-five-point arms,
equilateral-bisector collision, generic two-Kalmanson cancellation,
exact-off-circle, duplicate-center, and perpendicular-bisector convexity.
Thus v17 is another strict finite refinement, not exact-17 closure.  Its four
new analyses again collapse to one new learned clause for the v18 successor.

## Corrected non-transitive v18 replay

The first artifact written under the v18 name accidentally enabled the
optional transitive two-circle expansion.  That artifact has 74,813 variables,
2,876,231 clauses, and CNF SHA-256
`b45cef05edd12ce0b25013cf21d318db36020bb47c728118f07a0a0ef535f342`.
It was never independently validated or promoted and is retained only as a
diagnostic artifact.  A separate CaDiCaL canary remained `SAT`, so the broader
transitive expansion is not an immediate closure by itself.

The corrected v18b successor preserves the non-transitive 285-variable
semantics.  It replays 84 analyses and has 2,476,682 clauses, including 1,163
learned nogoods, with CNF SHA-256
`49de86fdfd77b003311dfd8598fc34c818690a84218f12b35a410ff2c7953724`.
The independent validator terminated `PASS`.  Four fresh CaDiCaL seeds
(2601--2604) remained `SAT`, passed all four assignment checks, and normalized
to the same selected-row model.

That model has 33 proposed bank witnesses.  Exact replay rejects one
nested-equal-chords proposal and certifies the other 32.  This round exposed a
replay inefficiency: selecting only the first certified witness discarded many
simultaneously valid cuts from the same expensive solver model.

## Bulk existing-bank replay in v19 and v20

The analyzer now minimizes every consumer-backed witness present in a model,
records unreplayed proposals separately, and the exporter imports all distinct
minimized clauses only after exact artifact alignment.  The downstream
independent validator then regenerates and reauthenticates the complete CNF.

Bulk-minimizing the v18b model produced the v19 successor with 285 variables,
2,476,700 clauses, 1,181 learned nogoods, and 85 analyses.  Its CNF SHA-256 is
`daab4962e73603aef0ba7c64da9f8b9132cffde79df94e0939bc40de8b6eb0ad`.
Independent validation terminated `PASS`.  Seeds 2701--2704 again remained
`SAT`, normalized identically, and exposed twelve replay-safe bank hits plus
one unreplayed nested-equal-chords proposal.  Their bulk minimization added nine
distinct learned clauses to v20.

The authenticated v20 formula has 285 variables, 2,476,709 clauses, 1,190
learned nogoods, and 86 analyses, with CNF SHA-256
`9444ee1dc0c6b518338e3ce443b2cb4ac3494828f76e025337742833e9477335`.
Independent validation again terminated `PASS`.  Fresh seeds 2801--2804
remained `SAT`, passed the DIMACS, source-Z3, independent-source, and static-bank
checks, and normalized to one model.  That model has seven replay-safe hits and
no unreplayed proposal: both directions of two-circle bisector order,
convex-five-point reverse order, generic two-Kalmanson cancellation,
exact-off-circle, duplicate-center, and perpendicular-bisector convexity.

## v21 near-saturation replay

The seven v20 witnesses add five distinct learned clauses in v21.  The
successor has 285 variables, 2,476,714 clauses, 1,195 learned nogoods, and 87
analyses, with CNF SHA-256
`caf7d96e72cf9d4a307debdc238440ce3338b64fa12831a9db776303cdc4859e`.
Independent validation regenerated that exact candidate, checked the complete
structural and static bank, round-tripped three source models and one CaDiCaL
model, and terminated `PASS`.

Fresh seeds 3001--3004 all remained `SAT` and normalized to the same selected-
row model.  Every assignment passed all four model-level checks.  The bank-hit
count has fallen from seven to two, with no unreplayed proposal: reverse
convex-five-point order and generic two-Kalmanson cancellation.  Both witnesses
minimize successfully and are the only additions proposed for v22.  If those
two witnesses add no distinct clause, or if their verified successor has no
bank hit, the current formalized bank is saturated on this staircase and a new
general obstruction is required.

## v22 replay

The two v21 witnesses add two distinct learned clauses in v22.  The successor
has 285 variables, 2,476,716 clauses, 1,197 learned nogoods, and 88 analyses,
with CNF SHA-256
`4e3abea9412367596281102faacdc874822d5d7b5454ac2c2d53a0bb621d03d8`.
Independent validation regenerated the candidate, checked all 145,975
structural clauses and fifteen static families, round-tripped three source
models and one CaDiCaL model, and terminated `PASS`.

Fresh seeds 3201--3204 all remained `SAT` and normalized to the same selected-
row model.  Every assignment again passed the DIMACS, source-Z3,
independent-source, and direct-static-bank checks.  This model has seven
replay-safe bank hits and no unreplayed proposal: both directions of
two-circle bisector order, both directions of convex-five-point order, generic
two-Kalmanson cancellation, exact-off-circle, and perpendicular-bisector
convexity.  All seven witnesses minimize successfully.  Their distinct-clause
successor is v23; until that successor is independently validated, these are
refinement data rather than a new trusted formula.

## v23 stopping point

The seven v22 witnesses add six distinct learned clauses in v23.  The
successor has 285 variables, 2,476,722 clauses, 1,203 learned nogoods, and 89
analyses, with CNF SHA-256
`fec68618172eb5cebf049821174484b101a03c66b38ab6c430cf1191f991dbec`.
Independent validation regenerated that exact candidate, checked all 145,975
structural clauses and fifteen static families, round-tripped three source
models and one CaDiCaL model, and terminated `PASS`.

Final canary seeds 3401--3404 all remained `SAT` and normalized to one selected-
row model.  Every assignment passed the DIMACS, source-Z3,
independent-source, and direct-static-bank checks.  The model has five
replay-safe bank hits and no unreplayed proposal: both directions of
two-circle bisector order, both directions of convex-five-point order, and
generic two-Kalmanson cancellation.

This is the stopping point for blind one-model refinement.  The remaining
models are still rejected by already-proved, cardinality-independent theorem
families, but the current exporter learns witness-specific row clauses for
four of those families and only a partially generalized endpoint-comparison
clause for two-Kalmanson cancellation.  The next finite step is to instantiate
the recurring theorem families exhaustively over the exact-17 universe, or to
prove an aggregate coverage theorem.  A v24 obtained only by adding the five
current witnesses would repeat the same staircase without addressing that
coverage gap.

## Transitive family-isolation round

The transitive-label compiler was then enabled on all 89 authenticated v23
analyses.  The resulting v23t formula has 74,813 variables, 2,876,276 clauses,
1,203 learned row nogoods, and 1,754 observed two-Kalmanson equality-label
cuts, with CNF SHA-256
`7ec0f61411c055455865c5bf2b30125c530e42c99eee3e698c00a22593199092`.
It compiles the two-circle bisector and convex-five-point families over the
whole finite universe, rather than only over previously observed row
witnesses.  Independent validation checked all fifteen static families, all
145,975 structural clauses, three source models, and a CaDiCaL roundtrip, and
terminated `PASS`.

Fresh seeds 3601--3609 all remained `SAT`.  All nine assignments passed the
DIMACS, source-Z3, independent-source, and direct-static-bank checks, and all
nine selected-row models were distinct.  Nevertheless, every model had
exactly one replay-safe bank hit and no unreplayed proposal: generic
two-Kalmanson cancellation.  Thus the transitive compilation successfully
removed the recurring two-circle and convex-five-point witnesses and isolated
one residual theorem family.

Adding all nine source-verified models produced v24t with 74,813 variables,
2,876,294 clauses, 1,212 learned row nogoods, and 1,763 observed
two-Kalmanson equality-label cuts.  Its CNF SHA-256 is
`4c13a43bb570dba907a368be574cae423ef06f55eeb58c8238ccfdd51177baf8`.
The increase is exactly eighteen clauses: one row nogood and one observed
equality-label cut for each distinct model.  Independent validation again
terminated `PASS`, with the same fifteen static families, 145,975 structural
clauses, three source models, and CaDiCaL roundtrip.

Fresh seed 3701 remained `SAT`.  Its assignment passed all four model-level
checks and again had exactly one bank hit, generic two-Kalmanson cancellation,
with no unreplayed proposal.  This is the stopping point for the finite
one-witness staircase.  The evidence now isolates the missing mechanism:
global consistency of the selected-row equality partition with the complete
strict Kalmanson linear system.  The current exporter admits only
two-Kalmanson equality-label instances already observed in authenticated
models, so another finite seed merely discovers another instance.

The next closure artifact should therefore be one of:

1. a lazy global linear-arithmetic oracle which checks every SAT assignment
   against all strict Kalmanson inequalities, extracts an exact rational core,
   and replays it through the existing source-clean Kalmanson consumers; or
2. a finite aggregate coverage theorem proving that every exact-17 cap-nine
   selected-row assignment contains a certified two-Kalmanson cancellation.

Either finite search route would still require the new Lean finite-normal-form
and checked-export ingress, followed by kernel-checked aggregate placement and
certificate consumption. The existing Python source adapter is finite semantic
evidence only. The validated v24t `SAT` result itself is not exact-17 closure.

## Lazy complete-Kalmanson refinement

The first proposed successor has now been implemented and exercised.  For a
source-verified Boolean assignment, the analyzer builds the complete strict
linear system consisting of positive distances, all triangle inequalities,
all strict Kalmanson inequalities in the fixed cyclic order, and every
selected-row equality.  A linear `UNSAT` result is not admitted directly.  A
separate extractor minimizes the assumptions, solves for exact rational
Farkas weights, normalizes them to integer weights, and replays the result
through
`GenericRowNogoodCertificate.false_of_weightedKalmansonCancellationData_of_check`.

This check was first run over the nine distinct v23t seed-3601--3609 models.
All nine were linearly infeasible.  The exact replayed certificates use four
to six selected rows, fourteen to 78 minimized assumptions, and seven to 71
weighted terms.  The heterogeneous cores show that the useful abstraction is
the complete linear oracle, not another hand-written matcher for one fixed
motif.

Running the full CEGAR wrapper separately on each pinned assignment took about
270 seconds because it rebuilt the 2.8-million-clause Boolean formula before
performing the linear check.  The analyzer now supports
`--always-linear-replay`, allowing the same source, model, bank, and complete
linear checks to run directly on a CaDiCaL assignment.  A seed-3601 replay took
about twelve seconds, followed by about three seconds for exact-certificate
extraction in the first timing pass.

The first nine certificates were admitted without rebuilding the large CNF.
`append_weighted_kalmanson_cuts.py` authenticates the base manifest and CNF,
exactly replays each weighted certificate, converts it to one Boolean row
nogood, and streams a byte-exact copy of the base with only the DIMACS header
and certified suffix changed.  The independent
`validate_lazy_weighted_cnf.py` replays the certificates again and checks the
whole base prefix and exact suffix byte for byte.  The resulting v25t formula
has 74,813 variables and 2,876,303 clauses.  Its CNF SHA-256 is
`42ae4aae703e0637f68f678a0b6839274d41fe20d2dcfb61eca0b4b60c9cf513`,
and independent validation terminated `PASS` for all nine appended clauses.

Fresh v25t seed 3801 remained `SAT` in about five seconds.  Its assignment
passed the direct source/model checks, and the complete linear oracle found a
new five-row, 44-assumption, 39-term exact contradiction in about twelve
seconds.  Exact extraction and theorem-bank replay succeeded, producing v26t
with 2,876,304 clauses and CNF SHA-256
`6e5507270721e8e76ee3b0156fa4ce809477bdabb9caa515ac8b43074fa3d0bc`.
The independent derived-CNF validator again terminated `PASS`.

The authenticated operations are now composed by
`run_lazy_global_kalmanson_loop.py`.  Its first end-to-end smoke iteration,
seed 3802, found another Boolean survivor in 8.45 seconds, rejected it by the
complete linear oracle in 12.94 seconds, extracted a four-row, 60-assumption,
53-term exact certificate in 6.13 seconds, and independently validated the
derived 2,876,305-clause CNF.  The sustained successor starts from that
derived manifest and stops fail-closed on finite Boolean `UNSAT`, a linearly
feasible or unknown survivor, a solver error, or any authentication failure.

The next sustained run refined seeds 3803--3818.  All sixteen assignments were
Boolean `SAT`, passed the direct source/model checks, and were rejected by the
complete linear oracle.  Exact extraction and theorem-bank replay succeeded
for every assignment.  The minimized certificates use four to seven selected
rows, nineteen to 71 assumptions, and twelve to 64 weighted terms.  The run
terminated only at its configured iteration limit, with 2,876,321 clauses.
Its terminal manifest SHA-256 is
`46ab89fb421de712ca92b0389b20e9a1f98ec14ec985edaa7dc4796f98160488`;
the terminal CNF SHA-256 is
`ddd7bb93edab4188ed127dcce37c7a0d7c8100f41cfe0c12058bce6c35280aaf`.

An end-to-end provenance audit exposed that the v25 manifest and CNF had been
overwritten after v26 was created by the earlier failed full-export attempt.
The mismatch was fail-closed: v26 still pinned the original parent hashes, so
the recursive validator rejected the changed files.  Rebuilding v25 from the
authenticated v24 base and its nine exact certificates reproduced the pinned
manifest SHA-256
`c025f534b53b666fea2ea58774bda4eceb3a0fd25b606c6878a11c6827b3ac24`
and CNF SHA-256
`42ae4aae703e0637f68f678a0b6839274d41fe20d2dcfb61eca0b4b60c9cf513`
exactly.  `validate_lazy_weighted_chain.py` then replayed all nineteen lazy
parent-to-child edges, from the authenticated v24 root through seed 3818, and
terminated `PASS`.  The overwritten manifest is retained beside the restored
artifact for audit; the overwritten CNF had SHA-256
`0f20e89d3b6ff44d259477ec179117e0f620139e3351f1527ecd633da6f899ee`.

The sustained driver now records and freezes every encoder, analyzer,
certificate, theorem-bank, and CaDiCaL source hash for the duration of a run.
It checks the freeze before each SAT query and after every proposal/extraction
or validation phase.  Any drift aborts the run rather than mixing artifacts
from different source states.

These results establish a fast, exact refinement loop.  They do **not** yet
establish exact-17 closure: a terminal Boolean `UNSAT` still needs an exact SAT
proof and the existing exact-17 source adapter plus kernel-checked finite
coverage ingress before the anchored production leaf can be discharged.

## Source-frozen continuation and dihedral theorem-family closure

A further source-frozen run refined seeds 3819--3850.  All 32 assignments were
Boolean `SAT`, passed the source/model checks, and were rejected by the complete
strict Kalmanson linear oracle.  Every rejection yielded an exact weighted
cancellation accepted by the existing source-clean Lean consumer.  The run
stopped at its configured iteration limit, not at Boolean `UNSAT`.  Its terminal
manifest SHA-256 is
`29d6cc1df0bef47137f93c4053c7660e1c8a49dddb658bd40339683006caae36`;
its terminal CNF SHA-256 is
`7f30e30d713119c50ef8d39b6d8f6be0ff4ebf9911db77560e3b5faaae1678e9`.
The recursive validator replayed all 51 accumulated lazy parent-to-child edges
and terminated `PASS`.

The mandatory generalization checkpoint found a uniform amplification.  A
weighted Kalmanson cancellation remains valid under every rotation and
reflection of the fixed 17-cycle.  For each exact certificate, the orbit
generator maps both selected rows and Kalmanson terms, reconstructs whether
each image is the `adjacentSides` or `innerOuter` form from its edge multisets,
and calls the exact theorem-bank checker on the image.  This is a use of the
cardinality-independent weighted-cancellation theorem, not an assumption that
the normalized source packet has the full dihedral symmetry.

The authenticated bank contains 60 exact certificates: the original seed-3701
certificate, the nine v23t certificates, seeds 3801 and 3802, the sixteen
seed-3803--3818 certificates, and the 32 seed-3819--3850 certificates.  The
legacy seed-3701 wrapper was regenerated from its pinned exact replay into the
current label-quadruple certificate schema before admission.  All 2,040
dihedral images replayed exactly and produced 2,040 distinct clauses.  The
independent validator proved that the authenticated base is preserved byte for
byte and that the exact suffix is precisely the replayed orbit bank.  The
source-frozen derived formula has 74,813 variables and 2,878,393 clauses, with
CNF SHA-256
`bca396ea7af8c70037f9bf96569bcbc5452363d8117dfa9ce1aa8e28e38741e6`.
The generation manifest pins eleven transitive source files; independent
validation terminated `PASS` for all 60 certificates and all 2,040 images.

This is a genuine general-theorem reuse gain: one oracle discovery now rejects
its entire 34-element cyclic-order orbit.  It is not yet exact-17 closure.  A
fresh successor search over the orbit-expanded formula must still terminate
Boolean `UNSAT`, and that verdict must then pass proof-producing SAT replay and
the exact-17 Lean ingress before the on-spine `sorry` is closed.

## Direct two-Kalmanson label cuts

The weighted-certificate bank exposed a stronger finite interface.  For two
strict Kalmanson inequalities, it is enough to know that the eight positive
edge occurrences on their left sides and the eight negative edge occurrences
on their right sides receive the same multiset of distance labels.  Summing the
two strict inequalities then contradicts that checked label permutation.
`TwoKalmansonLabelCut.lean` banks this as
`false_of_twoKalmansonLabelCancellationData`.  Its assumptions are direct
distance equalities, rather than selected-row paths, and Lean reports only
`propext`, `Classical.choice`, and `Quot.sound` in its axiom closure.

Exhaustively materializing all such Boolean clauses is not practical.  There
are 4,760 strict Kalmanson inequalities on the fixed 17-cycle and 11,331,180
unordered pairs with repetition.  Exact enumeration produces 262,956,680
distinct clauses after deduplication within each pair, with clause lengths from
16 through 32 literals.  The counted suffix stream has SHA-256
`8615a5d31de328c5c9ed4404356afded3884be21eb629f5b956cd315ce93ec6f`.
This rules out a static all-pairs layer as an engineering route; it does not
rule out the mathematical cut.

The production replacement is a lazy separator.  Given a complete CaDiCaL
assignment, it groups all 4,760 strict inequalities by signed label-count
delta and emits every cancelling pair violated by that model.  The appender
requires one complete, duplicate-free, in-range `SATISFIABLE` assignment.  An
independent validator streams the full authenticated parent CNF, checks that
the model satisfies every parent clause, reconstructs every appended cut, and
checks all clause counts and hashes.  Thus a malformed or stale assignment
cannot silently generate a refinement.

Three hand-driven refinements and a one-round canary passed this independent
validation.  The hardened third refinement added 117 clauses and produced CNF
SHA-256
`72d7945e9fc870eb838c6d97f66428a1617ecebeeb7309130bd8d1eb2d055d75`;
the canary added 173 more and produced CNF SHA-256
`36969a6ff0db182c214af9560c5d7f8ca4bf74c17c0027c97c625d2232f29937`.

The first sustained source-frozen wave then refined seeds 5--12.  All eight
assignments were Boolean `SAT`, satisfied the complete parent DIMACS, passed
the source Z3 structural check and the independent source-model check, and had
at least one direct two-Kalmanson cancellation.  The wave added respectively
96, 138, 3,503, 209, 134, 1,142, 2,480, and 273 clauses: 7,975 total clauses
from 8,777 cancelling pairs.  It stopped at the configured eight-iteration
limit.  Its terminal formula has 4,118,501 clauses, CNF SHA-256
`b9784eb8f14cc0f2c30f08e0d7da3c7617a9e8a8e64e97f6a46c0490c05cad95`,
and manifest SHA-256
`a0ef2ec2ca5b4fc66490048647d4f61741e370a6fc2baaf2150afcc5d822cb51`.

This wave establishes that the direct-label cut is common and cheap to
separate, but not that the current lazy sequence converges.  The per-model
yield varied by more than a factor of thirty, and every tested successor
remained Boolean satisfiable.  Continuing indefinitely with new random seeds
would therefore be search, not a closure argument.  The next promotion target
is either a bounded coverage theorem for these two-inequality label patterns
or a survivor with no direct two-Kalmanson cut, which would expose a genuinely
stronger obstruction family.

## Status classification

This work is a **finite CEGAR soundness repair, reusable theorem promotion, and
strengthened search round**.  Schemas I and J and the direct two-Kalmanson
label theorem are cardinality-independent geometric theorems, but the finite
cap-nine target remains open and no production `sorry` has yet been closed by
the results recorded above.

## PIQD pair-amplification checkpoint

The first seven authenticated PIQD refinements exposed 5,994 distinct pairs of
cancelling Kalmanson inequalities.  Applying every one of the 24 raw distance-
label permutations to those already observed pairs gives 135,675 distinct
instances of the source-clean `TwoKalmansonLabelCut` theorem.  After removing
the 5,384 model-specific clauses already admitted by the seven receipts, the
pair-closure admission added 130,291 clauses in 17 bounded HTTP batches.  This
is about three percent formula growth, rather than the 262,956,680 clauses
required by exhaustive raw two-Kalmanson expansion.

The crash-safe admission receipt is
`scratch/rigid221-blockerv-exact17-20260806/piqd-two-k-label-pair-closure-v3/receipt.json`,
with SHA-256
`77d12d5a3f44c33ea97ce1b6abb824447fd8a4508d72feaf4eae1b63a25d1a5a`.
An independent validator regenerated the selected inequality-pair universe,
all generalized clauses and their batch partition, checked the complete parent
receipt and model chain, and matched the live PIQD state at 4,254,176 clauses.

The first solve against that amplified formula remained Boolean `SAT` in 351
ms.  Its complete model, with SHA-256
`76f5fcb734828da626d38ab0e577d5cd8e2db18c372141988c1b5f964c785acc`,
passed the parent DIMACS check, source-Z3 pinning, and the independent source
model checker.  Exact global linear arithmetic is `UNSAT`, and the theorem bank
finds a source-clean generic two-Kalmanson cancellation witness.  The model has
738 cancelling inequality pairs, all disjoint from the 5,994 pairs used in the
amplification.

This is authenticated finite refinement, not exact-17 coverage.  It shows that
closing the labels of previously observed inequality pairs removes those pairs
efficiently, but does not establish a bounded pair universe or convergence.
The next computational consumer should compile a genuinely general selected-
row/path cancellation motif or admit the exact global linear-arithmetic
obstruction, rather than continue an unbounded pair-only loop.
