# Exact-17 cap-nine checked Lean CNFs

This directory contains the first source-authenticated DIMACS root for the
exact-17 cap-nine BlockerV route.

The bytes were written directly by Lean:

```bash
cd lean
lake env lean --run \
  Erdos9796Proof/P97/ATail/BlockerVExactSeventeenSourceCnfExport.lean \
  ../scratch/exact17-lean-to-sat/base.cnf
```

Artifact identity:

- file: `base.cnf`;
- header: `p cnf 308 209692`;
- lines: 209,693 including the header;
- bytes: 6,012,598;
- SHA-256: `d5ea7921014b2c1868c100f89a2dfbd906f9cdba28f282fcbad015d93b1dd425`.

An independent parser checked the header, clause count, trailing zero on every
clause, literal range, absence of empty clauses, and exact use of variables
1 through 308.

The source-to-formula semantic bridge is
`Problem97.ATailBlockerVExactSeventeenSourceCnf.SourceRealization.baseCnf_sat`.
Its axiom closure is `[propext, Classical.choice, Quot.sound]`; it uses neither
`sorryAx` nor compiler trust.  Compiler trust occurs only in the separate
finite variable-map and clause-count regression declarations.

The checked C--G theorem-bank extension is also written directly by Lean:

```bash
cd lean
lake env lean --run \
  Erdos9796Proof/P97/ATail/BlockerVExactSeventeenSourceCnfCdefgExport.lean \
  ../scratch/exact17-lean-to-sat/extended-cdefg.cnf
```

Extended artifact identity:

- file: `extended-cdefg.cnf`;
- header: `p cnf 308 2189852`;
- lines: 2,189,853 including the header;
- bytes: 104,887,967;
- SHA-256: `763bb4774a4d148ca35a4d33ecce06c158a8f941c3e5fb272f534cb2b9637527`;
- checked base prefix: 209,692 clauses; and
- source-authenticated C--G extension: 1,980,160 clauses.

`SourceRealization.extendedCnf_sat` proves that every source realization
satisfies the exact extended formula.  The extension covers both source-forced
named orders, both cyclic directions, every cut, and every increasing six- or
seven-point offset choice.  The bridge and the contract
`false_of_sourceRealization_of_extendedCnf_unsat` have axiom closure
`[propext, Classical.choice, Lean.ofReduceBool, Lean.trustCompiler,
Quot.sound]`: they contain no `sorryAx`, but currently inherit compiler trust
from the scoped `native_decide` finite regressions.

The independent fixture can be replayed with:

```bash
uv run python scripts/validate_exact17_lean_cdefg_export.py \
  --base scratch/exact17-lean-to-sat/base.cnf \
  --extended scratch/exact17-lean-to-sat/extended-cdefg.cnf \
  --report scratch/exact17-lean-to-sat/extended-cdefg-validation.json
```

It verifies the byte-identical base prefix and independently regenerates all
ten schema/order families.  Its checked report is
`extended-cdefg-validation.json`.

This extended root is the immutable ancestor of the production PIQD chain, but
it is not a closure result.  Root and successor custody is operational;
terminal proof production and replay, and the one-line aggregate use of the
exact-cover extractor, are still outstanding.  The frozen Wave63 Python root
remains diagnostic comparison material only and must not be resumed as the
source of truth.

## Lean-owned refinement chain

The C--G formula is the immutable root of an append-only Lean-owned chain.  A
SAT model may propose a clause family, but the child is generated only after a
source-clean Lean theorem and realization-to-satisfaction bridge are banked.
The current sequence is:

