# P97 PIQD A-core source package v1

Status: finite producer/consumer boundary only. This package makes no
Euclidean, universal, theorem-bank, Lean-closure, or proof-promotion claim.

## Contract

`build_source_package()` authenticates the bounded regular source files
`encoding.py`, `run.py`, `smoke.py`, and `RESULTS.md` under
`census/frontier-packages/a_core`. It reconstructs the selected `base+P` CNF
from the authenticated `ACoreEncoder` build, then binds source hashes, CNF
hash, map hash, dimensions, case, and clause-family inventory in a canonical
producer manifest. The source contract is
`a-core-incidence/base+P-source-v2`.

The exact selected dimensions are 889 variables and 21,101 clauses. The
family inventory is:

* `base`: 21,074 clauses;
* `DEL2`: 5 clauses;
* `C10`: 1 clause;
* `DEL3`: 21 clauses.

The generated DIMACS is byte-authenticated. The encoder's actual sparse
`by_var` IDs are preserved in build order: 432 source-named atoms retain
their real IDs (for example, variable 1 is `eq(a0,f1)`). Every absent ID is
explicitly named `aux_N`, including internal base counters and the DEL3
variables 880--889. A caller cannot invent or lexicographically reorder this
map.

The two formerly unordered equality-pair traversals in `encoding.py` are
canonicalized by sorted pair key and sorted pair endpoints. A three-seed
`PYTHONHASHSEED` regression checks identical CNF and package identities.

### Authenticated retry generation

The default call remains the v1 producer contract byte for byte. An optional
`retry` object selects only the additive
`p97-piqd-a-core-source-package/v2` producer-manifest form. Its exact keys are:

* `generation`: a positive builtin integer;
* `prior_job_id`: a canonical lowercase hyphenated UUID naming the exact prior
  PIQD job;
* `daemon_build_sha256`: the exact lowercase 64-hex daemon build digest.

Builtin booleans and floats are not integers for this contract. Noncanonical
UUIDs, uppercase or non-64-hex digests, missing keys, and extra keys fail
closed. Canonical JSON sorting makes the retry manifest deterministic.

The retry object changes the producer-manifest digest and therefore the raw
PIQD identity while preserving the exact CNF bytes, CNF hash, variable map,
source bytes, source hashes, case, dimensions, and clause inventory. The
adapter passes both the CNF and producer-manifest bytes through unchanged.
This is create-once **job-generation freshness** using PIQD's existing bound
manifest identity input. It neither mutates the prior job or its result nor
adds a daemon retry policy. It is not result freshness, a new SAT/UNSAT fact,
or a theorem claim.

`daemon_build_sha256` is a caller-supplied identity component, not a daemon
attestation. PIQD does not currently bind a job to an authenticated build
identity (`PIQD-BUILDBIND-001` remains open), so the association between this
field and the live daemon's `/version` response is out-of-band evidence. The
prepare response must be archived because it is the only record of
`existing=false`; terminal status does not echo that flag, the producer
manifest, or the identity hash. Consequently neither `existing=false` nor the
retry object alone is a third-party-verifiable daemon-build freshness claim.

## PIQD seam and custody

`packet_from_source_package()` creates a strict `RunPacket` with
`requested_core_limit=1` and a positive timeout. It deliberately carries no
legacy model: PIQD's returned total SAT assignment is the first complete
model. The adapter replays every DIMACS clause and decodes every mapped atom
before reporting finite SAT evidence. UNKNOWN and transport failures remain
honest; UNSAT is discovery-only without CERT-001.

Legacy `out/manifest.json` and its partial 432-key model are diagnostic input
only. The additive source-package path does not read them. Source/artifact
capture is bounded, no-follow, canonical, and create-once where receipts are
written. This package is not a theorem or a Lean-closure certificate.
