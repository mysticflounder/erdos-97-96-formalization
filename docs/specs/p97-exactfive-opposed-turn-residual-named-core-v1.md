# Exact-five opposed-turn residual named-core lane

This formula-local PIQD experiment consumes the fully authenticated completed
run-0005 of the opposed-turn residual QF_NRA lane.  It reconstructs all eight
parent result trees, both controls, the launch, and the terminal before any new
query can be prepared.

The six targets reduce to two exact unguarded polynomial-assertion families.
Profiles 360 and 467 have the same assertion set and multiset despite distinct
source-role maps.  Profiles 363, 376, 470, and 483 likewise share a second set
and multiset despite four distinct source-role maps.  The exact family record
contains each profile hash, role-map digest, assertion occurrence count, unique
count, set digest, and multiset digest.  It is reconstructed before
initialization, and every query retains it in its authenticated source payload;
terminal custody binds its self-hash.  The schema-exact run manifest uses its
standard `input_digests` to pin the parent manifest, launch, terminal, and all
eight parent result records.  Those result records in turn authenticate their
complete adapter trees.  Profile 360 represents the 12-class family; profile
363 represents the 13-class family.  Any future failure of exact family
equality blocks initialization rather than silently skipping a profile.

Each representative is submitted separately to Z3 and cvc5.  Each fresh PIQD
session contains one named normalization group, 13 individually named row
equalities, one named radius disequality, one named source-strict inequality,
and every individually named strict signed-area assertion.  This yields 236
assumptions for profile 360 and 302 for profile 363.  Every label is self-hashed
over its exact source entry, command expansion, body, family, index, source
system digest, and source-ledger digest.  The guarded ledger expands exactly to
the original unguarded assertion multiset.

Each engine also gets its own named positive SAT control and named negative
UNSAT control.  SAT is accepted only after exact rational replay by the frozen
parent verifier.  UNSAT is retained only when PIQD returns a nonempty,
nonterminal assumption core whose terms, source atom IDs, ordered labels, and
core labels reconstruct from the bound ledger.  UNKNOWN and unreconciled
transport loss remain inconclusive.  All sessions use the maintained PIQD HTTP
SMT adapter; no solver executable is launched directly.

Immutable result replay rechecks exact descriptor, original and normalized SMT,
source payloads, complete named request/frontier/session/receipt/close/lifecycle
custody, solver signatures, PIQD result digests, status semantics, and a flat
file inventory.  Runtime initialized, launched, failure, and terminal phases
have exact inventories.  Failure records bind the exact retained bytes and
cannot coexist with a terminal.  Completed terminal replay constructs no
transport.

The default CLI is silent on success, errors go to stderr, and `--verbose`
prints compact JSON.  `--init-only` authenticates all inputs, proves the family
reduction, and creates only the pristine run manifest.  It does not contact
PIQD.  This lane makes no claim of Euclidean source realizability, Lean
reachability, theorem closure, promotion, or execution of nonrepresentative
profiles.
