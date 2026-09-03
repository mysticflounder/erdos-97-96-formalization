# Profile 282 named-assumption core v1

## Scope

This producer reconstructs the completed profile-282 B--O QF_NRA diagnostic,
then asks which retained assertions PIQD reports in an UNSAT assumption core.
It makes no live-source completeness, source-realization, all-order
elimination, Lean-ingress, promotion, theorem, or proof-closure claim.

The immutable parent is
`scratch/runs/exactfive-hard-source-swap-profile282-bo-source-qfnra-20260903/run-0001`.
Before preparing a child query, the producer checks the predecessor source,
run manifest, launch, terminal, every query tree, solver receipt, and SAT
semantic replay. It rebuilds each predecessor system from its authenticated
profile-282 source ledger.

## Target assumptions

Each target has 302 assumptions in semantic family order:

- one normalization group guarding both `4*r^2-3=0` and `r>0`;
- thirteen individual row equalities;
- one radius disequality;
- one source-strict inequality;
- all 286 individual strict signed-area assertions.

Zero and repeated source assertions remain present. The state-only SMT journal
contains real and Boolean declarations followed by guarded implications. It
contains no solver command. PIQD owns the one assumption solve.

`named_atoms` is sorted by identifier. The requested identifiers preserve the
family order above. Every binding contains the family and index, exact source
ledger entry and assertion body, source-system hash, full-ledger hash,
assumption term, and a self-hash used as the PIQD assumption label. An accepted
UNSAT result must return a nonempty core, `terminal_unsat=false`, and labels
that match the returned terms and binding records exactly.

## Query matrix

The run is sequential with one worker and six fresh one-solve sessions:

1. Z3 named SAT control;
2. Z3 named UNSAT control;
3. Z3 mirror-order target;
4. cvc5 named SAT control;
5. cvc5 named UNSAT control;
6. cvc5 direct-order target.

The default timeout is 60 seconds per solve. The maintained PIQD SMT adapter
is the only transport. There is no direct solver subprocess and no fallback.

## SAT and custody boundary

A target SAT response is never accepted from the guarded formula alone. The
semantic verifier reconstructs the predecessor's unguarded profile target and
calls its exact rational expansion and source replay checker. The positive
controls use the same predecessor replay path.

The run root and all query trees are create-once. Every existing ancestor from
the repository root to the run root must be a real directory, never a symlink.
Existing complete trees are verified without PIQD transport. Regular-file,
single-link, exact-byte, digest, label, and unbound-file checks reject symlink,
hardlink, mutation, and crossed custody attacks. `--init-only` creates the
governed run manifest and no launch or solver artifact. Output is silent by
default; `--verbose` prints canonical JSON, while errors always go to stderr.
