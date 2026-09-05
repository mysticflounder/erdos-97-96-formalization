# CardGeThirteen exact-13 global-K4 prefix CEGAR audit

Date: 2026-09-04

## Scope

This lane tests whether the retained direct-profile exact-13 Kalmanson
abstraction remains satisfiable as the source-necessary global `D.K4`
existentials are added one carrier center at a time.  It replaces the earlier
single monolithic all-center query, which returned `UNKNOWN` in both engines,
with warm incremental PIQD sessions.

The root abstraction is the source-labelled tight-cover journal plus the
retained exact first-apex row.  Each prefix adds only an existential
four-support equal-distance row at a named raw center.  A live
`CounterexampleData` exact-13 branch must satisfy every full prefix because
`D.K4` applies at every carrier point.

Run `run-0001` used thirteen fresh rows, one at every raw center.  Run
`run-0002` uses the logically smaller source-necessary encoding:

- the retained `K` or `L` row witnesses global K4 at raw center `0`;
- the retained `T` row witnesses global K4 at raw center `1`;
- `C0` witnesses global K4 at the raw center selected by `b0`;
- `C1` witnesses global K4 at the raw center selected by `b1`; and
- a fresh row at any other raw center is activated under
  `¬ is_b0_center ∧ ¬ is_b1_center`.

Thus the guarded run introduces eleven possible rows rather than thirteen,
and either nine or ten of those rows are active according to whether one
blocker is raw center `1`.  The full-row mode remains available for exact replay of the first
experiment.

## Claim boundary

- A replayed `SAT` result is an abstract survivor, not a geometric model.
- `UNKNOWN` is inconclusive.
- `UNSAT` is formula-scoped until the source-to-formula bridge, PIQD custody,
  checked proof, and Lean-ingress publication gates are all discharged.
- No prefix result constructs the missing positional `FixedFiveRows` packet.

## Current result

### Run `run-0001`: redundant all-center prefix

The Z3 PIQD session used a 30-second timeout per prefix.  Prefixes through raw
centers `{0,1,8}` were replayed `SAT`; the four-center prefix ending at `9`
timed out; and the five-center prefix ending at `10` was again replayed `SAT`.
Every later prefix timed out.  In particular, the five-center survivor proves
that the retained abstraction plus K4 rows at raw centers `0,1,8,9,10` is not
itself contradictory.

The replayed five-center model is still an encoding model.  It supplies no
source realization and cannot discharge the exact-card-13 Lean branch.

### Run `run-0002`: guarded nonredundant prefix

The guarded encoding has ten focused unit tests.  They check the retained-row
coverage above, the exact guard on every new row obligation, monotone prefix
construction, preservation of the original full-row encoding, and journal
custody.  Pytest and Ruff both pass.

The complete Z3 PIQD session again used a 30-second timeout per prefix.  The
prefix adding raw center `8` was replayed `SAT` in 2699 ms, and the prefix
adding raw center `9` was replayed `SAT` in 8920 ms.  Every prefix from adding
raw center `10` through the final raw center `7` returned `UNKNOWN` at the
per-query timeout.  The event digest is
`6d20d59ab36a6f34350d0486d797e88a0a4e47091604ffe0b8326ab9098ef342`.

In the two-prefix SAT assignment, `b0 = 9` and `b1 = 1`.  Consequently the
guarded row at center `9` is inactive: `C0` witnesses K4 there, while the
retained `T` and `C1` rows both witness K4 at center `1`.  The active new row
at center `8` has support `{0,2,9,10}`.  This is a replayed abstract survivor,
not a source realization.

The disjunctive blocker guards remain a solver bottleneck.  The next bounded
experiment should pin `(b0,b1)` to a concrete ordered pair and solve the full
set of rows at every other center.  Starting with `(9,1)` tests whether the
replayed two-prefix survivor extends to full global K4 without asking the
solver to choose blocker roles simultaneously.

### Run `run-0003`: pinned blocker pair `(9,1)`

The pinned base asserts `b0 = 9` and `b1 = 1`.  The retained rows cover raw
centers `0`, `1`, and `9`; unguarded fresh rows are therefore added in the
order `8,10,11,12,2,3,4,5,6,7`.

Z3 replayed `SAT` after adding rows at `8`, `10`, and `11`, in 8475 ms,
2002 ms, and 16805 ms respectively.  Adding raw center `12` and every later
prefix returned `UNKNOWN` at 30 seconds.  The final replayed survivor has

```text
C0 = {0,2,3,11}       C1 = {4,6,7,12}
K  = {1,5,8,10}       L  = {4,9,11,12}
T  = {4,6,7,12}
G8 = {1,2,7,9}        G10 = {5,6,9,11}
G11 = {3,5,8,12}
```

