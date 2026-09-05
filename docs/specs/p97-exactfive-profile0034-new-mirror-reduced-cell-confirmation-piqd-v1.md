# P97 profile 0034 NEW-mirror reduced-cell confirmation v1

## Scope

This governed PIQD campaign independently checks the two reduced unguarded
formulas retained by the completed physical block-deletion recovery. It is a
finite-formula confirmation only. All theorem, source-realization,
source-completeness, all-profile, Lean-ingress, closure, and promotion claims
remain false.

The lane is
`exactfive-profile0034-new-mirror-reduced-cell-confirmation-piqd-20260905`;
its sole run is `run-0001`. Initialization writes only `run_manifest.json`.
The maintained PIQD SMT adapter is the only solver transport. The six cells
run sequentially (`workers = 1`), each in a fresh session with exactly one
solve and a fixed requested timeout of 60,000 ms. There are no assumptions,
Boolean guards, or resume path. Default output is silent, `--verbose` prints
JSON, and errors are printed to stderr.

## Parent custody

Before construction or launch, the producer authenticates the recovery run's
manifest, launch, terminal, execution commit, all 60 query result trees, all
round records, source/input digests, selected-result links, and false claim
boundary. The imported Z3 positive and negative controls are authenticated
from the recovery and summarized in the new terminal record; they are not
rerun. Fresh cvc5 positive and negative controls validate this transport.

The recovered GT cell retains edge groups 00, 01, 03, 04 and source-row
equalities 00, 01, 03, 05. The canonical retained-group-list SHA-256 is
`b87f28e24a17ce52e7f9b45b761730befa82807937b49152b04247f0306130e9`.
Its journal has 48 assertions, 69 commands, 5,365 bytes, and SHA-256
`b890625b9b39c1452de181d776e89addd76deb9b26321b93cb344713e35ba611`.

The recovered LT cell retains edge groups 00, 01, 03, 04, 06 and source-row
equalities 01, 02, 03, 05. The canonical retained-group-list SHA-256 is
`c38f1b732a8fc0b8043ca1b4181af97e828c273600273ba98e5b0282aef0a92c`.
Its journal has 59 assertions, 80 commands, 6,340 bytes, and SHA-256
`4eed0894343ae34a60d1b8b5c3328c4a584cdb7e344dad3dddcb3136e441be22`.

## Six fresh cells

Both reduced journals are sent once to Z3 and once to cvc5. Fresh cvc5
positive and negative controls complete the matrix. Raw UNSAT is retained as
discovery-only finite-formula evidence. SAT is accepted only when total exact
rational readback satisfies every retained physical assertion. Unsupported
algebraic values, rejected replay, semantic-verifier failure, UNKNOWN,
transport loss, or cross-engine disagreement remain inconclusive.

Every artifact is create-once and content-bound. Reads use nonblocking,
no-follow descriptor access followed by regular-file and single-link checks;
symlinks, FIFOs, hard links, replacement races, unbound files, incomplete
trees, session reuse, and source drift fail closed. Offline verification makes
no transport call. A partial launch cannot resume; it requires a new governed
run identifier.
