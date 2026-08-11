# ATAIL PIQD cvc5 geometry protocol v1

Status: additive diagnostic onboarding specification. This route is not a proof producer.

## Scope and trust boundary

`census/atail_force/piqd_cvc5_adapter.py` submits one named ATAIL polynomial system to one fresh PIQD SMT session and performs exactly one cvc5 solve. It delegates session authentication to the maintained public
`validate_authenticated_single_solver_query` and
`run_authenticated_single_solver_query` APIs in
`census/p97_search/phase3_piqd_smt_source_adapter.py`. It does not change PIQD, reuse a P97-specific producer adapter, contact a second solver, retry a solve, or invoke a live daemon during tests.

The adapter owns the ATAIL semantic boundary. The authenticated PIQD response and receipt show what the daemon ran; they do not establish that the polynomial encoding means the intended Euclidean theorem. That meaning is retained only as source-bound diagnostic evidence.

## Immutable custody packet

Before transport, the adapter captures the exact bytes of these maintained producer sources:

- `census/atail_force/producer_bank.py`
- `census/atail_force/producer_geometry.py`
- `census/atail_force/producer_mus.py`
- `census/atail_force/producer_probe.py`
- `census/atail_force/producer_surface.py`

The source root is opened from `/` one component at a time, and every relative
parent component is opened from its held parent directory descriptor. Every
component open uses `O_DIRECTORY|O_NOFOLLOW`. Each leaf uses `O_NOFOLLOW`, must
be a regular file with exactly one link, and must stay within the byte cap. The
adapter binds its device, inode, size, nanosecond mtime, and nanosecond ctime
before and after the bounded read and again through a no-follow pathname stat.
It also rebinds every held ancestor entry before accepting the snapshot. An
`OSError`, symlink, hard link, nonregular leaf, oversize leaf, short/long read,
leaf mutation, or ancestor replacement is normalized to an ATAIL custody error.

The canonical JSON descriptor binds the ordered source paths, byte counts, and SHA-256 digests. It also binds the exact original SMT bytes, normalized state journal, solver profile, producer/verifier identities, canonical blueprint, complete ordered system ledger, enabled atom order, complete variable readback order, and hashes of the semantic payload.

Execution accepts only exact `bytes` payloads and writes each custody artifact
through an already-held output-directory descriptor. Creation is
descriptor-relative `O_EXCL|O_NOFOLLOW`; the created descriptor must denote a
single-link regular file with the exact size and stable device/inode identity.
The adapter fsyncs the file, recaptures its exact bytes through that descriptor,
reopens and recaptures it through its no-follow pathname, rebinds the pathname
again, and fsyncs the held output directory. A link, replacement, symlink,
content, identity, or fsync race fails closed. The adapter never removes a
pre-existing or hostile replacement target while handling such a failure.

The adapter independently reconstructs the journal from the immutable semantic input immediately before transport. A byte, ordering, schema, hash, identity, source, atom, variable, or journal mismatch fails closed.

## Geometry-system acceptance

The v1 packet accepts only a `GeometrySystem` with:

- a nonempty, unique tuple of rational-polynomial SymPy variables whose names are simple SMT symbols;
- a nonempty ordered `NamedPolynomialAtom` ledger with unique canonical names, no `_safe` normalization collisions, and no SMT-symbol collision with the variable ledger;
- exactly one polynomial for `eq`, `ge`, `gt`, and `ne`, or exactly two for `or_ne`;
- nonempty family and Lean-source provenance strings for every atom;
- the repository's exact `OMITTED_LEDGER`;
- every declared variable used by the atom ledger, so the serialized variable order is complete; and
- a strong canonical `GeometryBlueprint`, including unique carrier/cyclic orders, three distinct cap apices, nontrivial caps, both opposite-apex exact classes, and both pinned K4 rows.

The serialized blueprint is reconstructed and revalidated at the execution boundary. A weak blueprint, noncanonical order, unknown member, missing class/row, unsafe identifier, duplicate identifier, or `_safe` alias collision is rejected even if an attacker consistently recomputes the surrounding JSON hashes.

Each polynomial is serialized as a canonical ordered sparse ledger over `QQ`: every term records an exact numerator, positive denominator, and a power vector in the complete variable order. This ledger, rather than reparsing solver assertions, is the immutable SAT replay input.

## State-only cvc5 journal

The only solver profile is cvc5. The deterministic journal contains:

1. `(set-option :nl-cov true)`;
2. `(set-logic QF_NRA)`;
3. every real declaration in complete variable order; and
4. each enabled relation as an SMT named assertion in canonical atom order.

The journal contains no `produce-unsat-cores`, `check-sat`, or `get-unsat-core`. PIQD owns the single solve command. The solve request has empty assumptions, requests a model, and requests exact readback for every declared variable. Named assertions are a diagnostic ledger only; because there are no solve assumptions, there is no core entitlement.

## Exact SAT replay

A SAT response is accepted only if both the cvc5 model and the PIQD `get_values` readback contain every declared variable exactly once, contain no extra binding, and parse entirely as exact rationals. Supported numeric forms are integers, terminating decimals, unary negation, and rational division of exact rational terms with a nonzero denominator. Floating approximations, algebraic-root syntax, missing values, duplicate values, extra values, and malformed terms fail closed. The parser's token budget counts every token, including each opening and closing parenthesis, before parsing begins.

When both model and readback are supplied by the maintained PIQD API, their exact rational maps must agree. The adapter then evaluates every enabled polynomial with Python `Fraction` arithmetic and enforces:

| relation | retained condition |
| --- | --- |
| `eq` | polynomial equals zero |
| `ge` | polynomial is at least zero |
| `gt` | polynomial is greater than zero |
| `ne` | polynomial is nonzero |
| `or_ne` | at least one of its two polynomials is nonzero |

Only a complete successful replay is classified `SAT_EXACT_RATIONAL_REPLAY`; the maintained engine status remains `SAT_SEMANTICALLY_REPLAYED`. A false relation is an explicit replay rejection. A parsing or custody failure is inconclusive/fail-closed, never SAT evidence.

## Standalone run-directory validation

Before any result is used, a caller opens the completed output directory
without following links, retains that directory descriptor, and calls
`validate_run_directory(output_fd)`. The API deliberately accepts no
caller-supplied `GeometrySystem`: the persisted canonical semantic input is the
only semantic authority. No CLI is added because a pathname-only wrapper would
weaken the held-descriptor contract.

The validator accepts an exact builtin nonnegative `int` descriptor. It lists
and reads the flat directory componentwise through that descriptor. Every leaf
must have a safe direct name, be a regular single-link file, fit the per-file
and aggregate caps, and retain its device, inode, mode, link count, size,
nanosecond mtime, and nanosecond ctime across a bounded descriptor read and a
no-follow pathname rebind. The directory identity and exact inventory must
also remain stable. After schema and semantic validation, the validator repeats
the complete capture and requires the same directory identity, file set, and
bytes.

The only accepted inventories are complete terminal SAT or diagnostic-UNSAT
runs. Both contain:

- `descriptor.json`, `original.smt2`, `journal.smt2`, and
  `source-00.py` through `source-04.py`;
- `cvc5.session.json`, `cvc5.smt2`, `cvc5.receipts-before.json`,
  `cvc5.receipts.json`, and `cvc5.closed-session.json`; and
- `atail-result.json`.

A normal run additionally contains exactly `cvc5.solve.json`. A reconciled
committed-response-loss run contains exactly `cvc5.reconciled-solve.json` and
`cvc5.reconciliation-session.json` instead. SAT additionally contains exactly
`cvc5.semantic.json`; UNSAT contains no semantic artifact. Partial,
`UNKNOWN`, unreconciled transport-loss, extra-file, and missing-file directories
are rejected.

Every JSON artifact must be strict canonical UTF-8 JSON followed by exactly one
line feed. Duplicate keys, floats, non-JSON constants, non-builtin values,
unexpected fields, excessive depth, and excessive node counts fail closed. The
validator reconstructs the source snapshots from the five positional source
files, reconstructs the state journal from `original.smt2`, requires both
persisted journals and the PIQD export to agree byte-for-byte, and invokes the
maintained public in-memory query validator.

Artifact ledgers bind every byte count and SHA-256. The locally checked PIQD
schema binds the cvc5 solver identity, canonical session UUID and paths, fresh
create state, exact single-solve lifecycle, before/after receipt counts,
empty-assumption request, complete readback request, journal byte/hash/count,
timeout and effective deadline, result digest, reconciliation state, close
state, and all cross-artifact identities. This persisted validator uses only
the maintained public generic journal normalizer, query validator, effective
deadline helper, and result-digest helper; it does not couple ATAIL to private
P97 validation functions.

For SAT, the validator reruns exact rational replay from the persisted canonical
semantic input and persisted model/readback, then requires the semantic artifact
and top-level result to equal the reconstruction. For UNSAT it reconstructs
only `UNSAT_DISCOVERY_ONLY`, empty assumptions, no named-core support, and false
theorem/global/Lean/core claims. Re-signing altered JSON or updating superficial
artifact hashes cannot promote either classification.

## UNSAT and claim discipline

UNSAT is classified exactly `UNSAT_DISCOVERY_ONLY`. An empty-assumption UNSAT receipt has an empty assumption/core ledger and `named_core_support = false`. It is not a named core, unsat-core proof, theorem, global result, universal result, Lean proof, proof artifact, source entitlement, or proof of the Euclidean Problem 97 claim. All corresponding adapter claim flags are false.

The canonical proof-blueprint reference is session `019fdf9c`, anchored at
`Problem97.ATailFrontierLiveClosure.false_of_criticalPairFrontier`. This onboarding leaves it unchanged: `OPEN` and `OFF_SPINE`. PIQD routing and exact SAT replay do not close or promote that proof obligation.

## Test contract

`scripts/test-p97-piqd-atail-geometry.sh` runs one pytest process against fake transport only and Ruff checks over the two owned Python files. It caps common native thread pools at one and fixes Python hash seeding. The fixtures cover deterministic SAT replay for all five relations; a contradictory UNSAT query; exact source/query custody; intermediate and leaf symlinks; hard-linked, nonregular, and oversize sources; same-size source mutation with restored mtime; ancestor replacement; immutable-output hardlink, replacement, symlink, and directory-fsync races; descriptor/schema and blueprint attacks; intra-ledger `_safe` and cross-ledger SMT-symbol collisions; structural-token budget enforcement; complete readback; rational-only values; model/readback disagreement; relation rejection; committed-response reconciliation; export tampering; the prohibition on a second solve; standalone normal and reconciled run validation; file, inventory, symlink, hardlink, swapped-source, crossed-lifecycle, crossed-result, re-signed schema, semantic, claim-escalation, and final-recapture attacks.

The current integration required no PIQD daemon change. A defect in this ATAIL adapter or the pre-existing P97 adapter is not, by itself, a PIQD bug; only a defect in PIQD's maintained API/receipt behavior should be reported as such.