Thus this abstraction has explicit K4 witnesses at six raw centers
`{0,1,8,9,10,11}`.  Its event digest is
`a91b845e0dbf29f32e1bb69b9901d9c85308e15642ee11f9d84e8ed189675cec`.

The independent cvc5 session returned `UNKNOWN` for all ten prefixes at the
same timeout.  Its event digest is
`535970275940fd8c4a61d39d6dff45634a08a01fbdf91f7cd10a2c507a4ae87f`.

The survivor still omits source-witness data exported by the raw ingress:
the two source labels and their row memberships, their exclusion from the
first-apex row, and the common deletion label with its row omissions and
tight-cover placement.  Those source-necessary constraints form the next
CEGAR wave; they are not semantic refinements until their Lean producer and
source-to-formula bridge are checked.

### Runs `run-0004` and `run-0005`: superseded abstract fixed cell

The later source audit invalidated this cell as a source realization.  Raw
label `1` is the first apex, while each blocker is the center of a good source
outside the first-apex fiber and therefore cannot equal the first apex.  The
pin `b1 = 1` violates that source consequence.  The computations below remain
valid at their stated abstract-formula scope, but they do not describe a live
exact-thirteen source packet.

Run `run-0004` retained the replayed Z3 step-4 direct-orientation cell with
`b0 = 9`, `b1 = 1`, and challenge rows at raw centers `8,10,11,12`.  The
run-0005 consumer now authenticates the source-event schema, blocker pins,
exact step-4 center sequence, replay outcome, source roles, and every
four-support challenge row before using that cell.  Tampering with the schema,
pins, centers, or replay disposition is rejected by the focused tests.

The equality/Kalmanson scan found no length-at-most-three pure cancellation
cover for all 495 supports at any of the ten centers not already represented
by the five fixed rows.  The corrected exact-class LRA formula, which uses
off-support disequalities only for the full `K`, `L`, and `T` radius classes,
was replayed `SAT` by both Z3 and cvc5.  Thus the source-entitled exactness is
not itself a contradiction in this fixed abstract cell.

The full nine-row planar QF_NRA query returned `UNKNOWN` from both backends at
300 seconds.  Prefix staging then removed every challenge row.  The remaining
five-source-row formula again returned `UNKNOWN/UNKNOWN` at 120 seconds; its
event digest is
`688f8f3562274f2093da585ecb8adb0470ef78ae0dc9bcf09d2bf81a630688e7`.

One further control split localized the solver behavior:

- with no incidence rows, Z3 returned replayed `SAT` while cvc5 returned
  `UNKNOWN`; event digest
  `a515c3051236e9e63e6144a96005679e4d2e9601c3fd18b187414defec10a9bb`;
- adding only the equality-only `C0` source row made Z3 return `UNKNOWN` at
  60 seconds; event digest
  `648105ff7c36aaf88118c99ea75cb7afa7932d217a9325664bf2f05acaff0487`.

The nonlinear stall therefore begins with the first circle-incidence row,
before any global-K4 challenge row.  These are `UNKNOWN` diagnostics, not
spuriousness proofs or semantic refinements.  The next proof-facing route is
the finite order/incidence classifier over the variable source rows; merely
raising the full planar timeout has no evidentiary basis.

### Arbitrary-length pure Kalmanson cone audit

The earlier support scan bounded certificates at three Kalmanson forms.  A
separate QF_LRA producer now asks the stronger finite-dimensional question:
after quotienting distance edges by the five fixed row equalities and one
challenge-row equality, does any nonzero nonnegative combination of all 1430
strict Kalmanson form vectors vanish?  Duplicate projected generators are
merged, zero projections are retained, and `sum(weights) = 1` normalizes every
nonzero finite cone combination.

For the first uncovered center-8 support `{0,1,9,11}`, 1430 raw forms reduce
to 1420 unique nonzero projected vectors over 60 edge coordinates.  The exact
2902-command journal has SHA-256
`8c18acd28eddb55ab511795098df7a3a80a9b4cca87d2eb812360afed8eec900`;
both Z3 and cvc5 returned `UNSAT`.  The event digest is
`63dba1d5c747fd7012ccf1715b418ad419b6b6a5844475add95a8d6e550f95cc`.

The source event's actual center-8 challenge support `{0,2,7,9}` was checked
separately.  Its journal has SHA-256
`9dccba0b63327b3d427b073adcabcaed36cd4dbffee6b7c78fd1bf42016c1620`,
and both backends again returned `UNSAT`; event digest
`f28d50f13abdbfedec8d01f4282d3b2130189686aac2630081e41dedb11097f3`.

