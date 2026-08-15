# Feature request: certificate-aware post-SAT realizability oracle pipeline

## Motivation

For solver-assisted mathematics, a SAT result often means only that an intentionally weakened Boolean abstraction is satisfiable. It does not imply that the model realizes the source mathematical structure. In the current P97 exact-17 CEGAR lane, each SAT assignment satisfies the current CNF but may fail Euclidean distance, cyclic-order, rank, or full-source constraints that have not yet been compiled into that child. We currently export the model, run several external theorem and geometry scans, identify a general obstruction, formalize it in Lean, and only then provision the next immutable child.

PIQD would be substantially more useful if it could orchestrate this post-SAT adjudication as a first-class, generic pipeline while preserving the distinction between raw solver status and source-level realizability.

## Proposed capability

Allow a job or campaign to declare one or more post-SAT oracle stages. After PIQD authenticates a SAT model, it invokes the configured stages on an immutable input bundle containing:

- root CNF hash and job/run identity;
- normalized complete SAT assignment and model hash;
- encoder/source-contract metadata and hashes;
- optional named-variable map and source artifacts;
- the exact oracle specification hash.

Each stage returns one of four typed outcomes:

1. `REALIZABLE`: the model has a source-level realization, with a witness artifact;
2. `REFUTED`: the model cannot realize the source contract, with a replayable certificate, exact obstruction, or minimized core artifact;
3. `UNKNOWN`: the stage completed without a certified decision;
4. `ERROR`: infrastructure or protocol failure, never conflated with `UNKNOWN`.

Raw DIMACS status must remain `SAT`. The oracle result should be stored separately, for example as `sat_adjudication.status`, so a heuristic or buggy oracle can never rewrite solver truth.

## Two explicit oracle modes

The protocol should distinguish:

- `validate_witness`: check a supplied source witness, such as exact coordinates;
- `existential_completion`: decide whether the Boolean model admits any completion satisfying a richer source contract.

These have radically different meanings and costs. A numerical coordinate candidate is not `REALIZABLE` until an exact checker accepts it. Likewise, nonlinear solver failure is `UNKNOWN`, not `REFUTED`.

## Pipeline and evidence model

A campaign should support an ordered gauntlet such as:

1. cheap exact linear, rank, and order filters;
2. exact SMT or real-algebra feasibility;
3. numerical candidate generation;
4. exact witness reconstruction and verification;
5. obstruction minimization or theorem-pattern extraction.

Every decisive result should name its evidence policy. `REALIZABLE` should require a witness blob plus a configured verifier result. `REFUTED` should require a certificate, replay log, exact infeasible core, or a project-defined checked theorem identifier. PIQD should record tool binary hash or version, command or HTTP adapter specification, input and output blob hashes, resource limits, timestamps, exit status, and verifier outcome.

The first implementation could use a simple allowlisted subprocess protocol over JSON stdin and stdout. A later HTTP worker adapter could use the same schema.

## State, caching, and API

Suggested behavior:

- the raw job reaches terminal `SAT` exactly as today;
- an independent adjudication record moves through `PENDING`, `RUNNING`, and a terminal typed outcome;
- retries create immutable attempts rather than overwriting evidence;
- cancellation and timeouts are explicit;
- results are cached and deduplicated by `(root_cnf_hash, model_hash, oracle_spec_hash)`;
- concurrent oracle attempts use the same single-writer and lock discipline as solver runs;
- `/model` remains the raw model endpoint;
- a separate endpoint exposes adjudication summary, attempts, and evidence blobs;
- campaign queries can select `SAT + REFUTED`, `SAT + UNKNOWN`, or `SAT + REALIZABLE` without collapsing those states.

## CEGAR integration

For `REFUTED`, the oracle may optionally emit a proposed refinement package:

- minimized model literals or named incidences responsible for failure;
- a stable motif identifier and canonicalized occurrence;
- an independently checkable certificate or exact arithmetic trace;
- suggested clauses, clearly marked as proposals until admitted by the project source bridge.

PIQD must not automatically mutate the parent CNF from an oracle proposal. The next child should still require an explicit, authenticated ingress step. This preserves the current Lean-owned invariant: source theorem first, immutable child export second.

## Acceptance criteria for an initial version

1. Configure one post-SAT subprocess oracle on a PIQD job.
2. Preserve and expose raw SAT independently of oracle status.
3. Authenticate the model and every oracle input and output artifact by hash.
4. Correctly distinguish `REFUTED`, `REALIZABLE`, `UNKNOWN`, and `ERROR`.
5. Cache identical model and specification invocations.
6. Support timeout, cancellation, retry, and concurrent-run exclusion.
7. Provide a machine-readable adjudication endpoint and CLI display.
8. Include tests proving that an oracle cannot alter raw solver status or silently promote uncertified numerical evidence.

## Concrete P97 payoff

After every exact-17 SAT child, PIQD could automatically run a source-realizability gauntlet. A certified refutation would yield the next theorem-mining target; an exact realization would be genuine counterexample evidence; and `UNKNOWN` would honestly preserve the present state. This would turn the current manual post-SAT loop into a reproducible service without weakening the Lean proof boundary.