| child | clauses | SHA-256 | result |
| --- | ---: | --- | --- |
| C--G | 2,189,852 | `763bb4774a4d148ca35a4d33ecce06c158a8f941c3e5fb272f534cb2b9637527` | SAT |
| EqualK4 | 2,268,460 | `00e0e3e50e518833b782a1afbb686896365335d4cb15c993b3a6a25e31cc0aa6` | SAT |
| TwoCircle | 2,306,540 | `2feebcbf67b377b2e198c34e4385adccf0e8a631051c6058855d72321ddf4746` | SAT |
| ThreeRow | 2,430,300 | `009b34264ddcb114a59410f3af61a46b04b831841ce6687104c1833d7441a9d4` | SAT |
| H--K | 3,618,396 | `a489fdf5ddbd1f0abd765592e4b016841b170aed7a20833318704e30171bb570` | SAT |
| Interleaved | 3,915,420 | `db8f493b4a8312efcf99d0e3e198537233b83dbb6cc5f4dad6f1423e22d90bd9` | SAT |
| EqualityChain | 4,212,444 | `d5c09fd5e139f88df5966907485a2f80b208a3917431dbd07d189ae505f16b9e` | SAT |
| PerpBisectorChain | 4,756,988 | `38db47b94b1f259feeb427a48850a94c58adf300deea0b37302a39435676e76a` | SAT |
| TwoKalmanson | 5,301,532 | `ae29c7b97602f2e6ff6c746badb13ee8abad13afec3b005da0e6c632d5e1f7fd` | SAT |
| TwoKalmansonSwappedDE | 5,846,076 | `759507d020a02253e85b59ce12e344451bbe66889dce221884f1b2a6aa3fac28` | SAT; PIQD `090c5be4-e747-40a3-ad96-baba17d9aace`; exact replay PASS |
| GenericCancellation | 5,846,080 | `7def1009b154d3b846274821300bc68f6ddd43b651e11258506f19924773ccbc` | SAT; PIQD `d03a17f2-1c7c-434c-a0eb-0c1e3a2aaab6`; exact replay PASS |
| GenericCancellationSecond | 5,846,084 | `6ab37b78e0db7cc98e2a1d62999d54d15a278135621aad95d520598afc7b47c2` | READY; recursively validated; not submitted |

The H--K theorem-bank report produced by the historical family-level minimizer
is not promotion evidence.  The production scanner now requires exact
canonical-record replay and binds the source-analysis SHA-256.

The repaired scan of the interleaved model bound 22 exact canonical records.
The first genuinely new record has been generalized in
`TwoCircleEqualityChainSchemas.lean`: five selected rows transport a common
radius from one center to a second center and contradict the same-side
two-circle reflection theorem.  Its targeted Lean build is green with no
`sorryAx`.  Its complete 297,024-clause Lean-generated child passed recursive
export and ingress validation, then returned `SAT` under immutable PIQD job
`7fcbf4c4-8cea-4179-8d56-16ddc3337494`.  Exact replay checked all 4,212,444
clauses, and the mandatory theorem-bank scan retained six exact records.

The first new record from that model is now generalized in
`PerpBisectorEqualityChainSchemas.lean`.  Three distinct carrier centers are
forced onto one perpendicular bisector by two direct equal-radius rows and one
equality chain; convex independence makes that impossible.  The complete
544,544-clause cyclic orbit was generated in Lean, recursively validated, and
admitted through a fail-closed ingress manifest.  Only the authenticated
4,756,988-clause child above was provisioned in PIQD.  Immutable job
`925a0469-313e-4cbe-bdf5-3046b9786df1` returned `SAT` after 345 seconds.  Exact
replay checked every clause, and the mandatory theorem-bank scan retained five
records.  This is not yet a closure theorem.

The first source-clean, non-subsumed record from that scan is now generalized
in `TwoKalmansonEqualityChainSchemas.lean`.  For seven cyclically ordered
carrier points, two strict Kalmanson inequalities cancel after eleven selected
row incidences propagate the required distance equalities.  Lean generated its
complete 544,544-clause orbit as the eighth child.  Independent recursive
validation checked the byte-identical parent prefix, regenerated every new
clause, and confirmed that the motivating model is cut.  Only the authenticated
5,301,532-clause root above was submitted under immutable PIQD job
`66c24b72-2b13-45d0-b00c-ef44115a1c88`; it returned `SAT`, and exact replay
checked every clause.  This is an authenticated refinement checkpoint, not an
exact-17 closure result.
The recursive validation report has SHA-256
`222e53bede625ae0213807e9472e8612f8bd883a9752ea4117d18b8f042d19a6`,
and the fail-closed ingress manifest has SHA-256
`d03929f8c9d273930080aac376bdd8e3107e0783bee4f96e493b82ea44b34b7d`.