An independent code/formula audit found the quotient direction, duplicate
reduction, normalization, and zero handling sound.  The result is a no-go for
arbitrary finite nonnegative combinations of the direct-order Kalmanson forms
using only these row equalities.  It is discovery evidence, not a checked
UNSAT proof or Lean theorem, and it does not cover a different cyclic order or
additional source/metric consequences.  In particular, extending the existing
one-to-three-form terminal cannot close this fixed source survivor; a successful
terminal must use stronger source incidence, metric/MEC information, or a
different branch reduction.

### Run `run-0006`: source-valid replacement cell

The pinned-source search was rerun with both blocker labels excluded from the
first apex.  Z3 replayed a source-constrained cell with `b0 = 9`, `b1 = 2`,
source roles `(s0,s1,d,z) = (4,3,7,9)`, and the five retained rows

```text
C0 = {2,4,6,11}       C1 = {0,1,3,10}
K  = {5,7,8,12}       L  = {2,9,10,11}
T  = {0,6,7,10}.
```

Challenge rows at centers `8`, `10`, and `11` replayed `SAT`; adding center
`12` returned `UNKNOWN` at 30 seconds.  The run-0006 consumer binds the
step-3 cell, including its blocker pins, source roles, rows, challenge centers,
and source-event SHA-256
`51f2448127176d0f02fc2fcb091eb3f32624579dcba8165363225d378e1976de`.

An all-center length-at-most-three cancellation scan stopped at the first
uncovered support at each of the nine centers not represented by the retained
rows:

```text
8:{1,2,5,7}   10:{1,4,5,9}  11:{1,4,5,8}
12:{1,4,5,8}  3:{0,1,5,8}   4:{0,1,5,8}
5:{0,1,4,8}   6:{0,2,4,8}   7:{1,2,4,5}.
```

The scan event has SHA-256
`16d8caa7f24e24b817f671cd6806745d97a15922536dda48d361ed0fb9554fab`.
It is exhaustive only up to the first uncovered support at each center; it
does not claim a count of all uncovered supports.

The arbitrary-length cone check was then applied to the first center-8
residual `{1,2,5,7}` and, independently, to the source event's center-8 row
`{2,7,9,12}`.  Their journals have SHA-256 values
`4c379a16cd7e9632f2cababd6f08765ef72f9959a270de59da1f10c19d3d0949`
and
`6ec0b622215ad1b300b1bd02ccc5a3615cf7c65f63804e699f041950dccff7b6`.
Z3 and cvc5 both returned `UNSAT` on both QF_LRA formulas; the event SHA-256
values are
`c900182be68301437bc8623ea7b9f8b9b6719304c9e8432e1c32207201851ac1`
and
`4f8291ed2d6b3607455401588c9fa50e0b6098f6df8a993d2f210b14901b064b`.

Here `UNSAT` is a no-go result: in this source-valid fixed cell, neither
selected challenge equality yields a nonzero nonnegative cancellation of the
direct-order strict Kalmanson forms after quotienting by the five retained-row
equalities.  It is not a contradiction certificate for the source packet.
At that checkpoint the result was formula-scoped PIQD evidence and the
replacement raw ingress had not yet been freshly built or imported into the
final consumer.  The next subsection records the superseding exhaustive scan
and build status.

### Run `run-0006`: exhaustive residual-domain CSP

The corrected source-valid direct-orientation cell was then scanned through
all 495 four-subsets at every center not represented by its five retained
rows.  The final exhaustive scan event has SHA-256
`dd7d2bc67d8435e679a78975f0993d3e7b4527ec5033a330d4bdd33810ca7b39`.
After retaining the replayed source-prefix rows at centers `8`, `10`, and
`11`, the remaining residual domains are:

```text
center 12: 21   center 3: 9   center 4: 10
center  5:  8   center 6: 6   center 7:  4
```

Every support outside those domains has a checked cancellation certificate of
length at most three.  For the `21 * 9 * 10 * 8 * 6 * 4 = 362880` residual
assignments, the Boolean conflict bank contains 17 unary exclusions and 337
binary exclusions, each carrying a single strict Kalmanson form whose
projection is zero under the selected row equalities.  An independent direct
enumerator checked all 362880 assignments and found no survivor.  PIQD Z3 and
cvc5 independently returned `UNSAT` on the 759-command QF_UF journal.

