# RVOL Wave 2b PiQD canary — run 0002 audit

**Lane:** `rvol-wave2b-piqd-canary-20260901`  
**Run:** `run-0002`  
**Status:** exact finite abstract CNF UNSAT, independently DRAT-verified; not a Lean or source theorem

## Contract and scope

Run 0002 is the immutable budget-only successor to run 0001. Contract v2
preserves the exact `Fin 9` cell, its 72 semantic row-membership variables, and
its 4,551 root clauses; it raises only `max_iterations`, from 64 to 1,024. The
root CNF SHA-256 remains
`778d14255f26fac6176f721cf4b1bd2f14d90fdea4bbb10c3f9e2edd316a5d1f`.

This is a discovery-only abstract cell. The source-to-cell bridge is unproved.
No result below establishes a source, `Card18`, cap, MEC,
arbitrary-cardinality, or existing project theorem.

## Incremental PiQD result

The live run pinned both the reviewed contract self-hash
`257b2a16eff24167afb1163d881c1ac3d989944a01e9eff25b6b12555fb6a59a`
and the reviewed root hash. PiQD session
`2723e886-62e5-41b3-beec-5d49a96da5b8` produced 97 SAT models. Every model
was independently replayed and rejected by an exact semantic Kalmanson cut.
The 98th solve returned UNSAT. The final formula has 4,648 clauses and SHA-256
`9a92c62725da78b6d65985ee9f80df20b7e8e0b3213a26b13b10c41ee9e8d825`.

The independent verifier reports `VERIFIED` with scope
`AUTHENTICATED_FINITE_ABSTRACT_CELL_ONLY` and live PiQD required. It checks all
97 model/certificate/cut/record/CNF transitions, all 98 receipts, the empty
assumption core on receipt 98, and the byte-identical PiQD session export. The
receipt statuses are 97 SAT followed by one UNSAT; all use conflict limit
1,000,000. Receipt `result_sha256` values bind PiQD's canonical verdict fields,
not raw solver stdout or retained SAT model artifacts.

## Proof-producing handoff

The closed session was handed through PiQD to the from-scratch CaDiCaL
`unsat` profile as job `7c320e9c-5b9a-49e4-9b92-bc9bd1c22171`. The handoff
CNF is byte-identical to the independently reconstructed final CNF. CaDiCaL
returned UNSAT in 5.848 seconds using one attested solver process, and PiQD
retained a 23,050,791-byte compacted LRAT proof with SHA-256
`5c4cd100af20448845792497ba660ad3175492ea843cdb304fea83b11f18e9db`.

For an independent semantic check, the LRAT stream was converted mechanically
to an addition-only DRAT stream: all 139,555 additions were preserved in order
with their exact clauses, LRAT IDs and hints were erased, and 66,885 deletion
actions were omitted. Deletions are optional and omitting them does not add a
proof step. `drat-trim` checked that stream against the exact stored CNF and
reported `s VERIFIED` in 9.157 seconds. The backward core contains 1,739 input
clauses and 125,442 of 139,556 lemmas, including 354 RAT lemmas and 2,618,371
resolution steps.

This establishes independently checked computational UNSAT for the exact finite
abstract CNF. It is stronger than the incremental discovery receipt alone.

## Lean-kernel status

Kernel promotion failed and is not claimed. The compacted LRAT introduces proof
literal 73 although the input DIMACS header declares 72 variables. The local
`piqd-lrat` verifier rejects that format at action 4,649 as
`ActionLiteralOutOfRange`. PiQD's generated Lean 4.27 stub then panics in the
LRAT deletion handler with an index-out-of-bounds error. A deletion-free LRAT
stub avoids that panic but `native_decide` evaluates `verifyCert = true` as
false. Neither generated stub is a theorem and neither is promoted into
`lean/`.

The trust boundary is therefore:

- exact finite abstract CNF UNSAT: independently DRAT-verified;
- Lean-kernel finite theorem: not established;
- source-to-cell mathematical bridge: not established.

## Mandatory post-wave mine

All 97 recorded models carry one `ZERO_VECTOR` certificate; there are no
`OPPOSITE_PAIR` certificates. K1 occurs 76 times and K2 21 times. The 97 cuts
are unique. Clause-length counts are `6:13`, `7:14`, `8:8`, `9:21`, `10:2`,
`11:14`, `12:10`, `13:9`, `14:1`, `15:4`, and `16:1`. All 72 membership
literals occur in the antecedent union.

Every decoded model has nine rows of size four and support indegree exactly four
at every vertex. Eighty-one models have pair-codegree profile `18×1 + 18×2`;
sixteen have `2×0 + 14×1 + 20×2`. These are sample regularities, not separate
universal theorems.

The finite-cell theorem candidate is now computationally closed: every row
system satisfying this exact conjunction of source cover, intersection and
pair-codegree bounds, strong connectivity, and shared-pair alternation has an
exact K1/K2 zero-vector obstruction. A bounded Lean-corpus reuse search at
source revision `91b89c34a` found `pairCodegree_le_two` and several local
Kalmanson contradiction schemas, but no existing theorem matching the complete
Fin-9 cell closure. The source-to-cell bridge remains the higher-leverage
formalization target; further enumeration of this same cell is unnecessary.

## Next work

The computation lane should stop here. Subsequent Lean work proved the generic
whole-carrier root surface: row size, center exclusion, source cover, both
codegree bounds, support connectivity, and shared-pair alternation all follow
from the faithful carrier, critical shell, minimality, and a compatible
boundary indexing.

However, the exact `Fin 9` transport is not a missing positive source lemma. A
nonempty support-closed subsystem of a minimal faithful carrier is the entire
carrier, while `FiniteN9Closure` excludes a nine-point `CounterexampleData`.
The Lean theorem `no_fin9_supportClosed_subsystem_of_minimal` records this
incompatibility. Thus this run remains a closed abstract canary, not an induced
cell of the live minimal source; source-facing finite work must use a sound
larger-cardinality reduction rather than force this exact cell onto it.

Separately, the PiQD/Lean certificate owner should receive the
extension-variable/deletion-stream failure as a tooling issue if kernel replay
of this finite certificate is desired.