The mandatory scan retained five exact records.  Its fifth record exposed that
the cancellation argument does not use `D`'s cyclic position.  The generalized
theorem is banked separately in
`TwoKalmansonEqualityChainUnorderedDSchemas.lean`, keeping the authenticated
parent theorem source byte-stable.  Lean generated the full 544,544-clause
swapped-`D`/`E` orbit as the ninth child shown above.  Its 291,567,840-byte
DIMACS and recursive ingress validate.  After the ingress identity was rebound
to the qualified daemon, the exact root passed PIQD custody and seeded-session
rehashing and was confirmed as immutable job
`090c5be4-e747-40a3-ad96-baba17d9aace`; it returned `SAT`, and its total model
independently replayed all 5,846,076 clauses.  The mandatory exact-record scan
found six existing source-backed consumers with no unreplayed proposal.  The
checked generic two-Kalmanson cancellation record is now banked with a
`SourceRealization` bridge and a complete four-clause Lean-generated orbit.
The 5,846,080-clause tenth root has SHA-256
`7def1009b154d3b846274821300bc68f6ddd43b651e11258506f19924773ccbc`.
After recursive ingress, custody, and seeded-session rehash checks passed, it
was confirmed as the sole immutable PIQD job
`d03a17f2-1c7c-434c-a0eb-0c1e3a2aaab6`; it returned `SAT`.  Exact replay
checked all 5,846,080 clauses, and the mandatory exact-record theorem search
found six bank hits with no unreplayed proposal.  The only new exact occurrence
is a second instance of the already-proved generic cancellation theorem.  Lean
now banks its complete four-clause orbit and `SourceRealization` bridge.  The
resulting 5,846,084-clause eleventh root has SHA-256
`6ab37b78e0db7cc98e2a1d62999d54d15a278135621aad95d520598afc7b47c2`;
its recursive export and ingress validations pass, and its first new clause
rejects the motivating tenth model.  It has not been submitted.
Maintainer build
`0cfc9577656fa3aef143a9fe7e5577d938dba9fd39f3b7118ed91735c97fc360`
is installed with a shared 402,653,184-byte prepare/blob/session-seed cap, but
the running daemon still reports the older build.  Adam must restart it, after
which the disposable canary must pass before the immutable eleventh root is
submitted.  The exact root bytes must remain unchanged.  They fit the new cap
with 111,084,956 bytes of headroom; their 308 variables are below the unchanged
`max_var = 1,000,000`.

The disposable preflight is now generated at
`piqd-large-cnf-capacity-preflight.cnf`.  It matches the ninth root exactly at
308 variables, 5,846,076 clauses, and 291,567,840 bytes, but every clause is
satisfied by `x1 = true`.  Its SHA-256 is
`b795edd93a4a222232e2b8128f6e2596eb153b9fd182788b93e0ef7a4f97e5a5`.
Generation metadata and independent validation are recorded in the adjacent
`.generation.json` and `.validation.json` files.  Local CaDiCaL parsed it and
returned `SAT` in 2.07 seconds.  This is not a proof artifact.  Live immutable
PIQD job `0e28e34e-385d-4b66-b2f9-9ae90c12b1fb` subsequently passed the full
prepare/custody/reread/session/solver path and returned `SAT` in 2.216 seconds;
the final report is valid.

Run the gate only after `piqc version` reports the new daemon hash:

```bash
uv run python scripts/run_piqd_large_cnf_capacity_preflight.py start \
  --expected-daemon-sha256 \
  0cfc9577656fa3aef143a9fe7e5577d938dba9fd39f3b7118ed91735c97fc360

# No polling loop: run this once the raw job is terminal.
uv run python scripts/run_piqd_large_cnf_capacity_preflight.py finalize \
  --expected-daemon-sha256 \
  0cfc9577656fa3aef143a9fe7e5577d938dba9fd39f3b7118ed91735c97fc360
```

`start` checks daemon and pinned-worker identities, prepares the unconfirmed
canary, rereads and rehashes PIQD custody, seeds and exports a session, solves
the export, validates receipts, closes the session, and only then confirms the
raw job.  `finalize` requires terminal `SAT`, rehashes the stored artifact, and
checks the complete 308-variable model.  Both phases record timing data.  The
final report has passed.  The runner uses PIQD profile `sat`; its receipt gate
checks the canonical headerless session journal, and its export gate checks the
original full DIMACS.  The ninth-root ingress manifest was rebound to the new
daemon identity and recursive validation passed.  The resumable production
controller `scripts/run_piqd_exact17_ninth_root.py` then reread PIQD's stored
CNF, exported and rehashed a seeded session, and confirmed only immutable job
`090c5be4-e747-40a3-ad96-baba17d9aace`; it returned `SAT`.  The finalized
receipt is `piqd-ninth-root-final.json`, the complete assignment is
`piqd-ninth-root-model.json`, and the replay-bound theorem-search artifacts are
`piqd-swapped-de-model-analysis.json` and
`piqd-swapped-de-model-theorem-bank.json`.

The capacity canary was SAT, so it did not exercise the UNSAT-only binary-DRAT
write, storage, readback, or replay path.  An `UNSAT` result for the production
job is therefore preliminary until all of those proof gates pass; no retry or
profile change is admitted without an exact-scale disposable UNSAT preflight.