The journal has SHA-256
`a79932e22d68e22a7442406f87c7ea38530bef1c159bb4d53472a5699b43d25d`;
the event has SHA-256
`60d206a16d4b7e7021c0aa56fc95f8922d25c2b6d178eb4b4b98482f593f7110`.
The producer has SHA-256
`d0bb2949ea3ff145795ecfd7a5186253a63f3c29dacc92e03daefcafd773b4ab`.

This closes the finite global-`K4` extension problem for this one authenticated
fixed direct-orientation base cell.  It does not show that every source packet
has those blocker labels, source roles, or five retained supports, and it does
not cover the mirror orientation or other cyclic occurrences.  The remaining
mathematical bridge is therefore a source-faithful occurrence classifier over
the variable `ExactThirteenFivePositionalRows`, or a justified normalization
that maps every source packet into a finite family containing this cell.

The replacement raw ingress now elaborates and its refreshed `.olean` contains
`nonempty_exactThirteenFivePositionalRows`.  The focused governed build
completed all 11975 module jobs; its post-build proof-blueprint resynchronizer
failed separately on the stale private declaration
`B1ApexUBlockerRationalTest.chordFunctional_linear` in another active lane.

### Runs `run-0011`–`run-0017`: variable-row incidence CEGAR

The next wave stopped fixing the remaining four retained supports and every
global `K4` challenge row.  Pure Boolean source and incidence constraints still
had models, so the CEGAR learner extracted shortest row-equality paths witnessing
one-form or two-form strict Kalmanson contradictions and excluded only the
membership atoms used by those paths.  Runs `run-0015` and `run-0016` accumulated
1500 distinct cuts without reaching a terminal result.

Run `run-0017` resumed from those 1500 cuts under the direct-order pins

```text
b0=9, b1=2, s0=4, s1=3, d=7, z=9, C0={2,4,6,11}.
```

It learned 1412 additional cuts and reached `UNSAT` on solve 1413.  The 1412
new conflicts comprise 807 transitive-incidence paths and 605 two-form
incidence paths.  None repeats a seeded cut or atom set.  The PIQD journal has
SHA-256
`398a05df7723643ab7ec24127b7a9dafdfd1fd452b0c3c57f0d936098c868de5`;
the event has SHA-256
`2465ac110ef1371de34e4903ede572d75aa2ca02e29e7d8aba0aaf595956bf30`.

This result is exhaustive for the pinned direct Boolean abstraction.  It is not
an all-source exact-13 result: the raw ingress fixes none of the six role labels
or the displayed `C0` support, and there is no mirror or dihedral transport for
the certificate family.

### Run `run-0018`: clause custody and pure-RUP replay package

The saved run-0017 SMT journal contains the base formula and 1500 seeded cuts;
its 1412 dynamically asserted cuts live in the event.  Converting the journal
alone produced a 50168-clause formula that CaDiCaL found `SAT`, providing a
negative control for event custody.  The fail-closed converter now verifies the
event schema, journal digest, dense refinement indices, 1412 distinct learned
cuts, and final cut-free `UNSAT` solve before appending those cuts.

The resulting clause-preserving DIMACS has 286 variables and 51580 clauses,
with SHA-256
`e03108c2bf961d48a343da0a132b1de3d76b28773f5658c7e80443f1029181c4`.
There are no Tseitin variables: each DIMACS clause is one source assertion or
one event-bound learned cut.  CaDiCaL 3.0.0 returned `UNSAT`; `drat-trim`
reported `s VERIFIED`, a 4767-clause core, 56077 core lemmas, 1464640
resolution steps, and zero RAT lemmas.  The DRAT and raw LRAT SHA-256 values are
`54f1085ae3c094b0084a09997742e6c965bee545a9f5953fe6b6cb11bcdde56f`
and
`0fcc5ba4da46462f5c2c60928627e353532cbc3be0392b9ba3d9029a7f9ce2b5`.

The normalized pure-RUP stream has 56077 additions, 31390 deletions, and
1464640 hints.  The verified checkpointed and windowed package hashes are
`8ee69015cde2b18b30bf6874060b1c54b6a3c8c5dd3e058aca56fa31a5c2a9e1`
and
`18dd25392d4e6c713220645ba6ae075dfb60e755cba53d81688fe28ad0ad3311`.
The structurally verified compact package has 22 replay windows and package
hash
`c0ae0b53227a58e1c1a0fa29dae8fe6ba903a4e43c87cf5f468c25313ae17e63`.
It still requires a governed Lean build and final-consumer axiom audit.  More
importantly, Lean must prove each incidence cut from its recorded weighted
Kalmanson cancellation data; replay of the Boolean CNF alone does not provide
that source-level semantic bridge.

The reusable `extract_lrat_verified_core.py` reducer now recovers original core
input IDs from the raw LRAT's initial deletion, checks their clause multiset
against the bare `drat-trim -c` core, and optionally checks the same IDs against
the `drat-trim -r` TRACECHECK graph.  It emits clauses in increasing original-ID
order, a dense-to-original JSONL map, and a densely renumbered pure-RUP proof;
an internal ordered-hint replay checks every emitted addition through the empty
clause.  On run `run-0018`, the reducer retained 4767 of 51580 clauses, remapped
56077 additions and 1464640 hints, and replayed successfully.  A fresh trace
generation independently reported 4767 core clauses, 56077 core lemmas, zero
RAT lemmas, and `s VERIFIED`.  These checks validate the reducer against the
pinned diagnostic run; they do not make that pinned result source-general.
The final diagnostic receipt also binds the reducer source and has SHA-256
`e640912632ddf136a863d007976d69ff9d04fbc728bec5085ec3b940f1b06e55`.

### Run `run-0019`: first unpinned direct wave

Run `run-0019` removed every role and row pin and resumed from the 2912 cuts
learned in runs `run-0015`--`run-0017`.  It learned exactly 5000 additional
cuts before reaching its configured refinement budget.  The final solve was
still `SAT` in the Boolean abstraction and exposed another
`transitive-incidence-path` conflict, so this is a continuation checkpoint,
not a satisfiable geometric witness.  The event has SHA-256
`d7ebb3cb7008d3b501f9fb3b70fedee437d918e4c348633a0138fef23aa40f25`;
the reconstructed journal has SHA-256
`d0fabc243217d5da30ae5db4b25aab2d0b6f9397866d544b1e1de7a1a5102022`.
Registered run `run-0021` resumes the direct orientation cumulatively from all
7912 prior cuts, again with no role or row pins.

### Run `run-0020`: first unpinned mirror wave

Run `run-0020` starts from the mirror cyclic order with no role pins, row pins,
or inherited cuts.  It learned exactly 5000 cuts before reaching its configured
refinement budget.  Its final solve remained `SAT` in the Boolean abstraction
and exposed a `two-form-incidence-path` conflict.  The event and reconstructed
journal SHA-256 values are
`f74835278e70c2bfd2aa18dc77b02ee36442f332edd7740f931526bf53f19392`
and
`1fbbbf76322e7f5e2b388e6b5cc85e55d78a583dbe04f3695bed749d5badd138`.
Registered run `run-0022` resumes those 5000 mirror cuts without adding pins.

At the 2026-09-05 checkpoint, both cumulative continuations remain live:
`run-0021` had completed at least 1241 `SAT` solves and `run-0022` at least 800.
Neither has emitted a terminal event, so neither supports an UNSAT or source
closure claim yet.

### Versioned source-reconstructing DIMACS custody

`cardge13_literal_qfuf_to_dimacs_v2.py` reconstructs the Boolean source prefix
from the current generators, recursively authenticates every seed event and
its own journal, regenerates every learned clause from its recorded conflict
atoms, and emits one provenance record per DIMACS clause.  Historical
`SAT_SURVIVOR` events are admitted as seed history only; the event selected for
conversion must still end in a durable cut-free `UNSAT` solve.

The real `run-0017` lineage, including the nested seed history through
`run-0014`, passes this reconstruction.  The v2 output contains 286 variables
and 51580 clauses: 26826 base combinatorial clauses, 21842 source Kalmanson
nogoods, and 2912 learned Kalmanson nogoods.  Its comment-free DIMACS SHA-256
is
`f1f1c90640674de05372b8116248d6c23aad6fc496d784d35a846ae6796acf8f`,
which matches the v1 clause sequence exactly.  The full v2 DIMACS SHA-256 is
`9d2c72288ebf97f4bd6462a4711c028449095884568b5cd57317bb1f3fdbf944`;
the 51580-row provenance stream SHA-256 is
`eae2c135870238f04618d45d2bd385140a8bfb24984150155b1f71b99f126881`;
and the domain hash recorded by the manifest is
`fda2362399c31c09e6c158b35c5c5aabc4921c2a33c3b3073e5a4dd7fb9faeb7`.
The manifest snapshot-binds all eight event and journal artifacts in the
recursive `run-0014`--`run-0017` custody chain.  Reconstruction executes fresh
module objects compiled from the same six source snapshots recorded in the
manifest.  Fifteen focused tests and Ruff pass.  They cover terminal-journal
path binding, nested seed semantics, recursive snapshot consistency, loaded
generator replacement, and rollback before the atomic directory commit,
including a concurrent empty-destination race.
This strengthens byte and lineage custody.  The separate Lean theorem proving
the source meaning of each retained clause is still required.
