# Computational closure plan — remaining frontier (updated 2026-08-14)

Evidence-status terms in this plan follow the
[closure evidence status ledger](closure-evidence-status-ledger-2026-08-05.md).

Operating premise (audited 2026-08-04): computation is the certified
theorem-mining and finite-coverage substrate, not a self-contained replacement
for the missing universal Lean theorems.  SAT, exact-rational certificates,
counting/Farkas certificates, and CEGAR cuts may propose or certify finite
obstructions; they receive closure credit only after a source-level producer
or lifting theorem connects them to a live universal leaf and a kernel-checked
consumer.  This plan supersedes the round-2 solve-prompt lane as the primary
closure route; the bridge prompts remain valid side-channels if run, but
nothing below depends on them.

A mandatory post-wave general-theorem mine analyzes only the artifacts newly
produced by that CEGAR or PIQD wave.  It is not a fresh search of the
accumulated theorem bank, indexed Lean corpora, mathlib, or literature.  When
wave data yields a concrete candidate theorem, run one bounded external reuse
preflight for that candidate before deriving it.  Forward-looking round
protocols below use "current-wave-data general-theorem mine" for this step;
historical checkpoint records keep the terminology under which their searches
were actually performed.

Historical ordered-v4 replay checkpoint (2026-08-08; distinct from the
arm-static cell-6 v4 canary): all 37 solver-selected ordered
records have kernel consumers, with the promoted replay chain and reproducible
artifact partition recorded in
[the exact-12 replay checkpoint](exact-twelve-rigid221-ordered-v4-replay-checkpoint-2026-08-08.md).
This closes learned-cut replay only.  The run remains `ITERATION_LIMIT`, and
source-exhaustive selector/arm/placement coverage plus its placement/signature
lift are still required before either exact-12 live leaf can close.

Historical dynamic next-row successor checkpoint (2026-08-10; distinct from
the arm-static cell-6 route): the source-to-finite
`nextRowOnlyHit` ingress and independent compiler v2 remain green.  The former
cell-3 order diagnostic is now proof-backed by the no-`sorryAx` declaration
`nextRowCell3PositiveNogood`, whose 48 source orders split into 42
common-five-point and six selected-row Kalmanson cases.  It is entry 56 of the
57-entry authenticated source-order bank.  Tagged runner v4 checks structural
certificates first and then admits only the lowest matching theorem-backed
source-order clause.  Every v4 journal record binds the exact bank digest;
replay reattests the live Lean and detector bytes and validates the complete
journal on a shadow CNF before installing any cut.  Legacy v2/v3 journals fail
closed.

Exact-12 `nextRowOnlyHit`/six-arm route correction (2026-08-11): the complete
live leaf supplies a named source outside the first-apex fiber, identifies it
with one of `u`, `xv`, or `xu`, and proves that its K4 survives deletion of `q`
or `w`.  The arm-aware dynamic pilot nevertheless stopped after 12 cells times
20 authenticated cuts, 240 records total.  Every record was an
`equality-duplicate-center` cut; extending cell 0 exposed another shared-label
variant rather than convergence.  No unchanged dynamic wave is authorized.

The active route is eager formula composition:

1. the historical frozen static-convex plus block-spanning/ThreeTriad
   membership prefix;
2. a proof-backed parametric membership-family layer mined from repeated
   survivors;
3. a separately authenticated named-deletion-arm suffix; and
4. a source-order bank rebuilt and installed after that suffix.

Current arm-static cell-6 v4 checkpoint (2026-08-11): the fresh placement-1,
`u_q` canary returned `SAT_WITNESS_REPLAYED` and was classified
`UNADMITTED_STRUCTURAL_SURVIVOR`; all candidate, base-predicate, named-arm,
exact-CNF, and canonical-static replay gates passed.  The v4 artifact itself
contains the 79-entry source-order installation and 636,386 clauses.  It has no
terminal CNF or terminal proof.

The fourth recurrence is checked in
`ExactTwelveRigid221ArmStaticCell6FourthCommonFivePositiveCut.lean`; it supplies
the next, 80th source-order binding, but that binding is not retroactively part
of the v4 artifact.  Mandatory theorem mining showed that the four consecutive
survivors are instances of one source-order-independent family: for
`a ∈ {3,4,5}`, `c ∈ {10,11}`, and `y ∈ {6,7,8,9}`, positive selected rows
`0:{2,a}`, `y:{2,a}`, and `c:{0,2,y}` force a common-five obstruction in both
frozen cap-block orders.  The no-`sorry` generic certificate is recorded in
`ExactTwelveRigid221SurplusApexPairCommonFiveCertificate.lean`.

Three proof-backed parametric discovery refinements are now composed eagerly.
The first surplus/apex-pair family has 24 role assignments, adds 23 shared
variables and 521 clauses, and produces the 44,925-variable, 635,961-clause
prefix with SHA-256
`014ac24d16b93f2c63413eb979c01e2259bfb9783adecd73afc26bd78a1c6a13`.
The second adjacent-apex/cross-block family has 24 role assignments, adds 39
shared variables and 669 clauses, and produces 44,964 variables and 636,630
clauses with SHA-256
`393c08c6837740304f9102020d6299a9fd0a6ac4879a87c3b48c9ab39a6038d9`;
its delta SHA-256 is
`65190cf69763a7ae55b356e60d1e9554a3c5310a26594eef4a1acf5678d0ff4b`.
The third second-cap/apex/surplus family is the exact 24-role source-universal
family: for each surplus label and each monotone or antimonotone ordered triple
of second-cap labels, rows `x:{2,b}`, `y:{2,b}`, and `c:{x,b,y}` force the
common-five obstruction in all 48 source orders.  It adds 36 shared variables
and 606 clauses, giving a 45,000-variable, 637,236-clause prefix with SHA-256
`2a7a0f63bcbeb983d9019b87797ffb8fa4c1c644045a21c1e79141b631075f90`;
its delta SHA-256 is
`4855eb70ff77277d5708a21c0115fbd55c009dd12624c176d73569cd6eab9d9f`.

Mandatory theorem mining on the next cell-6 survivor found no new geometric
theorem: it is a source-order-independent `ThreeTriadCollisionCore`.  In fixed
roles `B=9`, `C=7`, `D=6`, `E=8`, the varying surplus label is
`a ∈ {3,4,5}` and the four positive selected rows contain
`9:{6,7}`, `6:{a,9}`, `7:{a,6,8}`, and `8:{a,6,9}`.  The typed certificate
`ExactTwelveRigid221SurplusThreeTriadCertificate` uses selected-row incidence
only and does not treat a selected support as a complete metric fibre.  Its
exact three-role membership family adds ten shared variables and 178 clauses,
giving a 45,010-variable, 637,414-clause prefix with SHA-256
`2844611d6030452f2513307fde1de2439eb51a2eea11df2621bb653314b8dab4`;
the delta SHA-256 is
`ad8988be515c9828a29a00dfa47c59cafb29415dd0d621faddec06d4e65c5f75`.
The frozen survivor with assignment SHA-256
`5be3956a4bafa46e9667e75da7f8338bc218da2a31de941b69368e2cfb8633a5`
matches exactly the `a=4` entry and is blocked by its four-literal clause.

After the 867-clause arm suffix and rebuilt 80-entry source-order bank, the
strengthened bounded canary formula has 45,010 variables and 638,361 clauses
with
SHA-256
`74741f8ed04fd901444e083c9d23edba3dd98dba4692f6e12042a367ed9b862f`.
The four Python family compilers, live-source authentication, fail-closed
tamper checks, complete family-artifact custody, arm-canary integration, and
focused tests are green; the fourth-family plus canary suites pass 12 focused
tests with Ruff clean.  The fourth-family generic Lean certificate is clean in
the live language server.  Its exact CNF bridge and the subsequently mined
fifth common-five cut both pass targeted `lake-build` checks.
The generic positive-membership CNF bridge
now imports only the learned-clause bridge, removing an unnecessary dependency
on terminal-bank reconstruction.  The proof-carrying
`SourceOrderPositiveNogood` interface has likewise been extracted into the
lightweight `ExactTwelveRigid221SourceOrderPositiveNogood` module; the three
common-five family certificates depend on that interface rather than the
terminal formula.  This makes the complete family-CNF layer a bounded
validation target while leaving the terminal consumer API unchanged.
The third family's exact CNF bridge now builds successfully through this
smaller dependency path.  The earlier aggregate target still fails first in
the upstream `ExactTwelveRigid221V14JobCnf` interpreter at the 16 GB memory
limit; that failure is isolated from the family bridge and is not being hidden
as a successful terminal build.

The one authorized schema-v2 successor cell-6 canary completed as
`SAT_WITNESS_REPLAYED`.  Its exact formula is the 638,361-clause formula above;
the assignment SHA-256 is
`1be1053548e67a2bfc2ea6710a38bd3b868084d2694db85b8f0ace45a48ff7b8`
and the survivor artifact SHA-256 is
`f71a013e8a53c9c8ab81bc629e1924169d7be19269049915a115cbe95d907291`.
All candidate, exact-CNF, canonical-static-extension, named-deletion-arm, and
added-constraint replay gates passed.  This is a finite survivor, not closure.

Mandatory theorem mining on that survivor found no new geometry family.  All
48 frozen source orders are refuted by the existing convex-five-point consumer
with core `(a,x,b,c,y)=(2,7,1,5,9)`, using the selected rows centered at
`5`, `7`, and `9`.  The unbound detector certificate SHA-256 is
`31a7165ba53f94ff2272e599667bdd1e0897adae0e0f5cde6bae9e1582428e13`.
`ExactTwelveRigid221ArmStaticCell6FifthCommonFivePositiveCut.lean` now promotes
the result to a proof-backed source-order cut with learned clause
`[-838,-1584,-2205]`; after embedding the authenticated Lean binding, the
certificate SHA-256 is
`4d339fa4812f2453669925094e572ea41243d11d220d868c2e15114e3f925f2c`.
The rebuilt source-order bank has 81 entries and SHA-256
`84d27968cd8becaa9fe56e67839f3b54e6da53acd76f4f8ea700f0288f0377e5`.
Installing it yields 638,362 clauses with exact DIMACS SHA-256
`0f12ab70b208e5fed7457666a8c129cdc2ab5a3ada4dfc9cadf45cc2d92b2455`.
The arm canary now freezes both identities; this closes the narrower-test gap
that had allowed a stale intermediate bank hash to remain in this plan.
After the generic membership bridge was reduced to its lightweight
`LearnedClauseBridge` import, its authenticated source identity was rebound and
the positive-membership source-bank suite passed 12 tests in 20.09 seconds.
The earlier post-import source-bank suite passed eight tests and nine subtests
in 960.44 seconds; the companion arm-canary suite passed seven tests in 15.44
seconds, and Ruff was clean on the four touched Python files.
The independent theorem-mining review also confirmed that this is a positive-
membership cut only and does not treat selected supports as complete metric
fibres.  The fifth cut now imports the lightweight
`ExactTwelveRigid221SourceOrderPositiveNogood` interface rather than the heavy
terminal-bank reconstruction; its persistent module build succeeds, and its
axiom report contains only `propext`, `Classical.choice`, and `Quot.sound`.
Those gates authorized exactly one fresh successor canary.  It was consumed by
the cell-6 v8 run and completed as `SAT_WITNESS_REPLAYED`, with assignment
SHA-256
`235fd341501aacb82105e1d6ed8e514cae92ddafe5c0ed5e46b09932c7599e5c`
and survivor artifact SHA-256
`4c5649d31d5c180bd1975e65b3a6456c8eb8afc5f300df43e8feb00292252f71`.
All source-candidate, added-constraint, named-arm, exact-CNF, and canonical
static-extension replay gates passed.  The stop rule then fired; no second
solve was launched before theorem mining and promotion.

Mandatory mining of that survivor produced a new 24-role zero-center
cross-block common-five family.  For every
`x ∈ {3,4,5}`, `b ∈ {6,7,8,9}`, and `y ∈ {10,11}`, selected rows
`x:{1,b}`, `y:{1,b}`, and `0:{x,b,y}` force the checked common-five
obstruction `(1,x,b,0,y)` in both orientations of every frozen source order.
`ExactTwelveRigid221ZeroCenterCrossBlockCommonFiveCertificate` proves the
source-order nogood, while
`ExactTwelveRigid221ZeroCenterCrossBlockMembershipFamilyCnf` binds all 24
instances to the exact positive-membership CNF.  An independent role/order and
polarity audit found no mismatch between the Python compiler and Lean family.
The family adds 44 shared variables and 772 clauses.  Its delta SHA-256 is
`2d899d2fca5ac3a6027ac95e5ff8c730ba2b0fc0fd015c08cace2397aad7549f`;
the authenticated family-bank SHA-256 is
`2d58441ab3f3deb058b229f088d0070688705e0fa7067f62a5f054c94d62de03`.
The resulting prefix has 45,054 variables and 638,186 clauses with DIMACS
SHA-256
`80c0ba1bb134e446b123c6081705a481166d2217e0f6e793ba495d29d749d61e`.
After the 867-clause arm suffix and unchanged 81-entry source-order bank, the
successor canary formula has 639,134 clauses with exact DIMACS SHA-256
`eef97c600d8fcfcea1acceb5a7058c756e9213fb1a7d3e9ba99af77e0abd3c1a`.
The two family tests plus arm-canary integration pass 13 focused tests in
40.36 seconds; Ruff and format checks are clean.  Targeted Lean builds pass.
The generic source producer has only `propext`, `Classical.choice`, and
`Quot.sound`; the exact CNF consumer additionally has the audited
`Lean.ofReduceBool` and `Lean.trustCompiler` dependencies from its two
`native_decide` checks and no `sorryAx`.  A source scan of every project
definition evaluated by those checks found no `unsafe`, `implemented_by`, or
`extern` declaration.

Those completed promotion gates authorized exactly one fresh successor
canary.  The cell-6 v9 run completed as `SAT_WITNESS_REPLAYED`, with assignment
SHA-256
`f8247a6470d7434f5b4858a8bf3bf4f564f22ae1a5d16725fb273f6b492c72f6`
and survivor artifact SHA-256
`a4169a7ac45e9f483057c95449ead37b540ea19e4a8238e8cdaee7ed772eee9c`.
All replay gates passed.  The stop rule fired immediately; no second solve was
launched before all-order theorem mining and promotion.

Mandatory mining found a second 24-role common-five family.  For every
`a ∈ {3,4,5}`, `x ∈ {6,7,8,9}`, and `c ∈ {10,11}`, selected rows
`1:{0,a}`, `x:{0,a}`, and `c:{0,1,x}` force the checked common-five
obstruction `(a,x,0,c,1)` in both orientations of every frozen source order.
An independent exhaustive audit checked all 24 roles against all 48 source
orders (1,152 cases) with zero failures or order mismatches.  The generic Lean
certificate and exact CNF bridge bind all 24 instances to the source-faithful
positive-membership semantics.  The authenticated Python compiler shares the
72 raw requirements into 23 definitions and adds 494 implication clauses plus
24 blocking clauses, for a total delta of 23 variables and 518 clauses.

The new authenticated prefix therefore has 45,077 variables and 638,704
clauses with exact DIMACS SHA-256
`269d2527f22b59ee34d0521fca931553c5a969a7171a4e3b4df9498951f19f4e`.
Its family delta SHA-256 is
`fd05515311dd750d4864256b7bb0e29e80b18413ffa331db00f2faccfec573e7`,
the authenticated family-bank SHA-256 is
`e6b1e4b6000e4af8deeb681d62478faf2427c2774d249185131ced61f57581bd`,
and the compiled family SHA-256 is
`74853129ad62941ab8cb30a8a13deaf2688b39f9376fb491bb327d5b636e3396`.
After the 867-clause arm suffix and unchanged 81-entry source-order bank, the
successor canary formula has 639,652 clauses with exact DIMACS SHA-256
`a3e0954a16f25f6d6058f5709226381d4e7a422357e28d95a0e913423e36de0c`.
The combined zero-center family, new family, and arm-canary regressions pass 19
tests.  The generic source theorem has only `propext`, `Classical.choice`, and
`Quot.sound`; the exact CNF consumer has the expected governed
`Lean.ofReduceBool` and `Lean.trustCompiler` dependencies and no source-scan
warning.

Those completed promotion gates authorized exactly one fresh successor
canary.  The cell-6 v10 run completed as `SAT_WITNESS_REPLAYED`, with
assignment SHA-256
`3edbb2910a325f7b61acbc07968d54c8346a4b2d656d9ffaacf4a4468d4aad0c`.
All source-candidate, added-constraint, named-arm, exact-CNF, and canonical
static-extension replay gates passed.  The stop rule fired immediately; no
second solve was launched before all-order theorem mining and promotion.

Mandatory mining found a twelve-role apex-pair cross-block common-five
family.  For every `x ∈ {6,7,8,9}` and `y ∈ {3,4,5}`, selected rows
`x:{0,2}`, `y:{0,2}`, and `1:{0,y,x}` force the checked common-five
obstruction `(2,x,0,1,y)` in every frozen source order.  The mining
certificate SHA-256 is
`b19b07e3437e5212b3138a70542bea51301f78eac9a74689bdfbb1911b46e34f`.
An independent exhaustive audit checked all twelve roles against all 48
orders: all 288 direct instances have the reverse orientation, all 288 mirror
instances have the forward orientation, and there are no failed, missing, or
ambiguous cases.  The 36 raw row requirements deduplicate to exactly nineteen
CNF definitions.  The generic Lean certificate and exact CNF bridge bind all
576 instances to the source-faithful positive-membership semantics.

The family adds nineteen variables and 244 clauses.  Its delta SHA-256 is
`53196e064ff651efd020ce449cb968a0b04df5568cc2c1475625b544d038060e`;
the authenticated family-bank SHA-256 is
`4dc37cd0afd6daffaa162fc0038ca7905649c04a5f5a4dbda1b4b0c33d41d85c`,
and the compiled family SHA-256 is
`772685d231bb834e41915f27805958eb03986262fbd6440019cc06acb70ca205`.
The strengthened prefix has 45,096 variables and 638,948 clauses with DIMACS
SHA-256
`5ec0371e698496e001a75d67d4e39bd874232453d7cd9fbb2c6fc75258645a90`.
After the 867-clause arm suffix it has 639,815 clauses and SHA-256
`ce42d607d28d4e527c90493a776e3c3a2881de5c2b59d05fba26c5a86764949f`;
after the unchanged 81-entry source-order bank it has 639,896 clauses and
final SHA-256
`dd2902bddb68d9b7cfab8fb86df91bce32c44e3dc530e3fadca4bba28d3662c0`.
The family and arm-canary focused suites pass 13 tests, Ruff is clean, and the
targeted Lean module build succeeds.  The bank's `cell_index = 1` denotes the
frozen placement, while `arm_cell_index = 6` denotes the canary coordinate;
those values are intentionally different.

Those promotion gates authorized exactly one v11 successor canary.  It
completed as `SAT_WITNESS_REPLAYED` with all replay gates true; the assignment
SHA-256 is
`5a3c7970e3531771b8d26e97f4b9ed9b416eb11fab0ff9a78226f0e00c963304`
and the survivor artifact SHA-256 is
`2233bc3a7f2b9377ecd671db8255a8a9247d16853769e03acd26530cf6eeaf71`.
The stop rule fired before any further solve.

Mandatory mining of that survivor produced the 24-role apex-shared-pair
cross-block family.  For every `a ∈ {6,7,8,9}`, `b ∈ {3,4,5}`, and
`c ∈ {10,11}`, positive selected rows `0:{a,b}`, `1:{a,b}`, and
`c:{0,1,b}` force the common-five obstruction `(a,0,b,c,1)` in every frozen
source order.  Exhaustive replay checked all 24 roles against all 48 orders:
576 direct cases use the reverse orientation, 576 mirrored cases use the
forward orientation, and no case fails.  The generic Lean certificate and
exact positive-membership CNF bridge are kernel checked.

The family deduplicates 72 raw row requirements into 30 definitions and adds
294 implication clauses plus 24 blockers.  Its delta SHA-256 is
`86a80a42906f71d59a30e0d0d26cc579e94d378137e1ab45a5f139e1c9076491`,
authenticated family-bank SHA-256 is
`409d64ec7178857320e2284c36c24a38c19a5ad801f9b7ded9c98e1476d2b418`,
compiled-payload SHA-256 is
`e9272240042cdb96d95e3eef0465d57eda9025dad301d6d65265b622768e2179`,
and role-list SHA-256 is
`c1b263ad53eedf0850a95f95dfe5b64ada71a0807d7414d91211ea4138725af2`.
The strengthened prefix has 45,126 variables and 639,242 clauses with DIMACS
SHA-256
`a141b3223365f27eaa4d5b583293986b602e0b3f5467e7d74f319a24d5782d75`.
After the 867-clause arm suffix it has 640,109 clauses and SHA-256
`18b26eae3aef9f9aa07af520b3d1e82f732a9547fe7efddf19af4bc1df672c9b`;
after the unchanged 81-entry source-order bank it has 640,190 clauses and
final SHA-256
`376e67a55551eeb8e6303835c52f8ce8331f7c19af82c95a0906bacaa1d61360`.
Standalone bank attestation now checks the bank digest and exact four-file
source manifest, rather than accepting a valid but truncated manifest.  The
family plus canary regressions pass 13 focused tests, Ruff and formatting are
clean, and the targeted Lean build succeeds.  This is one finite
proof-backed refinement, not terminal UNSAT, all-arm coverage, a universal
lift, or live theorem closure.

The one successor canary authorized at that checkpoint was consumed.  It
returned a fully replayed `SAT` witness, so the stop rule fired before another
solve.  Mandatory mining extracted the next source-order-independent family:
for four distinct second-cap roles `a,x,c,y ∈ {6,7,8,9}` whose ordered pairs
have the same direction, and `b ∈ {3,4,5}`, positive rows
`x:{a,b}`, `y:{a,b}`, and `c:{b,x,y}` force the checked common-five
obstruction.  The exact role domain has 36 assignments.

The apex-internal shared-pair compiler uses 60 distinct row requirements.  Of
those, 24 are exact variables inherited from the second-cap/apex/surplus and
surplus/ThreeTriad parents; only 36 are fresh.  A pre-solve audit rejected an
initial Lean adapter that silently redeclared all 60 as fresh.  The corrected
adapter declares exactly variables `45127,...,45162`, imports the exact 24
parent definitions, generates implication clauses only for the fresh
definitions, and requires the caller to supply the source meaning of every
reused variable.  An executable cross-artifact regression resolves every Lean
parent reference to its Python SAT variable, compares all fresh definitions,
compares the complete 36-role Lean/Python role list, and checks the generic
role-to-block wiring.  Thus reused variables cannot acquire a fresh default
meaning at this boundary.

The repaired family adds 36 variables and 1,212 clauses.  Its delta SHA-256 is
`55bac342e4e178e27d9b2fbbe863812d87935a64d15108f04cd027144cb7a705`,
its compiled-payload SHA-256 is
`23b07449e37accf9cd161d2913aaa3bbe6993f01acccbd2acb159776cd5e6f92`,
its role-list SHA-256 is
`d97c470d4600181c8f55cb043528c7849a4f1506627e362585df695719cfabab`,
and its current authenticated family-bank SHA-256 is
`c18805a271e810241dab349c213789cf8bee8a030fb7f9d5517b2210adbb25cd`.
The strengthened prefix has 45,162 variables and 640,454 clauses with DIMACS
SHA-256
`34e2a2d14aaa2ca93cf71af94f5f3e19f4bb67ae106d9c9cdff33d1c582d182e`.
After the 867-clause named-arm suffix it has 641,321 clauses and SHA-256
`291f4dbf3649090e4068920026e754ba6d10e02528b557a3665927567c6ebb57`;
after the unchanged 81-entry source-order bank it has 641,402 clauses and final
SHA-256
`0e24885e3e2e7474441aa687216ee1cf862a7d05e6ab2bbd7c1637e7fd22ec12`.

The four focused family regressions, downstream formula-materialization gate,
Ruff check, and direct elaboration of both Lean modules pass.  An independent
read-only trust-boundary audit classified the checkpoint `CHECKPOINT_GREEN`
for one bounded canary.  It did not classify the modules as promotion-ready:
terminal proof replay, transitive axiom audit, exact terminal ingress, all-arm
coverage, and the cardinality lift remain separate obligations.

The one successor canary authorized by that checkpoint was consumed.  It
returned a fully replayed `SAT` witness with assignment SHA-256
`b040b5fa4e418fe9719dbddb1470340d74c94b8dcb08734045f224381393e97d`
and survivor-record SHA-256
`18cf2524df941ee240ace7b08cc5e4b124e2acaca701d87912c1d36d760d8f6f`.
There is no terminal proof artifact.  The stop rule fired before another
solve, and mandatory theorem mining covered all 48 frozen source orders with
certificate SHA-256
`c49b79aaec5f2df5a344fd943773e316ca22bccde2c3c05f5e7b4bfeb3d2118d`.
The mined family has eight valid `(x,b,y)` assignments: `x ∈ {6,7,8,9}` and
distinct `b,y ∈ {10,11}`.  Positive rows `x:{0,b}`, `y:{0,b}`, and
`2:{b,x,y}` force one of the two checked common-five orientations obtained by
swapping `x` and `y`.

The new apex/first-opposite shared-pair family introduces 14 fresh membership
variables and eight blockers, with no reused requirements or duplicate
blocks.  It adds 374 clauses.  Its delta SHA-256 is
`7f4d1279b9473a900370100061a12b3ac93f6a7ccb08c275be375c1f01de4ea0`,
its compiled-payload SHA-256 is
`fac6a62933f8fcdde0d523f07f66136d8d2b917c271380ca3ef4bc625a65aada`,
and its role-list SHA-256 is
`0261c9b8e86a75a150b04d7f6faeacf4ca62153b40cb0ba9104b730db0d4a46b`.
The strengthened prefix has 45,176 variables and 640,828 clauses with DIMACS
SHA-256
`1c5e5128225ad7d3878a2e1580f3628ca8955172982b0803d599ed2ad94c2d59`.
After the unchanged 867-clause arm suffix it has 641,695 clauses and SHA-256
`d93616f6553e9fc8e5ecdb56921b7279f24368cb47375f8811581a6bc5a66ad5`;
after the unchanged 81-entry source-order bank it has 641,776 clauses and final
SHA-256
`e2128c88bb9af157621674205f30596d4d9ca8f86911c070c03e3055767a3dcf`.
Authenticated end-to-end materialization, the combined 15 focused tests,
Ruff, and direct Lean elaboration now pass.  The bank and canary authenticate
the complete 2,877-file repository-local Lean import closure of the two proof
roots, rather than only a hand-maintained direct-source list.  The independent
read-only source-to-CNF re-audit found no remaining material correctness or
authentication issue.  Transitive axiom reports contain only the standard
`propext`, `Classical.choice`, and `Quot.sound` axioms for the geometric
producer, plus the governed `Lean.ofReduceBool` / `Lean.trustCompiler` native
boundary for the finite CNF theorem; no project `unsafe`, `implemented_by`, or
`extern` declaration was found in the evaluated closure.  This checkpoint
authorizes exactly one successor canary, not a broader wave.  A later `UNSAT`
would still require the runner's fresh byte-identical proof rerun, checked
RUP/Lean ingress, and expansion from one coordinate to all 648 exact-12 arm
coordinates.

The one successor canary authorized by that checkpoint has now been consumed.
It returned `SAT_WITNESS_REPLAYED` / `STRUCTURALLY_UNRESOLVED`, with assignment
SHA-256
`ec0d9b8d6e4aa0352155eb7a82e6bb6c99a2dc17ba1352596966881d550e3eda`
and authenticated survivor-artifact SHA-256
`67f3a18bdec6bc11c55767ebce0564ff874e235da21b6fdbde4c13938d16d4b7`.
There is no terminal proof artifact.  The stop rule fired before another solve.
Mandatory theorem mining then produced a 96-role source-clean common-five
family.  For `a,c ∈ {6,7,8,9}`, `b ∈ {3,4,5}`, and `y ∈ {10,11}`, rows centered
at `0` and `y` share `{a,b}`, while the row centered at `c` contains
`{b,0,y}`.  The frozen boundary blocks orient the resulting common-five core;
no inequality or relative order between `a` and `c` is assumed.

The exact compiler partition is 60 logical requirements: 48 fresh definitions
occupy variables `45177,...,45224`, while twelve center-`0` requirements reuse
exact parent definitions and variables `45097,...,45108`.  The first draft
incorrectly treated all 60 requirements as fresh.  It was rejected and
replaced before any solve: the repaired Lean bridge emits implications only
for the 48 fresh definitions, includes both partitions in family blocks, and
requires the caller to provide the source meaning of every reused definition.
An executable cross-artifact regression resolves those twelve Lean parent
references and compares their variable, center, and support triples with the
Python compiler state.

The repaired family adds 48 variables and 1,152 clauses.  Its delta SHA-256 is
`04728382408884774f44b3afe07598a7b84d420f10990eb3c062c44ef00e033e`,
its compiled-payload SHA-256 is
`e703aabe4c3c353ab82a6f21c3ba25ddac94911e426db869a42ad04d1448837d`,
its role-list SHA-256 is
`989a84237110c09d421ad0ee27f96deded608c71809d1959a2da545bd125c0c4`,
and its authenticated family-bank SHA-256 is
`8f7005479eb9cf440468ac55b5cc3d5d3a869674934b69c786e90e49531e3e25`.
The strengthened prefix has 45,224 variables and 641,980 clauses with DIMACS
SHA-256
`ffbfbff4b327943b0a889bb16b99b75ae934ec72027d829e0f332f24a98f5f9d`.
After the unchanged 867-clause named-arm suffix it has 642,847 clauses and
SHA-256
`353af10a0b4a49389ec743b520332c1fedb717b5f70d2acf31a28359b9c86e17`;
after the unchanged 81-entry source-order bank it has 642,928 clauses and final
SHA-256
`2879cb8d1899c5a96e3d4ef4a5e89ed4ed20ec6c60d8ed06b59f0baec60d8ad5`.
The canary serializes, hashes, and binds the new family bank and complete
recursive Lean source closure.  The focused regressions and an independent
source-to-CNF trust-boundary audit are green for one bounded canary.  This is
not promotion readiness.  Once committed and pushed, this checkpoint
authorizes exactly one fresh successor canary, not a wave.

That authorized successor canary has now been consumed.  It returned
`SAT_WITNESS_REPLAYED` / `STRUCTURALLY_UNRESOLVED`, with assignment SHA-256
`34850fcc6db05ad37be177322b4ee02c3743ba352506b1ed7862b4d3f8912172`
and survivor-artifact SHA-256
`0f85c6db2e0de0655427da839596cdbdb3753c48287bbf864befabedeba86bc7`.
There is no terminal proof artifact.  The stop rule fired before another solve.
Mandatory all-order mining found the common-five core
`(a,x,b,c,y)=(1,0,2,3,7)`: the rows centered at `0` and `7` share `{1,2}`,
and the row centered at `3` contains `{2,0,7}`.  This survivor does not
instantiate the preceding 96-role family because its fixed apex/first-opposite
roles occupy different frozen blocks; that is a role-domain distinction, not
an installation failure.

The resulting source-clean family fixes `(a,x,b)=(1,0,2)` and ranges over the
twelve pairs `c ∈ {3,4,5}`, `y ∈ {6,7,8,9}`.  The generic Lean
certificate and exact positive-membership CNF bridge cover those twelve roles.
The authenticated compiler introduces 17 fresh definitions and 211 clauses.
Its delta SHA-256 is
`ff3fef9fe7c16b849e6964f738f8475686394dc4f3ff1ccad1cc2ff5a47f0c16`,
its compiled-payload SHA-256 is
`cb9c658562230dfd4d71a4e5d646c3eb555910d344add8fcfe7df507d801a771`,
its role-list SHA-256 is
`cfd5b1fce6c3fc1a14d514eb90a111e4480c6e0a22d9c43948defeb88254f72f`,
and its current authenticated family-bank SHA-256 is
`60f70e569bc87fc0c65e45f201d485d672bb20f9aca9d248aec906abd7cee296`.
The strengthened prefix has 45,241 variables and 642,191 clauses with DIMACS
SHA-256
`b475d468f085adb54ecb352277c0df0c69d27ef00c61b89562edb2d5445385b7`.
After the unchanged 867-clause named-arm suffix it has 643,058 clauses and
SHA-256
`b47bd14179d18e526ba7915fe123b0e96b2929c2512b1b9851390cf7a65b02bb`;
after the unchanged 81-entry source-order bank it has 643,139 clauses and final
SHA-256
`e9ba86c01dbf491500295d0964b9f2cc6f601f468c57b7b4913e566b054117b8`.
Direct targeted Lean builds, Ruff, authenticated materialization, and fourteen
focused bank/canary tests are green.  Two independent read-only audits found no
remaining source-to-CNF, role-order, source-closure, job-binding, or fail-closed
artifact issue.  The initial real-definition lookup fallback was hardened
before this validation: out-of-family variables now map to an empty-support
sentinel, while all twelve entries name their three checked definitions
explicitly.  Once this checkpoint is committed and pushed, it authorizes
exactly one successor canary, not a wider wave.  The two terminal family
theorems' axiom reports contain only `propext`, `Classical.choice`,
`Quot.sound`, and the governed `Lean.ofReduceBool` / `Lean.trustCompiler`
boundary introduced by their finite `native_decide` validations; there is no
`sorryAx`.

These are finite SAT/replay and theorem-family results only.  They do not
establish exact-12 closure, aggregate six-arm/placement coverage, a
cardinality-at-least-13 producer or lift, Lean terminal ingress, or closure of
a live `sorry`.

The exactly one successor canary authorized by that checkpoint has now been
consumed.  Cell 6 returned `SAT_WITNESS_REPLAYED` /
`STRUCTURALLY_UNRESOLVED`; every candidate, added-constraint, named-deletion
arm, exact-CNF, and canonical-static-extension replay gate passed.  The
survivor artifact SHA-256 is
`3e810b280aa04463f326ab7edc6e033abc35194cc085f949cfaf095bbc1734d9`,
and the assignment SHA-256 is
`0ea7db6cd391f8937668e40a88b58b44d9765ea409157f01257942083398c5fb`.
There is no terminal proof artifact.  The stop rule fired immediately, and no
further solve is authorized until the following mined family is checked,
authenticated, and independently audited.

Mandatory all-order mining covered all 48 frozen source orders with
certificate SHA-256
`b2cf25482c4fafa7efbd64a1572251b0ce615cbe38ec27c403f12f7f5a2ca776`.
The source-clean family has 24 roles: `a` and `y` are ordered distinct
labels in `{3,4,5}`, `x ∈ {6,7,8,9}`, and the apex pair is fixed as `(0,1)`.
Positive selected rows `x:{0,a}`, `y:{0,a}`, and `1:{0,x,y}` force the
common-five core `(a,x,0,1,y)`.  In the mined survivor, the representative
role is `(a,x,y)=(4,6,3)`; 24 direct source orders use the reverse orientation
and 24 reflected orders use the forward orientation.  This paragraph records
an active proof-family checkpoint.  A pre-compilation reuse audit found 30
logical requirements: all twelve second-opposite-center pairs and all twelve
apex-center triples already have exact variables in the parent prefix, while
only the six ordered-distinct surplus-center pairs are fresh.  The checked Lean
and authenticated Python bridges now reuse those 24 parent definitions and
allocate only variables `45242`--`45247`; a 30-fresh-variable adapter remains
rejected.  The compiled bank extends the frozen parent from 45,241 variables
and 642,191 clauses to 45,247 variables and 642,425 clauses.  Its delta SHA-256
is `be73759811e6cbc9423ab95540ceedbc83f1df314746e3451821127a5444e417`,
its final DIMACS SHA-256 is
`d23b721936153e866afc6ca780b6829a8d3a9217e55f420fad9489baf1a7b7bb`,
and its compiled-payload SHA-256 is
`6a76bc83e87ded45297d12d8153b66c1c177b1e0a44a29775644678286b8c3b0`.
The two Lean modules build, their public endpoints have no `sorryAx` (the CNF
bridge has the repository-governed `Lean.trustCompiler` footprint from
`native_decide`), the six focused Python tests pass, and Ruff is clean.  The
bank source manifest now includes its direct source-faithful candidate-surface
dependency, and installation is transactional: any authenticated-payload drift
restores the variable count, clause suffix, and pattern-variable table.  This
is still not a terminal UNSAT result, all-arm coverage, a cardinality lift, or
closure of a live `sorry`.  Runner schema v4 now installs and re-attests the
family before the named-arm suffix, binds it into the authenticated source
inventory and job, writes its bank artifact, and requires its hash before
acceptance.  The first independent end-to-end audit found that successful
branch outputs were listed but not status-conditionally required; the runner
now requires the exact survivor JSON hash after replayed SAT, and the frozen
terminal-CNF plus proof hashes after verified UNSAT.  The remaining audit note
is recoverability-only: an exceptional interrupted run can leave an unusable
partial workdir, but no partial directory is accepted or resumed.  The full
runner regression suite passes 10/10 with fake solvers only.  The independent
follow-up audit confirms that the result-artifact fix closes the acceptance
gap under the runner's exclusive-workdir contract.  This v16 checkpoint was
published at `7570a31b`; the one permitted successor canary is the v17 SAT
checkpoint recorded below.

Historical v4 predecessor checkpoint: the fresh twelve-cell wave completed
100 authenticated records in every cell and ended `ITERATION_LIMIT`
throughout.  Its mandatory theorem-family
search found no missing local geometry family.  The lane-specific v5 terminal
consumer now rejects the historical v14 formula mismatch, and the exact Lean
reconstruction of the shared physical-cycle prefix plus next-row selector
suffix has a concrete `CompiledNextRowJob` adapter.  The adapter proves source
satisfiability of `baseDimacs ++ reconstructedClauseDelta` and agreement with
the canonical source assignment on all base variables.  Targeted elaboration
is green and its axiom audit contains no `sorryAx`; it inherits
`Lean.trustCompiler` from the frozen native-evaluated encoding anchors.

Historical generated-replay checkpoint: the current-source embedded-list
replay materialized all twelve scheduled cells under
`certificates/p97_exact12_next_row/`.  Every artifact
records the semantic coordinate, frozen base and candidate hashes, a
lane-specific source inventory, the exact 384-clause ordered suffix, and its
complete DIMACS hash.  The generator rechecks the recorded inventory before
publication; shared candidate/SAT code is pinned extensionally by the frozen
candidate table, complete base-clause, complete DIMACS, and ordered-suffix
hashes rather than claimed as a transitive source lockfile.  Twelve generated
Lean modules embed the corresponding lists, prove ordered-list equality with
`reconstructedClauseDelta`, prove the 384-clause length, and instantiate the
conditional source-satisfiability `CompiledNextRowJob`.  Their aggregate import
and the explicit first/last-cell axiom audit are green with no `sorryAx` and the
documented native trust axioms.  Lean does not parse the JSON files or prove
their SHA-256 string constants; the kernel-checked statement is equality with
the embedded lists.  The aggregate is an import collection, not a coverage
theorem.  The generator refuses overwrite, rejects coordinate/count/hash and
frozen-input tampering, and has a byte-exact `--check` mode.  This establishes
current Python generation and independent Lean reconstruction agree on those
twelve embedded ordered lists only.  At that checkpoint the next gate was a
checked learned terminal bank or terminal RUP/UNSAT certificate consumed
through these typed jobs.  There was no terminal UNSAT cell, all-cell
learned-bank coverage, arbitrary-cardinality lift, or live closure.

Historical static-equality v1 predecessor (2026-08-10): this route introduced
the fresh-schema static equality-closure extension specified in
[the exact-12 nextRow static-equality goal](specs/p97-exact12-next-row-static-equality-v1.md).
The earlier shorthand “shared-triple clauses” was misleading: direct overlap
of two selected supports in three labels is already excluded by base C2.  The
dominant learned cuts instead use transitive equality among the 66 metric
edges.  The v1 extension therefore adds 2,145 edge-relation variables, 18,240
selected-row implications, 137,280 transitivity clauses, and 7,920
duplicate-center obstructions (163,440 clauses total).  It deliberately omits
the scratch benchmark's optional K4, bisector, triad, and ordered families.
Historical nextRow schemas and artifacts remain frozen.  The fresh v1 runner
now installs the extension before hashing its initial formula, binds the
compiler and variable-map digests, admits only generated Lean-backed
source-order cuts, and fails closed while preserving every other survivor.
Its job/cut/run schemas are respectively
`p97_rigid221_exact12_next_row_static_cegar_job.v1`,
`p97_rigid221_exact12_next_row_static_source_order_cut.v1`, and
`p97_rigid221_exact12_next_row_static_cegar_run.v1`.  It does not borrow the
historical terminal consumer: records leave `terminal_formula_consumer` null,
and even identical-CNF checked DRAT is classified
`UNSAT_DRAT_VERIFIED_AWAITING_LEAN_STATIC_VALUATION`.  Focused validation is 13
tests plus 12 subtests, with Ruff clean.  Before a terminal result can close the
leaf, Lean must prove the auxiliary squared-distance-equality valuation and
exact terminal-formula equality.  This is finite infrastructure, not that
bridge, terminal UNSAT, or a closure result.

Exact-12 next-row static-geometry v2 checkpoint (2026-08-10): the first
source/CNF/static-replay-clean v1 cell-0 canary stopped on a five-label
`equality-equilateral-bisector-collision`.  This did not expose missing
geometry.  The source audit found the generic theorem, Boolean path checker,
positive-row certificate constructor, and heterogeneous nextRow terminal
consumer already present.  The canary has five distinct labels and the exact
six required closure paths, so all source side conditions are available.  The
new [v2 contract](specs/p97-exact12-next-row-static-geometry-v2.md) preserves
the v1 bytes and appends one six-negative-literal relation clause for every
ordered distinct `(p,a,b,c,x)`, namely all `12P5 = 95,040` instances.  It adds
no variables.  Cell 0 is frozen at 44,875 variables, 626,939 clauses, final
DIMACS SHA-256
`c720f44cfd99ad25c01d1dcd1bee62d213c608983e66d04e751958fd94d421dd`,
and v2-delta SHA-256
`dc07e3eff4dc21b32d38e4ca8e1225e90210db62ce306e615b01f969fa4bbb9b`.
Focused differential validation is 19 tests plus 12 subtests.  The v2 runner
uses fresh run/job/cut/survivor schemas, binds the geometric Lean sources in
its source inventory, admits only the live-attested source-order bank, and
treats either static stage after SAT replay as an invariant failure.  The next
gate is one fresh authenticated cell-0 canary followed immediately by a
theorem-family search on its first survivor.  A twelve-cell expansion remains
gated on that result.  This still lacks the whole-formula Lean equality
valuation, proof-producing terminal UNSAT, exact terminal ingress, all-cell
coverage, arbitrary-cardinality lift, and live `sorry` closure.

Exact-12 next-row static-convex v3 checkpoint (2026-08-10): the authenticated
v2 cell-0 canary completed every source/CNF/static replay gate and stopped on a
three-witness `equality-perpendicular-bisector-convex` core. Given a
squared-distance realization, carrier membership for every label, convex
independence, and a checked `PerpBisectorCore`, the source theorem
`false_of_convexIndep_of_perpBisectorCore` rules out three labels equidistant
from a distinct focus pair. The
new [v3 contract](specs/p97-exact12-next-row-static-convex-v3.md) preserves all
v2 bytes and appends the complete detector-scope family
`C(12,2) * C(10,3) = 7,920` of three-negative-literal equality clauses. Cell 0
is frozen at 44,875 variables, 634,859 clauses, final DIMACS SHA-256
`0d4ab5fa17a63ef862533615eb534b0fb4be5892052788e2a47477e7bd250ff9`,
and v3-delta SHA-256
`49e6e5d5b8b4c68f7bccb0356d5bf38ce9ee25b0397fe555a00f9cddb2fbafa2`.
A generic Boolean equality-path certificate and a separate typed
`SourceOrderPositiveNogood` adapter are source-authored without altering the
hash-pinned historical terminal-bank consumer. The first authenticated cell-0
v3 canary completed `SAT` and `STRUCTURALLY_UNRESOLVED`, with zero learned
records and no terminal proof. Three subsequent exact-row refinements also
remain `SAT`. The latest survivor has a sound positive-membership union at five
centers covering all 48 source orders; the tempting smaller A/B-only cut covers
only 36 orders and was rejected. The generic pattern-CNF theorem and concrete
five-variable adapter elaborate in an isolated scratch overlay. An
authenticated v2 bank binds their three Lean sources and a 117-clause delta
(44,875/634,859 to 44,880/634,976), with bank SHA-256
`553c0f6861c6e6186cd5e59f276a68f0031f9f0575fd7baed9d711f7ac9e7d94`.
Focused Python validation is Ruff-clean with 12 tests passing. The bank records
`LEAN_PATTERN_CNF_BRIDGE_COMPLETE_AWAITING_STATIC_PARENT_VALUATION`; every
terminal, UNSAT, lift, live-closure, and runner-integration claim remains false.
The next exact gate is the generated-layout edge-closure valuation and its
duplicate-center, equilateral-bisector, and perpendicular-bisector clause-family
theorems. The shared full build remains blocked upstream by the ongoing
Rigid221 refactor, so isolated elaboration is not a transitive-axiom or
live-spine audit. All-cell expansion remains gated on source-clean whole-formula
ingress; no terminal UNSAT, aggregate exact-12 coverage, cardinality lift, or
live `sorry` closure is claimed.

Exact-12 next-row static-parent/v5-r1 checkpoint (2026-08-10): the generated
layout gate named above is now complete in isolated Lean.  The equality,
equilateral-bisector, and perpendicular-bisector clause families have explicit
source valuations, and `frozenParentDimacs` packages the complete 634,859-clause
cell formula with a source-derived satisfying assignment.  Separate rolling
fingerprints and byte-for-byte Python differential tests bind the equality,
geometry, and convex clause order; their SHA-256 values are respectively
`bca24367d5601a5870432b568848717ea50a0dcb703be03b74cefcfcbc799b83`,
`dc07e3eff4dc21b32d38e4ca8e1225e90210db62ce306e615b01f969fa4bbb9b`,
and `49e6e5d5b8b4c68f7bccb0356d5bf38ce9ee25b0397fe555a00f9cddb2fbafa2`.
`ExactTwelveRigid221StaticTerminalConsumer.lean` gives the conditional typed
consumer for `frozenParentDimacs ++ bank.map learnedClause`: a terminal
`DimacsUnsatisfiable` closes the finite job only when every learned entry is a
proved `SourceOrderPositiveNogood`.  This is the missing whole-static-parent
ingress and consumer contract, not a terminal certificate or live closure.

The fresh twelve-core v5-r1 **diagnostic** wave under
`scratch/rigid221-sourceheavy-anchor/exact12-next-row-tagged-cegar-wave-i400-20260810-v5-r1`
then produced 3,960 authenticated refinements.  That wave used the older
structural runner: it started from the source-faithful cell CNF but did **not**
install `frozenParentDimacs`.  It therefore does not test the new static-parent
terminal route, and its rediscovery of static duplicate/equilateral/perpendicular
contradictions is expected rather than evidence that the static ingress failed.
Six cells reached the
400-record iteration limit and six stopped at a structurally unresolved SAT
survivor; no cell reached terminal UNSAT.  The aggregate stages are 3,814
duplicate-center, 81 equilateral-bisector, 48 perpendicular-bisector, twelve
three-triad, three equal-K4, one six-point-five-circle-A, and one existing
source-order positive-coverage cut.  These Python structural certificates are
not yet typed terminal-bank entries, so the wave cannot be promoted wholesale.

The first unresolved survivor, in cell 1 after 212 cuts, identifies a narrower
and immediately actionable adapter gap rather than new geometry.  The existing
ordered-coverage generator replays all 48 source-entitled boundary orders
through the already formalized convex common-five theorem.  Canonical
minimization uses two common-five cores and six positive row memberships.
`ExactTwelveRigid221V5R1Cell1CommonFivePositiveCut.lean` now packages them as a
typed `SourceOrderPositiveNogood`; isolated Lean elaboration and Python replay
both cover 48/48 orders, split 24/24 across the two cores, and compile the clause
`(-1,-61,-912,-1194,-1630,-2218)`.  The binding is appended to
`PROOF_BACKED_CUBE_BINDINGS`, preserving every existing authenticated bank
index.  The v4 static runner authenticates the whole-static-parent consumer and
correctly labels a verified terminal DRAT as still awaiting conversion to a
Lean `DimacsUnsatisfiable` theorem.  Its fresh cell-1 canary is the next exact
gate; continue only if the survivor strictly changes or the cell becomes
terminal.  In
parallel, the remaining structural stages need stage-specific typed positive
row adapters before any terminal journal containing them can enter the Lean
consumer.  No bounded result here supplies the separate card-at-least-13
producer or closes the anchored universal leaf.

The first v4 static-parent cell-1 canary then behaved as intended: it admitted
exactly the new six-row cut, replayed the post-static formula and one-record
journal exactly, and returned a different `STRUCTURALLY_UNRESOLVED` survivor.
That new cube is again blocked for all 48 source orders by the existing
common-five theorem.  Canonical minimization uses four cores with coverage
counts 24/8/8/8 in canonical core order and seven full selected rows, compiling
the clause `(-61,-175,-554,-912,-1630,-2239,-2702)`.
`ExactTwelveRigid221StaticCell1SecondCommonFivePositiveCut.lean` now packages
that obstruction as a typed `SourceOrderPositiveNogood`.  Its coverage proof
splits the six possible orders of the three surplus labels before invoking
linear arithmetic; isolated Lean elaboration is green under the scoped
two-million-heartbeat policy.  The authenticated live source has 11,237 bytes,
SHA-256
`2b14137d887d42f46db21b355fa27fd9d154d0e21c4cb0292af2de0d6148ed65`,
and differential Python replay covers all 48 orders with certificate SHA-256
`285fe54c8a4cebbbcea52ae5224544c38e539c6a9828c669f907744e0c92d08f`.
The binding is appended without reordering the prior bank.  The fresh v4-r2
cell-1 canary completed from its new authenticated work directory with exact
formula-extension and journal replay, admitted exactly the two proof-backed
source-order cuts, and again returned `SAT` / `STRUCTURALLY_UNRESOLVED`; there
is no terminal CNF or proof.  Its new survivor is different from both earlier
cell-1 survivors.  The mandatory theorem search covers all 48 source orders,
but again only with `false_of_convexFivePointCore`: four canonical cores cover
24/8/8/8 orders, their eight selected rows compile the diagnostic clause
`(-1,-61,-175,-554,-912,-1194,-1630,-2302)`, and the diagnostic certificate
SHA-256 is
`5f890592615b481ad510017c2f0fd05c4bf23113235028cbe1e2e5de95a33f74`.
This is now a repeated theorem family, not a genuinely new predicate.  Before
adding another survivor-specific adapter, the next gate is to generalize or
finitely precompile the common-five family and prove that its generated clauses
carry the same typed `SourceOrderPositiveNogood` evidence.  If that family gate
cannot cover the next survivor without another hand-written proof, the static
wave must stop and expose a genuinely new source-entitled predicate instead.
None of these finite cuts is terminal UNSAT, all-cell coverage, a
cardinality-at-least-13 lift, or live `sorry` closure.

An exact family-level minimization improves that diagnostic substantially.
Among all common-five cores available in the r2 survivor, the single core
`(a,x,b,c,y) = (6,5,0,3,1)` covers all 48 source orders and consumes only the
selected rows centered at `1`, `3`, and `5`.  The corresponding static cell-1
clause is `(-61,-175,-912)`.  This is stronger than the detector's former
first-core-per-order union, which used four cores and eight rows.  The reason is
uniform rather than a 48-case accident: label `6` is in the second-opposite
block, labels `5` and `3` are in the surplus block, and the direct or reflected
cap-block order gives the two turns of `(6,5,0,3,1)` one common orientation.
`ExactTwelveRigid221BlockSpanningCommonFiveCertificate.lean` now checks those
three role memberships, the two needed distinctness facts, and the four
positive-row equality steps once; it constructs a proof-carrying
`SourceOrderPositiveNogood` without using the forced internal order of the
second-opposite cap.  The r2-specific
`ExactTwelveRigid221StaticCell1ThirdBlockSpanningPositiveCut.lean` is data only,
and both modules elaborate in the isolated exact-12 overlay.  Python registry,
source-manifest, and deterministic-minimizer integration are now complete, with
the focused registry and bank tests green.  The authenticated v4-r3 cell-1
canary replayed all three source-order records exactly and returned another
`SAT` / `UNADMITTED_STRUCTURAL_SURVIVOR`; it produced no terminal CNF or proof.
The r3 survivor changes only the unused fourth member of the row centered at
`5`: the same three partial requirements

* center `1` contains `{0,6}`;
* center `3` contains `{0,1,5}`; and
* center `5` contains `{0,6}`

still instantiate the same block-spanning core `(6,5,0,3,1)` and cover all 48
source orders.  This shows that the exact-support clause
`(-61,-175,-912)` underuses the proved theorem: it excludes one support triple
while 3,675 exact support triples realize the same three partial requirements
in cell 1.  The next canary must therefore install the existing authenticated
positive-membership CNF compiler and a Lean valuation bridge for the
three-literal auxiliary block, rather than append a fourth survivor-specific
full-support clause.  The independent theorem-bank pass also recognized the r3
cube as a `ThreeTriadCollisionCore` with `(A,B,C,D,E) = (11,1,6,2,9)`; that is
a source-clean five-row fallback predicate, but it is strictly larger than the
three-requirement common-five cut and is not yet wired into the static parent.
This remains a reusable finite cut producer, not a terminal certificate,
all-cell result, cardinality lift, or proof-spine reduction.

That positive-membership gate is now implemented.  The v6/v7 runner installs
the authenticated positive-membership compiler and its Lean valuation bridge,
and the ThreeTriad fallback has been consumed by a smaller common-five
certificate rather than treated as an unproved predicate.  The first v7
cell-1 canary admitted the three-row core
`(a,x,b,c,y) = (8,1,3,9,11)`, using rows centered at `1`, `9`, and `11`, and
compiled the source-order clause `(-61,-2239,-2994)`.  Its Lean source
`ExactTwelveRigid221StaticCell1AfterThreeTriadCommonFivePositiveCut.lean`
elaborates in the isolated overlay and is pinned at 5,159 bytes with SHA-256
`09fd5952729856ee94f238f0725d4cf4145cb5b70bbfc0816eb4eaced72a3997`.
The fresh canary retained one exact-replay record and stopped at
`SAT` / `ITERATION_LIMIT`; it supplied no terminal CNF or proof.

The next seeded solve moved to a different `STRUCTURALLY_UNRESOLVED` survivor.
A new role-parametric theorem, rather than a survivor-specific 48-case proof,
now covers that residual: whenever `b` is in the first-opposite interior block,
`c` is in the second-opposite interior block, and `y` is in the surplus block,
the positive row steps at centers `2`, `y`, and `c` force the common-five core
`(0,2,b,c,y)` in one orientation for every one of the 48 source-entitled
orders.  `ExactTwelveRigid221ApexCrossBlockCommonFiveCertificate.lean` proves
this reusable family and is pinned at 5,132 bytes with SHA-256
`aa4495ab51060fcc584afe7b9cf98803b23650adaadc3b4f8117e5c4ee08ebcc`.
The cell-1 data adapter instantiates `(b,c,y) = (10,9,5)`, uses rows centered
at `2`, `5`, and `9`, and compiles the clause `(-155,-924,-2301)`; its source is
pinned at 1,883 bytes with SHA-256
`befc4dc730916bdd84df5edaf270aa722052a089ddb3316cd1533fd6a8c776d0`.
The resulting proof-backed registry has 65 entries and 69 authenticated Lean
sources; focused coverage, bank-build, and clause-installation tests are green.
This is a reusable finite cut family and a strictly changed survivor, but still
not terminal UNSAT, all-cell coverage, a cardinality lift, or live `sorry`
closure.  The next exact gate is a fresh canary against the 65-entry bank.

That canary is now complete and again returned `SAT` /
`STRUCTURALLY_UNRESOLVED`, with exact journal replay, two admitted source-order
records, and no terminal CNF or proof.  Its journal SHA-256 is
`ccdfda719a2a8647cdcacd1d0d43e4b543a3ecc43e83987a65ae872437d49b77` and
its survivor SHA-256 is
`8169c3a26e305cb10756681eb14a34dc29209ddc938c7fc720defc6b5b2e47a9`.
The new survivor exposes another reusable role family rather than requiring a
48-order data proof.  For a first-opposite apex `a` and second-opposite apex
`y`, the positive rows centered at `0`, `1`, `2`, and `y` force the common-five
core `(a,2,0,1,y)`; in the survivor `(a,y) = (11,6)`.  The generic proof
`ExactTwelveRigid221OppositeApexChainCommonFiveCertificate.lean` elaborates in
the isolated overlay and is pinned at 5,205 bytes with SHA-256
`acf0e0dcf1ba2ad94a6a9ac60dbe08f6c11e92171b42fc5baed1e5717ed0af67`.
Its cell-1 adapter
`ExactTwelveRigid221StaticCell1FourthOppositeApexChainPositiveCut.lean` is
pinned at 1,918 bytes with SHA-256
`43371eaadd025ec32d4040ac079408df8d9057140129c945875730fff1d2bc4a` and
compiles the four full selected rows to `(-1,-61,-155,-1195)`.  This raises the
proof-backed registry to 66 entries and the authenticated Lean-source manifest
to 71 sources.  The focused coverage, bank-build, and clause-installation tests
are green, as are Ruff and the scoped whitespace audit.
It is a source-clean finite cut producer, not terminal UNSAT, all-cell coverage,
a cardinality lift, or live `sorry` closure.  The next exact gate is a fresh
cell-1 canary past all three v7 source-order families.

That fourth cell-1 canary is now complete.  It again returned `SAT` /
`STRUCTURALLY_UNRESOLVED`, admitted three source-order-positive records, and
produced no terminal CNF or proof.  Exact journal replay succeeds.  The
authenticated work directory is
`scratch/exact12-cell1-opposite-apex-chain-v7-r4-canary-20260811`; its journal
SHA-256 is
`6265d4a408b928931cee994444564218c8bd87e2dbf61c199326855fe0c70edc`,
its survivor SHA-256 is
`8cb38e9be1c6ef421f92e5611a2bf44092094841053462fbf505754cd69ccd91`,
and its reconstructed discovery-CNF SHA-256 is
`9f48ec2b759eb5d1d48d183a37966297ed2a2bd62c7d5ac0b18d76d0efa1363f`.
The survivor has one common-five core covering all 48 source orders:
`(a,x,b,c,y) = (4,2,11,5,8)`, using selected rows centered at `2`, `5`,
and `8`.

The survivor has been generalized source-cleanly rather than recorded as a
one-off 48-order table.  If `a,c` lie in the surplus block, `b` lies in the
first-opposite block, and `y` lies in the second-opposite block, then the four
positive row steps at centers `2`, `y`, and `c` force the core
`(a,2,b,c,y)`.  Direct boundary order supplies its reverse orientation and
reflected boundary order supplies its forward orientation; no relative order
of `a` and `c` is needed.
`ExactTwelveRigid221SurplusCrossBlockCommonFiveCertificate.lean` elaborates in
the isolated overlay and is pinned at 5,487 bytes with SHA-256
`b1b90652bd38b26dc9fe4302e5b0f25a8995d1c4eaaaa419075280a518d61e75`.
Its cell-1 adapter
`ExactTwelveRigid221StaticCell1SurplusCrossBlockCommonFivePositiveCut.lean`
is pinned at 1,890 bytes with SHA-256
`032c1e0a54e7900b579272b04f421acbf261b4e7b09075902bbefdfeeefea8fa`
and compiles rows `2`, `5`, and `8` to `(-157,-1032,-2065)`.  The append-only
proof-backed registry therefore has 67 entries and 73 authenticated Lean
sources.  This remains a finite cut producer: there is still no terminal
UNSAT, all-cell coverage, cardinality lift, proof-spine reduction, or live
`sorry` closure.

The r4 canary used the runner's pre-migration direct local CaDiCaL discovery
path.  Further exact-12 discovery runs are paused while this packet is onboarded
to the strict PIQD discovery adapter.  Terminal acceptance is deliberately not
being migrated: a reported terminal UNSAT must still be reproduced from the
identical materialized CNF by a fresh local proof-producing CaDiCaL run and
checked by `drat-trim` until the certificate authority contract is extended.

That onboarding gate is now green.  The additive adapter replaces only the
`proof_path = None` discovery call; the existing byte-identical local terminal
rerun and DRAT authentication remain unchanged.  A raw-DIMACS control pair
returned one total SAT model and one UNSAT verdict through PIQD with
byte-identical readback.  The adapter's local offline gate passed 13 focused
fake-transport tests, Ruff, and formatting checks before a live exact-12
formula was submitted.

The first attempted continuation also established an important journal rule:
the three-record r4 journal correctly fails chain authentication against the
67-entry source bank, because the append-only source addition changes the root
job identity from
`1ae46bfaa5e8b56e470659940df8319da6ee9a02824e4a6b24a1faf406fc93de`
to
`062fbc09b3859957294143d0ed0aff1ab0f624d95479a29915d981225a4299e9`.
No record was silently migrated across that change.  A fresh-journal live
canary then completed successfully: PIQD returned `SAT`, exact-CNF and static
witness replay succeeded, one source-order-positive cut was admitted, and the
new journal replayed exactly.  The authenticated work directory is
`scratch/exact12-cell1-opposite-apex-chain-v7-r5-fresh-piqd-canary-20260811`;
its journal SHA-256 is
`5a0374cd995a95c85ee55f1d97c208bca7931a71ccf7f5da366e6341d2e94c6e`,
and its terminal record is
`8e0afab2703cfffafc30506f9b5645e4d9e487487bb466a8a2d432c36115df16`.
The status is still `ITERATION_LIMIT`: this is a discovery-ingress checkpoint,
not terminal UNSAT, all-cell coverage, a cardinality lift, proof-spine
reduction, or live `sorry` closure.  The next exact action is a bounded
same-job continuation from this one-record journal, with theorem-bank mining
after each completed wave.

That bounded r5 continuation admitted two further proof-backed source-order
cuts and then stopped fail-closed on an unadmitted structural survivor.  The
three-record journal SHA-256 is
`871c1a6e85f9211cadef8bc282fcc317d26c02f4c1ea9cfe9da55c873928a553`;
the survivor SHA-256 is
`73c07a0fc95a326bc2238eb6cff46864d23a3627b44aaacb0573caba176fc7df`.
There is no terminal CNF, proof, or UNSAT result.  The mandatory general-theorem
mine found only already-banked cardinality-free contradiction consumers; it
found no source-clean producer or cardinality lift for `nextRowOnlyHit` or the
anchored parent.

The broader exact diagnostic did identify one clean next finite cut: all 48
source-entitled boundary orders are covered by the common-five core
`(a,x,b,c,y) = (6,1,0,2,11)`, using the three full selected rows at centers
`1`, `2`, and `11`.  The resulting source-clean Lean nogood
`staticCell1PostChainCommonFivePositiveNogood` elaborates directly and compiles
in cell 1 to `(-61,-155,-2803)`.  It is append-only bank entry 68.  This is a
finite exact-12 obstruction, not a universal producer or live closure.

The static coordinator now prepares and authenticates the immutable
source-order bank once per run, binds it to the exact materialized SAT instance,
and uses only precompiled subset matching in the per-model hot path.  Replay
prepares an independently authenticated bank against the shadow instance.  The
new immutability and instance-binding tests pass, and the 68-entry source bank
replays against 74 pinned Lean sources.  Because entry 68 changes the bank and
job identities, the next r6 PIQD canary starts from an empty journal; no r5
journal record is migrated across that boundary.

The empty-journal r6 live canary is green.  Its job id is
`dc8dd3f7efdce15c75eb622650d57ba8b4a02d4921e524326aeaab1bcb96c6c5`;
PIQD returned `SAT`, local exact-CNF and canonical-static replay passed, and
bank entry 63 admitted clause `(-61,-2239,-2994)`.  The one-record journal
SHA-256 is
`3d79c532d6f2a8ef0db77f8c2589283585b5521943f1c5f64a06ee5dbe89a7ab`.
The status is `ITERATION_LIMIT`, with no terminal CNF, proof, UNSAT result, or
live closure.  A bounded same-job continuation is now the exact next step.

That bounded r6 continuation is complete.  It admitted four authenticated
source-order-positive records and then returned another `SAT` /
`UNADMITTED_STRUCTURAL_SURVIVOR`.  Exact journal replay and canonical-static
CNF replay pass.  The authenticated work directory is
`scratch/exact12-cell1-opposite-apex-chain-v7-r6-piqd-wave1-20260811`; its
journal SHA-256 is
`42ab526a3ba7487b73a2a7de97c6f0fa5b29fa7995af4bef90300bf0302c4ace`,
its survivor SHA-256 is
`ab6a7a191d1eace9231e5fedc1a5802882566e4b103b88d234c8e7cce8082a27`,
and its exact reconstructed discovery-CNF SHA-256 is
`3f36edaccd484dc13116aa022fb8f7d5dc3fa7044f31352f1306cc505257d776`.
There is no terminal CNF, proof, or UNSAT verdict.

The survivor supplies a four-row, order-independent instance of the existing
cardinality-free `ThreeTriadCollisionCore`, with roles
`(A,B,C,D,E) = (5,8,6,11,10)` and selected rows centered at `6`, `8`, `10`,
and `11`.  The source-clean Lean consumer and source-order wrapper are in
`ExactTwelveRigid221StaticCell1PostCommonFiveThreeTriadPositiveCut.lean`;
the file elaborates directly and is pinned at 3,788 bytes with SHA-256
`1d59b0ed92417c9121619ad0e83fcc36c99ab5539f6672469b4d331e64c8f7d9`.
The authenticated structural replay has proof SHA-256
`7f7f22bc1a5d32577f06e88d9185bf306cbe6b84baa6232b601e14b04ac0afac`
and nogood SHA-256
`8ecf0ef078b2b31d48326929978a38560a601ba5b4ebc7519c03720b70059388`.
It compiles in cell 1 to `(-1451,-1957,-2672,-2955)` and is append-only bank
entry 69.  Focused source authentication, clause replay, bank construction,
and Ruff checks are green; the bank now has 69 cuts and 75 pinned Lean source
files.

The mandatory post-wave theorem-bank mine found no source-clean
cardinality-free producer that forces these four selected rows from the live
parent.  Thus the mathematical contradiction consumer is general, but its
current ingress remains a finite exact-12 computational producer.  This is a
stronger replayable refinement, not terminal UNSAT, all-cell coverage, a
cardinality lift, or closure of the anchored live `sorry`.  Because entry 69
changes the authenticated bank and job identity, the next cell-1 PIQD canary
must again start from an empty journal.

The empty-journal r7 canary and its bounded five-step continuation are now
complete.  The canary job id is
`032985d439b0c655b83a68a452399a6ccdc3cfbf33ff62d1d3b40fd1f80e3d4a`;
its one-record journal SHA-256 is
`88f22a13dc231617f2c1dc0c7943ff476a652ee929a3ac52ef5fad2d91fba03f`.
The continuation admitted five authenticated source-order records and then
returned `SAT` / `STRUCTURALLY_UNRESOLVED`.  Its work directory is
`scratch/exact12-cell1-opposite-apex-chain-v7-r7-piqd-wave1-20260811`,
journal SHA-256 is
`5542e8881945be9eb078a366667a15f27976898102c2b5261685b56502178df1`,
survivor SHA-256 is
`17c88e7dd312d537b6564b7372702a3fe6699df8e6ddabf49484ce2295041e59`,
and reconstructed discovery-CNF SHA-256 is
`5cf52b68429690270291a7ccddd02f41aa73a60909a0f6cca69da137d7994903`.
There is no terminal CNF, proof, or UNSAT verdict.

The mandatory ordered diagnostic covers all 48 source orders of that survivor
with three cardinality-free common-five consumers, each covering 16 orders:
`(a,x,b,c,y) = (3,10,5,6,4)`, `(3,4,5,6,10)`, and `(7,5,0,3,4)`.
Their finite ingress uses the five full selected rows centered at `3`, `4`,
`5`, `6`, and `10`.  The source-clean Lean wrapper is
`ExactTwelveRigid221StaticCell1LateThreeCoreCommonFivePositiveCut.lean`; it
elaborates directly, is pinned at 9,881 bytes with SHA-256
`4270d1b7a0f034176c42e3565f708b998df306b201cc31585d33fd8626efdb74`,
and produces certificate SHA-256
`4d0bbe8f74ddd0aa730ebfd73a1ece8d0cacd687e250514a6688c244a16f1b76`.
It compiles in cell 1 to `(-175,-554,-924,-1431,-2672)` and is append-only
bank entry 70.  Direct Lean elaboration and Ruff are green; focused replay and
full authenticated-bank checks are green (25 tests and 81 subtests).  The three consumers are
cardinality-free, but forcing their five selected rows is still an exact-12
computational ingress.  Therefore this is not terminal UNSAT, all-cell
coverage, a general-cardinality lift, or closure of the anchored live `sorry`.

The subsequent empty-journal r8 canary and five-step continuation exposed a
solver-ingress defect in that bank path.  Although the 70-entry bank was
rebuilt, authenticated, bound into the job identity, and used for typed
per-model matching, its clauses were not installed in the initial discovery
CNF.  Consequently r7 and r8 had the same 635,440-clause initial CNF with
SHA-256
`5cdfec59aae93a18a667338e7d412a01f1e3162d8f5685cc7a9285b9711d5c4a`.
The r8 continuation repeated the first five r7 cubes and then admitted entry 70
as its sixth record.  This is not a PIQD defect and does not invalidate the
proof-backed cuts; it shows that the purported static bank was functioning as
an authenticated lazy detector bank rather than as an eager SAT bank.

That eager-installation repair is now implemented in the v8/r9 runner.  The
authenticated 70-clause source-order suffix is installed before job identity
and discovery-CNF materialization, and replay reconstructs and attests the same
installation transactionally.  The fresh empty-journal local canary has 44,902
variables and 635,510 clauses, with root CNF SHA-256
`ab5bd9a69b0fafbc23cc4ebf9628563b64af5d36d44ff6bab4cf043bcbfa2282`;
this differs from the defective 635,440-clause r7/r8 root.  Its source-order
bank SHA-256 is
`56bce9e97c550ed7f4f992d01309d3e5b2ddf34dec360800dd737d6c81cd3d45`,
its exact 70-clause suffix SHA-256 is
`f2dd6292f9ff9ab232167e803577c33eff84bddb101092ed5b721f326d91de94`,
and its installation attestation SHA-256 is
`0f11bf677e07514090fcc074c37bc2f8ca51b4d48a83efcfc56a79232569fae4`.
The strict coordinator/PIQD wrapper is green with 34 focused tests, Ruff, and
format checks.

The first live PIQD v8/r9 iteration returned `SAT` /
`STRUCTURALLY_UNRESOLVED`, not terminal UNSAT.  All exact-CNF, candidate,
canonical-extension, and added-constraint replay gates passed; the journal is
empty, so none of the old lazily rediscovered source-order cuts recurred.  The
survivor SHA-256 is
`674a64e2af69d45eb397f5b1d9f44918ef4c16fe3fcb676ba0bae9e51d9179c8`.
The broader ordered diagnostic covers all 48 source orders with one common-five
core `(a,x,b,c,y) = (4,7,10,5,9)` using selected rows centered at `5`, `7`, and
`9`.  Its certificate SHA-256 is
`264281c3ca4b3fe639c70b5e7b5b6cfcf600dece176d0330e50c144df766e275`
and it compiles in cell 1 to the new clause `(-924,-1748,-2312)`.  That clause
is absent from the 70-entry bank, but the diagnostic currently has no generated
Lean nogood binding; it is therefore a candidate for theorem production, not
an admissible production refinement yet.  The cardinality-free consumer is
available, while forcing these three selected rows remains exact-12 ingress.
There is still no terminal CNF, proof, aggregate coverage, general-cardinality
lift, proof-spine reduction, or live `sorry` closure.

The theorem-production checkpoint has now converted that candidate into
append-only bank entry 71.  The source-clean Lean file
`ExactTwelveRigid221StaticCell1R9CommonFivePositiveCut.lean` is 4,650 bytes
with SHA-256
`6e0238189115f0d4252533aab8fc4de489531fb16adf3f5327d66e96186396ad`;
direct Lean elaboration is green.  Its generated binding authenticates exactly
the three selected rows above and replays to `(-924,-1748,-2312)`.  Installing
the resulting 71-entry bank gives bank SHA-256
`ebd33a1728ccd879365369c546f11d3b5471f6cde653047ddcc02058a4d4dccb`,
71-clause suffix SHA-256
`3505baab0583632884bb8ff2c3a03a077de2aba73e59cbf9f6f927c297011a33`,
installation SHA-256
`d7c70fb6e1eff1125ed994a95e92f75668a3386b05da87ee95173ccb6b45d526`,
and a 44,902-variable, 635,511-clause root CNF with SHA-256
`b0539d7604861ecf6c7c0d948e9ea74214f2a51c89a82d578c879e0920c20295`.
The next PIQD continuation therefore uses the fresh project namespace
`p97-exact12-next-row-static-cell1-v8-r10`; no v8-r9 root, job, descriptor, or
journal is a valid continuation input.  This is still one finite exact-12 cut,
not terminal UNSAT, aggregate coverage, a universal lift, or closure of a live
theorem.

The first live v8/r10 iteration likewise returned `SAT` /
`STRUCTURALLY_UNRESOLVED`, with every replay and provenance gate green and an
empty journal.  Its survivor SHA-256 is
`e7d117ef1d81ce1a4b7582130ab17d046bf3f2795002a6013966e6972be88248`.
The mandatory ordered diagnostic covered all 48 source orders, but required
the explicit disjunction of the two swapped common-five cores
`(6,7,4,9,11)` and `(6,11,4,9,7)`; the one-core formulation is not justified.
The diagnostic certificate SHA-256 is
`dca985bc9ff5893e2fd6198ab0f2cf40636bfe62759f47496776a98eacf16718`
and its exact cell-1 clause is `(-1748,-2309,-3008)`.

That result is now append-only bank entry 72.  The source-clean Lean file
`ExactTwelveRigid221StaticCell1R10CommonFivePositiveCut.lean` is 5,454 bytes
with SHA-256
`048d2f876c5b50536973d21b205f70dc9670518c9d526deef92582c8430d8494`;
direct targeted elaboration is green.  Its theorem exposes the required
two-arm orientation disjunction and its nogood binding replays exactly to the
clause above.  The complete strict coordinator/PIQD wrapper is green with 35
tests plus Ruff and format checks.  Installing the 72-entry bank gives bank
SHA-256
`bac52fca93b9e7f90c15cf1f78796e79880cdc4289b1a812fe8206edcabfa785`,
72-clause suffix SHA-256
`e45a320e8eb522afce1047b2b8f660b891442be3203bfa109ab1da5c6555623f`,
installation SHA-256
`cbad2dc5e5d23927d951ea62383debbdc3a0ac7066bc8bd566be9dce95c5f512`,
and a 44,902-variable, 635,512-clause root CNF with SHA-256
`66d03254dde7c37afd1155a2fb0bfae17839e251325f3c8c7c8194d5109b5dd7`.
The next live continuation therefore uses the fresh namespace
`p97-exact12-next-row-static-cell1-v8-r11`.

The accompanying general-theorem search found the cardinality-independent
consumer
`Problem97.U5QDeletedK4Class.three_exact_classes_tetrahedron_incompatibility`
and the nearby producer
`pentagonOffClassBlocker_xvDeletion_threeExactRows_common_u`.  The producer
supplies three exact rows and their common point, but does **not** supply the
five positive incidences needed by the common-five consumer (nor an equivalent
source-order theorem).  Existing `Census554` three-triad declarations are
finite-only.  Thus entries 71 and 72 are legitimate exact-12 refinements and
theorem-discovery data, but they do not provide the universal ingress/lift for
the anchored live leaf.  The next mathematical target is a source-clean
five-incidence or equivalent order producer from the anchored hypotheses; do
not promote a terminal exact-12 result as universal closure without that
theorem.

The first live v8/r11 iteration again returned `SAT` /
`STRUCTURALLY_UNRESOLVED`, with all replay/provenance gates green and an empty
journal.  Its survivor SHA-256 is
`dc3792133700d406c267091821883c864503d1cb6fe03325a47ccf60c9c8a81d`
and assignment SHA-256 is
`dfca46be3211b483c72caaca876fe8468383dbe07d0647b6d4fe6247a99cdb81`.
The structural detector found a four-row three-triad collision, while the
mandatory ordered diagnostic found a strictly smaller three-row common-five
nogood.  The latter covers all 48 source orders with the single core
`(a,x,b,c,y) = (8,10,5,6,11)`, has certificate SHA-256
`b33517d187f135a4982cce5a3fe8e9cad21799d59a181e3fe007ea7600dbec80`,
and compiles in cell 1 to `(-1433,-2672,-2958)`.

That stronger three-row cut is now append-only bank entry 73.  The source-clean
Lean file `ExactTwelveRigid221StaticCell1R11CommonFivePositiveCut.lean` is
4,688 bytes with SHA-256
`63718eee44aa8d97a427dbb64dd01a63493e1640100f268e79a76717003efb62`;
direct targeted elaboration is green.  Exact clause replay, Ruff, the fresh
73-entry bank build, and the complete strict wrapper (35 tests plus formatting)
are green.  Installing the bank gives bank SHA-256
`0248c81f9143d5b09c03d4b0481c841655defd0b50126105b9ba0ca11cab5253`,
73-clause suffix SHA-256
`0c97f202b8f44fd05b918236604a8dbf81d62aae59347fa2b96db416213ad1f1`,
installation SHA-256
`01b7598adefac5b86e11e9543353085719f4539256380799938a41bba3f1f937`,
and a 44,902-variable, 635,513-clause root CNF with SHA-256
`91bb17d7201e638239cb7f327cf7b989e95447047361e4484498451247eb90a2`.
The completed v8-r13 request was a genuinely fresh 600-second PIQD request.
It returned `SAT` in 1.3 seconds.  Its survivor SHA-256 is
`35c79bde18367524958963519ba46a72ed14434d17d4c4530799cd1b60c3b86b` and its
assignment SHA-256 is
`0d5197f4f0ced33cfe7f935e74b2388ed949343ca58258f86e3c7d22d5daea08`.
There was no terminal UNSAT, aggregate coverage, universal producer/lift, or
live closure.  No r13 root, job, descriptor, or journal is valid continuation
input for the fresh route below.

The fresh r14 route appends bank entry 74:
`ExactTwelveRigid221StaticCell1R13MixedSourceOrderPositiveCut.lean`.  Direct
Lean elaboration is green.  The source uses centers `0,2,3,4,5,10,11`, compiles
the clause `[-1,-155,-175,-554,-924,-2672,-2958]`, and is 10,233 bytes with
SHA-256
`5371965813d8d53001975d2a6a7a1bea3febd0c36250881b730785cbd4fde207`.
The exact 74-entry identities are: bank SHA-256
`23ba74539463389b7665f3b100646e95496b6c2dc0addbb8cbeb5f1542c3f0fc`;
base 44,902 variables / 635,440 clauses, SHA-256
`5cdfec59aae93a18a667338e7d412a01f1e3162d8f5685cc7a9285b9711d5c4a`;
74-clause suffix SHA-256
`2d17f16177376b1b5ed954dc715b846d29ac0a1d6d5dfa43bf3fe9c502b27b96`;
final 44,902 variables / 635,514 clauses, SHA-256
`d1a9f992afc89420c12bd42524f7b3f49a05390f33fc9c350455df232f18c2db`;
and installation SHA-256
`68fde4133262449bd2826ec5c8a395b89364fd2d3777ecb2cb4783f4b324f3d8`.
The new live namespace is
`p97-exact12-next-row-static-cell1-v8-r14`.  This remains finite exact-12
infrastructure only: there is no terminal UNSAT, aggregate coverage,
universal producer/lift, or live closure.  The universal producer/lift remains
the load-bearing mathematical target.

The r14 request returned `SAT`, with authenticated survivor SHA-256
`32b2dd81231f7b01bfd89328c4da56821e637a7c1f2cf3d78e9d395ed28d33b9`.
Its minimized obstruction is the single 48-order common-five core
`(a,x,b,c,y) = (4,7,10,5,9)`, using only rows centered at `5,7,9`.
`ExactTwelveRigid221StaticCell1R14CommonFivePositiveCut.lean` packages the
clause `[-924,-1748,-2308]` as entry 75; the 4,756-byte source has SHA-256
`689479a9b53010de095632125883da286705e90fac0aad84d7a04f3472f1bf4e`.
The ensuing r15 request installed the exact 75-entry bank (bank SHA-256
`7a7c7711563fe0fd082b6980718216b6f2f2b0d25eebe1b48d39b85becf1b716`;
suffix SHA-256
`89829efe56c1f57f671e1b26b21b999b4ca1b6a78caf9bf6a7718120f4ce7454`)
and submitted the 44,902-variable / 635,515-clause formula with SHA-256
`a9653b9070a0237d476845d35ba194e91455e06d0308db1b1d6c7e9d2b3d4d38`.

The r15 request also returned `SAT`; its authenticated survivor SHA-256 is
`c03359b36af09c5a2f6bf641f6b131a2e586e46e14af973264dc9aa8276c5017`.
Again a single three-row common-five core covers all 48 source orders, now
`(a,x,b,c,y) = (4,7,8,9,10)`. Entry 76,
`ExactTwelveRigid221StaticCell1R15CommonFivePositiveCut.lean`, packages clause
`[-1748,-2362,-2487]`; its 4,622-byte source has SHA-256
`f86d3ba815b41162d8370b690feade1dc971d7352c12c202a0fb5e97c460e811`.
Direct Lean elaboration, exact 48-order replay, focused registry/bank tests, and
Ruff are green. This remains a finite learned cut, not terminal UNSAT or a live
closure.

No unchanged r16 wave should be launched. A subsequent source-transport audit
rejected the initially proposed interpretation of this core as
`(xv,O,u,c,centerAt c)`. The finite labels are exactly
`(4,7,8,9,10)`: label `4` has no fixed named source role, and the rows centered
at `9` and `10` are rows of the generic faithful carrier pattern. The checked
next-row ingress does not identify these three finite rows with a conditional
consumer requiring only `O ∈ Kc.support` and `u ∈ Kc.support`. Entry 76 is
therefore only an authenticated finite cut. The ingress-differential audit is
now complete: the omitted finite consequence is the source-proved
`FrozenNamedDeletionSixArm` described in the 2026-08-11 checkpoint above. The
next checkpoint is an authenticated runner and bounded wave over the separate
72 placement-by-arm cells; the r15 core is not reinterpreted as source
geometry.

That checkpoint is now complete.  The additive arm runner binds each of the
12 ordered `(jointDeletion,v)` placements and six named-deletion arms to a
separate job, authenticates the complete source inventory, and replays the
source-faithful candidate, the base next-row constraints, the selected
named-deletion arm, and the exact CNF independently.  Discovery `UNSAT` is
accepted only after a fresh byte-identical proof-producing run and successful
DRAT verification.  Focused validation reports 21 tests plus 10 subtests and a
clean Ruff check.

Historical 72-cell direct-wave checkpoint: the wave at
`scratch/rigid221-sourceheavy-anchor/exact12-next-row-arm-direct-wave-20260811-v2`
returned 68 `SAT_WITNESS_REPLAYED` cells and four
`UNSAT_DRAT_VERIFIED` cells.  The finite UNSAT cells are indices
`52,58,65,71`: placements `8..11`, in the `xu_q` or `xu_w` arm whose omitted
label is already the placement's `jointDeletion`.  These four contradictions
are the direct consequence of the compiled physical-cycle row at the `xu`
blocker; they do not constitute a new general geometric obstruction.  In
particular, the source six-arm disjunction still has a SAT witness in at least
one other arm for every placement, so this wave neither proves aggregate
six-arm coverage nor closes the exact-12 child.

2026-08-13 terminal promotion of those four finite cells is complete.  Each
cell was revalidated fail-closed against a current-source rematerialization
(byte-identical CNF; drift confined to two pinned job sources, recorded in
the receipt), reproved with a fresh `cadical --plain` rerun (the wave proofs
hold 395 RAT lemmas in core and cannot enter the pure-RUP ingress), and
normalized to a dense pure-RUP source by
`scripts/prepare_exact12_next_row_arm_terminal_rup_source.py`.  The compact
windowed replay packages are installed under
`lean/.../FrontierLiveClosure/ExactTwelveRigid221NextRowArmTerminal/Generated/
Cell00{52,58,65,71}/` with per-package `ingress.py` provenance, and the four
endpoint theorems
`NextRowArmTerminal.cell00{52,58,65,71}_dimacsUnsatisfiable` each prove
`DimacsUnsatisfiable` of the exact serialized cell CNF with axiom closure
`propext, Classical.choice, Quot.sound, Lean.ofReduceBool,
Lean.trustCompiler` and no `sorryAx`.  These remain the same four
tautological finite facts described above: the promotion validates the
terminal ingress pipeline and adds no aggregate coverage, universal
producer, or leaf closure.

The then-mandatory gate was theorem mining over the 68 authenticated SAT
witnesses.  First test the existing exact-false metric and source-order banks
against those witnesses and record recurring replayed certificate families.
Only a source-clean predicate that eliminates surviving arms may authorize an
arm-aware CEGAR successor.  Do not reinterpret the four tautological finite
UNSAT cells as a universal producer, and do not expand the old 12-cell journal
under the new arm schema.

That theorem-mining gate has also completed.  The authenticated report
`postwave-theorem-search.json` replays all 72 arm jobs, all four terminal proof
custody records, and all 68 SAT source predicates.  Every SAT witness admits an
independently replayed `equality-duplicate-center` certificate when its selected
supports are interpreted as `exact=False`; no direct survivor reaches an
unclassified stage.  At that checkpoint this authorized an **additive
arm-aware structural CEGAR runner** using the existing exact-false detector and
proof-backed source-order bank.  It did not authorize importing the old
12-cell journals: the arm job
identity, independent arm replay, record schema, and terminal coverage remain
separate.  Run a small canary first, stop on any replay or detector repeat, and
only then launch a bounded parallel wave over the 68 nonterminal arm cells.

Historical additive-runner checkpoint: the structural adapter was implemented in
`exact12_next_row_arm_cegar.py` with arm-specific run and cut schemas.  The
historical 12-cell schemas and workdirs are not reused.  A cell-6 canary
replayed five consecutive SAT assignments through the candidate, base
next-row, named-deletion-arm, and exact-CNF gates, appended five
`equality-duplicate-center` cuts, and reproduced the complete journal and CNF
from a fresh materialization.  Its status is still `ITERATION_LIMIT`; the
canary proves the arm ingress and replay path, not finite UNSAT or leaf closure.
Same-arm resume copies are accepted only after full arm-schema journal replay;
cross-arm warm starts remain forbidden without independent rematerialization
and certificate replay.

The general-theorem audit of the 68 direct-wave SAT models found the same first
`DuplicateCenterCore` in every case: centers `2,3` with shared labels `0,1,4`.
All 68 existing structural certificates replay, in three row-set variants.
This is strong theorem-mining evidence and uses an already source-proved
carrier-level obstruction.  The subsequent static-equality work now provides
the source-side duplicate-center semantics, so the missing finite ingress is no
longer an invitation to learn the same cores one at a time.  It is instead an
authentication and formula-composition obligation: the named-deletion arm must
be reflected as an exact suffix of the frozen static/membership formula, and a
terminal result must be replayed by a Lean consumer for that exact clause order.

Historical pre-v4 arm-static cell-6 progression: the following 76--79-entry
counts and hashes record the predecessor canaries.  They are retained for
provenance and are superseded as the current status by the v4 checkpoint and
24-pattern family layer near the top of this plan.

Arm-aware structural CEGAR was therefore stopped after the bounded twelve-cell
pilot reached 240 authenticated records, all at stage
`equality-duplicate-center`, with no terminal cell.  Continuing cell 0 exposed
another shared-label variant rather than convergence.  No unchanged dynamic
wave is authorized.  The production route is now the eager formula

1. frozen static-convex plus block-spanning/ThreeTriad membership prefix;
2. separately authenticated named-deletion-arm clause suffix; and
3. a source-order bank rebuilt and installed after that suffix.

The historical membership installers authenticate their original parent
hashes, so the named arm cannot be inserted before them without invalidating
their contracts.  For arm cell 6 (placement 1, arm `u_q`), the frozen prefix has
44,902 variables and 635,440 clauses.  Appending the 867-clause arm suffix gives
636,307 clauses and SHA-256
`4f555b1bee7eea93706d7d92f19ebc30aafc45b85c9400db64b8b76622f00356`;
installing the initial 76-entry source-order bank gives 636,383 clauses and
final SHA-256
`979e8dee3a8eba9f0a37b9629e44c2349bb280b398c12e1e082e7fda1abbcb47`.
The authenticated canary for this formula returned a fully replayed SAT
witness and `STRUCTURALLY_UNRESOLVED`, not terminal UNSAT.  Mandatory
theorem-family search then extracted a three-row common-five source-order cut:
centers `5`, `6`, and `9` force core `(0,6,7,9,5)` over all 48 frozen orders,
with 24 direct and 24 mirror certificates.  The checked proof body is recorded
by
`ExactTwelveRigid221ArmStaticCell6CommonFivePositiveCut.lean`.  Appending that
cut as bank entry 77 gives 636,384 clauses and final SHA-256
`5b7703ae5dc77007653320957ae0235c46af5190303d258827a040feb930ba9d`.
That strengthened canary also returned a fully replayed SAT witness.  Its
mandatory theorem gate found no order-independent metric core but extracted a
second 48-order common-five cut: centers `2`, `3`, and `11` force core
`(5,11,0,2,3)`, with 24 direct and 24 mirror certificates and certificate
SHA-256
`b3bd1412377bfcb07e90258fc484fdefc32f26b4c1032edf842f8aa44fc6bb6e`.
The checked proof body is recorded by
`ExactTwelveRigid221ArmStaticCell6SecondCommonFivePositiveCut.lean`.
Appending it as bank entry 78 gives 636,385 clauses and final SHA-256
`fe78cb1be270ce053354f581c9c4e95912b48ea848432a3c7a2ccba6a7b088e4`.
That canary also returned a fully replayed SAT witness.  Its mandatory theorem
gate found no order-independent metric core but extracted a third 48-order
common-five cut: centers `1`, `3`, and `6` force core `(4,6,0,1,3)`, with 24
direct and 24 mirror certificates and certificate SHA-256
`2b0ba71e08c9395d75549709fec94910b5cefdcf0083e49559e51c743f0f9e0f`.
The checked orientation and equality-core proof are recorded by
`ExactTwelveRigid221ArmStaticCell6ThirdCommonFivePositiveCut.lean`.  Appending
it as bank entry 79 gives 636,386 clauses and final SHA-256
`d7f71ef4e105e1c9ce8d580abce3058031bfc1c1c328f8a077b1590e4a13de1f`.
These counts, hashes, and finite cuts are exact composition and theorem-mining
evidence, not terminal UNSAT or Lean closure.

Lean source semantics and parent-ingress declarations for the six named arms
have been written.  The exact-order one-arm consumer
`false_of_terminalStaticNextRowThreeTriadNamedDeletionArmBank` constructs a
source valuation for the historical production sequence above.  The current
formula additionally contains the 24-pattern surplus/apex-pair family, so its
exact Lean CNF bridge and terminal consumer must be extended before a terminal
artifact is promotion-ready.  The next fresh immutable-workdir canary uses the
strengthened 80-binding, 636,908-clause formula recorded at the top of this
plan.  Every further SAT result must again pass theorem-family mining before
another solver wave is authorized.  Even verified finite UNSAT remains bounded
evidence until that exact Lean ingress and complete six-arm/placement coverage
are checked.

The four-row structural certificate could separately be formalized through
`SourceOrderPositiveNogood.ofThreeTriadCollisionCore` and
`Census554.ThreeTriadCollision.not_realizes_of_threeTriadCollisionCore`, but
its clause is weaker than entry 73 on this survivor and is therefore not being
added merely to duplicate coverage.  A fresh universal theorem-bank audit also
found no declaration deriving either that three-triad core or the required
common-five incidences from the anchored Rigid221 hypotheses.  The nearby
`pentagonOffClassBlocker_*_threeExactRows_*` declarations are finite producers
of three exact rows; their tetrahedron declarations consume the missing
cross-center incidences rather than produce them.  This leaves the universal
producer/lift as the load-bearing mathematical target even if the finite r14
campaign eventually reaches terminal UNSAT.

The mandatory theorem-mining pass over the diagnostic wave failed closed before
writing an aggregate report, but the follow-up audit established that the cell-4
journal is internally valid.  Its first record carries the wave-authenticated
source-order-bank SHA-256
`f5732fc392792362df145b999c4fe739f931d4329c46d8bde7038ac2b85db5d6`,
whereas the live bank changed after the new cell-1 proof-backed binding was
appended.  Replaying all 400 records against the wave's authenticated bank
digest succeeds.  Thus the validator correctly rejected stale provenance; the
postwave wrapper was at fault only for hiding the underlying hash mismatch.
Historical theorem mining must use the authenticated source snapshot (or a
fresh wave), never rewrite the journal's source hash.  The wrapper now includes
the underlying replay error in its fail-closed message.  This audit is not a
theorem-search result and supplies no closure claim.

Five-omission v3 checkpoint (2026-08-10): the authenticated twelve-shard wave
completed 275 local refinements in every deleted-label shard.  Every run ended
`ITERATION_LIMIT`, with no terminal proof.  Each run produced 259
duplicate-center, 14 equilateral-bisector, and two equal-K4 cuts (aggregate
3,108/168/24).  A compact layered successor keeps the 441-cut frozen bootstrap
separate from 275 distinct new local cuts, with zero overlap, and exposes their
716-cut union only as a derived projection.  This is replayable finite
structural evidence, not terminal UNSAT, a universal producer or lift, or live
Lean closure.

Exact-12 v17 SAT-stop theorem-mining checkpoint (2026-08-12): the v17 canary
returned `SAT_WITNESS_REPLAYED` and was classified
`STRUCTURALLY_UNRESOLVED`. The mandatory theorem-mining pass found a selected
24-role, source-clean apex-first/surplus/second common-five family; its
common-five coverage accounts for all 48 source orders. The Lean source
theorem and CNF binding are
`ExactTwelveRigid221ApexFirstSurplusSecondCommonFiveCertificate.lean` and
`ExactTwelveRigid221ApexFirstSurplusSecondCommonFiveMembershipFamilyCnf.lean`.
The new bank has 45,277 variables and 643,379 clauses, with DIMACS SHA-256
`18f09d0b8a854cfbe0783c6f84130366dc90011b25ce816eaeb8cdd5b8000ea8`. With
the arm and order suffixes, the final formula has 644,327 clauses and DIMACS
SHA-256
`57bfa7269a86b09ad2f63b5c882145fd3f55b77e31da866b227e2663f48c740b`.
This is theorem-bank refinement, not terminal UNSAT, general-n closure, or
live closure. The source theorem and CNF binding pass the governed targeted
Lean build and the explicit axiom audit contains no `sorryAx`; the CNF checks
retain the repository-governed `Lean.trustCompiler` footprint from
`native_decide`. The focused bank suite passes 6/6, the v5 fake-solver runner
suite passes 10/10, and Ruff is clean. An independent semantic audit found one
permissive unknown-variable fallback; it now maps to the impossible
center-self requirement and has a source proof that every
`FrozenSafeCubeOK` row rejects it. The solver stop rule remains in force
through commit and push of this checkpoint. Once published, this broad checked
family may authorize exactly one successor canary; that canary must again stop
on SAT for all-order theorem mining or on UNSAT for terminal RUP production.

Exact-12 v18 SAT-stop theorem-mining checkpoint (2026-08-12): the one
authorized v18 cell-6 successor canary returned `SAT_WITNESS_REPLAYED` and was
classified `STRUCTURALLY_UNRESOLVED`.  The final v5 formula had 45,277
variables and 644,327 clauses with DIMACS SHA-256
`57bfa7269a86b09ad2f63b5c882145fd3f55b77e31da866b227e2663f48c740b`;
the replayed survivor SHA-256 was
`298bfee77e52186588b96c46acac60c1aa7e5e06f0c319a41f4e18307da319db`.
All source-candidate, named-arm, complete-CNF, and canonical-static-extension
replay gates passed.  There is no terminal proof artifact.  The mandatory
all-order pass covered all 48 frozen orders with one common-five core
`(2,0,3,9,11)`.  Its embedded certificate SHA-256 is
`28f54643fc21f9392a42e21505fa58745ff59da2f8345dfa1d24d2fe00ed6a8f`,
while the containing JSON artifact has SHA-256
`6715879ab1e5a3f2e80eb63d91a8cd86dadbd4078b2121b6ab2958da112ae5fd`.
It mined the 24-role source-clean family
`b ∈ {3,4,5}`, `c ∈ {6,7,8,9}`, `y ∈ {10,11}` with positive
selected rows `0:{2,b}`, `y:{2,b}`, and `c:{0,b,y}`.  The source theorem
checks both frozen boundary orientations and feeds the existing convex
common-five contradiction.

The v18 family is now represented by
`ExactTwelveRigid221SecondApexSurplusSecondFirstCommonFiveCertificate.lean`,
its explicit Lean CNF semantic binding, and a Python bank implementation that
authenticates both Lean roots.
The binding reuses exactly variables `44903`--`44905`, allocates the 30 fresh
variables `45278`--`45307`, and emits 24 blocks after 30 fresh plus 3 reused
definitions, a 426-clause delta.  Current source constants freeze the resulting
prefix at 45,307 variables and 643,805 clauses with DIMACS SHA-256
`fcf2a28e970cfc3cdc7b831a54ea68617eb1e65eeea8de64a7bc329a76d67e9e`;
the delta, compiled-payload, role, and bank SHA-256 values are respectively
`d8031ca31bb6b5774a4b0d3c9ac40e5996b1d9a0c1ec0311450f4ac59a149561`,
`6212b4d6eda2c42e2eeac1166d70630eec570bcc39eaca94eb8d8cfbbcc965e6`,
`2642abc7fd08eb33a1d02b49e3eadd493bfea095d0b27a837d26f141e6291729`,
and `1e5f9ae70d15fddf80e5ad2b4736db6d3c889fa23c0d0a67eb190a9ea5c30347`.
Current runner schema v6 source installs and re-attests this bank before the
unchanged 867-clause named-arm suffix and 81-clause source-order suffix.  Its
post-arm and final DIMACS SHA-256 values are
`fb309c981015de11aa446a96df537144aded81f2a314bcb471e908c101b81133`
and `93f44e0f19ba9a4b9c207a01abb96b47f4d0642f7dcee002b11c2f31f6007913`;
the expected final formula has 644,753 clauses.  These v18-prefix and v6-final
identities are frozen source expectations, not artifacts from the earlier v5
SAT-stop workdir; the first real v6 canary remains the runtime acceptance gate.
The first published v18 Lean CNF bridge was **not** semantically sound: all 30
fresh variable numbers were permuted relative to Python's allocation order,
and the emitted requirement-block order also differed.  PIQD replay could not
detect that cross-language error because the submitted Python DIMACS bytes
were internally consistent.  The bridge is now corrected to Python's exact
allocation and normalized block order, and it exposes an exact
`blockingClauses_eq` theorem.  A new regression parses every Lean
`(variable, center, support)` definition and all 24 blocking clauses and
compares them, in order, with the Python compilation.  That repaired focused
bank suite passes 7/7 in 450.19 seconds and Ruff is clean.  The changed Lean
source manifest accounts for the corrected bank SHA-256 above; the DIMACS
delta and final formula identities are unchanged because Python had emitted
the intended formula throughout.  The source theorem's explicit axiom audit
has no `sorryAx`; the CNF binding retains only the documented `native_decide`
compiler-trust footprint beyond standard axioms.  Earlier v18/v6 source
manifest and runner records that name the defective Lean bridge are retired
as promotion artifacts even when their raw CNF hash still matches.

This remains a finite exact-12 theorem-bank refinement.  It is not terminal
UNSAT, all-arm coverage, a general-cardinality lift, or live closure.  The
anchor still forwards to four open children: two exact-12 leaves and two
cardinality-at-least-13 leaves.  A successor canary is authorized only after
the repaired bridge, its cross-language regression, and the successor
bank/runner checkpoint are committed and pushed; it must again stop on SAT for
all-order theorem mining or on UNSAT for terminal proof production.

Exact-12 v19 diagnostic result (2026-08-12): before the bridge defect was
found, one v6 cell-6 canary used the same 45,307-variable, 644,753-clause raw
CNF and returned `SAT_WITNESS_REPLAYED`, classified
`UNADMITTED_STRUCTURAL_SURVIVOR`.  The job id was
`fed61fb72d3d7f6330a41d02a80953aee69214a36b8b602e06602177b937e1ba`;
the replayed assignment SHA-256 was
`02f517a24a53f7e9edfa56258010dfe03bbffdbde20043552ea702bd9aee2d40`.
There was no terminal proof artifact or Lean ingress.  All-order mining covered
all 48 source orders by convex common-five orientation and found four cores.
The primary core is `(a,x,b,c,y) = (0,6,10,2,3)`, requiring selected rows
`2:{3,6,10}`, `3:{0,10}`, and `6:{0,10}`.  The embedded certificate SHA-256 is
`460ccb1222553275300534d0003d22ecb44167a953bf7caf3dbc0d33d8ce6b20`;
the containing artifact SHA-256 is
`d40553e41c879660db1b33375c65f2dbeb0dbcc8aea943de7e73503833a54268`.
Because the Python formula itself did not change, this remains valid finite
theorem-mining evidence.  Because its source manifest authenticated the
defective Lean bridge, it is not a promotable source-to-Lean certificate.

Exact-12 v20 source and semantic-ingress checkpoint (2026-08-12): the v19
primary core has been generalized to the 24 roles
`x ∈ {6,7,8,9}`, `b ∈ {10,11}`, `y ∈ {3,4,5}`, requiring selected rows
`x:{0,b}`, `y:{0,b}`, and `2:{b,x,y}`.  The source theorem checks the two
frozen boundary orientations and derives the existing convex common-five
contradiction.  Its `SourceOrderPositiveNogood` constructor has only standard
core axioms; the exact CNF consumer additionally has the repository-governed
`Lean.ofReduceBool`/`Lean.trustCompiler` footprint from `native_decide`, with
no `sorryAx` in either audit.

The v20 bank reuses variables `45167`--`45174`, allocates fresh variables
`45308`--`45337`, and adds 30 definitions plus 24 blocks to the repaired v18
prefix.  The frozen result has 45,337 variables and 644,063 clauses with
DIMACS SHA-256
`4f4314afc7c11b672655f6c67ea48286fc0adc3ae1d54f0e41f65c903947aed5`.
The delta, compiled-payload, role, and bank SHA-256 values are respectively
`f511a76eec4163417ed58ed06b06221875a7d7318e7198b3b16ebdde76c858bd`,
`e3ec43d05e335ac4c7e24828677afc8674e87c3da074a94864e7372fd22c8863`,
`cde3ccc0e4b90052ba7cae5ce7669919fc992e416657d9a41df0c2ff9edea72c`,
and `fa032aeb2a403dd8fbffac84a48e27e2bd2208b862097f48c13dab0ffd1cf91a`.
Its focused suite and separate exact semantic-lock rerun are green: every Lean
fresh and reused variable binding and all 24 blocking clauses agree in order
with Python.  Runner schema v7 now installs and re-attests the v20 bank before
the unchanged 867-clause named-arm suffix and 81-clause source-order suffix.
The post-arm formula has 644,930 clauses with DIMACS SHA-256
`0066a25a45828e1a230c1fbef77fe159dc5e0dc6d4d914db92d21f00530c17bc`;
the final formula has 645,011 clauses with DIMACS SHA-256
`2fca0633a644f0dbe3d8cfc0d25c716575ba69484a0f1f38f7b7724fcfdb1e67`.
The focused no-solver/fake-solver runner suite passes 10/10 and Ruff is clean.
The v3 all-order miner now requires the v7 schemas and authenticates the v20
bank artifact.  No successor solver has been launched, and this is not
terminal UNSAT, general-cardinality closure, or a live `sorry` reduction.

Exact-12 v20 diagnostic result and v21 ingress checkpoint (2026-08-12): the
sole authorized v20 cell-6 canary returned `SAT_WITNESS_REPLAYED` and was
classified `STRUCTURALLY_UNRESOLVED`.  Its job id was
`5dae106ba07e4782ef1d61593ec10f80b72b26398bc8a2c539104b52253a2a1f`;
the authenticated job, assignment, survivor, and discovery-CNF SHA-256 values
were respectively
`208d858a325d96121bc61f6cbd1bcf38461b7eaa1debd363d5be86e4a2f622b5`,
`6e90856d4f749264bb2443a89a05ed5c5ed2aa23c62af6e5729fb69c59399f1b`,
`2fa17b90d7ef784a36f45a5f63e9faf09e86470016079e7e500fea5f3e858060`,
and
`2fca0633a644f0dbe3d8cfc0d25c716575ba69484a0f1f38f7b7724fcfdb1e67`.
There is no terminal proof artifact.

The mandatory all-order pass covered all 48 source orders with the same
common-five core `(a,x,b,c,y) = (10,5,2,9,0)`: 24 forward and 24 reverse,
equally split between the direct and reflected source orientations.  The
certificate and containing-artifact SHA-256 values are
`ffbfbfe5546caf71ca590ba8459f0b84c05baf7af2c2dd21d7aa2a57916aef66`
and
`f8c393b976e445eeade8d51114d90b3144a60cb263d7d9c3a3aa3710a893cf77`.
This mined a source-proved 24-role family with `a ∈ {10,11}`,
`x ∈ {3,4,5}`, and `c ∈ {6,7,8,9}` requiring selected rows
`a:{2,x}`, `2:{a,x}`, `0:{2,a}`, and `c:{0,2,x}`.  The Lean producer checks
both frozen boundary orientations and feeds the existing convex common-five
terminal.

The v21 CNF bridge represents the two center-`c` pair requirements by their
equivalent triple requirement.  It reuses exactly six authenticated parent
variables `45302`--`45307`, allocates twenty fresh variables
`45338`--`45357`, and emits 120 source-faithful implication clauses followed
by 24 four-literal role blocks.  The frozen prefix therefore has 45,357
variables and 644,207 clauses.  Its DIMACS, delta, compiled-payload, role, and
bank SHA-256 values are respectively
`ee31f59067eb0dc9140e0a9a4cc1a5fd077154c2b8f54910ed42162ff95adc9c`,
`596466a1a6131c08c073a560bb5c14cdcd352abf21446cede380b0425b49794b`,
`b199915ca71557108ff1574fc694a7341edbf8014fd4c45844640f409e59a35d`,
`68b644141ef61f37beef118890d5164b63d10d1e0845b9007a1dd91861c7151b`,
and
`3e717aebe7ad5f614123461f2e1f10c0315f0c8308d56c3808426a61457227dd`.
The compiler rejects requirements with no candidate realization, unexpected
fresh-variable reuse, or drift in the exact inherited variable identities.
Runner schema v8 installs and re-attests this bank before the unchanged named-
arm and source-order suffixes.  The post-arm formula has 645,074 clauses with
DIMACS SHA-256
`1d7ef9f39e6c6c2127599ef7911d1535d36028fe22038d72b5a4eff10e5e05a3`;
the rebuilt source-order bank has SHA-256
`84d27968cd8becaa9fe56e67839f3b54e6da53acd76f4f8ea700f0288f0377e5`;
and the final 645,155-clause formula has DIMACS SHA-256
`a69826e5588cad4f42ab1d23edd3e20378ae4a21ff8dc43b616c4e9c4be53c6d`.
The exact bank suite passes 6/6, including literal Python-to-Lean comparison
of all 120 implications and 24 blocks, zero-candidate rejection, tamper
rejection, and rollback.  The no-solver/fake-solver runner suite passes 10/10;
targeted Lean elaboration and the recorded axiom-boundary checks are green;
and an independent source audit found no parity, fail-closed, runner, or PIQD-
contract defect.  Its documentation-freshness finding is resolved by the v21
supplement in
`docs/specs/p97-exact12-next-row-static-piqd-discovery-v1.md`.
This checkpoint remains finite theorem-bank refinement: it is not terminal
UNSAT, all-arm coverage, a general-cardinality lift, or a live `sorry`
reduction.  The cross-language parity, rollback, runner, Lean, axiom,
documentation, commit, push, and independent-audit gates are green in pushed
checkpoint `6746daca`.  Exactly one v21 cell-6 canary is therefore authorized.
It must stop on the first authenticated SAT or UNSAT result: SAT returns to
all-order theorem mining before any successor formula, while UNSAT enters the
separate byte-identical local proof-producing terminal path.

The first authorized v21 launch stopped before PIQD submission and therefore
produced no solver result.  The producer computes its root and suffix record
identities with sorted, indented JSON plus a trailing newline, while the new
adapter initially rechecked them with PIQD's compact canonical-JSON digest.
That serialization mismatch rejected the otherwise canonical root job before
any external state change.  The adapter now validates producer-owned root and
suffix identities with the producer's established `_json_sha256` convention;
the PIQD discovery descriptor uses compact canonical JSON plus one trailing
newline, while PIQD manifest and receipt self-hashes use compact canonical JSON
without that descriptor newline.  The synthetic adapter suite passes 8/8,
Ruff is clean, and a real v21 materialize/build-job/build-descriptor integration
test passes.  The
repair does not migrate producer hashes or enlarge PIQD's trust boundary.
After this repair is independently audited, committed, and pushed, exactly one
retry of the identical v21 cell-6 formula in a fresh immutable workdir is
authorized.  No successor formula is authorized by this pre-submission failure.

Exact-12 v21 diagnostic result and v22 proof-family checkpoint (2026-08-12):
the authorized identical retry completed through PIQD as
`SAT_WITNESS_REPLAYED` and `STRUCTURALLY_UNRESOLVED`.  The producer job id was
`2c342b3c672e5dc95241a88fb98716bb646689c86c3e841b0e3c536c46e1d29a`;
the PIQD job UUID and identity were respectively
`88592318-8532-4d9b-96bc-a43c7b7a9827` and
`f25cfc3593f9cf823cb501cfdbb0fd1fed576fba885a4bf25579e5a39176f05c`.
The authenticated job and survivor SHA-256 values were
`daa8532b0c5bea5acde90e52a2a6eafd993097f79f10e1170dc1487ea1d0f246`
and
`4ee0e843295f47a961a5256247813e6a97318b882451263f03ede5432afd32f0`;
all exact-CNF, canonical-extension, candidate, added-constraint, and named-arm
replay checks passed.  The formula was the byte-identical 645,155-clause v21
formula with SHA-256
`a69826e5588cad4f42ab1d23edd3e20378ae4a21ff8dc43b616c4e9c4be53c6d`.
There is no terminal verdict, proof, or Lean ingress.

The mandatory all-order pass covered all 48 source orders by the convex
common-five rule: 24 forward and 24 reverse, equally split between direct and
reflected source orientations.  Its primary role assignment is
`(a,x,b,c,y) = (7,10,4,6,11)`, with selected-row requirements
`c:{b,x,y}`, `x:{a,b}`, and `y:{a,b}`; swapping `x` and `y` gives the second
recorded closure certificate.  The certificate, containing artifact, and
mining-summary SHA-256 values are respectively
`7f08558037c21a73a307b9f59d244a525722ad65abf464bec0b57c64afc24247`,
`ed4aec7de66d5511041964ac176fa71173121faf3432f8670b04711f5cbafea5`,
and
`be527d8fbdc32c0a05eb93cbfa7c34dae2069e7ae0f76e63f9467c9de6c9a04f`.
This is finite diagnostic evidence only: the miner emitted no Lean nogood.
Before any v22 solver launch, these three row requirements must be generalized
over their source roles, proved against both frozen boundary orientations,
compiled into a Python/Lean-parity-checked membership-family bank, and
installed with fail-closed source-manifest authentication.  No successor
formula is authorized until that proof-carrying cut is complete.

That v22 promotion gate is now complete.  The source-clean Lean theorem
`FrozenBoundaryOrder.commonFiveOrientation_firstOppositePairSurplusSecondOpposite`
proves both boundary orientations for every one of the 48 source roles, and
`SourceOrderPositiveNogood.ofFirstOppositePairSurplusSecondOppositeCommonFive`
exports the corresponding source-order nogood.  The mixed membership-family
bank reuses the 24 already authenticated variables 45,201--45,224, defines
12 new variables 45,358--45,369, emits 96 explicit definition implications
and 48 three-literal blocking clauses, and therefore changes the frozen bank
from 45,357 variables and 644,207 clauses to 45,369 variables and 644,351
clauses.  The 144-clause delta SHA-256 is
`6c7cbf33dfda08ee20db8a880feeb32914d2a180a9d63d5d89943a43698ae098`;
the final DIMACS, compiled-family, role-table, and installed-bank SHA-256
values are respectively
`082162cdbee0f545dab56035ea768e3ad37ce06b9fb580c568781fd63b0d1200`,
`fbeff8c5164367c737c5793850ac153bb76f00f536a9cc8b51a5cd5c01776b77`,
`bc988efc9807e393faefdd67c31dfabc1c48c066f49f44747a8592a10540862f`,
and
`5d6333590a1289f9346ef38135872afb368e82f3f20aad6e66c5b753d204be21`.
The exact Lean bridge and source consumer pass targeted elaboration with no
`sorryAx` (under the already governed native-decision trust boundary).  The
focused Python suite passes 4/4 after reconstructing the full authenticated
parent chain; it compares every fresh definition, implication, and blocking
clause against Lean and tests source tampering, reuse, installation, and
rollback.  Ruff check and format check are clean, and an independent
read-only implementation audit found no defect.  This authorizes exactly one
bounded v22 cell-6 successor canary after the checkpoint is committed and
pushed.  It remains a finite proof-carrying refinement, not terminal UNSAT,
all-cell coverage, universal promotion, or closure of a Lean `sorry`.

The v22 arm-static canary integration advances both producer schemas to v9 and
binds the complete new family source manifest into the job, discovery
descriptor, required-artifact inventory, and published run manifest.  Its
frozen post-arm formula has 45,369 variables and 645,218 clauses with SHA-256
`3a58f8f21e1c23ecd78c76f17872ca7cb1065f58ebddb9225ec1acdc9f4f266a`;
the final source-order formula has 45,369 variables and 645,299 clauses with
SHA-256
`d77aec4a937245dc6f0330969ccbf9c07bb2317a5e83c2b0602a5ca2d5be9b3b`.
The launch gate requires both the full frozen-identity reconstruction and the
fail-closed job/artifact-binding test to pass after this schema change.  Its
first quiescent reconstruction passed every source attestation but failed
closed because a frozen parent-bank hash still named pre-reauthentication
bytes, while the exact CNF identity remained unchanged.  The complete
producer chain was then reauthenticated by 13 hash-pin substitutions across
nine files and committed and pushed as `41d65924`.  In an exact-SHA detached
worktree, the frozen reconstruction and job/artifact-binding canary now passes
(`1 passed in 997.05s`), and all nine shared files byte-match that green
worktree.  The current-tree fast PIQD/runner gate passes 13/13; a broader local
wave-tool regression passes 113 tests and two subtests after updating two
stale permission fixtures to the required mode `0700`.  These are ingress and
regression results, not solver results, and no v22 PIQD job has yet launched.

The separate PIQD release hold is discharged.  PIQD commit `419f845` moved each
solve onto a private content-address-verified CNF snapshot and re-hashes that
same snapshot before and after solving and during result confirmation.  The
current live daemon, SHA-256
`1b2a6653620bc12d5ecc2ba2f711d433bd9c45d97afe87d93135673f76d23090`,
also evaluates every reported SAT model clause-by-clause against that verified
snapshot and binds the proof pointer atomically to the verdict that minted it
(commits `0e341d3` and `24bb000`).  These daemon checks supplement rather than
replace the P97 adapter's independent complete-CNF and source-semantic replay.
The only remaining launch hold is the arm owner's rebased immutable v9
arm-plus-aggregate gate on top of `41d65924`.  Once that gate is green, exactly
one fresh immutable cell-6 v22 canary is authorized.  A SAT result triggers the
mandatory all-order theorem-mining stop; an UNSAT result triggers a fresh
byte-identical terminal proof-producing replay.  Neither result authorizes an
unchanged successor wave or a twelve-cell run automatically.

A separate pre-publication audit of the new wave-level postprocessors found
that they are not yet admissible as authentication boundaries.  The structural
postwave currently derives terminal-UNSAT aggregates from status labels without
independently checking the terminal CNF, DRAT, and verified-verdict artifacts;
the generic and arm SAT postwaves trust declared replay flags without fully
rebinding each positive assignment to the authenticated source manifest and
exact CNF.  Their link-custody checks are also weaker than the fd-anchored v21
static-workdir validator.  These defects do not alter the authenticated v22
canary runner/gate, but the v21 validator's frozen constants do not validate a
new v22 result; a versioned v22 outcome validator or equivalent independent
replay is required before publication.  The postprocessors remain prohibited
until independent CNF/model/proof replay and adversarial symlink/hardlink tests
are green.  No wave-level terminal or theorem-mining aggregate produced by the
current drafts may support promotion.

The card-at-least-13 producer audit has likewise narrowed the open source
contract.  No existing source-clean lemma derives any of the five positive
cross-incidences required by the current two residual leaves.  In the concrete
`c1 ∉ BO` arm, the new downstream theorem
`xvDeletion_c1_not_mem_BO_yields_self_commonDeletion` composes the existing
three-exact-row theorem, selected-four-class conversion,
survival-under-erase theorem, and common-deletion constructor to prove a
nonempty `CommonDeletionTwoCenterPacket D Hlate c1 c1 O`.  Its targeted module
build is green and `#print axioms` reports only `propext`,
`Classical.choice`, and `Quot.sound`, with no `sorryAx`.  This is progress but
not an eliminator: its first center is the deleted point `c1`, leaving only
`O` as a retained surviving center, so neither global minimality nor the
five-center terminal consumes it.  The next exact producer target is therefore
a retained continuation

The tempting physical-second-apex dispatch is not a closure shortcut.  A
checked coordinator-level probe can split this packet with
`physicalSecondApex_commonDeletion_robust_or_critical` and send the two arms to
`false_of_exactFourPhysicalConsumerRobustOutcome` and
`false_of_exactFourPhysicalConsumerSwappedUniqueFourOutcome`.  Those consumers
are defined later in `Rigid221Closure`, however, so the two source leaves in
`Rigid221SourceHeavy` cannot call them without an import-cycle refactor.  More
importantly, the fresh anchored spine currently reaches the two unbounded
missing-incidence `sorry`s, whereas that redirection would reach three distinct
open robust/swapped terminal declarations.  It would therefore source-close
two declarations while increasing this anchor's transitive frontier from four
to five total `sorry` declarations.  Do not promote that redirection as proof
progress; first prove a retained continuation or a strictly smaller clean
consumer.

```lean
∃ (d : ℝ²) (hdA : d ∈ D.A),
  d ≠ c1 ∧ d ≠ S.oppApex2 ∧
  HasNEquidistantPointsAt 4 (D.A.erase c1) d
```

equivalently, a retained center distinct from `c1` and `O` whose exact-four row
omits `c1`.  The generic minimality escape theorem does not provide the omitted
incidence, so it is not this producer.  Even this retained continuation must
subsequently feed a proved `MetricCoreAlternative`, third-bisector,
three-point-overlap, or saturated-fiber comparison before the residual can be
called closed.  The companion `u`-deletion arm also cannot use the generic
three-row producer without the currently unavailable `not survives xv`
ingress.  These are producer obligations, not routes already closed by the
existing packet constructors.

Exact-SHA launch and producer-audit checkpoint (2026-08-12): the launch base is
now commit `340965af3953e534dd814e7b0152fcf0a7ce7443`.  In a detached worktree
at that exact commit, 38 non-custody validator and postwave tests pass.  The two
preserved-v21 custody tests also pass when code from that exact commit validates
the original authenticated inode.  Copying the 102 MB workdir into the detached
worktree changes the inode and is rejected by those two tests, as required by
the fail-closed custody contract.  The focused exact-SHA arm-static gate then
passed, and exactly one immutable v22 cell-6 canary was launched from source
commit `f4f68481`.  Job
`18ee49e2aae3d1642f8aef7f8bd20e60ddfd7b7f5c4dc7dd3885c1b40043af81`
returned `SAT_WITNESS_REPLAYED` and was independently classified
`UNADMITTED_STRUCTURAL_SURVIVOR`.  Its minimum four-row certificate is an
`equality-three-triad-collision` core with roles
`A=8, B=5, C=7, D=10, E=6`; all six recorded equality paths replay directly.
The dynamic structural journal remains deliberately non-admissible in Lean:
it proves finite Python replay, not a typed positive-membership theorem cut.

The mandatory post-canary theorem mine found a source-order-independent
positive-membership family.  Pairwise-distinct `a,c,e` range over
`{6,7,8,9}`, `b` ranges over `{3,4,5}`, and `d` ranges over `{10,11}`.  The
four normalized requirements are

```text
b:{c,d}, d:{b,a}, c:{a,d,e}, e:{a,b,d}.
```

There are 144 role assignments.  The source-clean Lean producer
`SourceOrderPositiveNogood.ofSecondOppositeTripleSurplusFirstOppositeThreeTriad`
has been written and passes targeted elaboration; it uses only positive
selected-row membership and the checked `ThreeTriadCollisionCore`, not exact
fibres, source order, or convexity.  The first development probe confirmed 144
logical requirements, comprising 24 inherited predicates and 120 fresh
predicates, but an audit caught that its fixture stopped at v21 despite the
probe's post-v22 label.  Its CNF counts and hashes are therefore diagnostic and
must not be used as successor-bank pins.  The corrected exact-SHA compile now
explicitly installs the authenticated v22 parent and passes.  It starts at
`45,369` variables and `644,351` clauses, reuses 24 definitions, allocates 120
fresh variables, and appends 1,752 clauses, ending at `45,489` variables and
`646,103` clauses.  Its canonical delta SHA-256 is
`9030716a4eb59b31ed676486d481d7a41e5513aaac61eac2767287a3f3fb0496`;
the final DIMACS SHA-256 is
`dc63ac918ed05c66cb9207f05219f66b2ad1df0310537bad1c3028abe980c300`;
The development probe's tuple-list serialization of the 144 roles has SHA-256
`bf9f4b05ac59d1922a19589eb73b8e775d6a15d2080edd46ce1e428a08dfd42d`;
the production bank's canonical keyed-role serialization instead has SHA-256
`0e938ed52472210000f82a509a79fb72a8bb76d4620011fcb840f1da6b113fd0`.
Only the latter is a production successor-bank pin.  The generated Lean bridge
has 120 fresh definitions, 1,608 binary implication clauses, and 144
four-literal family blockers; its clause anchors are chunked to keep targeted
elaboration bounded.  A live-checkout targeted build and an independent static
clause-count/parity audit pass, but exact-SHA bank authentication and the
detached exact-SHA Lean build remain the active ingress gates.  These are
successor-bank facts, not a terminal certificate.  The current exact-12 target
is to finish those gates, extend the typed terminal consumer, and only then run
a new bounded canary.
There is still no terminal UNSAT, all-arm coverage, universal lift, or closed
live `sorry` from this result.

The terminal-consumer audit makes the second gate concrete.  The current
`ExactTwelveRigid221ThreeTriadMembershipTerminalConsumer` types only the
historical block-spanning layer and the five-variable three-triad supplement;
it does **not** consume the later family-bank prefix now ending at variable
45,489.  Consequently a solver result over the v23 canary would presently be
an authenticated computational artifact but not a Lean-ingressible terminal
certificate.  Before launch, add one source-valued global membership
assignment, prove that every generated layer agrees with it through that
layer's final variable, and use the existing per-layer implication and blocker
theorems to consume the complete emitted clause order, followed by the named
arm and source-order suffixes.  The generic assignment-composition lemma is
now under targeted kernel validation.  Production launch remains prohibited
until that full consumer elaborates against the exact frozen clause order.

Exact-12 v23 ingress reauthentication checkpoint (2026-08-13): the corrected
exact-SHA reconstruction now authenticates the complete v22-parent/v23-family
chain.  The post-family prefix remains 45,489 variables and 646,103 clauses
with SHA-256
`dc63ac918ed05c66cb9207f05219f66b2ad1df0310537bad1c3028abe980c300`.
After the fixed named-deletion arm suffix it has 646,970 clauses with SHA-256
`258dee064cdd39b33a38620c25b8bd47e8d61ab6d9b78b283cf559497d9fd944`;
after the 81-clause source-order bank it has 647,051 clauses with SHA-256
`ccf284562911954d27db02db9589100046ac03a986b6f4d9b2a47ae9c5ce8755`.
The source-order bank itself remains pinned at SHA-256
`cedf416274a28e0aaee1fe148986610fe7e0f81ca510cae5a69b43af3aa4348c`.
The canary probe accepts these identities.  A later detached full-project
build failed in the concurrently refactored `Rigid221SourceHeavy` module and
therefore neither validates nor invalidates this exact-12 ingress.

The full-prefix typed consumer has now been written in
`ExactTwelveRigid221FullMembershipPrefixTerminalConsumer.lean`.  It composes
all post-parent membership layers into one source-valued assignment, proves
the layer agreement obligations, consumes the fixed arm and source-order
suffixes in emitted order, and exposes a one-arm `DimacsUnsatisfiable`
terminal.  Targeted dependency validation is still in progress.  During that
validation, the named-deletion bridge was repaired after the Lean/Census554
refactor: its literal ceiling is now proved structurally rather than by a
large free-variable `native_decide`, and its negative blocker literals are
proved under the arbitrary successor-selector assignment.  That module now
passes direct targeted elaboration.  This is still ingress infrastructure:
the bounded 12-cell solver wave remains prohibited until the full consumer
itself elaborates, and there is still no terminal UNSAT, all-arm coverage,
universal lift, or closed live `sorry`.

Targeted-ingress validation checkpoint (2026-08-13): the upstream
`ExactTwelveRigid221V14JobCnf` module exceeded the 16 GB elaboration budget
when Lean normalized all auxiliary-variable blocks together.  It is now a
thin coordinator over bounded, dependency-ordered shards.  The named-deletion
bridge, all nine shards, and the assembled `ExactTwelveRigid221V14JobCnf`
coordinator now pass targeted `lake-build`; the five source-Sinz blocks are
checked independently and then reassembled, using symbolic source-end bounds
instead of concrete `baseNumVars + k` normalization.  The twelve finite
representative reductions for the center-Sinz variable count are also checked
under a bounded elevated heartbeat budget.  This is a proof-packaging refactor
only: it does not change the frozen variable map, clauses, hashes, or accepted
models.  The assembled full-prefix consumer remains to be validated before
any PIQD launch.

Exact-12 v23 canary checkpoint (2026-08-14): the full-prefix terminal
consumer validated by targeted `lake-build`, and after the adoption and
pin-reauthentication commit `fc0b0f5d`, the rebased immutable v9
arm-plus-aggregate exact-SHA gate passed in a detached worktree at that
commit (frozen-identity reconstruction plus fail-closed job/artifact
binding, 2 passed in 1,613 s).  Exactly one immutable cell-6 v23 canary
was then launched from the same detached worktree via PIQD; the daemon
`/version` SHA-256
`f89994bc10fcad69a264d8efbd7d76b8203c94c08f22b4536d3b473a12cee089`
was recorded at submission and is not treated as certification.  Job
`4646f2d9ce7ce5d23ed681e2536473beecc27ab02e5cb873a8b47ba32769a63c`
returned `SAT_WITNESS_REPLAYED` under the v11 run schema and is
classified `STRUCTURALLY_UNRESOLVED`; the survivor records 29,046
positive variables and a 12-literal cube, preserved with its PIQD
journal at `scratch/arm-static-cell6-v23-live-fc0b0f5d-20260814/`.
The v23-refined formula therefore still admits a cell-6 model.  There
is no terminal UNSAT, no all-cell coverage, no universal lift, and no
closed live `sorry`.  The mandatory all-order theorem-mining stop is in
force: the only authorized next steps are the versioned v22+ outcome
validator and the all-order mine over exactly this run's data, and the
mine result must not seed a successor formula without its own
source-proved membership family.  No successor formula, twelve-cell
run, or new wave is authorized by this result.

The mandatory all-order theorem mine over exactly this run's data is
complete.  The v23-frozen outcome validator
(`exact12_next_row_arm_static_v23_validator.py`, committed `c693c39a`
with its full adversarial test suite) authenticated the preserved
workdir, and the v4 all-order miner replayed the survivor across all 48
source orders.  Every order is covered by the
`convex-five-point-common-orientation` rule (24 forward, 24 reverse).
Seven order-independent common-five cores replay across all 48
orientations; the coverage certificate uses one dominant core
`a=1, b=7, c=6, x=9, y=11` for all 48 orders, structurally new against
every banked family because it involves center 1.  Its positive
memberships are: center 6 requires {7, 9, 11}; centers 9 and 11 each
require {1, 7}.  The mining summary and diagnostic certificate (SHA-256
`c43578c83acc086bdbb32db086a26e479ad1f1c5f29424326d76a8062d1d6550`)
are preserved in the canary workdir.  The certificate has no generated
Lean nogood: this is an authenticated finite diagnostic, not a
proof-backed cut, coverage, or closure.  The next admissible production
step on this lane is a source-clean Lean producer for the dominant
core's positive-membership family; only after that family is proved,
banked, and pinned may a successor formula be compiled.  No successor
formula, canary, or wave is authorized by this mine.

The first cross-wave general-theorem-mining audit of this lane is
complete (EMPIRICAL, diagnostic only; artifacts and sweep code in
`scratch/rigid221-sourceheavy-anchor/cross-wave-audit-20260814/`).  It
swept all 91 preserved SAT witnesses (21 canary, 2 live, 68 wave; the
68 wave witnesses collapse to 24 distinct solver models because
contiguous cells received byte-identical models), re-derived 3,488
unique order-independent common-five cores, and grouped them into 323
role structures.  Three findings matter.  First, the 19 installed
membership banks' 623 concrete patterns collapse to six anonymous
shapes, and fifteen of the nineteen banks carry a single shape —
exactly the anonymous shape of the v23 dominant core.  Second, that
shape recurs in 88 of the 90 other witnesses (44 of 46 distinct
cubes): each wave has banked a new concrete-label slice of one
invariant structure, and each refined formula has re-satisfied the
same structure in a fresh label range.  Third, 321 of the 323 role
structures have no bank contact at all, almost all wave-only and
outside cell 6.  The strategic consequence, stated as an empirical
observation and not a theorem: a label-general source-proved
membership producer for the dominant anonymous shape
`(c,{b,x,y}) (x,{a,b}) (y,{a,b})` would subsume the pattern content of
fifteen banks and remove the structure the cell-6 refinement sequence
keeps rediscovering, whereas banking the concrete `a=1` v24 family
would continue the one-label-slice-per-wave pattern.  Choosing between
the general producer and the concrete v24 family is a production
routing decision reserved for the lane owner and user; neither route
is authorized as a solver wave by this audit.

The routing decision is resolved (user, 2026-08-14): the lane pursues
the label-general source-proved membership producer for the dominant
anonymous shape, with the concrete v24 dominant-core lemmas banked in
parallel as an oracle and fallback.  The bounded feasibility probe is
complete with verdict FEASIBLE, and its load-bearing source citations
were independently re-verified against the live tree
(`Census554.ConvexFivePointCore.Core` is label-parametric;
`SourceOrderPositiveNogood.refutes` already supplies
`FrozenForcedSecondCapOrder`; `CommonFiveOrientationAt` reduces to
`CyclicTripleAt`, which uses only `<` comparisons and therefore
transfers along order-preserving relabelings).  The route decomposes
into six obligations: O1 canonical 48-order data mirroring
`source_boundary_orders()` in `exact12_v14_ordered_coverage.py` plus a
decidable all-order orientation predicate; O2 the single new
mathematical obligation and first missing antecedent, a bridge lemma
showing every position satisfying the frozen direct-or-mirror boundary
order together with the forced second-cap order agrees in relative
label order with one of the 48 canonical maps, so the decidable
predicate discharges `CommonFiveOrientationAt`; O3 the quantified role
data with distinctness and center-support side conditions; O4 the
general producer, assembled exactly like the three existing common-five
producers; O5 the generated CNF binding module under the approved
`Lean.trustCompiler` `native_decide` policy; O6 the Python family bank
whose role enumeration reuses the same 48-order construction.  The
orbit figures are EMPIRICAL (validated against three Lean-proven
families and one negative oracle, not kernel-checked): 15,588
unordered admissible role tuples over 2,585 distinct CNF row
definitions, versus 623 concrete patterns accumulated across fifteen
banks.  A conditional sub-orbit of 12,570 block-separated tuples is
provable without O2 but excludes the v23 dominant core, so the full O2
route is the production target.  No successor formula, canary, or
solver wave is authorized until the general family is proved, banked,
and pinned.

The parallel concrete v24 family is banked in Lean.  The new module
`ExactTwelveRigid221SecondOppositeInternalTripleApexFirstOppositeCommonFiveCertificate.lean`
proves the sixteen-member second-opposite internal-triple/apex/
first-opposite common-five family: roles `x, b, c` pairwise distinct in
the second-opposite interior with `b` numerically strictly between `x`
and `c`, role `y` in the first-opposite interior, fixed Moser apex `1`,
consuming only positive selected-row membership plus the frozen
direct-or-mirror cap blocks and the retained second-cap order.  The
dominant mined core `(1, 9, 7, 6, 11)` is a checked instance, and its
four membership facts are exactly the mine's memberships (center 6
requires {7, 9, 11}; centers 9 and 11 each require {1, 7}).  The
targeted build passed (10,875 jobs) and the axiom closure of the check,
the orientation theorem, and the producer was verified twice — by the
authoring worker and independently by the lane custodian — as exactly
`propext`, `Classical.choice`, `Quot.sound`, with no `native_decide`
and no heartbeat overrides.  The six sibling cores have different block
signatures and are open candidates, not obligations.  This banking
installs no Python family bank, pins, successor formula, or wave; the
family serves as the concrete oracle and fallback for the label-general
route above.

Obligations O1 and O2 of the label-general route are banked.  The new
module `ExactTwelveRigid221CanonicalBoundaryOrderBridge.lean`
enumerates the forty-eight canonical zero-cut boundary orders as
explicit lists mirroring `source_boundary_orders()` (length and
pairwise distinctness kernel-`decide` proved), defines the decidable
all-orders check `orientedAll48` with its soundness lemma, and proves
the transfer bridge: every injective position map satisfying the
frozen direct-or-mirror block hypotheses plus the forced second-cap
order inherits each orientation fact checked on all forty-eight
canonical maps.  One deliberate strengthening against the probe's
draft: the bridge requires position injectivity, which is necessary
(the frozen hypotheses do not separate positions inside the surplus
and first-opposite blocks) and is supplied by the packaged
`FrozenBoundaryOrder`, so the producer interface is unchanged.  Axiom
closure was verified independently of the authoring worker: the bridge
and its packaged corollary close over exactly `propext`,
`Classical.choice`, `Quot.sound`, with no `native_decide`, no `sorry`,
and no heartbeat overrides.  Three differential oracles tie the Lean
check to the independently cross-validated Python orbit enumeration
(dominant core and a second concrete-family member oriented; a
non-between control rejected).  The orbit figures in the routing
paragraph above were also re-derived by an independent enumerator with
exact agreement (25,032 / 15,588 / 2,585; crosscheck preserved in
`scratch/rigid221-sourceheavy-anchor/cross-wave-audit-20260814/`).
Obligations O3-O6 remain open.  No successor formula, canary, or
solver wave is authorized by this banking.

Obligations O3 and O4 are banked.  The new module
`ExactTwelveRigid221AllOrderCommonFiveCertificate.lean` defines the
label-general five-role data whose `rolesValid` side conditions mirror
the validated orbit enumeration literally (SC1 distinctness, SC2
spelled-out center-support exclusions, SC3 the decidable all-48
orientation check), the positive-membership-only check over the
family's four rows, a kernel-`decide` example that the v23 dominant
mined core lies in the role domain, and the general producer
`SourceOrderPositiveNogood.ofAllOrderCommonFive`, which assembles the
checked `ConvexFivePointCore` and discharges its orientation
obligation through the canonical-order bridge corollary — no
per-family orientation lemma, which is the payoff of the bridge.
Axiom closure was verified independently of the authoring worker:
exactly `propext`, `Classical.choice`, `Quot.sound`; `native_decide`
was authorized mid-flight but not needed, and the module contains no
`sorry` and no heartbeat overrides.  Two differential oracles tie the
decidable role domain to the independent Python enumeration (the
dominant core is admitted; the non-between second-opposite triple is
rejected).  Remaining obligations: O5, the generated CNF binding
module under the approved `Lean.trustCompiler` policy, and O6, the
Python family bank mirroring `rolesValid` and
`source_boundary_orders()`.  No successor formula, canary, or solver
wave is authorized by this banking.

The card-at-least-13 adapter audit also rules out a tempting shortcut.  The
pentagon residual does not supply a
`LargeCapUniqueFiveSecondApexRadius`: in particular it has no
`unique_K4_radius`, no `LargeCapUniqueFiveUnusedCriticalRow`, and no pair of
strict-interior deletions sharing one unused-row blocker.  Therefore neither
`nonempty_twoCommonDeletionSources_of_unusedCriticalRow` nor
`exists_third_commonDeletionSource` can be instantiated from the current
packet.  In the `xv`-deletion arm, the first genuinely missing positive fact is
exactly

```lean
centerAt source1 ∈
  SelectedClass (D.A.erase packet.xv) S.oppApex2 P.rho
```

and the checked theorem `xvDeletion_c1_not_mem_BO_yields_self_commonDeletion`
handles its negation only by producing a self-common-deletion packet.  The next
source theorem must transport that packet to a retained distinct center and
then to a third-bisector, fiber-card, overlap, or metric terminal.  Absent that
theorem, this branch is a candidate for exact predicate mining, not a claimed
source closure.

PIQD responsibility-boundary correction (2026-08-12): PIQD authenticates the
raw CNF bytes, job identity, and solver result that it receives.  It does not
interpret or validate the caller's Python-to-Lean variable semantics, source
entitlement, or proof-assistant consumer.  PIQD commit `773ccde` introduced
retention of the exact producer-manifest bytes for newly prepared raw-DIMACS
jobs.  `GET /jobs/:id` advertises their content address as
`producer_manifest_blob_hash`, and `GET /jobs/:id/blobs/:hash` returns bytes
that are re-hashed against that address.  This is an exact-byte custody
contract for the submitted manifest, not semantic validation of the manifest
or custody of the source files named inside it.  The field is null for
pre-change jobs, raw-DIMACS jobs submitted without a manifest, and non-raw-
DIMACS jobs; historical manifest bytes cannot be backfilled.  The distinct
`producer_manifest_hash` remains the digest folded into job identity and is
not evidence that bytes are retrievable.  Consequently every P97 bank
promotion must still independently compare the complete numeric variable-to-
source-requirement map and emitted clause order across Python and Lean.  A
successful PIQD replay cannot substitute for that cross-language semantic
test.  Commit `3cff11c` introduced enforcement of one daemon per
data directory with an exclusive advisory lock; this prevents the previously
possible two-daemon/double-solve corruption mode without changing routes,
identity, or deduplication semantics.  At this checkpoint, `piqd status`
reports the running daemon build as
`aa47e2ff3000890d11da79296721f0f51c3a228d4ef8446af3c3d2a73d969107`;
the deployed binary exposes the producer-manifest content-address field and
blob route.  That deployment observation does not enlarge the custody
contract described above.

## 0. Universal-ingress contract (binding, 2026-08-04)

Before a computational campaign is called production, record all five parts of
its landing contract:

1. the exact live-leaf hypotheses available at ingress;
2. the source-level theorem extracting the finite object or bounded
   obstruction represented by the encoder;
3. the symmetry/coverage argument showing that the finite search covers every
   extracted object;
4. the cardinality scope (including any upper bound, overflow state, or
   general-cardinality lift); and
5. the authenticated replay theorem and named kernel consumer that the result
   feeds.

An `UNSAT` result without this contract is a bounded diagnostic, not a
universal contradiction.  A finite exact-cardinality certificate is likewise
only an exact-cardinality theorem until a deletion/minimality or bounded-core
lift is proved.  In particular, unqualified `CLOSED` means `KERNEL-CLOSED`;
finite probes are `DIAGNOSTIC-ONLY`, and source theorems that still lack a
checked terminal consumer are `PROVEN-PRODUCER` or `CLOSED-TO-RESIDUAL`, not
closure of the live leaf.

### A-core cardinality scope correction

The A-core encoder formerly used exact-one values `0, ..., 24` and rejected
every `(N1)` sum above 24, imposing an unsound hidden `n ≤ 24` scope on live
leaves that assume only `12 ≤ D.A.card`. This was repaired on 2026-08-04:
each cardinality now has exact buckets `0,...,24` plus a sound `GE25` overflow
bucket, and every concrete `(N1)` tuple has an abstract image. The dedicated
`G-OVERFLOW` gate realizes `(nSig,nO1,nO2)=(24,2,3)` (concrete `n=32`) and
passes with `nGE25`; all eight refreshed package runs remain SAT. Thus the
encoder scope defect is repaired, but no A leaf is `KERNEL-CLOSED`.

The same scope audit still applies to every other universal-package encoder
with a finite exact-cardinality domain.

A dated 2026-08-08 blueprint refresh reported 30 explicit on-spine FLC theorem
sorries plus the synthetic `sorryAx` node.  That number is not asserted as the
current spine count because the present working tree has uncommitted Lean
changes and a stale blueprint index.  The older 18-obligation package count is
retained below only as historical coordinator bookkeeping; three
graph-unimported `FidelityCheck` declarations were parked outside the publish
spine in that dated refresh.

## 1. Dated package baseline (2026-07-30; superseded for source counts)

This section records the historical 18-obligation package census refreshed
2026-07-30,
which was identical for
`Problem97.erdos97_rhs` and `Problem96.erdos96_rhs`; kernel `#print axioms`
is the arbiter — the refs miner has a known dropped-edge bug. All were in
`ATail/FrontierLiveClosure.lean` (FLC), namespace
`Problem97.ATailFrontierLiveClosure` (since 2026-08-05, `9feb86f6`, sharded
into 15 files under `ATail/FrontierLiveClosure/` with the original path as an
umbrella import; FQNs unchanged). Recomposed 2026-07-28 by the landed
simplification refactor (`a0f73bc1`): initially 19 leaves, with A dropping 8→6
(two `blockerV` arms closed; `blockerVRowOther_*` renamed `blockerVRow_*`)
and B growing 1→3 (B2/B3 are live named leaves again). A later source-clean
F3 narrowing replaced one residual by two directly consumed theorems, taking
the live total to 20.  The 2026-07-30 canonical-row override/rebase closes the
aligned/nonbisector source leaf by reducing it to the already-open fresh-third
leaf, returning the direct total to 19.  The subsequent fixed-row same-cap
split closes the positive alignment branch and replaces the opaque fresh-third
leaf by one strictly narrower negative residual; the direct total remains 19.
The final cap-source consolidation observes that both the negative fresh-third
leaf and the one-sided-deletion leaf were called only after constructing the
same `CapSourceThirdCanonicalRowSurface` and after the coordinator had already
produced `GeometricMultiplicityResidual`.  Their branch-specific packets are
concrete refinements of that residual, rather than independent contradiction
interfaces.  They are now compatibility adapters to the single common
`false_of_capSourceThirdCanonicalRowSurface` obligation, which retains the
residual explicitly.  This reduces the direct total to 18 and the F-Γ frontier
from three leaves to two without discarding the finite blocker-fiber data.

This is not the current raw source count.  A 2026-08-02 live-source audit found
28 explicit `sorry` bodies in FLC.  Relative to the preceding 21-body source,
the retained-omission and normalized fresh-third refactors removed two broad
placeholders and introduced nine directly consumed leaves, for a net increase
of seven.  Both replacement coordinators elaborate, but still inherit
`sorryAx` through those leaves; this is auditable decomposition, not kernel
closure.  Refresh the proof-blueprint coordinator frontier before using a
declaration count for publication; the active E1 execution target and
four-workstream decomposition are recorded below.

| Pkg | Leaves | Declarations |
|---|---|---|
| A-core | 6 | `false_of_exactFourMutualOmissionRigid221_minimalCore`, `..._physicalApex_sourceEqU_blockerDeleted`, `..._blockerV_sourceRowHeavy`, `..._blockerVRow_{oppositeRowHeavy,sparseRows}`, `false_of_exactFourRigid221_sourceHeavy_secondOppositeLarge` |
| C-core | 2 | `..._physicalApex_sourceNeU`, `..._nonphysicalCollision` |
| D-R | 2 | `false_of_exactFourPostCardElevenTwoRadiusBranch`, `false_of_exactFourPhysicalConsumerSwappedUniqueFourOutcome` |
| D-E | 2 | `false_of_firstApexUniqueRadiusExactFive{Distinct,Common}ObstructionCenter(s)Residual` |
| E (E1 core) | 4 | `false_of_retainedOmission_pairedCommonDeletion_triApexAllLarge_core`, `false_of_retainedOmission_reverseHitFresh_endpointCrossHit_triApexAllLarge_core`, `false_of_retainedOmission_reverseHitFresh_endpointCommonDeletion_triApexAllLarge_core`, `false_of_retainedOmission_reverseHitFresh_threeDistinctBlockers_triApexAllLarge_core` (proved dispatchers: `false_of_retainedOmission_reverseHitFresh_endpointCriticalFiber_triApexAllLarge_core`, `false_of_retainedOmission_reverseHitFresh_triApexAllLarge_core`, `false_of_retainedOmission_triApexAllLarge_core`; public adapter: `false_of_retainedInteriorDirectedOmission_and_all_low_hits`) |
| F-Γ | 2 | `TwoSourceExactCollisionRowsTerminal.false_of_crossBlockerCoincidence`, `...false_of_capSourceThirdCanonicalRowSurface` |
| B | 3 | `false_of_twoDistinctExactFourMutualOmissionJointDeletions_blockerCollision`, `false_of_exactFourMutualOmission_fourCenterCommonDeletion_{blockerCoincidence,survivalSquare}` |

The 18 in this historical table is a coordinator/package granularity, not a
current declaration-level leaf count; use the recorded snapshot below only as
a dated closure-frontier inventory.

Notes: F4 (`freshOutsideSecondBlockerFiber`) is closed by the landed fiber
swap. Hypothesis lists must be re-read from the tree at encode time; the
solve-prompt family docs are the unfolded plain-math references. The B
package regains its banked B2/B3 normal forms as direct leaf targets
(`lean/scratch/b-family-bank/`).  The compatibility theorem
`false_of_capSource_alignedSingletonRadius_of_secondBlocker_nonbisector` is
source-clean and is not a separate leaf; it now delegates directly to
`false_of_capSourceThirdCanonicalRowSurface`.  The public
`false_of_freshCanonicalRowOverride` is now a live adapter on the
crossed-seventh route: the escaping B7 point supplies the three canonical-row
omissions, the override theorem enters the normalized-only FreshThird adapter,
and the result reaches the pre-existing normalized FreshThird residual.  This
source-closes the crossed-seventh U3 child without proving the inherited
FreshThird leaves.  The fresh-third classifier and one-sided six-center route
remain checked theorem-bank material rather than independent closure.

### Recorded sorry inventory (historical snapshot)

The package table above is historical.  The current closure gate is
declaration- and spine-based, not a raw token count.  After the crossed-seventh
rewire, `proof-blueprint sync` completed at build hash `7dea73d9a2c3`, with the
source and kernel call graphs matching.  The synchronized 2026-08-10 snapshot
reports 35 on-spine open symbols and 41 effective declarations with `sorry`,
down from 42 before the rewire.  The list below remains the older 25-leaf
family inventory and is retained only as historical package bookkeeping; it
is not the current kernel count.

The 25 recorded leaves are:

* **Rigid221 / exact-four (13).**
  `false_of_twoDistinctExactFourMutualOmissionJointDeletions_blockerCollision`;
  `false_of_exactFourMutualOmission_fourCenterCommonDeletion_blockerCoincidence`;
  `false_of_exactFourMutualOmission_fourCenterCommonDeletion_survivalSquare`;
  `false_of_exactFourMutualOmissionRigid221_minimalCore`;
  `false_of_exactFourMutualOmissionRigid221_physicalApex_sourceEqU_blockerDeleted`;
  `false_of_exactFourMutualOmissionRigid221_physicalApex_sourceEqU_blockerV_sourceRowHeavy`;
  `false_of_exactFourMutualOmissionRigid221_physicalApex_sourceEqU_blockerVRow_oppositeRowHeavy`;
  `false_of_exactFourMutualOmissionRigid221_physicalApex_sourceEqU_blockerVRow_sparseRows`;
  `false_of_exactFourRigid221_sourceHeavy_secondOppositeLarge`;
  `false_of_exactFourMutualOmissionRigid221_physicalApex_sourceNeU`;
  `false_of_exactFourMutualOmissionRigid221_nonphysicalCollision`;
  `false_of_exactFourPostCardElevenTwoRadiusBranch`;
  `false_of_exactFourPhysicalConsumerSwappedUniqueFourOutcome`.
  These feed the exact-four/Rigid221 dispatchers and the post-card-11 or
  swapped-unique-four residual consumers.  No sound, source-entitled
  row-counting/metric producer or replayable SAT/certificate artifact currently
  closes any of the 13 leaves.  Existing finite incidence shadows are
  diagnostics only; the next required producer is a general-capacity
  incidence/metric contradiction, followed by a focused Lake and transitive
  axiom check.

* **First-apex unique-radius exact-five residual (2).**
  `false_of_firstApexUniqueRadiusExactFiveDistinctObstructionCentersResidual`;
  `false_of_firstApexUniqueRadiusExactFiveCommonObstructionCenterResidual`.
  They are consumed by the exact-four residual and original-frontier unique
  radius arms.  The current banks provide only thin support and role splits;
  there is no exhaustive terminal, kernel-checkable certificate, or other
  computational route to `False` for either leaf.

* **Retained omission / E1 (8).**
  `false_of_retainedOmission_pairedCommonDeletion_triApexAllLarge_core`;
  `false_of_retainedOmission_reverseHitFresh_endpointCrossHit_firstCenterEqFreshSource_triApexAllLarge_core`;
  `false_of_retainedOmission_reverseHitFresh_endpointCrossHit_sharedBlocker_JInLeftAdjacentCap_triApexAllLarge_core`;
  `false_of_retainedOmission_reverseHitFresh_endpointCrossHit_sharedBlocker_JInRightAdjacentCap_triApexAllLarge_core`;
  `false_of_retainedOmission_reverseHitFresh_endpointCrossHit_secondCenterEqFirstSource_triApexAllLarge_core`;
  `false_of_retainedOmission_reverseHitFresh_endpointCrossHit_genericRoles_triApexAllLarge_core`;
  `false_of_retainedOmission_reverseHitFresh_endpointCommonDeletion_triApexAllLarge_core`;
  `false_of_retainedOmission_reverseHitFresh_threeDistinctBlockers_triApexAllLarge_core`.
  Proved dispatchers consume these leaves through
  `false_of_retainedOmission_triApexAllLarge_core` and its reverse-hit/fresh
  adapters.  CEGAR rounds v35--v38, exact-15 archetypes, and endpoint SAT or
  `UNKNOWN` results do not close a universal leaf.  The first missing
  source-entitled producer is an order-sensitive metric contradiction (or a
  global full-carrier/K4 deletion-row coupling) for the one-inside/one-outside
  cap arm; no current computational artifact supplies it.

* **FreshThird / F-Γ (2 on-spine leaves).**
  `Problem97.ATailFrontierLiveClosure.TwoSourceExactCollisionRowsTerminal.false_of_crossBlockerCoincidence`;
  `Problem97.ATailFrontierLiveClosure.TwoSourceExactCollisionRowsTerminal.false_of_twoCapSources_freshOutsideFirstBlockerFiber`.
  The outside-first theorem is the active load-bearing FreshThird leaf; the
  other on-spine FreshThird leaf is
  `false_of_crossBlockerCoincidence`, while the second-fiber theorem is a swap
  adapter.  The normalized-remaining, first-non-hit, and first-fiber
  declarations are compatibility code off the current publish spine.  The cap-profile census, Boolean shadows, and
  v36--v38 SAT/`UNKNOWN` runs remain finite diagnostics, not universal proofs.

Thus **all 25 leaves listed in this snapshot are computationally unclosed**;
this sentence is not an authoritative current sorry count.  “No route” here
means that the available SAT, CEGAR,
exact-rational, counting, and certificate pipelines have not produced a
source-entitled kernel-checkable contradiction; it is not evidence that the
mathematical statements are false.  A future computational result closes a
leaf only after it is landed in Lean and passes the focused build, refreshed
spine, and transitive-axiom gates.

#### Rigid221 off-class-blocker coordinator update (2026-08-06)

Before this change, the immediate coordinator-interface frontier at
`false_of_exactFourRigid221_sourceHeavy_secondOppositeLarge_pentagonOffClassBlocker`
was one on-spine theorem obligation.  The checked parent now consumes an
exhaustive fan-out-two producer:

1. an exact-cardinality-12 leaf carrying `D.A.card = 12`, the exact closed-cap
   profile `S.surplusCap.card = 5`, `S.oppCap1.card = 4`, and
   `S.oppCap2.card = 6`, together with the exact four-point strict interior;
2. a `13 ≤ D.A.card` leaf carrying one named endpoint deletion whose selected
   four-classes survive at three pairwise-distinct centers.

Both children are explicit theorem obligations consumed immediately by the
proved parent, and the existing publish-target consumer path is unchanged.
The retained parent residual preserves all of the old hypotheses, so neither
branch closes by erasing data or calling the parent cyclically.

Chosen granularity: two theorem leaves.  No proposition-valued outcome or
closer packet is introduced: the public residual is the explicit
data-preserving child interface, and the proved split/profile producers are
reusable source-level API.  The
per-leaf narrowing measure is the singleton cardinality and exact profile in
the first arm, and the stricter cardinality range plus explicit same-deletion
survival data in the second.  Immediate constructor fan-out is two.  The local
load-bearing `sorry` count changes from one to two; neither child is yet
discharged, so this is auditable decomposition and not kernel closure.  The
28-leaf inventory above is the preceding audited snapshot; its global count
must be refreshed from the built proof spine rather than adjusted by prose.

The `deleted = xv` ingress now has a checked three-row incidence producer,
`pentagonOffClassBlocker_xvDeletion_threeExactRows_common_u`.  For any two
sources furnished by that arm it retains the complete q-deleted selected rows
at their two actual blockers and the complete q-deleted physical row at
`S.oppApex2`; all three contain the named point `u`, and the physical row has
cardinality exactly four.  The general metric consumer
`U5QDeletedK4Class.three_exact_classes_tetrahedron_incompatibility` has been
ported from the sibling general-`n` theorem bank into the reusable local
module `U5GlobalIncidenceQDeletedTetrahedron`, with a focused build passing.
The ATail adapter
`pentagonOffClassBlocker_xvDeletion_false_of_tetrahedron_incidences` records
the exact remaining producer contract: it closes once the following five
positive cross-incidences are available, writing `O` for the physical apex
and `c₁,c₂` for the two actual blockers:

```text
c₁ ∈ BO,   O ∈ K₁,   c₂ ∈ K₁,   O ∈ K₂,   c₁ ∈ K₂.
```

These five facts are not presently source-proved.  The new module and adapter
are therefore a checked consumer boundary, not closure of the unbounded leaf.
They reduce the previously implicit eight-incidence tetrahedron sketch to one
explicit five-incidence producer obligation and give future CEGAR/theorem
mining a precise source-level predicate vocabulary.

Current producer target (audited 2026-08-11): factor those five facts into one
endpoint-parametric packet, provisionally named
`PentagonEndpointCrossCenterPacket q source₁ source₂`, where `q` is either
`P.u.1` or `packet.xv`, `K₁` and `K₂` are the corresponding selected critical
four-shells, and `BO` is the selected class centered at `S.oppApex2` after
deleting `q`.  The packet must assert exactly

```text
c₁ ∈ BO,   O ∈ K₁,   c₂ ∈ K₁,   O ∈ K₂,   c₁ ∈ K₂.
```

The two live cardinality-at-least-13 leaves are specializations of this one
producer boundary: the `u` arm uses the fixed source pair `xu` and
`jointDeletion.deleted`, while the `xv` arm uses its supplied arbitrary source
pair.  Existing crossed-row and three-exact-row lemmas stop short of this
packet, and the tetrahedron declarations consume rather than produce it.
Accordingly this is genuine new source-level mathematics, not an import or
adapter gap.  The next unbounded-lane milestone is the endpoint-parametric
producer itself (or a strictly equivalent universal lift), followed by two
thin adapters into the existing consumers; merely declaring the packet does
not close either leaf.

The 2026-08-12 source audit isolates the first packet field more sharply.  For
`K₁ := (Hlate.selectedAt source₁.1 source₁.2).toCriticalFourShell`, the existing
`K₁.center_mem` already proves `center source₁ ∈ D.A`; hence
`center source₁ ∈ BO` reduces exactly to the two missing source facts

```text
center source₁ ≠ deleted,
dist S.oppApex2 (center source₁) = P.rho.
```

The corresponding concrete targets are `c₁ ≠ packet.xv` plus the radius
equality in the `xv` branch, and `cXu ≠ P.u.1` plus the radius equality in the
fixed-`u` branch.  `centerAt_ne_source` gives only inequality with the
center's own source, while `P.hsourceBlockerClass` applies only to the
contextual source `P.u`; neither supplies this field.  Thus the carrier
ingress is already available, but the physical-radius/deletion-survival pair
is genuine producer work.  This refinement does not reduce the live leaf
count.

The 2026-08-11 producer audit sharpens this boundary.  In both residual
theorems the hypothesis `13 ≤ D.A.card` is currently unused after the checked
three-row exporter; each residual assumes precisely the negation of the
five-incidence packet.  Moreover, the existing rational convex-octagon local
model shows that common endpoints, equal row radii, and cyclic order alone do
not force the missing center incidence.  Therefore another local K4 or
third-bisector adapter cannot be promoted as the producer.  The next proof
must use the cardinality hypothesis through global minimality/deletion data:
derive an endpoint-crossing disjunction from saturated actual-blocker fibers,
then use third-bisector/fiber-card lemmas to eliminate its non-crossing arm.
The argument should be endpoint-parametric so that the `u` and `xv` deletion
leaves are discharged by thin adapters rather than two unrelated proofs.

The unbounded leaf is now a checked nested fan-out-two coordinator.  In both
endpoint arms the complete five-incidence packet is discharged by a checked
tetrahedron consumer.  The `deleted = xv` arm leaves only
`...threeCenterDeletion_xv_missingIncidence`, which assumes the negation of
that packet.  The `deleted = u` arm now ignores the old arbitrary-source
witnesses and switches to the source-clean fixed pair `xu` and
`jointDeletion.deleted`; its only load-bearing child is
`...uDeletion_fixedPhysicalPair_missingIncidence`, which assumes the negation
of the corresponding five-incidence packet.  The old
`...threeCenterDeletion_u` declaration is now a proved compatibility adapter,
not part of the obligation frontier.  Thus the unbounded coordinator retains
two strictly narrower on-spine `sorry`s while the complete-incidence subcase
has been eliminated in each arm.
The top-level anchor still has immediate fan-out two (exact 12 versus
cardinality at least 13); the nested unbounded constructor has fan-out two.
This is a genuine case elimination and a more precise producer frontier, but
it is not closure because both residual children remain open.

The deletion partition is now source-level rather than merely a proposed
search vocabulary.  The focused-built theorem
`pentagonOffClassBlocker_largeCard_threeColor_pair` proves that when
`17 ≤ D.A.card`, the sources outside the `xv` row contain two sources with
distinct actual blockers in one of three uniform profiles:

1. both fail after deleting `u` and survive after deleting `xv`;
2. both survive after deleting `u` and fail after deleting `xv`;
3. both survive both endpoint deletions.

The first survival in profile 1 is forced by the existing pair-deletion
theorem, so simultaneous failure is not a fourth color.  The threshold is
exactly the counting threshold supplied by thirteen outside sources: three
color classes of size at most four cannot cover them.  This leaves the finite
cardinality range `13 ≤ D.A.card ≤ 16` as a separate bounded stratum rather
than mixing it into an unbounded survivor leaf.

Profile 2 now has a symmetric checked incidence path.  The theorems
`pentagonOffClassBlocker_uDeletion_crossedRow` and
`pentagonOffClassBlocker_uDeletion_threeExactRows_common_xv` retain two
selected rows and the physical row after deleting `u`; all three contain
`xv`.  The checked adapter
`pentagonOffClassBlocker_uDeletion_false_of_tetrahedron_incidences` closes the
complete five-center-incidence packet just as in profile 1.  Those five
positive incidences are not source-proved in either orientation.  Profile 3
also has no current contradiction consumer.  Therefore the three-color
theorem is a genuine uniform producer and a justified route change, but not a
closure claim and not yet an additional on-spine case split.

The profile-3 ingress is now exact rather than prose-only.  The checked
adapter
`pentagonOffClassBlocker_biSurvival_commonDeletionRectangle` turns two
distinct actual blockers surviving both endpoint deletions into two
`CommonDeletionTwoCenterPacket`s with the same ordered pair of centers: one
packet for deletion of `u`, and one for deletion of `xv`.  Together these form
a two-deletion/two-center rectangle of exact q-deleted four-point rows, with
the existing overlap and actual-blocker separation fields available to a
consumer.  The theorem-bank audit found no existing contradiction theorem for
this rectangle.  In particular, the nearby mutual-omission joint-deletion
terminal requires physical-class and row-omission ingress that these arbitrary
outside sources do not supply.  The missing result is therefore a rectangle
comparison consumer (or a producer of those stronger ingress facts), not an
adapter from raw survival data.

The previously missing source entitlement for the exact-12 lane's
order-sensitive restriction is now proved as
`pentagonOffClassBlocker_exists_forced_secondCap_order`.  It extracts a CGN
ordering of the physical second cap and names the indices of

```text
u, c = centerAt xv, xv, xu.
```

The source row gives `dist xv u = dist xv xu`, and the `xv` row gives
`dist c u = dist c xv`.  CGN one-sided distance injectivity therefore forces
exactly

```text
u < c < xv < xu
```

or its reversal.  This is a general-cardinality Lean producer with the exact
ordered-cap packet and point-identification witnesses retained; it is not a
contradiction and does not discharge either live child.  Any CEGAR use must
encode this chain behind a landing contract that reconstructs these four
named points and the same physical second-cap order.  Adding an anonymous
four-position ordering clause to the old row-only schema would be unsound.

The existing exact-12 probe already enumerates precisely these two chains in
`metric_order_mine.py::boundary_orders`: under its frozen labels
`(u,c,xv,xu) = (6,7,8,9)`, the 24 global boundary orders restrict those four
labels to `(6,7,8,9)` or `(9,8,7,6)`.  The new Lean theorem therefore justifies
a restriction that the computation was already using; it does not add a new
CNF predicate or retroactively turn the learned row clauses into a Lean
certificate.  The immediate computational follow-up is to record and
fail-closed test an explicit source-to-frozen-label/order replay contract,
without changing the frozen schema's semantics, and then ask which additional
source-entitled predicate turns the chain into a replayable obstruction.  A
kernel-checked source-to-CNF/global-order adapter is still absent, so the lane
remains theorem-mining evidence rather than closure.

Two further constraints that the exact-12 encoder already imposed now also
have general-cardinality source proofs in the live module.
`pentagonOffClassBlocker_exact_physical_cycle_traces` proves that the selected
rows at the five physical sources `(u,xu,deleted,v,xv)` meet the exact physical
five-class in the five cycle edges

```text
{u,xu}, {xu,deleted}, {deleted,v}, {v,xv}, {xv,u}.
```

`pentagonOffClassBlocker_physical_cycle_actualBlockers_injective` then proves
that the five corresponding actual blockers are pairwise distinct.  These
theorems source-entitle `probe.py::trace_edges` and its per-center at-most-one
constraints.  They do not change the CNF, prove an obstruction, or supply the
missing kernel-checked source-to-CNF adapter.  The source-sensitive run records
their theorem names in its ingress metadata so a future replay cannot silently
treat these pre-existing encoder constraints as anonymous assumptions.

The strongest fixed pair supplied by those traces is now packaged by the
checked theorem `pentagonOffClassBlocker_fixedPhysicalPair_biDeletion`.  It
chooses the consecutive physical sources `xu` and `jointDeletion.deleted` and
proves, uniformly and without a cardinality bound, that both sources lie
outside the selected `xv` row, their actual blockers are distinct and differ
from the physical apex, and both selected rows plus the physical-apex radius
class survive deletion of either endpoint `u` or `xv`.  Thus the source side
of a two-source/two-deletion bi-survival rectangle is no longer existential or
CEGAR-derived: its sources and exact physical-cycle rows are fixed in Lean.
No theorem-bank consumer currently turns this rectangle into a contradiction.
For deletion of `u`, the checked exporter
`pentagonOffClassBlocker_fixedPhysicalPair_uDeletion_threeExactRows_common_deleted`
now turns the two fixed selected rows and the physical-apex class into three
exact q-deleted classes sharing the named point `deleted`.  The checked
consumer
`pentagonOffClassBlocker_fixedPhysicalPair_uDeletion_false_of_tetrahedron_incidences`
closes the subcase in which

```text
cXu ∈ BO,  O ∈ Kxu,  cDeleted ∈ Kxu,
O ∈ Kdeleted,  cXu ∈ Kdeleted.
```

Consequently the live `u`-deletion obligation is no longer arbitrary
three-center survival.  It is precisely the negation of this conjunction for
the fixed pair, under `13 ≤ D.A.card`.  The load-bearing leaf count on this
local nested frontier is unchanged: one broad `u` leaf was replaced by one
strictly narrowed fixed-pair missing-incidence leaf, while the complete packet
was proved impossible.  This is genuine case elimination, not anchor closure.

The next mathematical target is therefore to force one of the absent
cross-incidences—or derive a contradiction from its absence—using a comparison
theorem forcing a third `{u,xv}`-bisector point, a three-point overlap between
one fixed row and another exact four-class, or a saturated blocker-fiber
consequence.  Adding more arbitrary common-deletion packets does not address
this boundary.

The separate `metric-order-mining.json` report of `24/24` UNSAT orders is not
a universal obstruction.  It analyzes one completed incidence SAT survivor
whose otherwise unconstrained selected-row slots were filled by that model.
The source-forced-core replay over the source journal found no source-forced
order core in any sampled survivor (`0/300`) and no survivor covering all
orders.  Accordingly the `24/24` report remains theorem-discovery evidence;
it does not authorize a learned cut or close the exact-12 child.

The next promotion step on this route is consumer-first: prove a checked
contradiction comparing the two endpoint-indexed common-deletion packets, or
prove a source-level reason that one of the two endpoint survivals must fail.
Once that consumer exists,
split the current unbounded coordinator into the bounded `13..16` stratum and
the three exhaustive `≥17` profiles, eliminating each complete tetrahedron
incidence subcase in the two crossed arms.  Do not add the four new terminal
obligations before this consumer check; the present producer is reusable
without inflating the proof frontier.

The `xv` child also retains, for both selected blocker centers, the
source-proved failures of K4 after deleting `u`; these were already established
by the two-color construction and had previously been discarded at the
coordinator interface.  The two centers therefore survive deletion of `xv`
but fail deletion of `u`.  No current theorem consumes that crossed-deletion
pair by itself.  Three centers surviving one deletion likewise do not imply
the full `HasNEquidistantProperty 4` needed to invoke counterexample minimality.

A new cardinality-free geometric producer is also checked:
`pentagonOffClassBlocker_nextRow_strictTriple_card_le_one`.  If `c` is the
off-class blocker of the `xv` row and `Kc` is the row reselected at `c`, then

```text
|(Kc.support ∩ {u, xu, xv})| ≤ 1.
```

Its proof localizes the blocker of `Kc` to the strict second cap from any two
of those three physical-class hits and applies the existing four-point
strict-cap equidistance contradiction.  The theorem-bank audit found no direct
consumer.  The initially claimed r15 two-incidence consumer was invalidated by
the exact label-and-row transport audit: the r15 cut is stated over the generic
labeled row pattern and does not identify its core rows with `Kc.support`.
Consequently the strict-triple bound remains banked geometry, while r15 remains
a finite learned cut; neither is a discharged child or a source-level producer
for the other.

The complementary fixed-center deletion fan is now promoted as
`pentagonOffClassBlocker_physicalClass_commonDeletionFan`.  It proves that at
least three points of the exact physical five-class are omitted by `Kc`, and
each such point is a common deletion preserving K4 at both the next actual
blocker `centerAt c` and the physical apex.  Together with
`pentagonOffClassBlocker_secondCap_commonDeletionFan`, the live source now
contains the two fan families proposed by the deep audit: a four-source
second-cap fan at `(c,O)` and a three-source physical-class fan at
`(centerAt c,O)`.  No checked theorem currently compares these families, so
this is a producer landing and not closure.  The next consumer target must use
their shared robust apex and fixed first rows to force a third `{u,xv}`
bisector point, a three-cap-point selected row, two distinct prescribed joint
deletions, or an `M44` contradiction.

The exact-12 source-sensitive CEGAR diagnostic has also reached 10,000 learned
row clauses under persistent CaDiCaL/IPASIR discovery (`39,733` variables and
`325,923` clauses) and remains `ITERATION_LIMIT`.  The run added no source-level
clauses or variables and its learned clauses are row-only.  It therefore does
not encode the new reselected-row theorem and cannot promote an exact-12
result even if later UNSAT: the current journal has no source-level Lean
adapter preserving the actual-blocker endomap, fan data, and certificate
semantics.  The next computational action is now branch-specific: extend the
explicit exact-12 ingress contract with either the named interior source plus
surviving `q`/`w` deletion, or the two exact radius classes plus their checked
two-by-two partition of `{u,c,xv,xu}`.  Extending the same undifferentiated
row-only journal is diagnostic enumeration, not a closure route.

The later proof-backed source-order sequence through r15 supersedes another
undifferentiated continuation of that diagnostic. It authenticated 76 finite
cuts and repeatedly reduced the current cell-1 survivor to a common-five core,
but remained SAT. It did not produce a valid source-level two-incidence
consumer. More survivor-specific common-five waves are paused until a
Lean-proved source predicate, absent from the current finite ingress, is
identified and compiled.

That successor experiment is now instantiated in a fresh Class-C v4
namespace.  It replays the 10,000 inherited row clauses and adds 780 clauses
from checked source producers: 245 for the frozen second-cap pair predicate and
535 for the conditional next-row strict-triple bound.  A negated-predicate
novelty probe found the first family already implied by the inherited bank
(verified DRAT) but exhibited a SAT violation of the second, so the
next-row-triple family is a genuine strengthening.  The frozen namespace now
contains 1,250 v4 records (11,250 learned clauses including the inherited
bank) and remains `ITERATION_LIMIT` at 39,733 variables and 327,953 clauses.
A second verified novelty query shows that the checked two-off-center
second-cap fan conclusion is also already implied and would add no cut.  This
is not closure: the Python source-to-CNF adapter is not kernel checked, and no
finite contradiction has been found.  A future promoted result here would
close only the checked exact-cardinality-12 branch; the separate
`13 ≤ D.A.card` siblings remain independent.  Do not extend this detector
loop again without a new source producer.  The next useful producer must
force either a saturated actual-blocker fiber or a cross-fan blocker
collision/second-iterate incidence accepted by an existing checked consumer.
The detailed scope, validation, and artifact pointers are recorded in
`scratch/pentagon-offclass-exact12-v2/source-constraints-v4-report-2026-08-06.md`.

The v4 namespace is narrower than a complete exact-12 role-placement run: it
inherits the first SAT placement chosen by the feasibility probe
(`deleted=0,v=2`).  A new exhaustive base-abstraction diagnostic tested all 42
ordered outside-interior placements.  All 42 were SAT; only the two endpoint
permutations placed both `deleted` and `v` on the second-cap endpoints.  This
refutes the proposed shortcut that the two checked deletion fans must overlap
in a named physical-class source.  The overlap observed in the frozen `d0-v2`
model is placement-specific, not a checked producer.  Therefore the next
producer must be placement-independent: either a cardinality argument over
the full carrier, an actual-blocker image/fiber theorem, or a new global
transport from the two fan packets into an existing collision or
second-iterate consumer.  Do not formalize the endpoint-overlap statement.
The diagnostic table and replay script are
`scratch/pentagon-offclass-exact12-v2/all-placement-audit.json` and
`scratch/pentagon-offclass-exact12-v2/audit_all_placements.py`.

The exact-12 coordinator is already in the fully robust physical-second-apex
context: `P.surface.secondApex_robust` is a field of the inherited
`ExactFourPostCardElevenRobustSurface`.  An attempted robust-versus-critical
split was therefore rejected before build: the robust arm added no
information, while a `PhysicalSecondApexCriticalResidual` arm contradicted an
inherited hypothesis.  It must not be counted as a narrowing or as a live
route.

The corrected source-level split uses the checked robust radius normal form
`interiorPairGood_or_twoDistinctExactFourInteriorRows`.  The single broad
`...pentagonOffClassBlocker_exactTwelve` obligation is refactored through a
dispatcher to two data-preserving leaves:

1. `...exactTwelve_interiorDeletion`, retaining a positive five-point radius,
   an actual source in the strict second-cap interior, its identification with
   one of the four named interior points `{u,c,xv,xu}`, and a surviving
   `interior_q`- or `interior_w`-deletion;
2. `...exactTwelve_twoRadiusPartition`, retaining the no-five alternative,
   two distinct exact four-point radius classes and disjoint selected rows,
   together with the checked exact two-by-two partition of the four named
   strict-interior points.

The per-leaf narrowing measure is the unresolved robust-radius-classification
constructor count, which drops from two to one; each leaf also retains the
full exact-12 endpoint packet and the constructor-specific witnesses.  The
anchor's outer exact-12-versus-`card ≥ 13` fan-out remains two, and the
nested exact-12 fan-out is two.  In the local coordinator-interface frontier,
one broad exact-12 obligation is replaced by two strictly narrower explicit
theorem obligations; the two existing unbounded missing-incidence leaves are
unchanged.

The two-radius child is now closed in Lean.  Its inherited physical context
already contains a positive radius `P.rho` with a selected class of cardinality
at least five, contradicting the child packet's universal no-five hypothesis.
This removes one load-bearing `sorry`; it does not close the exact-12
dispatcher because the interior-deletion child remains open.

The interior-deletion child is also strictly narrower than the interface
listed above.  The checked sharp two-radius cap bound and
`S.oppCap2.card = 6` force its arbitrary five-point radius to equal the
physical radius `P.rho`.  After that identification, `Q.hblockerNotClass`
eliminates the off-class center `c` from the four named source choices.  The
proved adapter now feeds one explicit physical-radius leaf whose only source
roles are `{u,xv,xu}` and which retains the surviving `interior_q`- or
`interior_w`-deletion.  The coordinator-interface frontier therefore changes
from two exact-12 leaves to one open exact-12 leaf: the no-five constructor is
discharged, while the five-point constructor loses its free radius and one of
four source placements.  This is real narrowing plus one leaf closure, not
closure of the parent off-class-blocker theorem.

The general five-point robust consumer in `Rigid221Closure` remains downstream
of `Rigid221SourceHeavy` and itself relies transitively on open robust leaves;
it cannot be imported back as evidence that this residue is proved.  The next
exact-12 computation must therefore encode the three physical source roles,
the actual-blocker map, and the surviving named deletion.  The old row-only v4
journal still lacks that ingress and cannot promote a result for this leaf.

The historical scratch v5 adapter encoded that finite ingress for the
frozen `d = 0`, `v = 2` placement.  It separates the six branches
`{u,xv,xu} × {q,w}`, forbids the selected source's actual blocker from being
the first apex, and uses
`cross_deletion_survives_iff_not_mem_selected_support` to require the selected
blocker row to omit the named deleted point.  Its contract self-test passes all
six branches, with 801 branch clauses in each case.  A one-iteration smoke for
every branch replays the 11,250 inherited v2--v4 records, validates the decoded
source/deletion predicates, and learns an equality-duplicate-center cut; every
branch is still SAT after that refinement.  These runs validated their
then-current data contract and supply theorem-mining survivors.  They do not
prove the Lean leaf:
the source-to-CNF adapter is not kernel checked, the run covers only one frozen
placement, and no branch has reached certified UNSAT.

The first bounded v5 wave is now complete at 101 recorded refinements per
branch (606 records total) using the persistent proof-free CaDiCaL discovery
backend.  Every branch stopped at `ITERATION_LIMIT`; none reached UNSAT.  The
streaming replay in
`scratch/pentagon-offclass-exact12-v2/analyze_source_role_deletion_v5.py`
revalidated all recorded source/deletion predicates.  Across the 606 rejected
models, the selected source's blocker fibre has size at most two and the global
maximum blocker-fibre size is at most four, but these observations are already
covered by the checked physical-trace/fibre facts or by the existing general
fibre bound.  The branchwise row intersections likewise reproduce the admitted
physical-cycle traces rather than a new invariant.  The required wave-boundary
theorem-bank search found no independent pair-deletion or blocker-basin theorem
that subsumes these records.  Accordingly, no new cut is admitted from this
wave.  Its result is empirical theorem-mining evidence only; the next wave must
either add a newly proved source predicate or continue the same authenticated
search without changing the schema.

The later theorem
`false_of_exactFourRigid221_sourceHeavy_secondOppositeLarge_deletedXuRow`
is not an independent consumer for this residue.  Its proof passes through the
five-cycle/pentagon dispatcher and returns transitively to the current
pentagon-off-class-blocker anchor.  Moving it earlier would expose a dependency
cycle rather than close a leaf.  It must not be cited as a closed downstream
route for the exact-12 residue.

Direct Lean 4.27 source verification now passes for
`Rigid221SourceHeavy.lean`, including the physical-radius adapter and the
closed no-five child.  A transitive Lake rebuild is being rerun separately
after the ongoing `Census554` import refactor; until that finishes, this is a
focused source-check result rather than a refreshed transitive-axiom claim.

An independent refresh of the source-model journal counted 4,999 records
(4,900 with decoded source cubes).  The observed blocker-fiber and fan
statistics still supplied no invariant that replays for every survivor; in
particular, the stronger-looking three-fan-blocker pattern remains finite
CEGAR evidence rather than a universal Lean producer.  No new learned cut is
authorized by that audit.

The current source frontier must be kept split by cardinality.  There are four
load-bearing leaves below this anchor: the two exact-12 residuals
`...physicalRadius_commonDeletion_missingIncidence` and
`...physicalRadius_nextRowOnlyHit`, plus the two `13 ≤ D.A.card`
missing-incidence leaves for the fixed `u` deletion and the arbitrary-pair
`xv` deletion.  The checked five-incidence tetrahedron consumers
belong only to the latter unbounded stratum.  Measuring their antecedents in
the exact-12 v5 journals is therefore a cross-stratum diagnostic, not evidence
for choosing a producer for the exact-12 leaf.  The analyzer now labels that
scope mismatch explicitly.

The proposed saturated-fibre fan-feeding predicate also fails the survivor
test.  Among the 4,999 source-v3 models, 132 have a blocker fibre of size four,
but none has a size-four fibre reached within two blocker iterates by every
member of the second-cap fan.  The same predicate occurs in none of the 606 v5
source/deletion models; the only saturated v5 cases are 82 models in the
`xu`/`w` branch, and all 82 fail full fan feeding.  The isolated final SAT map
that motivated the conjecture was therefore not representative.  No
fan-feeding theorem or learned cut is authorized.

The placement-complete exact-12 diagnostic is now finished.  The schema-v3 script
`audit_all_source_role_deletion_placements.py` checked all 42 ordered
`(deleted,v)` placements and all six `{u,xv,xu} × {q,w}` source/deletion
branches, for 252 base-abstraction queries in total.  It found 240 `SAT` and 12
`UNSAT`.  The 12 `UNSAT` instances are exactly the direct trace/deletion
collisions: the source is `xu`, the selected deletion is `q` with
`jointDeletion.deleted = q`, or the selected deletion is `w` with
`jointDeletion.deleted = w`.  In those cases the exact `xu` selected row
contains `jointDeletion.deleted`, so that row cannot retain four points after
deleting the same point.  All other 240 branches are `SAT` in the base
abstraction.  The artifact records and mechanically checks that the
`UNSAT` set equals this collision set, with zero unexpected `UNSAT` instances
and zero collision instances reported `SAT`.  It now also records the two
source-entitled common-deletion fans.  Of the 240 survivors, 11 have no selected
fan deletion crossed by both fans, 160 have one, and 69 have two.  More sharply,
all 229 survivors in which `xu` misses the row reselected at the `xv` row's
actual blocker have `xu` in both deletion fans; all 11 survivors in which `xu`
hits that next row have empty fan intersection.  Thus the complete finite grid
exposes a two-arm predicate rather than a contradiction.

This is a source-local narrowing candidate, not closure and not a new global
geometric obstruction.  The diagnostic deliberately omits the
placement-specific v2--v4 journals and supplies one witness per satisfiable
query, so it can refute candidate invariants but cannot establish them.  The
next exact-12 predicate must distinguish some of the 240 surviving branches,
survive the complete placement grid, and then be proved from the live source
packet before it enters a production CEGAR schema.  The immediate Lean-facing
task is to expose the direct collision as a checked deletion-survival adapter;
it should narrow the search without splitting the load-bearing leaf unless a
subsequent producer closes one of the resulting cases.

The direct-collision adapter has now been written as
`pentagonOffClassBlocker_xuRow_survival_forces_deleted_ne`.  It combines
`Q.hdeletedXuRow` with
`cross_deletion_survives_iff_not_mem_selected_support`, proving for an
arbitrary erased point `z` that survival of the `xu` row forces
`jointDeletion.deleted.1 ≠ z`.  As of this plan update the source edit is
awaiting a build covering the edited source; even after validation it remains
a proved narrowing adapter, not closure of the exact-12 leaf.

The source-level form of the new two-arm predicate is implemented as
`pentagonOffClassBlocker_xu_commonDeletionFans_or_nextRow_onlyHit`.  It says
that either deleting `xu` preserves K4 at the consecutive blocker centers and
the robust physical apex (packaged as two `CommonDeletionTwoCenterPacket`s), or
the next row contains `xu` and omits both `u` and `xv`.  The latter omissions
come from the already proved strict-triple cardinality bound.  This producer is
still narrowing, not closure: no imported theorem currently contradicts the
three-center common-deletion arm, and no imported theorem contradicts the
next-row-only-`xu` arm.  The next computational query must therefore run these
two arms separately and mine the missing exact-row cross-incidences or an
orientation-sensitive metric predicate required by a checked terminal.
The live language server reports a complete proof with no diagnostics in the
edited declaration; a fresh Lake build covering this source is still pending.

The first consumer audit rejects the obvious tetrahedron route rather than
supporting it.  The schema-v1 script
`audit_dichotomy_tetrahedron_predicates.py` keeps the live v5
source/deletion ingress, fixes one checked dichotomy arm, and asks both
polarities of each candidate incidence.  In the canonical `(d,v)=(0,2)`
smoke over all six source/deletion branches, the existing fixed-pair
`u`-deletion consumer requires two incidences whose positive forms are
`UNSAT` in both arms: the `xu` blocker cannot lie in the physical row after
deleting `u`, and the robust physical apex cannot lie in the deleted-source
row.  For the natural next-row-only-`xu` instantiation, every one of the five
missing center cross-incidences has both a `SAT` positive query and a `SAT`
negative query.  The 606 existing v5 journal models likewise contain no model
satisfying all five incidences for either the natural hit-arm or miss-arm
instantiation.  These are finite diagnostics, not impossibility proofs, but
they are enough to stop treating the tetrahedron consumer as the immediate
exact-12 target.  A placement-complete repetition of this already-refuted
predicate set is not scheduled.

The computational continuation is now the fresh schema-v6 driver
`dichotomy_arm_cegar_v6.py`.  It fixes either `xu` absence (the
common-deletion-packet arm) or `xu` presence (the next-row-only-hit arm) in the
row selected at `centerAt c`, replays the complete v2--v5 journal stack for
the selected source/deletion branch, and then continues the existing exact
metric and ordered-cover detector.  Its twelve clause-contract self-tests
pass.  One end-to-end `(d,v)=(0,2)`, source `u`, deletion `q` smoke iteration
passes in each arm, including inherited-journal replay, decoded-model arm
validation, certificate generation, and certificate replay.  Both smoke
models were eliminated by equality-duplicate-center certificates (nine rows
in the common-deletion arm and five in the hit arm); neither run is terminal.
The hit arm has since completed a ten-iteration bounded continuation for the
same canonical source/deletion branch.  All ten survivors were eliminated by
distinct replayable equality-duplicate-center certificates, with minimized
cores ranging from four to ten rows.  The run stopped at `ITERATION_LIMIT`, so
this is detector-throughput evidence, not a terminal result.

The two v6 arms did not have equal semantic status.  The hit arm fully encoded
its checked consequence: `xu` membership was added by v6 and the `u`/`xv`
omissions were inherited from the v4 strict-triple clauses.  The common arm
encoded only the antecedent `xu ∉ Kc.support`, not the two
`CommonDeletionTwoCenterPacket` witnesses returned by the Lean producer.
Accordingly, common-arm v6 output remains diagnostic and must not be described
as packet-complete.

That ingress gap is now repaired at the theorem-mining interface, but it is not
a Lean closure.  The checked theorem
`pentagonOffClassBlocker_xuCommonArm_threeConcreteExactRows` identifies the two
packet first rows with the actual critical rows at `xv` and at its next
blocker, and supplies the physical five-class with `xu` erased as a third
exact-four row.  All three rows omit `xu`, and the theorem exports their three
pairwise C2 overlap bounds.  The separate checked theorem
`pentagonOffClassBlocker_xuCommonArm_blockerAvoidsConcreteCenters` says that
the actual blocker of `xu` avoids both nonphysical row centers.  Lean
elaboration and `lean_verify` pass for both with only the standard axioms.

`common_concrete_rows_cegar_v7.py` implements the resulting frozen exact-12
adapter.  It maps `Kxv` to the selected row at the fixed center `C`, `Kc` to
the selected row at `blocker(C)`, and `BO` to the physical class minus `xu`.
It adds 865 producer clauses: 90 fixed-row `xu` omissions, 765 conditional
next-row `xu` omissions, and ten blocker-avoidance clauses.  Pairwise C2 is not
duplicated: `Kxv`/`Kc` is inherited from `CoverInstance._build_c2`, while the
two `BO` overlaps are consequences of the stronger physical-circle C2 units
in `probe.build_case`.  Likewise, the no-common-pair C4 restriction is a
**separate global physical-circle constraint** inherited from
`probe.build_case`; it is not an output of the concrete-row theorem, and the
physical circle is counted once.

The packet-row consumer now exists.  The checked Lean theorem
`pentagonOffClassBlocker_xuCommonArm_false_of_tetrahedron_incidences` applies
`U5QDeletedK4Class.three_exact_classes_tetrahedron_incompatibility` to the
three concrete rows.  Its complete additional antecedent is the five positive
incidences

```text
d ∈ BO,  oppApex2 ∈ Kc,  u ∈ Kc,  oppApex2 ∈ Kxv,  d ∈ Kxv,
```

where `d = blocker(C)`.  The consumer derives the other three tetrahedron
incidences from the source packet.  `lean_verify` reports only the standard
axioms.  v7 maps this theorem to 440 guarded ternary clauses of the exact form

```text
¬blocker(C,d) ∨ ¬choice(C,Kxv) ∨ ¬choice(d,Kc)
```

for `d ∈ BO` and rows satisfying the displayed memberships.  Thus the current
adapter adds 1,305 clauses in total: the 865 producer clauses plus 440 checked
consumer clauses.  This is a consumer landing, not a producer of the five
incidences and not closure.

The v7 contract self-test covers all six source/deletion placements and ten
positive/negative semantic cases.  In addition to the concrete-row checks, it
tests activation of the all-five predicate, each one-incidence omission, and
differential equality between every emitted ternary clause and the expected
guarded clause family.  A clean one-record smoke run in
`cegar-d0-v2-common-v7-u-q-consumer-final-smoke` replayed all 11,351 inherited
records, used 330,161 clauses, and eliminated its survivor with a five-row
`equality-duplicate-center` certificate.  Its manifest records 440 consumer
clauses, `kernel_checked_source_to_cnf = false`, and `bankable = false`.  The
earlier corrected smoke remains producer-only evidence, and the 25-iteration
pre-blocker run remains superseded diagnostic data.

The initial 50-survivor incidence census in
`cegar-d0-v2-common-v7-u-q-mask-census-50/incidence-mask-census.json` has now
been superseded for theorem selection by a 500-survivor continuation in
`cegar-d0-v2-common-v7-u-q-mask-census-500/incidence-mask-census.json`.  The
larger run stopped at `ITERATION_LIMIT`; every survivor was eliminated by an
existing replayable detector, led by 364 equality-duplicate-center cores, but
the branch is not terminal.  In bit order
`(d∈BO, O∈Kc, u∈Kc, O∈Kxv, d∈Kxv)`, the true counts were respectively
`382, 357, 41, 182, 59`, and no survivor satisfied all five.  Thus neither the
50-model observation `d∈BO` nor the absence of `u∈Kc` was stable.  No single
named incidence should be promoted as the missing producer from these data.

The same artifact audits all six row-role permutations and every common point
of the three exact rows.  No orientation matches the generic tetrahedron
consumer.  The best deficits are one fact for 8 survivors, two for 112, three
for 313, four for 63, and five for 4.  In the closest recurring orientation
`Kx=BO`, `Ky=Kc`, `Kb=Kxv`, the eight one-fact cases split again: four lack a
triple-common point, two lack `O∈Kc`, and two lack `d∈BO`.  The only observed
triple-common points in that orientation were `u` (41 records) and `xv` (36
records).  Consequently the sound full `S₃` clause family for
`three_exact_classes_tetrahedron_incompatibility` would eliminate zero of the
500 recorded survivors.  It should not be added merely because the generic
consumer exists.  These are finite-model statistics, not source theorems.

A read-only audit of the other direct `U5QDeletedK4Class` consumers found no
cheaper replacement consumer.  The six alternatives require additional
metric/equilateral structure, a fourth exact class, or larger cross-incidence
packets that the current source branch does not provide.  The remaining mined
U5 class families consume `U5QCriticalTripleClass`, and no checked adapter from
the three concrete K4 rows to that interface is currently available.  Thus the
next step is not a mechanical consumer substitution.

The arbitrary-cardinality metric consumer now has an exact checked ingress
from this branch.  The axiom-clean theorem
`pentagonOffClassBlocker_exists_faithfulCarrierPattern_for_xuConcreteRows`
constructs a `FaithfulCarrierPattern D.A` whose row at the physical second apex
is exactly the physical five-class with `xu` removed.  Critical-shell
uniqueness then forces its rows at the two consecutive blocker centers to be
the concrete `Kxv` and `Kc` rows already exported by the common-arm theorem.
This removes the geometric existence/mapping ambiguity: the finite object to
classify is a faithful carrier pattern with one prescribed physical row, not
an ad hoc three-row incidence structure.

The companion axiom-clean theorem
`pentagonOffClassBlocker_false_of_xuConcreteRows_shellMetricCoverage` records
the precise landing contract.  If every faithful carrier pattern with that
prescribed physical row and the two theorem-forced consecutive blocker rows
contains a
`Census554.GeneralCarrierBridge.ShellMetricCoreAlternative`, then the existing
arbitrary-cardinality consumer `false_of_shellMetricCoreAlternative` supplies
`False`.  The theorem is deliberately a conditional consumer boundary: its
higher-order coverage premise is still missing, so it closes no `sorry` and
must not be counted as proof progress.  Targeted diagnostics and
`lean_verify` pass for both declarations with only the standard Lean axioms;
a Lake build covering the concurrent source edits remains pending.

This changes the next finite target.  Do not continue choosing one of the five
tetrahedron incidences from survivor frequencies.  The checked generic and
carrier layers now exist in
`GenericRowNogoodCertificate.lean` and `ExactTwelveCarrierIngress.lean`:
an exact-twelve carrier is relabeled by `Fin 12`, every faithful row is
transported to a complete labeled row, and geometric realization is preserved.
The carrier module builds, and the three central ingress declarations have only
the standard Lean axioms in the targeted audit.

The source layer is implemented in `ExactTwelveRigid221Ingress.lean`.  Its
fixed-role theorem pins the three Moser apices and the six named cap-interior
roles.  `FrozenRoleLabeling` then proves that the joint-deletion point and
`P.v` occupy two distinct members of the seven-label variable vocabulary,
reducing every source model to one of 42 ordered `(d,v)` placements.  The
fixed-role and 42-placement proofs pass direct source checking.
`FrozenRoleLabeling.interiorProfile` now proves the exact strict-interior
label blocks `{3,4,5}`, `{10,11}`, and `{6,7,8,9}` from the three exact cap
sizes and the named second-cap interior.  Its companion
`FrozenInteriorProfile.closedCapProfile` proves the corresponding exact closed
caps `{1,2,3,4,5}`, `{0,1,10,11}`, and `{0,2,6,7,8,9}`.  The complete module,
including the `C1/C2/C4` source cube, passes targeted checking, and an explicit
axiom audit reports only `propext`, `Classical.choice`, and `Quot.sound`.

The source-valid candidate-admission layer is now substantially sharper.
`labeledRowPattern_inter_labelsOf_card_eq` transports source intersection
cardinalities exactly through the frozen relabeling.  Using that adapter,
`FrozenRoleLabeling.moserOneHit` proves all six Moser-center adjacent-cap
one-hit filters, while `FrozenRoleLabeling.basicCandidateCuts` proves the two
general post-`SUB2` families: every row has `moserCount ≤ 2`, and a row centered
in one of the three strict cap interiors has `sameCapCount ≤ 2`.  These
declarations pass targeted Lean checking, and the updated axiom audit again
reports only the standard Lean axioms.  The stronger mixed filter
`moserCount ≥ 2 -> sameCapCount = 0` is deliberately absent: no source theorem
currently proves it.

`ExactTwelveRigid221SafeCandidate.lean` now packages those results as an
executable finite semantic contract.  `FrozenSafeCandidateAt` states exactly
the source-proved row filters, `frozenSafeCandidateClasses` enumerates their
finite candidate sets, and
`FrozenRoleLabeling.row_mem_frozenSafeCandidateClasses` proves that every
selected source row is admitted.  `FrozenRoleLabeling.safeCubeOK` combines
that membership with the independent `C1/C2/C4` source cube.  The new module
passes targeted checking and the explicit axiom audit with no `sorryAx`.
This completes semantic source-to-candidate admission.

The candidate-index and SAT-valuation ingress are now implemented as well.
`ExactTwelveRigid221SafeCoverCnf.lean` freezes the same twelve candidate tables,
choice-variable offsets, pairwise-C2 clauses, and Sinz-encoded C4 clauses as
the Python contract.  Its checked anchors are 3,040 choice variables, 42,560
total variables, 368,075 clauses, and 268,031 C2 clauses.
`ExactTwelveRigid221SafeCoverIndexBridge.lean` proves that every semantic safe
candidate has an index in the frozen table and transports the source `C2/C4`
conditions to those indices.  `ExactTwelveRigid221SafeBaseSat.lean` constructs
the corresponding choice and Sinz auxiliary valuation and proves that it
satisfies the complete base CNF.  The latter theorem's explicit axiom audit
contains only `propext`, `Classical.choice`, and `Quot.sound`; in particular it
has no `sorryAx` and does not depend on native-code evaluation.

`ExactTwelveRigid221SafeCoverSat.lean` composes these layers: every
`FrozenSafeCubeOK` row family induces a satisfying assignment of the frozen
base CNF.  Its axiom audit additionally contains `Lean.ofReduceBool` and
`Lean.trustCompiler`, inherited from the exhaustive finite candidate-table and
mask equivalences in the index bridge, and still contains no `sorryAx`.  This
is the required soundness direction for any later certified UNSAT result.  The
source-to-finite composition is now explicit in
`ExactTwelveRigid221SourceSafeIngress.lean`: the live exact-twelve residual's
checked `(5,4,6)` cap/interior producer, the concrete-row role labeling, and
the semantic candidate theorem yield `FrozenSafeCubeOK`, hence a satisfying
CNF valuation.  A serialized targeted build of that final composition remains
pending behind the repository-wide build lock.  This is ingress, not a
contradiction, and closes no live `sorry`.

The corresponding Python contract is now explicit rather than implicit.
`source_faithful_candidate_surface.py` introduces schema
`p97_rigid221_exact12_source_safe_candidate.v1`, enumerates exactly the safe
per-center rules above, and lists the unsupported mixed cut and the diagnostic
`probe.py` physical constraints as exclusions.  `CoverInstance` now accepts an
explicit candidate provider and independent cube validator; its defaults remain
the historical surface, while `SourceFaithfulCoverInstance` selects the new
exact-twelve contract.  It requires Python frozen profile `(5,6,4)`, whose last
two cap slots represent the theorem-facing profile `(5,4,6)` in reversed order.
The representative mixed row `(0,1,4,5)` at center `3` is rejected by the
historical surface and admitted by the safe surface, as required.  The complete
card-head unit suite passes (58 tests).  The contract test freezes all twelve
candidate counts, the aggregate choice-variable count, and the generated base
CNF variable/clause counts so drift in the proof-facing surface is detected
before a certificate run.  As finite regression data, that center
has 283 historical candidates and 322 safe candidates (39 restored rows), and
the safe base C1/C2/C4 CNF has 42,560 variables and 368,075 clauses.  These are
Python implementation facts independently mirrored by the checked Lean
encoding anchors.

That terminal base run has now been performed against the frozen source-safe
contract.  CaDiCaL returns **SAT**, not UNSAT: 42,560 variables, 368,075
clauses, and CNF SHA-256
`a52baadf6084ffd84b92804a25d6ed6decf7da2e4a6bc485f314a35b514b794e`.
The decoded twelve-row cube was independently replayed through
`source_faithful_cube_ok`, so this is a semantically checked witness for the
frozen abstraction rather than a raw solver model.  The reproducible runner
is `census/card_head/source_faithful_run.py`; its authenticated artifacts live
under `scratch/pentagon-offclass-exact12-v2/source-safe-v1/`.  Thus `C1/C2/C4`
plus the currently proved safe candidate filters cannot close the exact-12
residual.

The next exact computational target is **not** another run of this base CNF.
It is to mine the verified SAT witness family for a predicate that (i) fails on
those survivors, (ii) has a source-level theorem under the live exact-twelve
residual, and (iii) is added behind a new explicit schema before rerunning
CEGAR.  Until such a producer lands, further clauses from the older diagnostic
surfaces are not promotion-safe.

The first such predicate is now isolated.  The concrete producer fixes the
physical-apex row to the physical five-class with `xu` removed, so under the
frozen role labeling that row contains labels `6`, `8`, the joint-deletion
label, and the `v` label.  The already proved second-apex one-hit inequalities
then forbid the latter two distinct labels from lying together in either
adjacent closed cap.  This eliminates exactly 18 of the 42 ordered placements
and leaves the 24 cross-cap placements.  The finite pair-separation lemma is
Lean-clean in `ExactTwelveRigid221ConcreteBranchSurface.lean`.  Its geometric
source adapter is isolated separately in
`ExactTwelveRigid221SourceConcreteBranchIngress.lean`; that adapter's
serialized targeted build is pending behind the repository-wide build lock.
Once the adapter builds, this is a checked source narrowing, not a
contradiction and not a license to mutate the frozen v1 schema.

A preliminary `nextRowOnlyHit` sidecar which added only the existential next
row condition eliminated no additional placement: all 24 cross-cap placements
were SAT.  Its first witness failed the separately proved row-7 physical trace,
so that run is intentionally classified as underconstrained empirical evidence.
A refined sidecar then added
`row[7] ∩ {6,9,d,v,8} = {6,8}`.  All 24 cross-cap placements remained SAT.
Adding the full five-blocker-cycle surface in a separate variant also left all
24 placements SAT.  The authenticated empirical record is
`probe_nextrowonlyhit_sourcefaithful_row7cycle_20260807_b7c9.json`.  Thus the
physical-apex row, exact row-7 trace, and blocker-cycle structure are useful
source constraints but do not supply the missing contradiction.  The next
predicate must feed one of the two exact-12 terminal consumers directly:
common-deletion missing incidence or the exact next-row-only-hit obstruction.
No result from either sidecar counts as closure without a new schema, source
ingress, exhaustive certificate, and Lean consumer.

The first equality-only CEGAR pass on the common-deletion arm reached an honest
frontier rather than an `UNSAT`: after 706 independently replayed
duplicate-center nogoods, CaDiCaL produced a survivor for which the existing
formalized unordered metric detector found no core.  The previously missing
**same-boundary transport is now kernel-checked**.
`ExactTwelveRigid221BoundaryOrderIngress.lean` retains one global zero-cut CCW
boundary indexing for all three cap blocks, and
`ExactTwelveRigid221SameBoundaryOrderIngress.lean` transports the source-proved
local order `u, blocker(xv), xv, xu` (or its reverse) into that same indexing.
The theorem supplies 48 literal source orders: 24 direct cap-block orders and
24 mirror cap-block orders.  It does **not** by itself justify quotienting those
48 orders to the older 24 mirror-normalized representatives; that quotient
would require an additional reflection transport for the complete retained
row/metric packet.  Consequently future proof-facing ordered searches must
either check all 48 source orders or first land that reflection adapter.  The
older weaker second-cap-only universe, with 216 survivors among 2,880 orders,
is no longer the proof-facing ingress contract.

The first ordered detector nevertheless encoded a stronger condition than the
Lean consumer: it required all five core roles to form one cyclic subsequence,
whereas `ConvexFivePointCore` needs only the two triples `(a,x,b)` and `(b,c,y)`
to have one common cyclic orientation.  That mismatch caused a false stop at
iteration 707 and is not evidence against the route.  The explicit frozen v4
schema `p97_exact12_sourcefaithful_common_ordered_structural_cegar.v4` corrects
the detector to this two-turn contract without changing the v2/v3 schemas or
their replay.  In the first 3,000 v4 records it classified every model: 2,993
by replayed unordered structural cores and seven by exhaustive 24-order
coverage at iterations 706, 707, 1479, 1601, 2118, 2653, and 2751.  The run
ended only at its iteration limit, not in `UNSAT`.  The resumed extension has
now also reached its configured limit.  Its terminal journal contains 10,000
new classified records through iteration 10705: 9,963 unordered structural
cuts and thirty-seven ordered cuts.  The ordered set is the previous eighteen
plus iterations 6302, 6303, 6956, 7536, 7808, 7952, 8077, 8391, 8515, 8556,
8674, 8713, 8922, 9306, 9976, 10137, 10138, 10182, and 10349.  The summary
reports 10,706 learned clauses including the 706 bootstrapped cuts and
380,973 final CNF clauses.  Its status is `ITERATION_LIMIT`, with neither
`UNSAT` nor an unclassified survivor.

`ExactTwelveRigid221OrderedCoreConsumer.lean` now gives kernel-checked replays
of the first two ordered cuts, including the six-row iteration-707 cut.
`ExactTwelveRigid221OrderedCoverageCuts.lean` now contains exact replays for
all sixteen remaining cuts in the first eighteen-cut snapshot.  All eighteen
now pass targeted kernel builds.  In particular,
`ExactTwelveRigid221OrderedCoverageCuts.lean` directly includes the two long
closures at iterations 4723 and 4898 and replays their recorded five-step
flip/row/flip/row/flip paths.  The standalone
`ExactTwelveRigid221OrderedLongClosureCuts.lean` prototype duplicates those
declaration names and is not part of the promoted import chain.  Several
records strengthen during replay:
iterations 4669, 5959, and 6116 collapse to one three-row core independent of
the retained block order.

The newer iterations 8391 and 8922 collapse further to the same seven-fact
three-row membership schema.  Iteration 9976 supplies a second such schema;
iterations 10137 and 10138 share a third; and one of the five iteration-10349
cores alone supplies a fourth.  Their source is recorded in
`ExactTwelveRigid221OrderedThreeRowCuts.lean`; unlike the learned records, these
theorems do not assume exact row identities or retained within-block orders.
All four schemas cover every one of the 24 normalized orders and jointly replay
six learned records.  Their post-refactor targeted build is green.  The other
thirteen cuts after iteration 6196 are now replayed by the universal-three-row
and residual-coverage modules described below.  This completes learned-cut
replay only; it does not supply aggregate candidate coverage or terminal
`UNSAT`.

The next search schema is now implemented as the isolated sidecar
`membership_core_structural_cegar.py`.  Its v5 clauses retain every unordered
v4 cut as an exact-row clause, but replace an ordered exact-row union by the
row-membership facts actually used in a deterministic minimum cover of the 24
orders.  Crucially, those facts are extracted from the independently replayed
`closure_paths`; they are not inferred merely from the five geometric roles.
That distinction is necessary for iterations 1601 and 4898, whose selected
cores use nontrivial equality paths.  An earlier direct-role prototype was
rejected on this check and its audit and 25-iteration smoke artifacts are
quarantined in directories explicitly named `invalid-direct-core`; they are
not evidence.

The corrected full bootstrap audit replays all 706 frozen v1 cuts and all
10,000 frozen v4 records.  The thirty-seven ordered records deduplicate to
thirty-two sound membership clauses.  Twenty-five records use one direct
seven-membership core; iteration 4898 uses one nine-membership core through
its recorded five-step equality path; the other eleven records need minimum
covers of two, three, or four cores.  The corrected 25-iteration smoke and a
second complete journal replay both pass.  Those 25 new records are unordered
structural cuts, and the smoke ends at `ITERATION_LIMIT`; this is a schema and
replay validation, not finite exhaustion or Lean closure.

The corrected v5 production run has now finished and replayed deterministically.
It adds 4,567 records beyond the 10,706-record bootstrap and stops at iteration
15,273 with `ORDERED_STRUCTURALLY_UNRESOLVED`, not `UNSAT`.  The stable journal
SHA-256 is
`1d97513e76c7a141840e0b3fe1a7192faa1d00e29aad3867a12167c7f935eaf3`.
Thus the v5 exact-row plus ordered membership-core portfolio is exhausted on
one fixed `(jd,v) = (0,2)` placement without a contradiction.

The v6 sidecar `all_membership_structural_cegar.py` strengthens every replayed
unordered equality-path certificate to the positive row memberships actually
used by that path.  It authenticates old numeric v5 clauses in the original v5
variable-allocation context and then re-encodes their semantic membership keys
in v6; direct reuse of those numeric literals was rejected as unsound.  Replaying
all 15,273 v1/v4/v5 records yields 8,652 distinct membership nogoods and 6,621
duplicate generalizations.  Two complete bootstrap audits agree byte-for-byte
(run SHA-256
`2563002625a8e7a299c0f4841dfe75d78650821d0c2415c5414cc97d65c780f7`).
The follow-up learned 92 further membership cuts and then reached another
`ORDERED_STRUCTURALLY_UNRESOLVED` cube at iteration 15,365.  Its stable journal
SHA-256 is
`bfc116fe4ad44003ea3b1fe6394fda8cadbc7661a64b8f0c4739734ced4696d3`.
So stronger membership generalization alone still does not close the fixed
placement.

That v6 survivor now gives a sharper next predicate.  Across each literal
24-order direct and mirror family, ordinary common-orientation five-point cores
cover 22 orders.  The remaining two direct orders satisfy the rotated
three-shell schema `124/423/034`; the remaining two mirror orders satisfy
`314/140/201`.  Both schemas use only three selected rows, and the forced
second-cap order is supplied in the same retained boundary indexing.  This is
a source-entitled Kalmanson consumer target, not yet finite exhaustion.  The v7
search must check all 48 literal source orders and independently replay these
two exact schemas; it must not reactivate the older 24-order Kalmanson detector
under an unproved reflection normalization.

That v7 check is now complete and negative as a closure result.  The
`same_boundary_kalmanson_cegar.py` runner replays all 48 literal orders, passes
its tamper tests, and authenticated the complete v1/v4/v5 bootstrap.  Its first
production wave learned 402 new membership clauses (286 unordered structural
cuts and 116 same-boundary ordered cuts), reaching 9,054 distinct membership
nogoods, then stopped at iteration 15,675 with
`ORDERED_STRUCTURALLY_UNRESOLVED`.  The v7 journal SHA-256 is
`90eac5f9a18f23728fdd2c28024f4ead48c9239d3f642c736b3b447d2b2f4554`.
This is another SAT survivor of the finite abstraction, not finite exhaustion.

The new survivor exposed portfolio incompleteness rather than a new metric
schema: common-orientation cores cover 42 of its 48 literal source orders, and
the already formalized generic three-selected-row Kalmanson theorem covers the
remaining six (three direct and three mirror).  The v8 successor
`all_source_order_kalmanson_cegar.py` therefore uses that generic theorem over
all 48 literal orders instead of adding more hard-coded rotated schemas.  Its
20 sidecar CEGAR regression tests passed, including tamper rejection, and a full
mixed-version bootstrap audit replayed the 15,273 source records plus all 402
v7 records to the same 9,054 distinct membership nogoods.  A source-facing
generic Lean adapter has been written in
`ExactTwelveRigid221KalmansonConsumer.lean`; targeted validation is still
pending behind the concurrent refactor.  The completed v8 production wave
learned 264 further clauses (92 all-source-order and 172 unordered structural
cuts), reaching 9,318 distinct membership nogoods.  It then stopped at
iteration 15,939 with `ORDERED_STRUCTURALLY_UNRESOLVED`; its 666-record journal
has SHA-256
`b434a1a891622b2e7489045f34fe7b84a61def2ed43212cba401f70b2ccf2acd`.
Thus v8 also leaves a finite survivor rather than proving `UNSAT`.

That survivor has one and only one uncovered literal source order after the
v8 portfolio: direct order
`(0,9,8,7,6,2,5,3,4,1,11,10)` (source-order 21).  An exact rational QF_LRA
probe with positivity, all selected-row equalities, every strict triangle
inequality, and every strict Kalmanson inequality is `UNSAT`.  Its minimized
five-constraint core uses only the increasing quadruple `(0,9,8,5)`, the row-0
equalities `d(0,5)=d(0,8)`, the row-9 equalities `d(9,5)=d(9,8)`, and the one
strict Kalmanson inequality these equalities cancel.  This is exactly the
already kernel-proved cardinality-independent theorem
`CapCrossingKalmansonBridge.false_of_two_selected_rows_shared_late_pair`, not
a new assumption.  The v9 sidecar `shared_late_pair_cegar.py` adds that
four-membership detector with independent semantic replay and tamper rejection;
all 24 CEGAR regression tests pass.  Its complete authenticated mixed-version
bootstrap audit also passes, replaying the 15,273 source records and all 666
v6/v7/v8 records to the same 9,318 distinct membership nogoods.  Three v9
production waves then learned 1,334 further clauses (693 shared-late-pair
ordered cuts and 641 unordered structural cuts), reaching 10,652 distinct
membership nogoods at global iteration 17,273.  All three stopped only at
their planned journal caps with status `ITERATION_LIMIT`; the 2,000-record
authenticated journal has SHA-256
`b226e1a52dcf8b23a7736610b0b882edd9e8142a083935696e7422abfc0dda43`.
This is neither a solver failure nor closure: no terminal `UNSAT` and no new
unclassified survivor was obtained.  The continued one-cut-per-survivor
behavior is evidence that the current portfolio has not yet exposed a compact
invariant; a continuation from that authenticated journal remains diagnostic.
Even terminal v9 `UNSAT` would
cover only the fixed `(jd,v) = (0,2)` exact-12 cell; the placement/symmetry
coverage and non-exact-12 three-center branch remain separate load-bearing
obligations.

The v10 discovery sidecar `symmetry_lift_cegar.py` now closes each replayed
membership cut under the exact anonymous-label action
`S3({3,4,5}) × S2({10,11})` for this fixed cell.  This is deliberately an
untrusted acceleration, not a promoted proof rule.  Its fail-closed finite
contract checks all 12 label maps, all 48 literal source orders
orientation-by-orientation, and the complete source-faithful candidate table;
all 30 v10-era sidecar CEGAR tests pass.  A full mixed-version audit replays the 10,652
primary nogoods before allocating symmetry images and expands them to 76,504
distinct orbit nogoods.  The first 100-record v10 production probe added 921
new orbit nogoods, reaching 77,425, but again stopped at its planned cap with
`ITERATION_LIMIT`, not `UNSAT`.  Its 2,100-record journal has SHA-256
`8a26aaabcf726248179dfd1d301ca738d784482f691466d8fd9a22e7083f1c68`.
All 100 new records represent previously unseen symmetry orbits, so the lift
is eliminating whole 12-label equivalence classes but has not yet exposed a
small closing invariant.  Promotion still requires independent replay of the
image clauses and a Lean label-renaming argument; fixed-cell terminality would
still leave the placement-complete and non-exact-12 lifts open.

The v11 diagnostic `blocker_observer_cegar.py` now preserves the raw positive
SAT assignment and records the five already source-proved physical-cycle
actual-blocker choices without changing the CNF or the learned clause.  Its
full 2,100-record v10 bootstrap audit passes, and all 33 current sidecar CEGAR
tests pass.  The first 100 v11 survivors again ended at the planned
`ITERATION_LIMIT`; the resulting 2,200-record journal has SHA-256
`809f0c521dd6c15d68e4c73d7a1acd5cf7ea0f190f0f372cb24b6e00b4d7d491`.
Those survivors have exactly two symmetry-canonical *selected-model* blocker
signatures.  In all 100 selected assignments, the observed blockers at the
four sources `u`, the joint-deletion point, `v`, and `xv` are fixed; only the
selected `xu` blocker splits: 13 assignments choose `u`, while 87 choose one
of the two frozen labels for `R.interior_q` and `R.interior_w`.  These are
CaDiCaL witnesses, not complete blocker domains: the same row cube can admit
more than one auxiliary blocker assignment.  They therefore do not establish
a source dichotomy or justify blocker-sensitive Lean arms.

The v12 diagnostic `blocker_domain_observer_cegar.py` repairs that
interpretive gap without changing the CNF or learned clauses.  It reconstructs
every injective physical-cycle blocker map admitted by the selected row cube,
including the source-proved identities, and verifies that the solver-selected
map belongs to that family.  The frozen 2,200-record v11 bootstrap replay
passes and all 35 sidecar tests pass.  In the first 100 new records, 71 cubes
have one compatible blocker map and 29 have two.  The complete possible-center
domain for `actualBlocker(xu)` is `{interior_q}` in 41 cubes, `{interior_w}` in
one, `{u}` in 29, `{u, interior_q}` in seven, and `{u, interior_w}` in 22.
The only other varying coordinate is the joint-deletion source, whose blocker
is either `xu` or an anonymous surplus-interior label; after symmetry there are
three complete-map signatures.  The 2,300-record v12 journal has SHA-256
`1c2a66d8b3e5b5f1c1ecb518c7cfaa76a3eedf7d74c3fd08d20c04b8193f6477`.
This is finite theorem-mining evidence only: it covers five physical sources
in one placement, not the carrier-wide endomap, and no coverage theorem yet
says that these domains exhaust the live Lean leaf.  The next producer target
is not the earlier three-signature conjecture.  It is the source-exact six-arm
adapter supplied by the live named-source and deletion-survival hypotheses,
followed immediately by a terminal consumer for at least one arm.

The live leaf gives a more source-faithful split than the earlier
signature-only proposal: the named source is one of `u`, `xv`, and `xu`, and
one of the two named interior deletions `q` and `w` survives at that source's
actual blocker; membership in `outsideFirstApexFiber` also excludes the frozen
first-apex label as that blocker center.  This is an exact six-arm source
cover, not a guessed blocker-signature trichotomy.  Replaying these predicates
against the 100 v12 diagnostic cubes leaves respectively `100, 100, 47, 75,
58, 7` cubes in the arms `u/q`, `u/w`, `xv/q`, `xv/w`, `xu/q`, and `xu/w`.
The existential union therefore eliminates none of the 100 cubes, but the
`xu/w` arm is a useful narrow first production cell.

`named_deletion_arm_cegar.py` is the explicit v13 diagnostic compiler for one
of those six arms.  It authenticates the full 2,300-record v12 seed, adds the
exact blocker-to-row omission implications and first-apex exclusion, and
preserves the inherited proof-replay path.  Its unit tests pass.  The first real `xu/w`
window added 100 replayable cuts (81 unordered and 19 ordered), producing a
2,400-record journal with SHA-256
`7d0ac755c9a932b7a1d2dcfbe0c70982deb481e29724294349c647fc9081792b`.
It ended at `ITERATION_LIMIT`, not `UNSAT`.  This is still one arm of one fixed
placement, so it is neither six-arm coverage nor a live-sorry closure.  The
planned extension has now added 600 further arm-local records, for 700 v13
`xu/w` records beyond the authenticated 2,300-record v12 prefix.  The combined
3,000-record journal covers iteration numbers 15,273 through 18,272 and again
ended at `ITERATION_LIMIT`, not `UNSAT`; it has SHA-256
`cb21d6f02bc613bb0e6fb74d89894713649e193f5d5dda876cce3b4b0db040fe`.
Blindly extending the same cell is therefore not the immediate leverage
point.  The next computational milestone is either a new source-entitled
generalization that materially shrinks this survivor family or a terminal
outcome for the cell; only then should the other five arms and the checked
placement transport be scheduled.

An August 7 source-faithfulness audit found a separate defect in the inherited
common-missing-incidence base beneath v13.  The Lean branch supplies one
distinguished next center
`d = Hlate.centerAt c hcA`; the Python base instead negated the tetrahedron
incidence conjunction, and excluded the `xu` blocker, for **every** center
whose selected row contains `c` and omits `xu`.  No source theorem identifies
all such centers with `d`.  That universalization strengthens the finite
model, so the v13 run is diagnostic data only even within its fixed placement
and arm.  Its SAT/`ITERATION_LIMIT` result remains valid evidence that this
stronger model was not exhausted, but no future `UNSAT` from that frozen
schema would be promotable.  The next schema must introduce an explicit
distinguished-`d` selector and guard both the missing-incidence condition and
the blocker inequality by that selector.  The frozen v13 schema and journal
remain unchanged for reproducibility.

That repair is now implemented as the v14 `xu/w` branch.  It authenticates
and replays the frozen 3,000-record v13 journal but allocates a one-hot
distinguished-`d` selector before the first new solve; only the selected row
is required to contain `c` and omit `xu`, and both the tetrahedron negation and
`b(xu) ≠ d` are guarded by that selector.  Unit and prefix-authentication
tests pass.  The initially reported one-iteration canary and 100-iteration
window in fact executed zero new solves: the inherited runner interprets
`--max-new-iterations` as an absolute output-journal target, despite its name,
so a value below the 3,000-record resume prefix makes the loop empty.  Those
summaries are not SAT evidence.  A corrected run, with the target set to
3,100, added 100 genuine replayable certificates and ended at
`ITERATION_LIMIT`, not `UNSAT`; the resulting journal has SHA-256
`952602e5d025ac7be55dee5fe2a5ca30b694b5efad09b706f1f0ae501ed738a9`.
The selected-`d` counts were `0:7, 2:69, 4:12, 5:11, 6:1`.  The v13 records
remain usable only as independently replayed learned geometric cuts, not as
evidence for the soundness of the old v13 base.  The same unrestricted run has
now been extended to 3,600 records and remains at `ITERATION_LIMIT` with
12,252 membership nogoods; the journal SHA-256 is
`569954ad445a11619f35aab0fdbf9366db60304b583e5877745ce48400c72bc3`.
The new 500-record suffix selected
`d = 0:28, 2:322, 3:34, 4:38, 5:72, 6:1, 9:3, 10:2`.
In particular, the unrestricted source-faithful solver continues to expose
out-of-row witnesses; absence of `d = 8` or `11` from this finite suffix is
sampling evidence only, not a source exclusion.

The next attempted restriction was not source-faithful.  V15 forced
`d ∈ row[1]`, where the fixed row is `{6,0,2,8}`.  In the live Lean leaf,
however, this membership occurs only as one conjunct of the five-incidence
tuple negated by `hmissing`; neither `hcommon` nor the checked v14 ingress
proves it independently.  Consequently the v14 records with `d = 4` or `5`
cannot be discarded as source-impossible.  V15 is a strictly stronger
diagnostic branch, not a production successor.  Its authenticated 3,200-record
journal remains a reproducible diagnostic.  The v16 fixed-selector shards need
a more precise classification: once an in-row label `d = k` is pinned, v15's
units disabling every out-of-row selector are redundant with selector
one-hotness.  Each of `d = 0,2,6,8` is therefore a source-faithful v14 subcase,
but the four shards are not source-exhaustive because the live source also
permits out-of-row `d`.  The `d = 8` shard reaches fresh-solve `UNSAT` with a
verified DRAT proof, while `d = 0,2,6` remain at `ITERATION_LIMIT`.  This
eliminates one finite selector subcase after independent Lean replay; it does
not close the fixed cell or a live leaf.  Production coverage must resume from
unrestricted v14 or add fixed-`d` shards for every remaining eligible label.
The v17 fixed-selector wrapper implements the latter decomposition without
adding v15's unsound row-membership restriction.  Its ten source-eligible
shards are exactly `d ∈ {0,2,3,4,5,6,8,9,10,11}`: all twelve finite labels
except the source-proved exclusions `d ≠ 1` and `d ≠ 7`.  It authenticates
the frozen 3,200-record v15 journal only as a bank of independently replayed
geometric cuts, then rebuilds the v14 base and pins one selector.  Focused
wrapper, authentication, and selector tests pass (21 tests across the v14–v17
suite).  An out-of-row `d = 5` canary added one fresh, replayable certificate,
confirming that the wrapper is not silently retaining v15's selector-domain
restriction.  The `d = 8` v17 shard is terminal `UNSAT` at the frozen
3,200-record boundary with 46,083 variables and 483,739 clauses; the fresh
CaDiCaL proof passes `drat-trim`.  Its CNF and DRAT SHA-256 values are
`cee2fdb254c79380397e402b67f4675f2957f35cac8747b59c904ab2aef59f1f`
and `94f0f0fb1019b3f9fe75efbd3990436f2b488900e4d4c2556ea4b31a4fbec84e`
respectively.  This reproduces the v16 `d = 8` result through the corrected
v17 contract.  Core extraction then exposed a much smaller source-level
reason for the contradiction.  `drat-trim -c`
reduces the 483,739-clause formula to 472 clauses with 270 proof lemmas, 4,362
resolution steps, and no RAT steps.  The core SHA-256 is
`da11bc7594ad093e6c0f9eb14c13daf3b1e6bc16eb7ab069a6d5999221cbac91`;
it is byte-identical to the earlier v16 `d = 8` core, so the six removed v15
row-selector units were irrelevant.  Canonical clause provenance gives 467
input clauses from the already ported safe-cover base and only five later
source clauses.  Those five are the fixed first-row trace, the physical-cycle
blocker unit and its row-incidence implication, and the `d = 8` selector unit
and its missing-incidence implication.  Semantically they force both `9 ∈
row 8` and `9 ∉ row 8`.  The 23 clauses matching frozen-journal records (12
`all-source-order-coverage-v9` and 11 `unordered-membership-v6`) occur only as
DRAT proof lemmas; they are not trusted input axioms of the extracted core.

This source reason is now kernel checked rather than left at finite-UNSAT
status.  `FrozenDistinguishedDCommonMissingAwayFromEight` records the sharpened
selector domain, and
`frozenDistinguishedDCommonMissingAwayFromEight_of_firstTrace` proves `d ≠ 8`
from the first-row trace, the physical-cycle blocker, and the source-faithful
missing-incidence packet.  The v14 source-ingress theorem now exports that
sharpening.  A direct targeted check of
`ExactTwelveRigid221PhysicalCycleIngress.lean` passes.  This eliminates the
`d = 8` selector at source level; it does not close the fixed named arm or the
live leaf.

The initial v17 pilot wave is recorded in
`scratch/sidecar-sourcefaithful-common-missing-20260807-a7f3c1/distinguished-d-all-v17-wave-manifest.md`.
The complete pilot matrix has one terminal finite result (`d = 8`) and nine
`ITERATION_LIMIT` survivors.  Each surviving shard produced one fresh
replayable geometric cut.  After the kernel source exclusion, the remaining
selector domain is exactly `d ∈ {0,2,3,4,5,6,9,10,11}` for this fixed
`xu/w`, `(jd,v)=(0,2)` cell.  Closing those nine selectors would still leave
the other five named-deletion arms, placement transport, and the live Lean
consumer before this campaign could count as leaf closure.

The fixed-selector incidence audit is now exhaustive at the Boolean ingress
level.  Across the nine surviving selectors, the five incidences required by
the existing tetrahedron consumer are not forced.  For `d = 0,2` the 32
signatures reduce to four SAT signatures, all forcing `d ∈ B(O)`, `u ∉ K(c)`,
and `d ∉ K(xv)` while leaving the two `O` incidences free; `d = 6` has the same
four signatures except that `d ∈ K(xv)`.  Selectors `d = 3,4,5,10,11` retain
16 of 32 signatures and force only `d ∉ B(O)`, while `d = 9` retains eight and
also forces `d ∉ K(xv)`.  This is a finite source-faithful no-go for using the
current five-incidence consumer as complete coverage of this cell.  It is not
a theorem that no stronger source producer exists.

The surviving v17 shards share geometric cuts through an authenticated
cross-shard epoch compiler, but the first compiler contract required a
correction.  Epochs 1--4 were compiled by v1/v2 and happened to pass ordinary
replay under the tested selectors.  A 50-model-per-selector wave then exposed
that raw membership-clause integers are not portable: `pattern_variable` is
allocated lazily, so reordering independently generated journals can assign a
different variable to the same semantic membership.  The v1/v2 compiled
epochs are therefore historical experiments and must not be reused as banks;
the underlying selector-local source journals remain independently
replayable.

Compiler v3 authenticates the same 3,200-record prefix and every source
journal, deduplicates only by the canonical `selected_memberships` key,
preserves each source numeric clause as provenance, and marks the semantic key
for local rematerialization during ordinary replay.  Detector-specific replay
then rechecks the retained geometric certificate and the exact semantic key
before accepting the locally derived clause.  The repaired epoch 5 contains
3,729 records: 529 unique suffix records retained from 1,341 copies, with 812
duplicates removed; its SHA-256 is
`ebda16e235f25ab1630138fba5517638f50141955b5eca0d1e0d2a25cac61449`.
It passes the ordinary v17 replay path under `d = 4`, yielding 12,381
membership nogoods.  Focused tests cover semantic deduplication, harmless
certificate variants, local literal rematerialization, and rejection of a
record that ambiguously carries both portable semantics and a numeric payload.

The deeper wave classified 450 models but produced 430 new unique semantic
cores; none of those 430 was independently rediscovered by two selectors.
That is decisive empirical evidence that further depth in this fixed
`xu/w`, `(jd,v)=(0,2)` cell is mostly shard-local discovery rather than useful
cross-selector theorem mining.  The new cuts include 194 ordered-coverage,
110 duplicate-center, 68 perpendicular-bisector, 28 equilateral-bisector, and
21 triad cores.  The shortest three-row perpendicular-bisector instance is
already an application of the cardinality-independent
`false_of_convexIndep_of_perpBisectorCore`, not new geometry.  This campaign
therefore stops scaling the fixed cell.  The next computational target is a
source-faithful arm/placement-parametric adapter followed by small replay
canaries in a genuinely new named-deletion arm; no symmetry-orbit reduction
may be claimed until the corresponding Lean renaming theorem exists.  The
full corrected artifact contract is recorded in
`scratch/sidecar-sourcefaithful-common-missing-20260807-a7f3c1/distinguished-d-all-v17-cross-shard-epoch-report.md`.

That arm/placement adapter now exists as
`arm_placement_distinguished_d_shard_cegar.py` (v18).  It varies only the six
source-entitled named-deletion arms, the ordered `(jd,v)` placement, and the
distinguished-`d` selector; it explicitly records that historical v10 orbit
allocation is replay machinery, not a placement-transport claim.  Full
ordinary replay succeeds for the new `u/q`, `(jd,v)=(0,3)`, `d=4` cell.  A
runner audit also caught a historical interface trap: despite its name,
`--max-new-iterations` denoted a target total journal length, so requesting
five against a 3,729-record bank performed no solves.  The runner now exposes
the tested resume-safe `--additional-iterations` mode and records the initial
and target journal sizes.

The corrected canaries classified ten actual models: five in `u/q` and one in
each of the other five arms at `(0,3),d=4`.  Every one yielded an independently
replayable equality-duplicate-center certificate.  Semantic deduplication
retained seven cuts; the `xv/q` and `xv/w` cuts coincide, and the `xu/q` and
`xu/w` cuts coincide with one already found in `u/q`.  These cuts instantiate
the existing cardinality-independent `DuplicateCenterCore` consumer.  They
are useful shared exclusions, not a new producer and not leaf closure.

The seven cuts are compiled above the authenticated epoch-5 prefix into the
3,736-record portable arm/placement epoch with SHA-256
`b4e8820a750007ba1045febe00e97b9088bcb35b74c6a4f19965e5542b87d32a`.
Ordinary replay of that epoch succeeds in a second genuinely new placement,
`u/q`, `(jd,v)=(0,4)`, `d=4`, with 12,388 membership nogoods.  This establishes
portable certificate reuse across the sampled cells only.  The bounded
new-placement canary has now run: its one newly classified model produced only
an equality-duplicate-center certificate already covered by the generic
`DuplicateCenterCore` consumer, and the cell remains `ITERATION_LIMIT`.  This
triggers the planned stop-scaling rule; a broad arm-by-placement matrix is not
the next target.

The first source transport layer is now kernel checked in
`ExactTwelveRigid221PlacementTransport.lean`.  It defines the exact finite
placement domain, proves its cardinality is 42 with kernel reduction, proves
that every `FrozenRoleLabeling` lands in that domain, and constructs a new
fully realized frozen labeling after any carrier-label permutation which fixes
the nine named roles and preserves the variable-role domain.
`labeledRowPattern_trans` identifies the transported rows exactly with generic
row-pattern reindexing.  `ExactTwelveRigid221PlacementOrbits.lean` now supplies
two finite layers.  On the unrestricted placement domain, its deterministic
admissible permutation of the unnamed labels `3,4,5` reduces 42 ordered
placements to 21 representatives.  The imported source packet supplies the
physical-pair separation facts; this finite layer consumes them to restrict
the live domain to exactly 24 placements, and the same admissible action
reduces those to a stable proof-facing list of 12 representatives.  No swap of
the frozen named labels `10` and `11` is used.  The companion
`ExactTwelveRigid221NormalizedSafeIngress.lean` rederives the interior profile,
closed-cap profile, and `FrozenSafeCubeOK` from the geometric source after
normalization; this avoids assuming a generic candidate-table symmetry.
`ExactTwelveRigid221BranchTransport.lean` proves reindexing invariance for all
three v14 branch predicates, and
`ExactTwelveRigid221NormalizedV14Ingress.lean` transports the complete
source-produced packet--physical row, actual blocker identities, five exact
row traces, six-arm predicate, and both distinguished-`d` predicates--to one
of the 12 representatives while rederiving the safe cube.
The aggregate normalized-v14 target now passes a fresh targeted build.  Axiom
audits of that theorem and the separated 12-representative cover report only
`propext`, `Classical.choice`, and `Quot.sound`, with no `sorryAx` dependency.

These are source ingress, transport, and placement-coordinate representative
cover results, not full branch/certificate coverage theorems.  The first
complete finite schedule is now explicit: 12 placement representatives times
six named-deletion arms times the nine distinguished-`d` coordinate values
permitted by the `AwayFromEight` exclusions, for 648 cells.
`census/card_head/exact12_v14_schedule.py` now freezes that Cartesian schedule
under schema `p97_rigid221_exact12_full_v14_schedule.v1`, authenticates its
canonical payload, and hash-binds the schedule manifest to the listed Lean
source-file bytes.  It rejects omitted, reordered, duplicated, type-confused,
or source-drifted manifests; it does not itself validate Lean elaboration or
terminal semantics.  It is a data-only enumeration contract: arm names and
center indices are coordinates, not independently proved semantic witnesses.
`census/card_head/exact12_v14_jobs.py` now adds a deterministic per-cell job
descriptor and an authenticated complete 648-job set.  Every v1 job is
deliberately `SOURCE_TO_CNF_UNVERIFIED` with execution `BLOCKED`: validation
rejects schedule/source drift, coordinate tampering, type confusion, and
missing, duplicated, or reordered job-set entries, but no job may reach the
solver until a reviewed source-predicate-to-literal valuation contract is
hash-bound in a future executable schema.  The existing scratch v18 runner can
probe an individual arm/placement/center cell, and the existing epoch compiler
combines sampled records only; neither is that source-to-CNF contract or
supplies exhaustive cell coverage.

The follow-on finite binding is now implemented separately rather than
weakening that v1 history.  `exact12_v14_valuation.py` compiles the physical
five-cycle, six named-deletion arms, and distinguished-`d` predicates and
replays them independently on decoded rows and blocker centers.  It pins the
exact source-faithful candidate table and base CNF hashes, so a same-sized
lookalike surface fails closed.  A full regression compiles all 648 cells.  In
particular, the 72 `d = xu` cells correctly treat
`blocker(xu) != xu` as automatic from blocker-source exclusion; an earlier
draft incorrectly rejected those cells.

`exact12_v14_bound_jobs.py` now binds one blocked coordinate job to the exact
compiler source, variable map, and DIMACS bytes under a distinct finite-only
schema.  `exact12_v14_cell_run.py` uses that binding for one-cell discovery,
checks SAT assignments against every CNF clause and both independent semantic
replayers, and accepts a discovery `UNSAT` only after a fresh identical-CNF
proof run verifies DRAT.  The first real canary, cell 0, is
`SAT_WITNESS_REPLAYED`, with candidate, added-predicate, and exact-CNF replay
all true.  Thus the source-safe incidence layer is now producing authenticated
survivor data, but is not itself the missing contradiction.

That first geometric-refinement checkpoint is now implemented in
`exact12_v14_structural_cegar.py`.  The runner replays each SAT witness against
the source candidate surface, added v14 predicates, and exact current CNF;
accepts a cut only through the existing exact structural-certificate validator;
and journals it in an append-only chain bound to the job and detector sources.
Cell 0 first produced a five-row equality-duplicate-center cut.  A seeded
resume authenticated that record and produced a second distinct cut.  The
complete journals replay, and focused certificate, clause, tamper, and runner
tests pass.  Both canaries remain `ITERATION_LIMIT`, so this establishes the
refinement contract and resumability, not a terminal cell or finite coverage.

The first Lean record-ingress canary is now explicit in
`ExactTwelveV14DuplicateCenterCanary.lean`.  It translates the first
authenticated cell-0 journal certificate to
`DuplicateCenterNogood (Fin 12)`, kernel-checks the closure paths, and supplies
both exact- and positive-row-match source consumers.  A targeted build passes;
axiom audit of the positive consumer reports only `propext`,
`Classical.choice`, and `Quot.sound`.  The reusable
`ExactTwelveRigid221LearnedClauseBridge.lean` now closes the next semantic seam:
falsification of an emitted negative selected-row clause under the canonical
source `finalAssign` implies that every recorded row is the source-selected
candidate and therefore that the record `PositivelyMatches`.  The canary
kernel-checks encodability of all five rows and composes that exact Boolean
premise to `False`; its targeted build passes, and proof-blueprint mines zero
edges into axioms.

This completes record validity, literal reflection, and the conditional source
contradiction.  The semantic source/job seam is now kernel checked too.
`ExactTwelveRigid221V14JobSemantics.lean` defines the exact 648-element job
coordinate type and `FrozenV14AddedConstraintsHold`; the source bridge
`exists_source_normalized_v14_semanticJob` proves that every normalized
geometric packet selects one concrete cell and satisfies that complete
semantic predicate.  It includes the exact row-1 and row-7 constraints, all
five physical source/blocker exclusions and edge traces, and the selected
named-deletion and distinguished-`d` predicates.  Its targeted build passes,
and its axiom audit reports only `propext`, `Classical.choice`, and
`Quot.sound`.

The remaining source/job-clause gate is therefore narrower and exact: extend
the canonical source assignment to the emitted blocker and Sinz auxiliary
variables and prove satisfaction of the compiler's numbered DIMACS clauses.
This semantic theorem alone does **not** prove that compiler reflection, that a
journal is terminal, or that terminal CNF coverage forces one learned clause
to be false.  After the exact clause reflection lands, a generated terminal
bank plus the generic Boolean coverage step can feed the learned-clause bridge.
Only verified terminal cells should be scaled and aggregated across the
648-cell schedule.

This is not yet a proved disjoint partition: both the source arm and
distinguished-center predicates are existential/disjunctive, so overlap and
empty cells are allowed.  Promotion still requires a Lean ingress theorem for
every emitted detector family, contract-valid records for every required cell,
verified terminal outcomes, replay of every detector family used, and one
aggregate Lean coverage consumer.  A blocked, missing,
nonterminal, or unverified job is incomplete and contributes no coverage.  No
current learned bank certifies even that 648-cell union, and neither live leaf
is closed.

The source half of this contract is now kernel checked.  The public theorem
`outsideFirstApexFiber_centerAt_ne_firstApex` exposes the blocker-center
exclusion, and
`pentagonOffClassBlocker_namedSource_survival_sixArm` combines it with
`cross_deletion_survives_iff_not_mem_selected_support` and the live named-source
dichotomy to produce exactly the six source/deletion arms compiled by v13.  A
targeted build of `Rigid221SourceHeavy` passes.  This is a producer result, not
finite coverage: the normalized transport now preserves the arm predicate,
but the finite runner must still cover every required arm/placement/selector
cell, reach terminal outcomes, and replay those outcomes in Lean before either
exact-twelve live leaf can close.

The source-to-finite valuation for the physical blocker cycle and named
deletion arm is now kernel checked in
`ExactTwelveRigid221PhysicalCycleIngress.lean`.
`mem_labeledRow_at_actualBlocker_iff` translates a row literal at the actual
blocker label exactly to membership in the geometric selected shell.  The
strengthened
`exists_source_safeCubeOK_with_physicalCycleBlockers` constructs the
source-safe cube and injective five-source blocker map, identifies every
finite blocker with the corresponding geometric `centerAt`, proves every
blocker differs from its source and from the second-apex label, retains the
fixed identities `b(u)=8` and `b(xv)=7`, and retains all five exact
`frozenNamedDeletionSixArm_of_actualBlockers` compiles the geometric six-arm
producer into the exact finite predicate `FrozenNamedDeletionSixArm`, and
`exists_source_safeCubeOK_with_physicalCycleBlockers_and_namedDeletionSixArm`
packages that predicate with the full ingress valuation.  A direct targeted
Lean check of the module passes.  The source-faithful selector ingress is now
also kernel checked.  `FrozenDistinguishedDCommonMissing` is the finite
predicate used by v14.  It correctly guards the five-way tuple by one selected
`d`; it does not and must not assert `d ∈ row[1]` independently.
`frozenDistinguishedDCommonMissing_of_actualRows` labels the actual
`d = centerAt c`, proves its selected row contains `c` and omits `xu`, and
transports both `b(xu) ≠ d` and the missing tetrahedron incidence only at that
label.  The combined producer
`exists_source_v14_physicalCycle_namedArm_distinguishedD` supplies one common
witness satisfying the safe cube, physical row, five-cycle blockers, six-arm
disjunction, and distinguished-`d` predicate.  Direct targeted checks of both
ingress modules pass.  This completes the fixed-placement source-to-v14
semantic ingress.  The normalized-v14 transport above now discharges the
separate source placement-transport obligation and exposes the exact 648-cell
finite schedule.  It does **not** provide exhaustive six-arm/placement/selector
coverage, terminal `UNSAT`, certificate replay, or closure of either
exact-twelve live leaf.  The new full-v14 schema freezes the 648-cell
coordinate grid, and the blocked v1 job contract authenticates its per-cell
operational identities only.  The current v17 nine-selector partition and v18
arm/placement adapter remain canary machinery until a reviewed valuation
binding, terminal records, and Lean replay/coverage consumers exist.  No
current result justifies the historical eight-orbit claim.

The complete set of 37 ordered-v4 convex-core records has now been replayed by
kernel-checked cardinality-independent consumers.  Eighteen are the earlier
exact replays, six are subsumed by the four schemas in
`ExactTwelveRigid221OrderedThreeRowCuts.lean`, ten by the direct schemas in
`ExactTwelveRigid221OrderedUniversalThreeRowCuts.lean`, and the final records
7808, 8077, and 8556 by two-core arithmetic coverage in
`ExactTwelveRigid221OrderedResidualCoverageCuts.lean`.  Record 9306 and two of
the residual coverage theorems honestly retain the source-proved internal
second-cap order; the other direct schemas do not assume it.  Targeted builds
of all three new consumer modules pass.  This closes the **learned-cut replay
subtask only**.  The v4 run itself remains `ITERATION_LIMIT` after 10,000 new
records (10,706 total), not terminal `UNSAT`, and neither source-exhaustive
placement/signature coverage nor a live `sorry` has been obtained.

These are promoted or promotion-pending learned clauses, not closure.  A
future terminal `UNSAT` from the present row-only schemas would still not by
itself establish the blocker-sensitive source theorem suggested by v12, and
one fixed source-faithful placement still needs the exhaustive
placement/symmetry lift before it can close the universal live leaf.  The
equality-only journal and all earlier schemas remain frozen.

The final composition with
`pentagonOffClassBlocker_exists_faithfulCarrierPattern_for_xuConcreteRows` is
isolated in `ExactTwelveRigid221ConcreteRowsBridge.lean`; the new
`ExactTwelveRigid221SourceSafeIngress.lean` consumes it and the already proved
`pentagonOffClassBlocker_card_twelve_exact_cap_profile` theorem to produce the
complete `FrozenSafeCubeOK` row family.  Serialized targeted builds now pass
for the concrete-row bridge, source-safe ingress, same-boundary order ingress,
and all seven ordered-cut consumers from the first 3,000-record tranche after
the concurrent `Rigid221SourceHeavy` refactor.  The remaining gap is therefore no longer a
vague source-to-safe adapter.  It is certified finite exhaustion plus the
placement/symmetry lift needed to connect that exhaustion to the universal
leaf.  No current closure claim is based on the still-running finite search.

The older Python adapters remain unsuitable for promotion.  In
`scratch/pentagon-offclass-exact12-v2/probe.py`, the physical-apex row is only
chosen as a four-subset of a five-point physical class, so it does not justify
the later claim that this row witnesses every physical pair.  The same probe
imposes pairwise distinctness on all five physical blocker centers, while the
checked source theorem currently supplies only two specific blocker
inequalities.  Separately, `candidate_surface.py` still includes the unsupported
mixed `moserCount`/`sameCapCount` filter even though its one-hit and two basic
post-`SUB2` families now have checked source producers.  Therefore neither the
historical candidate surface nor `probe.py` is wholly proof-facing.  The new
`p97_rigid221_exact12_source_safe_candidate.v1` Python contract is the explicit
replacement: it disables the mixed cut and freezes the proof-facing candidate
table and base CNF.  The candidate-table/index equivalence and satisfying
choice-variable/Sinz valuation theorem are now implemented in
`ExactTwelveRigid221SafeCoverIndexBridge.lean`,
`ExactTwelveRigid221SafeBaseSat.lean`, and
`ExactTwelveRigid221SafeCoverSat.lean`.  The remaining work is not another
base-valuation theorem; it is a stronger source-proved branch predicate plus
an explicitly versioned finite coverage/UNSAT certificate.  No live `sorry`
has been closed by this ingress work.

Certificate replay has also started.  `ExactTwelveDuplicateCenterRecords.lean`
contains the first authenticated v7 duplicate-center record; its Boolean check
and generic no-realization consequence pass direct Lean checking.  This is one
sound learned row cut, not finite coverage.  The remaining promotion work is
now represented by an explicit finite-bank contract.  The generic checker
defines `DuplicateCenterNogood`, separately proves closed record validity, and
rules out a row pattern only after consuming an independent semantic-coverage
witness.  `FrozenRoleLabeling.false_of_duplicateCenterBank` specializes that
contract to this source branch.

The journal rows are marked `exact := false`, so their honest semantics is
positive incidence, not row equality.  The generic checker now exposes
`PositiveRowsMatch` and proves that positive containment becomes exact when
both the source row and recorded support have cardinality four.
`FrozenRoleLabeling.false_of_positiveDuplicateCenterBank` combines this with
`labeledRowPattern_card`.  Thus the row-arity bridge is checked; it is no
longer an implicit Python assumption.

`census/p97_search/export_generic_duplicate_center_bank.py` streams the v7
journal, independently replays each selected duplicate-center certificate,
checks its four-positive-incidence row shape, and emits generic Lean bank data
plus closed validity and four-support checks.  One-record and 100-record smoke
banks pass direct Lean checking.  This still proves only validity.  The exact
missing closure object is a theorem that every source-faithful frozen-role
pattern is **positively covered** by some bank member (or by the union of bank
members for all supported detector families).  The current partial journal
does not supply that theorem.

The remaining promotion work is therefore to serialize the checked full-v14
source-to-CNF valuation without weakening its branch predicates, prove
aggregate coverage against `FrozenRoleLabeling`, replay every detector family
used by a terminal run into its proof-facing alternative, and obtain terminal
proofs rather than iteration-limited journals.  The proved normalization uses
only the `S3({3,4,5})` action allowed while all nine named roles remain fixed:
42 unrestricted placements reduce to 21, while the source-proved separation
first restricts the live domain to 24 and then reduces it to the explicit 12
representatives.  The full promotion grid is therefore 12 x 6 x 9 = 648
cells.  The historical eight-cell schedule additionally swapped frozen named
roles and remains only a search heuristic.  No terminal exact-twelve UNSAT
certificate or aggregate 648-cell coverage theorem currently exists.

#### Exact-12 source32–56 wave-boundary theorem gate (2026-08-09)

A general-theorem search has now been run over proof-backed source sequence
numbers 32 through 56 rather than merely mining the next survivor.  All 25
certificates replay over all 48 source boundary orders.  Twenty-four are
instances of the existing convex five-point common-orientation obstruction;
source37 is the one source-independent structural collision.  Eighteen cuts
use three selected positive rows, four use five, two use six, and one uses
seven.  The only literally repeated labeled five-point core is
`(a,x,b,c,y) = (2,9,0,10,1)`, in sources 40, 41, 42, and 55.  Its seven required
incidences are already compressed by the cardinality-independent row theorem
`false_of_threeRows_core_2_9_0_10_1`.

The gate therefore found no missing local geometry consumer.  The reusable
equality-closure, five-point, Kalmanson, cap-crossing, and label-transport
interfaces already cover the observed proof shapes.  In particular, proving
another fixed exact-12 five-point contradiction would duplicate existing
infrastructure.  The next theorem target is upstream: a source-level producer
from the live Rigid221 residual hypotheses to a finite disjunction of
order-covered positive cores, followed by complete placement/cell coverage and
either a universal-cardinality lift or a source-entitled exact-12 preserved
subconfiguration theorem.

This conclusion is deliberately negative about closure.  Seven cuts do not
reduce to one direct three-row support, two five-point cuts require explicit
equality closure, and the structural cut is genuinely different.  No broad
named-role relabeling was used; only literally equal frozen labels were
compared.  The report and replayable JSON live under
`scratch/rigid221-sourceheavy-anchor/exact12-v14-source32-56-general-theorem-search-2026-08-09.*`.
The current post-source56 survivor has a diagnostic 48/48 two-core proposal,
but that is only a candidate source57 cut until its Lean source-order theorem,
nogood, and proof-backed binding are checked.

The Lean spine now exposes that conclusion directly.  The former single
`...exactTwelve_interiorDeletion_physicalRadius` obligation is a checked
dispatcher through
`pentagonOffClassBlocker_xu_commonDeletionFans_or_nextRow_onlyHit`.  Its
complete common-deletion incidence arm is discharged by the checked
tetrahedron consumer.  Two narrower on-spine leaves remain:

* `...physicalRadius_commonDeletion_missingIncidence`, retaining the exact-12
  source/deletion-survival packet, the concrete common-deletion witnesses, and
  the negation of the five-incidence tuple; and
* `...physicalRadius_nextRowOnlyHit`, retaining the complementary theorem-proved
  row trace `xu∈Kc`, `u∉Kc`, `xv∉Kc`.

Targeted Lean diagnostics pass for the dispatcher.  Its axiom audit still
contains `sorryAx` exactly because the two named leaves are open.  This is a
one-to-two on-spine narrowing with checked fan-out, not closure.

The `nextRowOnlyHit` arm now has a source-clean exact-deletion ingress.  The
theorem
`pentagonOffClassBlocker_uDeletion_exactEleven_fiveSurvivorRows_of_u_not_mem_nextRow`
combines `D.A.card = 12`, the proved `u ∉ Kc` trace, and the five-center
survival theorem to produce `(D.A.erase u).card = 11` together with five exact
q-free K4 rows and the distinct actual blocker where deletion fails.  Its
downstream `ExactTwelveRigid221Ingress` declaration is now only a compatibility
wrapper around the live source theorem.

The stronger source normalization
`pentagonOffClassBlocker_nextRowOnlyHit_exactElevenCarrier_or_xuCollision`.
It proves a precise binary interface:

* either all five surviving centers are distinct and the five exact rows are
  installed in a `FiveSurvivorFaithfulCarrierBoundary` on a faithful pattern
  over the original exact-twelve carrier (the rows themselves are extracted
  from the exact-eleven deletion); or
* the iterated blocker center equals the `xu` blocker center, and the two
  selected rows contain each other's sources.

The proof rules out the deleted-source and `v`-row center collisions from the
existing live row traces.  The only remaining duplicate-center branch is thus
the explicit reciprocal `xu` collision.  This source normalization now passes
targeted validation.  It remains finite ingress, not a terminal contradiction
and not a closed `sorry`.

A second, CEGAR-facing checkpoint now packages the same source theorem without
discarding either arm.  `FrozenNextRowOnlyHitDichotomy` records the actual
blocker `d` of frozen source `7`, the exact selected-row signs
`7,9 ∈ row d` and `6,8 ∉ row d`, and the source-proved alternative that either
the five relevant centers are distinct or `d = blocker 1` with reciprocal
incidence `7 ∈ row (blocker 1)`.  The theorem
`frozenNextRowOnlyHitDichotomy_of_actualBlockers` proves this predicate from
the live source packet, and `FrozenNextRowOnlyHitDichotomy.reindex` proves that
it survives every admissible placement normalization.  Finally,
`exists_source_normalized_physicalCycle_nextRowOnlyHitDichotomy` installs the
predicate together with `FrozenSafeCubeOK`, the complete five-cycle row trace,
the actual-blocker identifications, and one of the twelve checked placement
representatives.  At that historical checkpoint both modules passed direct
Lean elaboration and contained no local `sorry` or axiom declaration; the
first also passed the then-targeted Lake build.  This is not a current green
promotion claim for the later arm-static route.

The exact successor-job contract is now explicit in
`ExactTwelveRigid221NextRowJobSemantics.lean`.  Its theorem
`exists_source_normalized_nextRowOnlyHitJob` combines the normalized source
packet with the v14 source-job bridge only at the theorem-bank level: it exports
the exact frozen physical class and row-at-one, the physical five-cycle and
actual blockers, the pinned blocker centers, and the full next-row dichotomy.
The targeted Lake build passes.  Its transitive axiom report contains only
`propext`, `Classical.choice`, and `Quot.sound`, with no `sorryAx`.  This is the
source-to-finite semantic ingress for the successor job; it is not a proof that
the Python emitter reflects Lean syntax and is not a finite contradiction.

This predicate is compiled as a separate successor schema.  It cannot be
conjoined with the historical v14 distinguished-row contract: the new source
theorem proves `9 ∈ row d`, whereas v14 assumes `9 ∉ row d`.  The next bounded
compiler is `p97_rigid221_exact12_next_row_only_hit_compiler.v2` in
`census/card_head/exact12_next_row_valuation.py`.  Unlike its first draft, v2
does not import the private v14 semantic compiler.  It reconstructs the frozen
source-safe instance, exact physical class/row traces, actual blocker cycle,
and distinguished-row disjunction directly, then independently decodes and
replays both dichotomy arms.  Its focused compiler tests pass.

The fail-closed one-cell runner is
`census/card_head/exact12_next_row_cell_run.py`, schema
`p97_rigid221_exact12_next_row_only_hit_cell_run.v1`.  It authenticates the
compiler and Lean source inventory, materializes a fresh source-faithful CNF,
uses proof-free discovery, and accepts SAT only after candidate, successor, and
exact-CNF replay.  Discovery UNSAT is accepted only after a fresh identical-CNF
run produces a DRAT proof verified by the existing adapter.  Runner and
compiler tests currently pass 16 tests plus 4 subtests, and Ruff is clean.
The one-cell canary and its 25-cut resume passed every replay gate.  The
authorized twelve-core/twelve-cell wave then ran under schema v2 to 100 local
refinements per cell.  Fresh post-wave replay reconstructs every job and
current CNF, authenticates and semantically replays all 1,182 journal records,
and replays the persisted unresolved survivor against its exact post-journal
formula.  The aggregate is 1,167 duplicate-center, 11
equilateral-bisector, three three-triad, and one perpendicular-bisector cut;
11 cells are `ITERATION_LIMIT`, while cell 3 is
`STRUCTURALLY_UNRESOLVED` after 82 cuts.  The replay report is
`scratch/rigid221-sourceheavy-anchor/exact12-next-row-structural-cegar-wave-i100-20260810-v2/postwave-theorem-search.json`,
with the trust and route classification in that directory's `REPORT.md`.

The four admitted detector families already have generic geometric theorem
families in `Census554`; the post-wave pass therefore did not discover a
missing consumer for an admitted cut.  It instead exposed the actual next
predicate gap: the cell-3 survivor satisfies the complete current finite CNF
but has no order-independent `MetricCoreAlternative` certificate.  Do not
raise the iteration limit on that cell under the unchanged detector.

The source-entitled order diagnostic has now been promoted to a checked finite
cut.  `ExactTwelveRigid221NextRowCell3PositiveCut.lean` proves the complete
48-order split and packages it as `nextRowCell3PositiveNogood`; the exact
binding is bank entry 56.  Tagged journal v4 records the certificate family,
bank index, exact bank SHA-256, selected-row clause, cube, and complete positive
SAT assignment.  Replay recompiles the supplied bank, reattests its live Lean
and detector sources, and commits no clause until the complete journal passes
on a shadow instance.  This deliberately supersedes the unauthenticated-bank
v3 canary rather than migrating it.

The fresh v4 cell-3 canary under
`scratch/rigid221-sourceheavy-anchor/exact12-next-row-tagged-cegar-canary-cell3-i84-20260810-v4`
replayed all 84 records.  Record 82 uses bank entry 56; the aggregate is 82
duplicate-center, one source-order positive-coverage, and one
perpendicular-bisector/convex cut.  The run ended `ITERATION_LIMIT`, with bank
SHA-256
`f3aef3b9b7ad921f3dccff027f1cbb82ca147d3c5369cc92142c65ba5586ab47`
and no terminal proof.

Historical twelve-cell v4 wave: the run under
`scratch/rigid221-sourceheavy-anchor/exact12-next-row-tagged-cegar-wave-i100-20260810-v4`
completed with 100 authenticated records in every cell.  All twelve
cells ended `ITERATION_LIMIT`; there is no terminal CNF or DRAT proof.  Across
the 1,200 records, 1,184 are duplicate-center cuts, eleven are
equilateral-bisector collisions, three are three-triad collisions, one is a
perpendicular-bisector/convex cut, and one is the source-order bank entry 56.
The mandatory post-wave theorem search is recorded at
`exact12-next-row-tagged-cegar-wave-i100-20260810-v4/postwave-theorem-search.json`.
It found no new local theorem family: the non-source-order cuts match existing
`Census554` obstruction families, while entry 56 already has its checked
positive nogood.  Matching a Python certificate to such a family is not a
typed journal-to-Lean consumer; the structural records therefore carry a null
direct-consumer field until generated Lean nogoods are supplied.

That replay exposed a typed-ingress defect rather than a missing local metric
lemma.  The shared source-order bank named
`SourceOrderTerminalBankConsumer.false_of_terminalSourceOrderPositiveBank`,
but that theorem constructs the historical v14 formula using
`FrozenV14JobCnf.reconstructedClauseDelta`.  It is not a direct consumer for
the successor predicate `FrozenNextRowOnlyHitAddedConstraintsHold`.
`ExactTwelveRigid221NextRowTerminalBankConsumer.lean` now supplies a separate
conditional terminal interface.  A generated `CompiledNextRowJob` must prove
that its exact serialized finite formula has a source assignment agreeing with
the canonical selected-row assignment on all base variables.  Only then may a
terminal UNSAT fact and a bank of proof-carrying positive nogoods yield
`False`.  Tagged journals move to v5 and record this lane-specific consumer
only for proof-carrying source-order entries.  Structural entries record no
direct Lean consumer.  The v4 records are retained as historical diagnostics
and rejected by live v5 replay rather than silently reinterpreted.

The mathematical half of that typed ingress is now explicit.
`ExactTwelveRigid221V14JobSemantics.lean` isolates the shared physical-cycle
predicate used by the common clause prefix; its final two `True` fields only
forget the two v14-specific suffix conjuncts and are not new geometric
assumptions.  `ExactTwelveRigid221NextRowJobCnf.lean` reconstructs the exact
ordered selector suffix, including the compiler's guarded blocker clauses,
and proves that a source-produced next-row assignment satisfies the complete
common-prefix-plus-selector delta below the exact variable ceiling 42,730.
`ExactTwelveRigid221NextRowCompiledJob.lean` adds the base-CNF agreement and
satisfaction proofs and packages
`baseDimacs ++ reconstructedClauseDelta cell` as a concrete
`CompiledNextRowJob`.  At that historical checkpoint targeted 32 GB direct
elaboration was green; the higher cap was needed because the imported
frozen-v14 native computation exceeded the ordinary 16 GB wrapper cap.  The
axiom audit contained no
`sorryAx`, but does contain `Lean.trustCompiler` through those existing native
encoding checks.

This object is deliberately named `reconstructedCompiledNextRowJob`: it did
not yet authenticate that the Python emitter serialized the same ordered
clause list.  The next exact target at that checkpoint was an emitted per-cell
clause artifact and a checked equality
`serializedClauseDelta = reconstructedClauseDelta cell`, following the
existing v14 cell-0000 pattern.  That equality upgraded the reconstruction to
an authenticated `CompiledNextRowJob`; the subsequent v5 work is historical
and has been superseded by the arm-static route above.  This checkpoint had no
terminal DRAT proof,
all-cell coverage, universal lift, or live `sorry` closure.

A fresh theorem-family search over the last 100 records of all twelve
`86017f66` cells classified 1,145 duplicate-center cores, 24
equilateral-bisector collisions, 22 perpendicular-bisector/convex cores,
seven three-triad collisions, one six-point five-circle collision, and one
source-order positive-coverage cut.  Every structural family is already an
arm of `Census554.MetricCoreAlternative`, consumed generally by
`Census554.false_of_metricCoreAlternative`.  The report is
`scratch/rigid221-sourceheavy-anchor/exact12-v14-wave-86017f66-plus100-general-theorem-search-2026-08-09.md`.
It therefore identifies no missing local geometry consumer and proves no
coverage theorem.

Background mathematical producer obligations, independent of the immediate
arm-static canary, are:

1. map the exact-twelve `FiveSurvivorFaithfulCarrierBoundary`, together with
   only source-entitled role/order data, to `Census554.MetricCoreAlternative`;
2. consume the reciprocal `xu` collision through an existing or new
   pinned-multiplicity, duplicate-center, or third-bisector terminal.

The finite adapter now being validated for target 1 is
`FrozenFiveOmissionBoundary`.  It records exactly one deleted label, a
five-element set of selected-row centers all omitting that label, and the
deleted label's distinct actual blocker outside that center set whose row
contains it.  The source theorem
`exists_frozenRoleLabeling_with_fiveOmissionBoundary` transports this packet
through a `FrozenRoleLabeling` for the same faithful carrier pattern and
packages `FrozenSafeCubeOK` for that exact same labeling.  This shared witness
is required: separate existential labelings for the base candidate cube and
the five-omission predicate would not justify their conjunction in one CNF.
The source adapter and same-labeling transport now pass targeted elaboration.
Live axiom checks report only `propext`, `Classical.choice`, and `Quot.sound`,
with no `sorryAx`.  This is a green source-to-finite ingress theorem, not a
finite contradiction or a closure theorem.

A fresh indexed theorem-bank search found no existing terminal for either
branch.  The closest reciprocal-incidence result,
`blocker_centers_eq_iff_mutual_cross_membership_of_first_apex_double_deletion_survives`,
requires its own robust double-deletion packet and characterizes blocker
equality; it does not contradict the reciprocal collision already produced
here.  Likewise,
`third_fiber_or_larger_known_fiber_of_three_omissions` assumes three values
omitted globally by one finite self-map and two pre-existing collision fibers.
The five-omission boundary instead says that one deleted source is absent from
five selected rows.  Those are different quantifier patterns, so the latter
cannot be used as the former's omission ingress without a new source theorem.
This search therefore confirms, rather than removes, the two producer gaps.

The older v14 job is not automatically a consumer for this packet: its
distinguished rows are tied to different frozen source roles, while the new
boundary chooses arbitrary exact `u`-deleted K4 witnesses at five proved
centers.  Any further finite search must encode one of the two exact interfaces
above and return a replayable named core for the same carrier pattern.  Another
unconstrained exact-12 row-pattern wave, or reuse of v14 cuts without a new row
identification theorem, does not consume the new source data.

The smallest source-faithful implementation path is the generic exact-twelve
selected-row universe in `census/card_head/source_faithful_candidate_surface.py`
and `sat_encoding.py`, with independent complete-cube replay through
`source_faithful_cube_ok`.  For labels `0,...,11`, a boundary witness is a
triple `(deleted, blocker, centers)` with `blocker != deleted`, five centers
chosen outside the blocker, `deleted` present in the blocker row, and
`deleted` absent from every center row.  There are 60,984 such label triples.
The source contract does **not** prove that `deleted` is outside `centers`, so
an encoder imposing that extra exclusion would be unsound.  The first bounded
run must either post-filter complete cubes or introduce explicit witness
variables with both CNF and decoded-predicate replay.  It must not use
`CoverInstance.pattern_variable` as a biconditional: that helper currently
encodes only selection implies pattern.  Only after this can the loop shape of
the v14 structural runner be reused; its v14 materializer and detector are not
valid unchanged for this packet.

That separate finite schema now exists as
`p97_rigid221_exact12_source_safe_five_omission.v1` in
`census/card_head/source_faithful_five_omission.py`.  It deliberately leaves
the frozen source-safe base untouched and adds one-hot deleted/blocker
selectors, exactly five omission-center selectors, the source-entitled role
separations, and exact selected-row incidence clauses.  Its allocation is
42,680 variables and 405,266 clauses before fixing a deleted-label shard;
selector identities and those totals are regression-pinned.  Focused Python
tests replay the decoded boundary on the same complete SAT assignment and
reject role collisions and non-exact-twelve construction.

The authenticated structural CEGAR runner is now schema v2 and fixes several
custody gaps found in adversarial review.  Journal records bind the complete
formula-source manifest as well as the base DIMACS and detector manifest;
complete journal replay recomputes the base formula from the finite instance;
formula and detector transitive source manifests are explicit; and the runner
reads each persisted CNF through one no-follow regular descriptor and sends
those exact verified bytes to CaDiCaL on standard input.  This removes the
earlier hash/pathname/reopen gap.  A discovery UNSAT is accepted only after a
fresh byte-identical terminal rerun emits a nonempty DRAT proof; `drat-trim`
then receives unlinked snapshots of the exact CNF bytes and the descriptor-read
proof bytes.  Journal replay has independent per-line, total-byte, and record-
count bounds.  Formula, detector, and tool manifests are rechecked at run end,
and recorded executable bytes are checked around every subprocess call.  The
final journal replay also hashes the fully reconstructed current DIMACS bytes
rather than checking only record count, chain head, and learned-clause set.
Detector replay accepts `direct_row_equality_replay` only when its JSON value
is the literal Boolean `true`; truthy strings and other non-Boolean values fail
closed even if the surrounding proof digest is recomputed.
Malformed positive assignments, malformed contract digests, duplicate JSON
keys, truncated or oversized journals, symlink artifacts, formula mutation,
and failed terminal custody all fail closed.  The runner explicitly records
that adversarial same-user executable swap-and-restore remains outside its
trust boundary on macOS; it does not claim `fexecve`-strength tool custody.
The focused tests for runner replay, detector validation, and typed-bank
export, together with their Ruff checks, pass.  This hardening improves
artifact trust only; it proves no finite coverage or source theorem.

The historical schema-v2 authenticated canary fixed deleted label `2`.  The
shard formula therefore had 405,267 clauses and SHA-256
`76567bd3dd62ed8e64093841e0f6b07e545caa9d7b830026066dd86736c9f1dd`.
One SAT iteration replayed the complete assignment and same-labeling boundary,
then produced a replay-valid `equality-duplicate-center` cut: blocker `11`,
omission centers `4,5,6,7,8`, and rows centered at `8,10` sharing the triple
`2,3,4`.  The current stdin-bound authenticated journal is under
`scratch/rigid221-sourceheavy-anchor/five-omission-v2-stdin-canary-deleted2-i1/`.
It has journal SHA-256
`22b39cbae847580058da16da6459ade9a729875af0ae51ab74d5432b923646d7`
and terminal record SHA-256
`5f4f20724ee9947ea609413557c9b626f62c1dc0c91116a499d7f1070af9cac9`.
The complete journal, source manifests, tool manifest, exact CNF assignment,
and same-labeling boundary all replayed under that recorded contract.  Its
status is `ITERATION_LIMIT`, not terminal UNSAT.  Because detector and terminal
replay have since been hardened as described above, this directory is
historical finite-mining evidence and intentionally fails current manifest
validation; it is not current promotion ingress.

The same-labeling Lean ingress subsequently passed targeted elaboration in
`ExactTwelveRigid221SourceSafeIngress.lean`.  Live `#print axioms` checks on
the five theorem-facing declarations reported only `propext`,
`Classical.choice`, and `Quot.sound`, with no `sorryAx`.  This validates the
source-to-finite five-omission adapter and the `nextRowOnlyHit` disjunction;
it does not produce a contradiction.  The initial 25-refinement wave was then
extended by 250 refinements per deleted-label shard.  The aggregate checkpoint
under
`scratch/rigid221-sourceheavy-anchor/five-omission-v2-wave-seed25-plus250-20260809T2232/`
contains 12 `ITERATION_LIMIT` summaries and 3,300 records that were
authenticated and replay-valid under their recorded contracts: 3,286
`equality-duplicate-center` cuts and 14
`equality-equilateral-bisector-collision` cuts.  There is still no terminal
UNSAT shard, terminal proof, survivor, replay failure, coverage theorem, or
live `sorry` closure.  The aggregate classification and custody boundary are
recorded in that directory's `REPORT.md`.  These directories are not rewritten
after a contract change and no longer satisfy the current source-manifest
check, so they remain theorem-mining evidence rather than current promotion
artifacts.

A later fixed-code deleted-label-`0` diagnostic reached 202 cuts before its
iteration limit: 201 `equality-duplicate-center` records followed by one
`equality-equilateral-bisector-collision` record at index 201.  The generated
heterogeneous `Bank-v5.lean` proves each emitted learned-clause identity and
each cut's `FrozenSafeCandidateAt` encodability, and directly elaborated at
that checkpoint.  The run is under
`scratch/rigid221-sourceheavy-anchor/five-omission-v2-fixed-bisector-smoke-20260810/deleted-0/`.
It is still neither UNSAT nor closure, and the subsequent strict-Boolean and
full-DIMACS replay hardening makes its recorded manifest stale.

That current-contract execution gate has now been rerun.  A fresh deleted-label
`0` one-record canary passed exact-CNF, same-labeling, journal, source-manifest,
and tool replay.  A fresh 202-record reproduction then recovered the same stage
distribution and final formula SHA-256
`4ebcd31a40312b632f4d1cd2048dfb0bca8ddad732eb227f6070316242afa9f4`
under the hardened contract.  Its authenticated heterogeneous bank contains
all 202 cuts, has SHA-256
`9b994be7f466f1ec449ba029036a7cf792631d8f6d5dff4ad05e879b6b833aad`,
and directly elaborates in Lean.  The fresh artifacts live under
`scratch/rigid221-sourceheavy-anchor/five-omission-v2-hardened-bisector-repro-20260810/`.
This clears the current-contract replay and typed-bank packaging gate for a
bounded 12-shard wave; the reproduced shard remains `ITERATION_LIMIT`, so it
does not clear the terminal UNSAT, all-shard coverage, or live-closure gates.

The ensuing current-schema bounded wave ran 275 authenticated refinements in
each of the twelve deleted-label shards under
`scratch/rigid221-sourceheavy-anchor/five-omission-v2-hardened-wave-i275-20260810/`.
All twelve shards again stopped at `ITERATION_LIMIT`; the 3,300 replayed
records comprise 3,286 duplicate-center and 14 equilateral-bisector cuts, with
no terminal CNF/proof or UNSAT shard.  Exact-clause deduplication leaves 441
portable cuts: 437 duplicate-center and four equilateral-bisector records.  The
strict shared-bank artifact is
`scratch/rigid221-sourceheavy-anchor/five-omission-v2-hardened-shared-bank-v2-i275-20260810.json`;
its file SHA-256 is
`cf38e9e1bba56a4772b67de70404c2c7b87cb4f4b28923b7037bffce1427d698`,
its document SHA-256 is
`560765255fd5c52d552d84e5bf3ee108d7f50d27dc5c81913cfdeb93f5a9b4d6`,
and its ordered clause-list SHA-256 is
`904c5cf0bb4f38e97a04a34d49f8241fa6b2509c77951f5f7b2618fc7e5fccc2`.
The v2 loader preserves all 3,300 source occurrences, authenticates the twelve
source-run contracts, and recompiles every certificate to the same clause
against every deleted-label target.  This is a reusable finite bootstrap bank,
not terminal evidence, a universal producer, or a live closure.

That successor checkpoint is now complete.  The schema-v3 runner binds the
frozen bank into the effective CNF, run summary, and each subsequent journal.
The fresh wave under
`scratch/rigid221-sourceheavy-anchor/five-omission-shared-v3-wave-i275-20260810/`
again ran 275 local refinements in each of twelve deleted-label shards.  All
twelve runs ended `ITERATION_LIMIT`, with no terminal proof.  The local
sequence is identical at the clause, stage, and certificate levels across all
twelve shards: 259 duplicate-center, 14 equilateral-bisector, and two equal-K4
cuts per shard, or 3,108/168/24 records in aggregate.  The full journal records
are deliberately not claimed identical because their shard provenance differs.

The fail-closed layered successor is
`scratch/rigid221-sourceheavy-anchor/five-omission-v2-plus-v3-i275-successor-v1-20260810.json`.
It contains 441 authenticated bootstrap records and 275 distinct local records,
with zero clause overlap, and exposes their 716-clause union only as a derived
projection.  Its artifact SHA-256 is
`238155f0f5ba5ae7cb98567566b3d5fb7c1a0ab0c9e93f51b997998288c3ad63`,
its document SHA-256 is
`7385bd97ffc28f0896aa00da09551faf30b44e2b4de862127c571ece4d629cf9`,
and its derived clause-list SHA-256 is
`30f774f47855ac4e26a8e868276366363bf389ceb2fd851d791041aa53697775`.
The loader independently replays both layers against all twelve target shards.

The typed exporter now consumes this successor artifact directly.  The complete
716-cut generated bank contains 696 duplicate-center, 18
equilateral-bisector, and two equal-K4 cuts; it proves every typed obstruction,
exact learned-clause identity, and frozen-candidate encodability.  The generated
source SHA-256 is
`7312bec9304ca8accff6451237338d3b87943e3a908ce964a5d9f7de3fdf8510`.
Targeted direct Lean elaboration passes.  This typed validity result still does
not supply terminal UNSAT, exhaustive coverage, a universal lift, or a live
closure.

The mandatory post-wave theorem-bank search found no source-clean theorem that
uniformly constructs one of these duplicate-center nogoods from the source-heavy
pentagon traces.  The first concrete theorem-discovery target is a
`PositiveRowsMatch` proof for the stored record44 pattern (support triple
`{2,3,11}`), followed by a uniform statement that some checked bank member
positively matches the source labeling.  This theorem route and the terminal
finite-coverage route are complementary; neither has yet discharged a live
leaf.

The mandatory search was repeated over the 275 distinct v3 local cuts.  All
cuts instantiate the existing duplicate-center, equilateral-bisector, or
equal-K4 obstruction families.  No source-clean cross-center theorem was found
that forces one of those patterns from an arbitrary live Rigid221 packet, and
the cuts do not produce the missing cross-center incidence facts required by
the current residual leaves.  Thus the v3 wave added a stronger finite bank but
no new universal producer or live closure.  Another wave using only these same
three predicates is not the next theorem-discovery target.

The corresponding post-wave theorem audit found no unconditional theorem from
`FrozenFiveOmissionBoundary` alone to `PositiveRowsMatch` or
`MetricCoreAlternative`; that is expected and is not the terminal-bank route's
missing premise.  For a **falsified learned clause**, the existing
`DuplicateCenterNogood.positivelyMatches_of_learnedClause_false` theorem already
derives the selected-row facts from `FrozenSafeCubeOK` and the clause's frozen
candidate encoding.  The generic duplicate-center checker then supplies the
geometric contradiction (equivalently, two distinct selected rows cannot share
three labels; see `labeledRowPattern_inter_card_le_two`).  Consequently a
separate source theorem identifying every mined row in advance is unnecessary
for the duplicate-center cuts in terminal coverage: complete-formula UNSAT
forces some learned clause to be falsified by the source assignment.  This
conclusion does not promote other detector families; each such stage still
needs its own row-uniform typed source core.

The exact Lean ingress and conditional consumer are now implemented and green
under targeted elaboration.  `ExactTwelveRigid221FiveOmissionCnf.lean` mirrors
the Python allocation and exact 405,266-clause common formula;
`ExactTwelveRigid221FiveOmissionFormulaSat.lean` proves that every
`FrozenSafeCubeOK` row with a `FrozenFiveOmissionBoundary` source witness
satisfies the common formula and its deleted-label shard; and
`ExactTwelveRigid221FiveOmissionTerminalBankConsumer.lean` consumes a
heterogeneous typed bank of source-proved positive-row cuts together with a
`DimacsUnsatisfiable` proof.  Duplicate-center cuts use the existing typed
constructor.  Equilateral-bisector and equal-K4 cuts now have their own generic
row-uniform certificate constructors as well, so the stored equality paths are
replayed from arbitrary positive realizations of each cut's complete selected
rows rather than assumed from one decoded SAT assignment.
The transitive axiom audit found no `sorryAx`; the executable selector and CNF
anchors use the governed `native_decide` boundary (`Lean.ofReduceBool` and
`Lean.trustCompiler`) in addition to standard Lean axioms.

This exact-12 route directly targets only the two exact-12 residual children,
`...physicalRadius_commonDeletion_missingIncidence` and
`...physicalRadius_nextRowOnlyHit`.  The same anchor has two additional
cardinality-at-least-13 residual children,
`...uDeletion_fixedPhysicalPair_missingIncidence` and
`...threeCenterDeletion_xv_missingIncidence`; exact-12 terminal evidence would
not consume either of them.  A fresh mandatory theorem-bank search found no
existing source-clean shortcut from these four residual interfaces to a
checked terminal.

The remaining exact-12 promotion gap is fresh terminal evidence and its final
packaging:
computation must reach a terminal byte-identical DRAT-verified UNSAT formula,
postprocess it to the checked compact-RUP/`DimacsUnsatisfiable` boundary, and
package every learned record in the terminal bank as the corresponding typed
source-order nogood under one unchanged current contract.  The typed
heterogeneous bank generator now packages the complete 716-cut successor as
conditional cut validity; it does not supply the absent terminal proof or
all-shard coverage.  Until those artifacts exist, the historical waves, the
new schema-v3 wave, and the 716-cut successor remain finite theorem-mining and
regression evidence, not a producer, coverage theorem, or live closure.

The next missing object is therefore split in two at both theorem and
promotion boundaries.  For theorem discovery, mine a source theorem or a new
consumer for the **disjunctive** missing-incidence patterns rather than one
arbitrarily chosen bit, and audit the next-row-only-hit leaf independently.
For promotion, preserve the checked base extraction/label transport and add
each stronger `blocker`/`choice`, source-role, row-trace, and deletion-role
predicate behind an explicit new schema with its own source theorem.  The historical
500-model run is only the canonical `u`/`q` slice, and the later v7 run on that
same slice stopped at its iteration limit rather than terminal `UNSAT`.
Until CNF semantics and exhaustive finite coverage are proved, even a future
terminal finite `UNSAT` would not close the common-deletion leaf, the exact-12
parent, or the universal parent.

Separately, when a cardinality-at-least-13 encoder is introduced, the fixed
`u`-deletion leaf should precede the arbitrary-source `xv` leaf: its sources
are canonically `xu` and `jointDeletion.deleted`, and its checked consumer has
one explicit five-incidence antecedent.  That campaign needs a new
cardinality-sound ingress; exact-12 journals cannot be reused as evidence for
it.

#### Unreachable or intentionally parked placeholders

These are included so the inventory is complete, but they do not currently
block `Problem97.erdos97_rhs` because they have no publish-spine path:

* `Problem97.U1LargeCapRouteBTail.DoubleApexOffSurplusSharedRadiusPair`
  (`lean/Erdos9796Proof/P97/U1LargeCapRouteBTail.lean:2446`), with a local
  U1 consumer but no current target reachability (one body placeholder).  It
  has no computational closure route recorded.
* `oppCap2_endpointEscape_false` and
  `surplusEscape_pinnedFamily_sep_false` in
  `attic/U2OppCap2Escape.lean` (two inline body placeholders); both have local
  attic consumers but the attic module is not imported.  No computational
  closure route is recorded.
* `Problem97.CPackageBankFidelity.fidelity_c1`,
  `Problem97.CPackageBankFidelity.fidelity_c2`, and
  `Problem97.EPackageBankFidelity.fidelity_e1` in the two
  `lean/scratch/*/FidelityCheck.lean` files (three body placeholders).  They
  are explicitly parked fidelity checks, not production obligations; their
  banked source-clean companions do not close the live leaves.
* `comparator/Challenge.lean` contains 30 intentional challenge stubs.  They
  are discharged by `comparator/Solution.lean` and are not a production
  target.  Root `scratch/` also contains stale exploratory placeholders in
  `live-bank-match/routeBTail_HEAD.lean` (50 body placeholders),
  `p1b-fidelity-audit/{baseline,candidate}.lean` (50 and 56),
  `f3-anchor-slice.lean` (2), `current-freshthird-anchor-slice.lean` (2),
  `atail-arm1/UniqueArmReduction.lean` (2), and
  `atail-arm2/SI1CardFiveCollisionResidual.lean` (1); these 163 body-level
  occurrences are a hygiene inventory, not 163 publish obligations.  They
  must remain marked `PARKED-SPEC` (or be removed/wired deliberately) and must
  not be counted as closure progress.

The source scan also finds prose mentions of `sorry` and generated/commented
examples in other Lean files.  They are not declaration bodies and are omitted
from the recorded inventory above.  Do not edit the generated
`docs/live-blueprint.md` by hand; regenerate it only after the source/build
state is reproducible.

Cardinality scopes must not be conflated.  The all-large tri-apex parent has
cap floor `(6,6,6)` and therefore carrier floor `|A| ≥ 15`; its first
cardinality search order is `15, 16, 17, 18`.  The F-Γ cap-source target is a
strict subbranch whose surface additionally assumes the first indexed cap has
cardinality at least eight, giving floor `(8,6,6)` and `|A| ≥ 17`.  Thus the
17-point F3 incidence shadow below does not raise the parent theorem's lower
bound from 15, and a 15- or 16-point parent survivor need not instantiate the
cap-source packet.

### Post-card-11 route handoff (2026-08-01)

`Problem97.FiniteN11Closure` is now a verified fixed-card regression endpoint:
it closes the exact-cardinality-11 branch, but it does not reduce the 18
universal `FrontierLiveClosure` obligations.  The production continuation
dispatches every non-11 carrier directly to
`ATailFrontierLiveClosure.false_of_twoLargeCaps_commonCriticalMap`.

The production target is therefore the uniform all-large-cap E1 route in
`ATail/FrontierLiveClosure.lean`.  Its normalized retained omission
`Q : RetainedOmissionAllLargeNormalForm P` is now dispatched through two
explicit constructor arms; each retains the flattened
`G : TriApexAllLargeContext D S` and parent residual `R`.  The paired arm is a
terminal, while the reverse-hit/fresh arm is a proved dispatcher to the
endpoint-critical-fiber and three-distinct-blocker branches.  The endpoint
branch is itself a proved dispatcher to cross-hit and fresh-common-deletion
terminals.  At the public route boundary these four leaves are reached through
the proved dispatchers, then
`false_of_frontierLargeOppositeCapsBiApexRobustResidual`, then the all-large
tri-apex wrappers, and finally
`false_of_twoLargeCaps_commonCriticalMap`.

Do not make an exact-card-12 or exact-card-13 census the next production
milestone.  Cards 11–13 remain regression/fallback evidence only.  A landing
on this route counts only when all eight E1 terminal leaves are proved and the existing
adapter/coordinator chain passes the focused Lake build plus refreshed
proof-blueprint reference and transitive-axiom checks; a source-clean wrapper
alone is not closure.  The D-R two-radius and D-E unique-arm residuals remain
separate secondary obligations.

### E1 closure decomposition (2026-08-02)

Broad exact-15 CEGAR is no longer the sole proof plan for the uniform E1 core.
It remains valuable as a theorem miner and finite coverage engine, but its
output must be consumed through four separately auditable workstreams:

1. **Canonical core archetypes.**  Classify exact-15 survivors up to proved
   symmetries and prove a Boolean cross-case coverage theorem.  Representatives
   without checked coverage are diagnostics only.
2. **General Lean soundness theorems.**  Bank the reusable geometric or metric
   contradiction behind each useful cut family.  The first completed producer
   is the seven-source critical-shell mutual-omission theorem: the counting
   dichotomy, literal Paley physical-shell adapter, and reindexing step compile
   without `sorryAx` under the approved `native_decide` trust boundary.
3. **Exact-15 finite coverage.**  Produce a replayable certificate that every
   exact-15 normalized assignment reaches a proved soundness theorem.  This is
   an exact-cardinality theorem, not the uniform E1 conclusion.
4. **General-cardinality lift.**  Prove that every larger normalized residual
   contains a bounded covered obstruction or admits a deletion/minimality
   descent preserving the E1 hypotheses.  This is the required bridge from the
   exact-15 certificate to arbitrary `15 ≤ D.A.card`.

These are workstreams, not four new Lean obligations.  The normalized sum type
supplies the kernel-checked exhaustive producer needed for the first split.
Before that split, the coordinator interface was one `sorry` taking
`Q : RetainedOmissionAllLargeNormalForm P`.  The theorem
`false_of_retainedOmission_triApexAllLarge_core` is now a proved fan-out-two
dispatcher to the paired-common-deletion leaf and a reverse-hit/fresh
coordinator.  The latter is itself proved by the nonreturn endpoint
classification and fans out to two branches.  Its endpoint-critical-fiber
  branch is now a third proved dispatcher, using the exact fresh-source
  cross-hit/common-deletion continuation.  The positive cross-hit child is a
  fourth checked dispatcher, splitting the only role coincidences not already
  excluded by the inherited exact-row interfaces.  Its shared-blocker child is
  now a fifth checked dispatcher, using collision localization and the global
  cap cover.  The final live frontier is
  therefore:

- `false_of_retainedOmission_pairedCommonDeletion_triApexAllLarge_core`,
  narrowed by the first constructor's reverse omission and paired
  common-deletion packet; and
- three children of
  `false_of_retainedOmission_reverseHitFresh_endpointCrossHit_triApexAllLarge_core`:
  `..._firstCenterEqFreshSource_...` (`A = J`),
  `..._secondCenterEqFirstSource_...` (`X = C`), and
  `..._genericRoles_...` (all three equalities fail), each retaining the
  endpoint critical fiber, the fresh first-apex row source, and the positive
  hit of the opposite fiber endpoint;
- the two children of the `A = X` shared-blocker coordinator,
  `..._sharedBlocker_JInLeftAdjacentCap_...` and
  `..._sharedBlocker_JInRightAdjacentCap_...`, which additionally retain
  exclusion of `J` from the strict first-cap interior and the corresponding
  adjacent closed-cap membership;
- `false_of_retainedOmission_reverseHitFresh_endpointCommonDeletion_triApexAllLarge_core`,
  retaining the complementary nonmembership together with the source-exact
  common-deletion packet it produces; and
- `false_of_retainedOmission_reverseHitFresh_threeDistinctBlockers_triApexAllLarge_core`,
  retaining the same constructor data plus a named nonreturning walk with
  three pairwise-distinct consecutive actual blockers.

All eight terminal leaves are consumed immediately by proved dispatchers and
therefore by the same all-large publish route.  Across the three exhaustive
splits and the shared-blocker cap-cover split, the raw load-bearing `sorry`
count changes from one to eight; this is decomposition rather than closure.
The tractability gain is that the unequal
incidence and endpoint payloads now target separate stable mathematical
statements instead of one sum-typed leaf.  This is a net increase of seven
live leaves and must be counted as frontier bookkeeping, not proof progress.
Do not fan this E1 frontier out again unless the same change proves at least
one resulting child or records a compensating, measured tractability gain.

The fresh branch now also has a source-proved continuation producer,
`exists_reverseHitFresh_nonreturnEndpointClassification`.  It retains the two
successive source-exact common deletions as a named walk and uses
`fresh ≠ kept` to remove the source-return outcome.  The live branch therefore
has only two endpoint shapes: an origin-tagged endpoint blocker collision with
its critical fiber, or three pairwise-distinct consecutive actual blockers.
This producer now proves the reverse-hit/fresh coordinator.  The endpoint
collision has a second source-proved producer,
`exists_reverseHitFresh_endpointCriticalFiber_continuation`, which chooses a
fresh first-apex row source and splits on whether its actual critical row hits
the opposite fiber endpoint.  In the positive arm,
`false_of_endpointFreshCrossHit_of_orderedPlacement` is a proved adapter to
`OrderedCrossRowCore.false`, but that adapter closes only the placement
`O < A < X < J < C < K`; the current interfaces do not produce that placement.
A source audit leaves exactly three unresolved role coincidences, `A = J`,
`A = X`, and `X = C`.  They are now separate on-spine targets.  Once they are
excluded, the generic child has six distinct roles and needs a global
cyclic-order/full-row metric classifier, not merely a producer for one chosen
order.  Existing Kalmanson equality schemas eliminate only a proper subset of
the possible orders.  The source-clean module
`EndpointFreshFiveRoleKalmanson` banks that proper subset explicitly:
`false_of_firstCenterEqFreshSource_of_crossHit_of_placement` and
`false_of_secondCenterEqFirstSource_of_crossHit_of_placement` each eliminate
all eight direct-or-reflected oriented placements now covered by the bank.
Their kernel audits use only `propext`, `Classical.choice`, and `Quot.sound`.
Regular-pentagon witnesses show that the three shell equalities alone do not
eliminate every remaining order.

The shared-blocker branch `A = X` now has stronger exact incidence and order
producers.  The common blocker contributes one full exact-four critical shell.
Its support meets the selected first-apex four-support exactly in `{C, J}`;
the latter is a chosen four-subset of a physical apex radius class that may
have multiplicity four or six.  The common shell is uniquely `{C, K, J, L}`,
with `K` and `L` both outside that selected first-apex support.  Moreover `C`
and `J` alternate across the chord joining the first apex to the common blocker
in every compatible boundary indexing.  Collision
localization now also proves that `J` lies outside the strict first-cap
interior.  Since `J` remains on the positive retained first-apex radius, the
global cap-cover theorem puts it in the left- or right-adjacent closed cap.
The former single outside-first-interior obligation is therefore a proved
coordinator with immediate constructor fan-out two, into the on-spine leaves
`false_of_retainedOmission_reverseHitFresh_endpointCrossHit_sharedBlocker_JInLeftAdjacentCap_triApexAllLarge_core`
and
`false_of_retainedOmission_reverseHitFresh_endpointCrossHit_sharedBlocker_JInRightAdjacentCap_triApexAllLarge_core`.
Each child retains the outside-first-interior hypothesis and adds its named
adjacent-cap membership, so both are strictly stronger than the parent.  This
is source-clean narrowing, not a contradiction.  The old six-role cyclic
placement classifier and sparse Euclidean-bank dispatch remain a downstream
fallback after the two cap-local branches have been exploited.

#### A = X shared-blocker checkpoint (2026-08-02)

The shared-blocker theorem bank has four further proved declarations in the
current `ATail/FrontierLiveClosure/TriApexEndpointRetainedOmission.lean`
block starting at line 1480:
`endpointFresh_criticalShell_inter_frontierRadiusClass_eq_pair_of_sharedBlocker`,
`endpointFresh_sharedBlocker_frontierRadius_fourth_packet`, and the left- and
right-adjacent-cap singleton-intersection theorems.  Together they lift the
chosen-row facts to the full retained frontier-radius class, name its fourth
critical-shell point, and isolate its intersections with the two adjacent
caps.  A focused `lean_verify` audit reports only `propext`,
`Classical.choice`, and `Quot.sound`; these declarations introduce no new
`sorry` and are producers, not a contradiction.

Two exhaustive local checks delimit what these facts can prove by themselves.
First, the strict five-point Kalmanson enumeration leaves four of the twelve
dihedral cyclic orders feasible.  The other eight are precisely the
nonalternating orders, so common-pair alternation is the complete linear
five-point consequence of these shell equalities.  The auditable enumeration
is in
`scratch/retained-omission-e1/a-x-kalmanson-enumeration/report.md`.
Second, an exact rational strictly convex eight-point witness realizes the
stronger local specialization of two full exact unit four-shells whose
intersection is exactly `{C, J}`.  Its exact
verification is in
`scratch/retained-omission-e1/a-x-two-exact-circles/`.  This is an authenticated
local no-go: convexity plus the two full circles cannot close the `A = X`
branch, so the next producer must use global carrier data.

That global producer is
`endpointFresh_exists_selectedRow_escape_twoShellSeed`, now source- and
axiom-verified.  A focused `lean_verify` audit reports only `propext`,
`Classical.choice`, and `Quot.sound`.  It applies global K4/minimality to the union of the two named
shell supports: the seed has cardinality at most eight, whereas the all-large
cap hypotheses force carrier cardinality at least fifteen.  Hence a selected
row centered in the seed escapes the seed.  This theorem adds no new
obligation; the next closure step is to consume that escaping
row in one of the two existing adjacent-cap leaves rather than split either
leaf again.

#### Exact-six selected-support seed checkpoint (2026-08-03)

`endpointFresh_twoShellSeed_card_eq_six_of_sharedBlocker` sharpens the local
search universe from the generic upper bound eight to exactly six points in
the shared-blocker branch.  It combines the two four-element selected supports
with their proved exact intersection `{C, J}`.  A focused `lean_verify` audit
reports only `propext`, `Classical.choice`, and `Quot.sound`; the theorem adds
no obligation and is a quantitative producer, not a contradiction.

This checkpoint also fixes a load-bearing modeling boundary.  The first-apex
row is a `SelectedFourClass`, not necessarily the full physical radius class:
in the six-point apex profile it is one of several equidistant four-subsets.
Consequently the current v29/v30 encoding, which stores one physical shell per
nonapex center and reuses the old paired/fresh case universe, does not directly
encode this shared-blocker continuation.  A sound successor must explicitly
quantify over every equidistant selected four-subset at the relevant seed
centers (or prove an equivalent universal reduction).  The useful continuation
query is whether some forced escaping selected row has its **center** in the
adjacent cap containing `J` and has at least two hits in `Q.row.support`; the
two hit points may lie anywhere in the carrier.  The superficially stronger
query that puts a second `Q.row` point inside that adjacent cap is vacuous:
the proved left/right singleton theorems already say that the whole retained
first-apex radius class meets the chosen adjacent cap only at `J`.  That query
is therefore only an encoding canary, never a closure result.  Treating
`Q.row` as a full exact-four shell would likewise create a spurious
inconsistency and is forbidden.

The universal selected-row quantifier is now authenticated in Lean.
`exists_faithfulCarrierPattern_with_classes_on` preserves an arbitrary
prescribed selected four-class at every center of a finite nonempty seed, and
`endpointFresh_exists_prescribedRow_escape_twoShellSeed_of_sharedBlocker`
combines that adapter with global minimality and the exact-six theorem.  Thus
**every** simultaneous choice of rows at the six seed centers has an escaping
chosen row.  Focused `lean_verify` checks report only `propext`,
`Classical.choice`, and `Quot.sound`; neither theorem adds an obligation.

The quantifier reduction has now also been banked for every nonempty proper
carrier subset, not only this endpoint seed.
`exists_center_all_selectedFourClass_escape_of_proper_subset` extracts one
subset center at which **every** selected four-class escapes, and
`exists_center_selectedClass_inter_card_le_three_of_proper_subset` proves the
equivalent encoder-facing statement that every positive-radius full
`SelectedClass` at that center meets the subset in at most three points.  The
endpoint declarations
`endpointFresh_exists_seedCenter_all_selectedRows_escape_twoShellSeed_of_sharedBlocker`
and
`endpointFresh_exists_seedCenter_selectedClass_seed_card_le_three_of_sharedBlocker`
are specializations to the proved exact six-point seed.  Focused
`lean_verify` checks for the two general declarations report only `propext`,
`Classical.choice`, and `Quot.sound`.
The endpoint bank further proves
`endpointFresh_exists_seedCenter_ne_firstApex_ne_sharedBlocker_selectedClass_seed_card_le_three`:
the pinned center cannot be the first apex or the common blocker, because each
of those centers already has an exposed four-point positive shell inside the
seed.  This removes two center roles but does not identify the pinned center
with any of the six seed labels or place it in an adjacent cap.
This replaces the raw six-center simultaneous-row assignment by one pinned
center with a full-multiplicity cap.  It is a measured producer and search
constraint, not a contradiction: it still supplies no adjacent-cap role,
two-hit overlap with `Q.row`, or cyclic placement for an escaping point.

#### V33 endpoint shared-blocker selected-seed slice (2026-08-03)

Schema v33 is the first finite model in this lane to encode the theorem's
universal selected-row polarity directly.  It is restricted to exact `n = 15`,
the ordinary fresh arm, endpoint collision, and the shared-blocker outcome.
For each labelled case it selects `J`, reconstructs the common critical row
and `Q.row`, proves their encoded union has exactly six points, chooses one
exact four-subset of the encoded K4 class at every active seed center, and
requires at least one chosen row to escape the seed.

The selected `Q.row` and seed rows are deliberately not registered as full
physical circles.  V33 therefore does not infer nonmembership from exclusion
from a selected subset and cannot use those exclusions as power-pattern
nonzeros.  The new layer has 251 Boolean variables and 702 tracked constraints;
the complete semantic count is `1031 + 15 * profiles.count("D")`.

Ruff, Python compilation, nine focused tests, and three profile subtests pass.
A clean-checkout gate now verifies that every schema and the lockfile read by
the inherited v8/v9/v12-v19/v29-v33 runtime chain are tracked; this prevents
an untracked working-tree dependency from masquerading as a source-frozen
computation.
A spawned-child smoke has valid provenance and closes only
`fresh_SSS_k0_d1_f2` externally at the Boolean prepass, with zero assignment
records.  This is evidence that the narrowed encoding is active, not a
coverage result.  The parent remains open with the same eight terminal leaves
and no ninth obligation.

The frozen 192-case matrix ran from detached commit `643f30fe` with 23 nice-15
workers under
`artifacts-v33-production2-clean-643f30fe/20260803T133955.191739Z-matrix-pid89083`.
Its terminal aggregate is authenticated but incomplete: 144 `UNSAT`, 36
`UNKNOWN`, 12 fail-closed tracker errors, and zero `SAT`; all 144 closures occur
in the inherited Boolean prepass.  The child contract is valid, all 192
result-file hashes recompute, and the aggregate SHA-256 is
`6eeef80f2a5e614d2fd0f8aabad2526f39c1841d3a88290dff345ca20b174960`.

The profile split identifies a smaller successor lane.  `SSS`, `SDS`, `SSD`,
and `SDD` close completely; `DSS`, `DSD`, and `DDS` each leave 12 unknowns;
`DDD` closes 12 and hits the same missing
`track_exact_fifteen_s_profile_mutual_class_pair` tracker admission on 12.
These unresolved/error cases occupy the same 12 joint role tuples.  The
mandatory global theorem-bank audit found no matching general-n contradiction.
The odd-round efficiency audit localized the principal measured cost to dual
normalization (367.60 seconds in a representative 636.93-second case, versus
about 8.24 seconds in recorded solver calls), with a further roughly 245
seconds not yet instrumented.

The next computational step is therefore not a broader or repeated matrix:
repair the D-profile tracker allowlist, add durable phase telemetry, and run
the 12 hard role tuples as a canary lane.  V33 closes only its 144 labelled
subcases; it does not close the selected-seed slice or a Lean terminal leaf.
Exact scope, hashes, and audit details are in
`scratch/retained-omission-e1/round5-general-cegar/V33-ENDPOINT-SHARED-BLOCKER-SEED.md`.

#### V34--V35 hard-canary terminal (2026-08-03)

V34 isolated the twelve hard exact-15 `DDD` role tuples and authenticated the
failure mode: all twelve cases remained `UNKNOWN`, despite 225 metrically
inconsistent assignments. A recurring compact-core motif yielded the banked
nonapex full-shell transitivity theorem
`false_of_mutualClassPair_sharedMember_thirdClassExcludes`.

V35 encoded that theorem as exactly 1,320 ordered nonapex clauses and reran
only the twelve hard cases against authenticated commit `61d11be0`. The
top-level HEAD-source manifest contains 59 entries; the source contract has
16 role entries over 14 unique files, and top-level provenance separately
records the Git commit. The focused contract suite passed 20/20 tests, the
aggregate reports `child_contract_valid = true`, and all twelve result-file
hashes validate. The aggregate remains incomplete: 0 `SAT`, 0 terminal
`UNSAT`, 12 `UNKNOWN`; summary SHA-256
`4b6447ccd412bd9714f6352571c8cd97220ca6d148d778ff0c2a9f194b248353`.

The theorem pruned assignments from 225 to 186 (17.3%) but did not improve
wall time (361.656 to 367.063 seconds). Of 186 learned blockers, 50 were compact
and 136 were complete 1,076-literal assignment blockers. Normalization consumed
2,102.386 assignment-seconds while solver checking consumed only 28.761.
Future runtimes can cache case-invariant normalization and reconstruction, but
the present lineage will not close by engineering alone.

The v34--v35 transitivity-only lane is therefore retired. The next bounded
round on the retained-omission target must be gated by an order-sensitive
metric contradiction or another source-entitled producer for the hard
one-inside/one-outside cap arm. A reverse-incidence/common-radius producer is
also the precise missing bridge in the separate FreshThird residual, but it
must not be conflated with these twelve v35 cases. No theorem-bank audit found
either bridge ready-made. The retained-omission eight-leaf coordinator
frontier remains unchanged. Full evidence is in
`scratch/retained-omission-e1/round5-general-cegar/V35-TRANSITIVITY-CANARY-TERMINAL.md`.

The 2026-08-03 checkpoint builds the complete
`Erdos9796Proof.P97.ATail.FrontierLiveClosure` target and repairs the stale
constructor arities in the already-committed normalized fresh-third adapter.
The latest cached proof-blueprint snapshot reported 31 indexed declarations
with `sorry`: 28 on the `Problem97.erdos97_rhs` spine and three
graph-unimported parked `FidelityCheck` declarations.  That dated snapshot is
superseded by the 2026-08-08 refresh: 40 sorry-bearing declarations total,
with 30 on-spine theorem sorries, seven off-spine theorem sorries, and three
graph-unimported `FidelityCheck` declarations.  A source scan also finds
the unreachable U1/attic declarations and the comparator/scratch placeholders
listed in the recorded inventory above; they are not publish-spine
obligations.  Because current Lean files were uncommitted after that build,
the older paragraph is a dated reachability snapshot, not current-source
validation.  The current refs check is clean at build `422328c8b6f2`; retain
this paragraph only as historical provenance.  At the chosen coordinator
granularity, `false_of_retainedOmission_triApexAllLarge_core` still reaches the
same eight terminal leaves described above.  Thus the coordinator-interface
frontier and its immediate fan-out are unchanged by this selected-row adapter:
it is a banked producer and quantifier correction, not a leaf closure or a new
split.

The remaining query must be order-sensitive.  Merely producing an escaping
row whose center lies in the adjacent cap containing `J` and whose support has
two hits in `Q.row.support` is not contradictory: two distinct centers may
share a pair, provided the pair alternates about the centers.  The first proved
consumer is `selectedFourClass_shared_pair_separated`.  Therefore the useful
predicate `Good(c, row)` additionally says that the two common points are
**nonalternating** with the first apex and `c`; equivalently, their two
`btw firstApex c` truth values agree.  A stronger cap-local alternative is to
put both common points outside the chosen adjacent cap, which is consumed by
`selectedFourClass_outside_overlap_card_le_one`.  Producing either predicate
is still conjectural.

#### V36--V37 terminal Boolean diagnosis (2026-08-03)

The bounded v36/v37 pilots disprove the sufficiency of the weaker proposed
successor. V36 remained 12/12 SAT after global selected-row alternation. V37
remained 12/12 SAT after additionally forcing a branch-localized escaping row
with two `Q.row` hits and imposing the banked exact adjacent-cap singleton
theorem. The forced pair can split across the cap boundary.

The post-v37 theorem-bank audit nevertheless gives a strict localizer.  The
carrier-level theorem
`SelectedFourClass.exact_overlap_of_cap_singleton` is now banked in
`P97/U1CarrierInjection.lean`: the two-circle overlap bound, an exact singleton
cap trace, a common point, and overlap cardinality at least two force the
overlap to be exactly `{J, x_out}`, with the outside overlap exactly
`{x_out}`.  The later `selectedFourClass_outside_overlap_card_le_one` theorem
is not needed for this deduction.  This is a proved producer, not a terminal;
the live retained-omission packet still has to produce the two selected full
classes and the two-hit premise, and no banked theorem excludes the resulting
mixed placement.

The bounded symmetry-orbit census described next is complete.  Do not resume
aggregate metric CEGAR unless a new endpoint-specific theorem excludes one of
its surviving placements or produces a cyclic signature consumed by an
existing terminal.

That bounded census is now complete. Of the six oriented cyclic-order classes
for `(first apex, branch center, J, x_out)`, the shared-pair separation theorem
eliminates four and leaves exactly the two alternating classes
`A,J,B,x_out` and `A,x_out,B,J`. Neither surviving class matches an existing
Kalmanson terminal. This is a finite diagnosis, not a Euclidean closure: the
next mathematical target must use endpoint/branch-specific packet data to
contradict those two alternating mixed placements. The existing aggregate
selected-row contract is exhausted.

The quantifier polarity remains load-bearing.  The finite counterexample query
is the base model together with valid selected rows at all six seed centers,
existence of an escaping chosen row, and `Esc(c) -> not Good(c, row_c)` for
every seed center.  Authenticated UNSAT would then prove that every
selected-row choice pattern has a good escaping row in the frozen exact-15
relaxation.  A single existentially chosen row does not establish that
statement.

#### V38 pinned physical-multiplicity canary (2026-08-03)

V38 encoded the new pinned-center theorem in the full metric model, not in the
Boolean relaxation.  It adds an exact-one selector over the fifteen carrier
labels and 210 guarded representative-shell constraints saying that every
positive physical shell at the selected seed center meets the exact-six seed
in at most three points.  The full formula itself already entails that the pin
is neither the first apex nor the shared blocker; focused regression checks
prove both contrary role assumptions `UNSAT`, so no ad hoc role-exclusion
clauses were added.

The only metric run was the canonical `fresh_DDD_k0_d2_f1` canary with a
20-second solver timeout.  It returned `UNKNOWN` (`canceled`) after 28.647
seconds total wall time.  Since v38 inherits v37's hypothetical forced
branch-two-hit producer, even a future `UNSAT` here would be conditional.  No
broad round is justified, no retained-core leaf closes, and the eight-leaf
coordinator frontier is unchanged.  The exact bounded evidence is in
`scratch/retained-omission-e1/round5-general-cegar/V38-PINNED-SEED-CENTER-MULTIPLICITY-CANARY.md`.

#### Endpoint local-geometry retirement and global-coupling retarget (2026-08-04)

The follow-up endpoint audit retires the named local geometry as a closing
route.  The four residual base orders
`A = J: OAKXC, OCXKA` and `X = C: OCAKJ, OJKAC` each have an exact-rational
strictly convex planar realization satisfying the named eight-role
equalities and nonmemberships.  An independent verifier checked all 140
hull-edge/other-point cross signs.  These are local named configurations only:
they do not realize the anonymous erased deletion rows, the full carrier, or
the global no-K4 condition, so they are not P97 countermodels or closure
failures.  The constructive artifacts are
`scratch/endpoint_constructive_geometry_report.md` and
`scratch/endpoint_constructive_geometry_verification.json`.

The source-faithful packet boundary is now corrected.  The existing theorem
`ATailFiveCenterDeletionBoundary.qDeletedK4Class_support_eq_selectedShell`
identifies the delete-M packet's `B2` support with `Sigma_A` and the
delete-K packet's `B2` support with `Sigma_B`.  Thus only the two O-centered
`B1` supports remain anonymous in the general-cardinality interface; each has
an overlap of at most two with its corresponding exact selected shell.  The
exact-15 D44 producer now identifies those rows in its narrower branch, but
that chain requires `|A| = 15` and currently ends in a theorem with no live
consumer.  It therefore does not repair the general interface or close an
endpoint leaf.  The earlier diagnostic wording that treated both erased rows
as fully decoupled is superseded.  Any new endpoint schema must encode these
exact `B2` identifications and overlap caps, but must not promote either O-row
to a full physical circle.

The exact QF_NRA audit checked all 120 insertions of `M,B` into the four
residual orders: 22 exact-rational named-local SAT witnesses, 82
solver-trusted strict-Kalmanson necessary-core UNSAT results, and 16
UNKNOWN results after Z3/cvc5 timeouts.  All 22 witnesses passed independent
`Fraction` readback and fixed replay in both solvers.  The result is a
diagnostic boundary, not a proof: the audit still omits the anonymous O-row
supports, their exact overlap constraints, cap/MEC data, the full carrier, and
global K4 exclusion.  The detailed report is
`scratch/five_role_euclidean_qfnra_report.md`.

The next producer target is therefore global full-carrier/deletion-row
coupling, beginning with the proved `B2 = Sigma_A/Sigma_B` identifications and
the two overlap-at-most-two constraints.  It must be selected backward from a
kernel-complete contradiction consumer: record the live source theorem, the
exact produced proposition, the adapter, and the consumer before promoting it
as a closure target.  The exact-15 D44 row-identification chain and the
five-role Kalmanson placement bank are presently disconnected producer and
consumer fragments, respectively.  Do not rerun the retired named-role
relaxation or treat its SAT witnesses as global models; do not treat
solver-trusted Kalmanson UNSAT or QF_NRA `UNKNOWN` as independently checked
closure.

The negative arm now carries
an explicit new common-deletion packet rather than an inert omission.  The
three-distinct-blocker branch still lacks selected-row ordinal-comparison edges
that turn the named blocker path into a strict comparison cycle.

The dated v30 signal is positive for workstreams 1 and 2 but not a convergence
certificate: roughly 6,950 authenticated UNSAT assignments yielded 437 short
projected cores across all 23 active cases, while closing zero cases near
mid-budget.  The long v28 run has no completeness or termination bound.  Every
round therefore ends with a current-wave-data general-theorem mine, and every
odd round also gets an efficiency/observability review before more compute is
launched.

One exact-15/SDD cut family is now banked, but it does not change the uniform
frontier.  Its soundness theorem is stronger than the original exact-15 form:
for any single cap of cardinality exactly six, the selected rich apex class
contains the entire strict cap interior; it is not equal to that four-point
interior.  The source-clean, no-`sorryAx` consumer
`ExactFifteenSProfileMutualClassPair.false_of_sProfile_interiorPair_of_cap_card_eq_six`
closes a finite candidate only when checked coverage supplies strict-interior
points `C, M` and radii `rC, rM` with the four required facts: the apex and `M`
belong to `C`'s selected class, `C` belongs to `M`'s selected class, and the
apex does not belong to `M`'s selected class.  In the authenticated v30 prefix,
21 of 11,601 completed proposals violated 9 distinct ordered cuts, and all 21
were already `UNSAT`.  This is useful theorem-backed exact-15 pruning, not a
finite-coverage certificate or convergence claim.  Exact-15 all-large caps
force the needed cap-six premise and remain a convenient corollary.  The
universal E1 core has only cap-cardinality lower bounds, so this result neither
narrows nor closes that core without a separate exact-six branch or coverage
producer.

The exact-15 profile dispatcher is now checked as a two-way theorem rather
than eight role-labelled cases:
`exists_exactSixClass_or_all_exactTwoFourClasses_of_card_eq_fifteen` gives
either one exact six-class at an indexed apex, or exact `4+4` classes at every
indexed apex.  This is exhaustive and `sorryAx`-free, but it is not itself a
closure split: the S-bearing side still needs the full-shell `C,M` coverage
producer above, while the all-D side receives none of the v32 clauses.

A constructor-level coverage audit rules out treating v32 as a hidden packet
consequence.  For the natural strict-interior pair in
`pairedCommonDeletion`, the normal form supplies none of the four centered
full-class literals used by the cut.  In `reverseHitFreshCommonDeletion`, the
reverse critical shell supplies only the literal saying that the retained
source lies in the reverse blocker's full class; apex membership, the reverse
centered incidence, and apex nonmembership are still missing.  Moreover, the
normal form names points only in the first cap, so it supplies no candidate
pair for an `S` profile at either later cap.  Packet `B₁`/`B₂` omissions
must not be promoted to full-shell nonmembership.  Consequently v32 remains a
sound exact-15 finite-search cut until a separate coverage theorem or complete
finite certificate is produced.

### FreshThird cap-profile routing (2026-08-04)

The bounded cap-composition census and follow-up motif audit are recorded in
`scratch/freshthird-cap-size-composition-inventory-20260803.md` and
`scratch/freshthird-cap-profile-motifs-20260804.md`.  Writing
`s = n - 15` and `m = c_d - 6` for the designated cap, the arithmetic
interface has `e_0 + e_1 + e_2 = s`, with `e_i = c_i - 6`, and the fixed-index
cap-source requirement is `m >= 2`.  Hence the labelled profile count is
`binomial(n - 13, 2)`, the fixed-index designated-cap count is
`binomial(n - 15, 2)` for `n >= 17`, and the `m = 2` stratum persists for
every `n >= 17`.  The identities and canonical-orbit census were checked for
every `15 <= n <= 256`; this is exhaustive for the stated arithmetic model,
not a geometric realization or a Lean theorem.

This changes computation priority but not closure credit.  The `m = 2`
thin-cap stratum consists of `(6+a,8,n-11-a)` for
`0 <= a <= n-17` and must be treated as a uniform arbitrary-surplus branch;
an `n = 17` SAT or exact-profile result cannot be promoted to the universal
FreshThird leaf.  Capacity-dominant strata (roughly `m` near two-thirds of
the surplus for C-pairs and four-fifths for independent C/Q slots) are useful
for diagnostic ordering only.

The alternative “choose the largest cap” route is not currently available as
a Lean simplification.  `TwoCapSourceThirdCanonicalRowSurface` and
`CapSourceThirdCanonicalRowWitness` hard-code `S.oppIndex1`, and no current
transport theorem carries that packet, its blocker fiber, and the normalized
residual to a new index.  Existing packet redesignations are not sufficient
for this interface.  Therefore the computational work order is: prioritize
handling the `m = 2` stratum (by a uniform producer, a geometric impossibility,
or a profile-independent terminal); separately audit/prove a full
index-transport producer if the growing-slack largest-cap route is desired;
and do not add an `n`-specific production enumerator.  The normalized-remaining
route is now recorded as off-spine compatibility code.  The current
`OPEN / ON-SPINE` FreshThird ingress is
`false_of_twoCapSources_freshOutsideFirstBlockerFiber`; common-radius,
first/second non-hit, and distinct-cap residual routes do not change that live
spine status.

#### Source-clean producer boundary (2026-08-05)

The earlier three-hit/collision-row theorem was not a producer: its residual
arms immediately called the FreshThird contradiction (or another `sorry`).
That circular path has now been split at a genuine source-clean boundary,
`Problem97.ATailFrontierLiveClosure.TwoSourceExactCollisionRowsTerminal.collisionRows_sourceCleanMultiplicityIngress`.
For the two retained collision rows and the tri-apex packet, it proves

```
CollisionCrossHit P Pρ ∨
  (GeometricMultiplicityResidual P Pρ ∧ TwoCollisionGlobalSplit P Pρ)
```

from the blocker-fiber multiplicity theorem and the independent cap-eight or
cross-blocker split.  A focused Lean 4.27 build and `#print axioms` audit pass;
the producer has only `propext`, `Classical.choice`, and `Quot.sound`, with no
`sorryAx`.  It is now wired into the existing three-hit path.  This is ingress
progress, not a closed leaf: the first missing consumer is a theorem that
eliminates the geometric residual together with `TwoCollisionGlobalSplit`,
covering the normalized first/second non-hit and distinct-cap arms.  No further
search for a pre-existing producer is warranted; subsequent computation must
target that explicit residual predicate and provide a stated general-cardinality
lift before any certificate can be promoted.

#### Residual producer construction contract (2026-08-05)

The next producer is now specified as a finite contract rather than an open
theorem-bank search.  It consumes
`TwoCapSourceThirdCanonicalRowSurface`, `FreshThirdBlockerFiber`, and
`FreshThirdNormalizedResidualRemainingCase` and must return a source-clean
disjunction that either produces a `FreshThirdCrossRowHit`, exposes the
outside-overlap blocker/cap contradiction, or transports the packet to the
existing common-radius/apex-cap terminal.  The exact contract and promotion
gate are recorded in
`scratch/freshthird-residual-producer-contract_20260805.md`.

The implementation order is fixed: first normalize deletion-survival and
row-omission into explicit support facts; then test only omission-to-other-row,
both-Q-sources-outside-one-cap, and common-radius transport clauses in the
bounded exact-rational model; finally prove and wire the weakest surviving
clause in the universal Lean theorem.  SAT/UNSAT/UNKNOWN at fixed `n` remains
diagnostic until a general-cardinality lift is present.

#### Concrete producer construction (2026-08-05)

The search phase did not produce a universal cap-wide cut: the exact-rational
`n = 17` probe has SAT witnesses for both proposed non-hit implications.  The
producer is therefore being built from the source packets already present on
the spine.  The first source-clean component is
`freshThirdCapSourceNonHit_center_ne_of_sourceRowOmission`, which converts a
surviving omitted endpoint into separation of the source-row center from the
fresh blocker center.  On the retained-radii arm,
`exists_freshThird_retained_minimalDeletionCoreProducer` now packages the two
omitted endpoints, source-row survival, and a first-apex
`MinimalDeletionCore` in one universal producer.

These are ingress producers, not closure: the remaining bridge is one
cap-wide incidence/order theorem consuming the separation or minimal-core
packet and producing either a cross-row hit, the outside-overlap contradiction,
or the common-radius packet.  No new fixed-`n` search is promoted until that
consumer and its arbitrary-cardinality lift are explicit.

The two branches were exposed through one source-level contract,
`freshThird_canonical_consumerPacket`.  It returns either
`FreshThirdRetainedDeletionCorePacket` (the two omitted endpoints, their
double-deletion survival, and a first-apex `MinimalDeletionCore`) or a
`CommonRadiusTwoCapSourceThirdCanonicalRowSurface` (a non-retained radius with
two cap points and its full canonical-row surface).  The historical coordinator
used the dichotomy to dispatch to the retained-surface or common-radius route.
Those are compatibility routes, not the current publish spine.  The
common-radius packet is consumed by its existing surface theorem; the retained
packet is currently only a branch witness because that surface theorem has no
minimal-core argument.  The retained packet remains a route-local mathematical
gap: no additional search is needed to obtain it; the next theorem would have
to turn that packet into a cap-wide incidence/order contradiction or an
existing terminal.

#### No-search construction gate (2026-08-05, updated)

The producer is now a Lean construction, not a theorem-bank lookup.  The
exceptional canonical-source/different-fresh-cap arm supplies
`freshThird_canonicalDifferentCap_endpointPlacement`: a source-clean,
cardinality-free packet containing one common boundary indexing, the direct or
reflected cap-block order, the strict placement of the two blocker-fiber
endpoints relative to the two shell centers, and their membership in both
four-point rows.  The older
`freshThird_canonicalSource_differentFreshCap_sharedPairCyclicPacket` remains
the lower-level alternation producer; the new theorem is the finite placement
adapter that a consumer can inspect.

This is deliberately not closure.  The packet has two shared rows and is
geometrically realizable.  The next construction step is a third-incidence
producer with this exact contract:

1. retain the endpoint packet and the position of the actual canonical source
   point in the `oppIndex1` block, rather than only the position of its shell
   center; the source-clean companion
   `freshThird_canonicalDifferentCap_sourceSupportPlacement` now provides this
   placement on the same boundary;
2. combine that placement with one additional source-clean shell/support
   equality, yielding either a strict four-/five-/six-point Kalmanson pattern,
   an outside-overlap contradiction, or the existing common-radius packet;
3. consume that result in the compatibility-route FreshThird residual and prove the
   arbitrary-cardinality lift before any finite certificate is a promotion
   candidate.

Thus the immediate work is a bounded source-level bridge from endpoint
placement to a third shell/incidence fact.  A fixed-`n` checker is postponed
until this bridge is present; it may then test the finite placement predicate,
but an UNSAT result still needs the universal Lean lift.

#### Retained producer construction sheet (2026-08-05)

The construction is now recorded in
`scratch/freshthird-retained-producer-construction-20260805.md`.  This closes
the theorem-search loop: the retained packet is an existing producer, while
the missing theorem is a consumer-data producer built from that packet and
`FreshThirdNormalizedResidualRemainingCase`.  Its first two arms must return
either a contradictory cross-row hit or the existing cap-wide alignment
packet; its equal-center arm must return a third-incidence packet or the full
metric/order data for an existing Kalmanson terminal.  An alternation flag,
two-row boundary placement, bounded `n`, or a wrapper around the target is not
an acceptable substitute.  The next Lean edit is therefore one global
omission-transfer/third-incidence lemma plus direct target wiring, after the
current FrontierLiveClosure sharding freeze is lifted.

#### Direct consumer audit (2026-08-05)

The anchored target was audited against every current source-clean FreshThird
consumer in `TwoSourceFreshThirdFiber.lean`, `TwoSourceFreshThirdResidual.lean`,
`TwoSourceCanonicalSurface.lean`, `TwoSourceClosure.lean`, and
`TwoSourceRetainedMinimalCore.lean`.  The audit is recorded in
`scratch/freshthird_consumer_audit_2026-08-05.md` and found **no existing
consumer whose ingress is implied by the full normalized-remaining leaf**.

The first- and second-non-hit branches provide only `sameBlocker` or
`sourceRowOmission`; they do not provide cap-wide alignment, both endpoints
outside one cap, or reverse row membership.  The equal-center branch supplies
an exact four-point row and omission packets.  Its canonical `oppIndex1` arm
is already consumed, while the remaining arms are exactly:

* two `distinctBlockersDifferentCaps` interactions; or
* two `sameCapWithInternalFiberSource` interactions at a noncanonical cap.

Cap-interior uniqueness does not eliminate either shape.  In particular, the
current common-radius theorem needs a stronger radius surface, and the
existing different-cap boundary packets have no order-sensitive contradiction
consumer.  The residual coordinator's recursive call to the anchor is
therefore intentional bookkeeping, not closure.

The next admissible production target is one source-clean theorem proving at
least one of: (i) cap-wide alignment (or an equivalent contradiction) for a
non-hit branch; (ii) common-radius plus reverse-membership ingress for an
existing terminal; or (iii) an order-sensitive consumer for the two
noncanonical equal-center shapes.  A fixed-cardinality UNSAT result, wrapper,
or stronger `sorry` is not promotion evidence without that universal ingress
and its arbitrary-cardinality lift.

#### Import-reachability checkpoint (2026-08-06)

The equal-center exact-row/support-intersection packet and its endpoint
omission producers have now been checked against the complete current import
graph and indexed Lean corpus.  No hidden source-clean consumer accepts the
packet with no-`(m,4,4)`/`IsM44`, Kalmanson, cyclic-order, or reverse-row
membership data.  The Kalmanson declaration found downstream is attached to
a different crossed-three-row leaf and is not import-reachable from this
target without a cycle.

This makes the next bridge concrete: prove one third cross-row incidence
(the nearest existing five-ccw/two-selected-rows consumer), or prove a direct
order/metric contradiction for the two noncanonical equal-center shapes.
The first- and second-non-hit arms still require cap-wide alignment,
common-radius plus reverse-membership ingress, or an equivalent direct
contradiction.  No additional packet, fixed-cardinality certificate, or
recursive wrapper counts as progress until it supplies that universal
source-level bridge and its arbitrary-cardinality lift.

#### Exact equality-core CEGAR checkpoint (2026-08-06)

The first source-faithful `n = 17`, first-non-hit/aligned probe has now been
refined against the generic checked equality-core bank.  The trust correction
is important: a `SelectedFourClass` supplies four equal-radius members, but it
is not globally exact merely because its support has cardinality four.  An
off-circle exclusion is sound only when that center is the actual blocker of
some source, where `critical_support_exact` identifies the selected support
with the full radius class.  The corrected CEGAR lane therefore uses every
selected row for equality closure, but guards exact-off-circle cuts by actual
blocker existence.

The orientation-complete run in
`scratch/retained-omission-e1/round5-general-cegar/`
reached a core-free Boolean survivor after 271 checked-kernel cuts:

- 18 blocker-guarded exact-off-circle cuts;
- 171 explicit radius-partition closure cuts;
- 38 duplicate-center cuts;
- 39 perpendicular-bisector cuts; and
- 5 ordered convex-five-point cuts, with both cyclic orientations covered.

This is theorem mining, not closure.  The resulting survivor has no instance
of those five kernel families.  Its exact metric screen timed out in all three
stages (`exact-metric-relaxation`, `full-convex`, and
`convex-only-relaxation`), so the metric verdict is `UNKNOWN`, not SAT or
UNSAT.  The optimized ordered-core detector reproduces this checkpoint in
about 135 seconds instead of roughly eleven minutes by testing cached equality
components before reconstructing proof paths.

That checkpoint did **not** audit the full imported theorem bank.  A subsequent
source audit found nine further five-/six-role equality schemas, the four
selected-row triangle schemas, and the complete four-case two-center bisector
parity family.  A Lean 4.27 axiom audit of all 17 consumers under
`scratch/retained-omission-e1/round5-general-cegar/` shows only `propext`,
`Classical.choice`, and `Quot.sound`; no consumer depends on `sorryAx`.
Consequently the earlier conclusion that the survivor already required a new
fifth-center theorem was premature.

The expanded equal-cross-row-center/aligned census is nevertheless still not
a finite closure.  Eagerly compiling all 14,280 two-center parity instances
and then learning 1,000 further cuts reached `CUT_LIMIT` after about 894
seconds: 295 cuts were blocker-guarded exact-row clashes and 705 were instances
of the single checked schema
`false_of_five_ccw_three_shell_equalities_012_124_314`.  Batching that dominant
schema is fidelity-preserving because the ingress already axiomatizes radius
equality as an equivalence relation.  The batched rerun learned 2,000 cuts in
357 solver checks (about 482 seconds), consisting of 183 blocker-exact cuts
and 1,817 instances of that same Kalmanson theorem, but again ended at
`CUT_LIMIT`.  These are concentration and performance results, not UNSAT.

The corresponding live-source audit now fixes the producer contract more
sharply.  In the equal-hit arm the two selected rows give distinct centers
`c,f`, shared endpoints `q₁,q₂`, and the two equalities
`dist c q₁ = dist c q₂` and `dist f q₁ = dist f q₂`.  The checked
`selectedFourClass_shared_pair_separated` theorem forces the four roles to
alternate, so every nonalternating two-center parity terminal is already
excluded and cannot be used as a productive case split.  The existing
`FreshThirdExceptionalBoundaryMetricPacket` retains this alternating order,
both shared-row memberships, and the actual canonical source point on one
boundary indexing.  What is missing in the equal arm is one source-clean
**third-incidence bridge** from that packet to a named five-/six-role
Kalmanson schema (or to an existing outside-overlap/common-radius terminal).
For the full remaining-case sum, a second producer must transfer each
`firstNonHit`/`secondNonHit` source-row omission to either a contradictory
cross-row hit or the existing cap-wide-alignment terminal.  Fixed `n = 17`
search remains diagnostic until those uniform producers are proved; no
bounded UNSAT by itself closes the universal FreshThird leaf.

## 2. Ground rules (binding)

1. **Encoding smoke test before any production run** — every encoder must
   reproduce a known result first (per-package gates listed in §5).
2. **Forbidden modalities** (dead-ends (D-msolve), revised per
   `scratch/qfnra-gate-revisit/REPORT.md`): leaving combinatorial class
   selection to the SMT solver (boolean selectors / subset disjunctions
   inside an NRA query — times out even at one center); decimal-literal
   frames (spurious ~1e-16 SAT); reading complex Gröbner non-emptiness as
   real-satisfiability. Exact-rational / symbolic only. Per-branch QF_NRA
   over an explicitly enumerated incidence type IS permitted as a Layer-2
   UNSAT engine (44/70 general-frame gate branches resolve in 120s).
3. **Trust boundary**: msolve/Singular/cvc5/floating probes are untrusted
   proposal generators only; every kill is re-verified in exact `Fraction`
   arithmetic; every Lean landing is kernel-checked (`decide` preferred,
   `native_decide` allowed under the bv_decide standard).
4. **Spine discipline**: every Lean landing names its target leaf and is
   wired in the same change. No off-spine banks.
5. **Branch-B (realizability) certificates are adversarially audited before
   any route is declared dead**, then reported to Adam — an upstream
   re-split is a pivot decision. {{NEEDS_ADAM_INPUT}} at that gate.
6. FLC is a moving surface while the simplification refactor is in flight —
   coordinate before any FLC edit; computational artifacts live under
   `census/` and `scratch/`, Lean landings go through the normal gate.

## 3. What prior computation already fixes

These results shape where compute is spent; do not re-run them.

- **Local metric layers are realizable to substantial depth.** The 15-point
  rational witness (`scratch/full-local-euclidean-model-complete/`) realizes
  all four required 4-point distance classes simultaneously in strict convex
  position; the 8-point two-circle model
  (`scratch/full-local-circle-terminal/`) realizes the shared-chord packet.
  Consequence: no leaf closes on local circle geometry alone; the
  contradiction must use the incidence/counting layer or global structure
  (cap growth, cover bounds, minimality). The banked B1 normal form
  (`lean/scratch/b-family-bank/`) and its production declaration in
  `lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/B1Live.lean` prove the same
  thing on the Lean side: B1's local bisector geometry is exactly saturated.
- **F3's real core is Γ + (F3a) + (F3b)** — (F3c) is redundant
  (`lean/scratch/f3c-redundancy-bank/`), and the sharpened form
  `f3c_joint_sharp` (two simultaneous five-center survivals) is free
  ammunition for the F encoding.  The production five-center coordinator now
  closes the branch where the second collision blocker bisects the explicit
  first-fiber outside pair, using ordered-cap uniqueness.  The former strict
  non-bisector child is source-clean.  Its former compatibility proof used the
  universal selected-row escape to supply a carrier point outside both
  collision rows and the cap-source row.
  That selected row is used only to certify carrier membership; the row used
  by the override is the canonical selected four-class at the escaped point.
  A second point outside both collision pairs is installed with
  `CriticalShellSystem.overrideAt`, and the frontier, residual, collision,
  localized-cycle, and cap-source packets are rebased to the overridden
  system, then invoked the fresh-third blocker terminal.  The live coordinator
  now stops at the common cap-source/blocker-multiplicity target: it retains
  the original cap-source surface together with the already-produced
  `GeometricMultiplicityResidual`, and therefore all three blocker-fiber
  constructors.  On the enlarged first-fiber
  constructor, the checked
  `firstFiber_cycleAlignedHits_or_collisionFiveCenterDeletion` decomposition
  does not create a useful deletion leaf, because the deletion disjunct is
  already a consequence of the cap-source witness.  The smallest
  terminal-reaching incidence target for its cycle-aligned disjunct is to put
  both `Q.source` and `Q.otherOutsidePoint` in the cap-source selected support.
  Together with the cycle packet's retained `P.source₁` hit, these memberships
  close through
  `false_of_firstFiber_bothOutsideHits_and_firstPairHit`.  Computational work
  on this arm should therefore search for the missing outside hit(s), not for
  another derivation of the five-center deletion residual.  The six-row
  algebraic collision alternative remains the broader all-arms route.
  A completed producer audit (2026-07-31) found no production constructor for
  `Census554.GeneralCarrierBridge.ShellMetricCoreAlternative` from the live
  cap-source packet.
  The only concrete constructor is the scratch theorem
  `shellMetricCoreAlternative_of_orderedFrontSchemaEmbedding` in
  `scratch/atail-force/uniform-live-metric-core-producer/UniformProducerBoundary.lean`;
  its `OrderedFrontSchemaEmbedding` antecedent requires five-role cyclic order
  and positive row incidences that no production theorem currently supplies.
  The cap-source packet supplies omission data instead.  Therefore a
  `FaithfulCarrierPattern` adapter alone does not advance the frontier: this
  fallback needs an ordered-schema occurrence theorem or a direct
  `ShellMetricCoreAlternative` producer.
  The override and the later legacy
  sub-classifiers are not load-bearing, but the residual itself is.  The
  cardinal-minimal
  17-point incidence shadow in
  `scratch/f3-unbounded-counting-audit/REPORT.md` satisfies all remaining
  abstract F3 constraints and extends unboundedly; this explains the failure
  of the superseded direct fixed-slot/incidence route.
  The v17 mirror-interleaving six-point cut refutes the exact frozen v16 local
  survivor, but the resumed 100,000-cut outer ledger timed out fail-closed.
  The smaller local/critical/reuse-second projection completed at 5,933 cuts
  with an 18-class survivor.  Its exact full-coordinate probe timed out
  fail-closed at 600 seconds; exhaustive four- and five-class subset mining
  found no UNSAT core, while the complete six-class traversal retained 205
  solver-`UNKNOWN` cases and no validated core.  The custom v18 projection
  with both a global K4 row and a minimal cover at `q` returned an induced
  necessary-condition survivor after 14,740 cuts, but that survivor separates
  `cover_q` from `b1` and is incompatible with the subsequently extracted
  source-faithful Lean equality.  The v19 projection asserts
  `cover_q = b1`, derives equality of the two unique-row supports through
  existing coherence, and excludes the escape center from `b1`, `b2`, and
  `bs` in both continuation arms.  Its schema rejects v18 checkpoints, and
  the bounded self-test plus replay-metadata tests pass.  The resumed v19
  round returned `ALIVE`, with epistemic status
  `INDUCED_NECESSARY_CONDITION_ONLY`, after 20 outer calls, 14,740 resumed
  cuts, 2,434 newly banked cuts, and 17,174 total cuts.  Its survivor has an
  exact strict-Kalmanson metric on the induced quotient; it is neither a
  Euclidean countermodel nor an UNSAT result.  A source-faithful replay of
  that exact 22-class survivor generated 37 positive quotient-distance
  equations, 440 strict-convexity support assertions, and four gauge
  assertions.  Z3 reached its hard timeout and the probe returned
  `UNKNOWN_FAIL_CLOSED`; this adds no Euclidean realizability or
  nonrealizability conclusion.  A direct equality-closure scan also found no
  `DuplicateCenterCore` instance in the 62 recorded true row equalities.
  A separate fixed-`n = 17` Boolean CEGAR lane now generates checked
  unordered-edge equality closure and duplicate-center nogoods dynamically,
  including the exact 14-literal Phase-3 motif.  Five focused tests and both
  smoke SAT/UNSAT gates pass, with the smoke UNSAT proof checked by DRAT
  replay.  The exact fixed-17 QF_FD-to-CNF lowering took 9.34 seconds and
  produced 116,393 variables and 1,435,449 clauses (31.4 MB).  CaDiCaL
  returned timeout/UNKNOWN after 600 seconds in its default mode and after
  300 seconds with `--sat -n`; the 567 MB interrupted production DRAT stream
  is incomplete and non-certifying.  Even a certified fixed-17 result would
  address only the first cardinal stratum: the cap-source leaf gives the
  profile bound `8 + 6 + 6 - 3 = 17`, while its abstract incidence shadow
  admits `17 + k` extensions.  None of these results closes the remaining
  common cap-source/blocker-multiplicity obstruction; see the current
  K-A-LIVE checkpoint in
  `docs/closure-matrix-2026-07-09.md`.
- **The generic cap classifier is now a historical diagnostic, not a live
  split** — `exists_blockerCenter_mem_capInteriorByIndex` localizes each actual
  blocker separately to some strict indexed cap, but the negative
  `FreshThirdBlockerFiber` packet does not prove that the fresh blocker differs
  from the cap-source blocker, that either fresh source lies outside the
  blocker's cap, or that either fresh source belongs to the cap-source row.
  Its positive incidence only places the two fresh sources in one another's
  own selected rows.  Even a joint same-cap localization lemma would therefore
  leave those row-membership and distinctness fields open; the needed producer
  must couple cap localization to the cap-source row rather than merely
  classify the two centers independently.  The sorry-free scratch theorem
  `SevenBranchClassifier.lean` now typechecks an exhaustive seven-way split:
  equal blockers; a cap-source-row miss; one cross-row hit; two hits with
  different cap indices; same-cap with the first source inside; same-cap with
  only the second source inside; or the already-closed positive alignment
  branch.  The v5 necessary-condition probe found exact SAT witnesses for the
  equal-blocker, different-index, first-inside, and second-inside branches;
  found strict SAT-witness subcases for both the row-miss and one-hit branches
  while their cold unrefined runs timed out; and returned UNSAT only for the
  positive alignment branch already closed in Lean.  Those SAT subcases imply
  SAT for their respective parent branches.  These are models of an explicitly
  incomplete projection, not carrier countermodels or Lean refutations.  The
  classifier described what would be needed after the former fresh-third
  split, but it did not narrow the common cap-source/blocker-multiplicity
  obstruction and is no longer on the coordinator interface.
- **The equal-blocker mutual branch now has one checked terminal** —
  `commonCollisionEndpointOmission_or_complementaryMembership` gives an exact
  split for the two collision pairs.  In the complementary arm, equal actual
  blockers identify the two selected supports; the two distinct cap sources
  and all four pairwise-disjoint collision endpoints would then be six
  distinct members of one support of cardinality four.
  `false_of_equalBlockers_complementaryMembership` formalizes this
  contradiction on the production spine.  Only the common-endpoint-omission
  arm still entered the generic fresh-third terminal from this caller.  This
  remains a checked subbranch of a compatibility route, not a live frontier
  split.
- **The former one-sided deletion leaf exposes six synchronized centers** —
  `sixCenterDeletionSurvivalPacket_of_oneSided` produces, in either deletion
  arm, exact-four survival at the two collision blockers, all three robust
  Moser apices, and the surviving cap-source blocker, with the six centers
  pairwise distinct.  Each packet component directly instantiates
  `U5QDeletedK4Class.exists_card_four_of_hasNEquidistantPointsAt_skeleton`, so
  materializing the six deleted-carrier four-rows is mechanical and is not the
  missing mathematics.  The closest checked terminal is
  `U3FixedTripleAuditFrame.false_of_rowwiseConfinedQDeletedClasses`.
  `SixSurvivorExactRowsBoundary.exists_fixedTripleAuditFrame` now supplies that
  frame, including its `U5DangerousTriple`, under `9 < D.A.card`; the live
  `17 ≤ D.A.card` contract discharges this premise.  The remaining source
  theorem is rowwise confinement of every audit-center q-deleted class inside
  `U5BoundedSupport`, or a contradiction from
  `U3FixedTripleAuditFrame.exists_qDeleted_escape_or_criticalFourShell`.  No
  such theorem currently follows from deletion survival alone.  This
  identifies the exact missing producer for that historical route, but the
  route is no longer a separate obligation because its cap-source witness
  already feeds the common surface.
- **Cross-blocker equality needs a global bridge, not a local alias
  contradiction.**  A source audit of all four
  `CrossBlockerCoincidence` aliases shows that each alias supplies at most one
  direction of the reciprocal row incidence needed by the existing
  duplicate-center terminals; the localized and mutual-omission packets add
  only negative incidence.  The exact follow-up in
  `scratch/atail-force/cross-blocker-euclidean-audit/` gives a checked rational
  coordinate witness for each of the `4 × 3 = 12` alias/residual branches in
  the encoded named Euclidean projection.  This is not a model of the complete
  Lean hypotheses.  It rules out only the proposed local route: closure must
  use an omitted global consequence such as common support/frame confinement,
  full cap order, carrier-wide K4/minimality, or the no-`(m,4,4)` hypothesis.
- **The consolidated metric question (Q)** (dead-ends): the global
  per-vertex-K4 forced-repeated-circle incidence is irreducibly metric /
  ∃ℝ-flavoured. The plan does not attempt to decide (Q) wholesale; it
  attacks the dated package frontier's finite case structure, where each leaf's
  hypothesis stack is strictly richer than (Q).

## 4. The engine: two-layer CEGAR per package

One pipeline, applied per shared package (7 packages, §1), leaf supplements
as clause deltas. This is the same loop `census-554` already runs
(CEGAR-to-UNSAT with exact certificate replay), retargeted at the frontier
packages.

**Layer 1 — incidence/counting CNF.** Finite relational abstraction of the
package: ground set = the named points (T/Γ₂ five-sets, apexes a₀ a₁ a₂,
sources, blockers, CD-packet members) plus bounded anonymous slots; boolean
atoms for row membership (`x ∈ Row(y)`), cap membership (incl. strict
interiors), blocker map values (β(x) = y), class cardinalities (rows exactly
4, |T| = 5, |Λ| ∈ {4,5}), survival/omission arms, and the counting
trichotomies (cap-growth arithmetic |C₁|+|C₂|+|C₃| = n+3, |O₁|+|O₂|+2 = n,
cover bound |A| ≤ 4|N|, row-heaviness counts N_u, N_v). Every clause must be
IMPLIED by the package hypotheses (soundness is one-directional; the
abstraction may omit hypotheses — minimality and no-(m,4,4) in particular
are not finitely expressible and are omitted). CaDiCaL via
`census/card_head/` conventions; DIMACS + drat proofs retained.

- **UNSAT** ⇒ the package (or leaf delta) is contradictory at the incidence
  layer ⇒ Lean-close it by certificate replay (§6). This is the good
  outcome; A/C's row-heaviness splits and E's cover-bound structure are the
  most likely candidates. {{NEEDS_PROOF}} — no package verdict is assumed
  in advance.
- **SAT** ⇒ enumerate satisfying incidence types up to symmetry (blocked
  clauses over the model's orbit); proceed to Layer 2 per type.

**Layer 2 — exact-rational realization per incidence type.** Extend the
15-point witness scaffold: fix the incidence type, search ℚ² coordinates
satisfying every metric constraint exactly (`Fraction` arithmetic, msolve /
Singular / sympy as untrusted proposers, `check_model.py`-style exact
verification). Two outcomes:

- **Realized** ⇒ Branch-B candidate for that package. Verify every leaf
  hypothesis exactly except minimality/no-(m,4,4) (not finite); this is a
  *conditional route-kill* in the D-doc sense. Adversarial audit, then STOP
  and report (§2.5).
- **Not realized, with an identified small-support obstruction** (an exact
  polynomial certificate that some ≤10-point sub-configuration is
  impossible) ⇒ prove that obstruction as a Lean metric kernel (the
  88-metric-point-kernel pattern; opus prover agents, no subagents), add it
  to Layer 1 as a new clause, re-run. This is the CEGAR refinement step —
  each iteration strictly shrinks Layer 1's model space, and each kernel is
  a permanent on-spine asset once its replay lands.

Termination is not guaranteed (the loop can stall if realization neither
succeeds nor yields a finite-support obstruction — that residue is exactly
the (Q)-flavoured content); the stall condition is itself reportable: it
names the minimal open metric fact for that package.

### Pinned-multiplicity boundary (2026-08-01)

The pinned-multiplicity reformulation is now a checked semantic bridge, not a
new generic CEGAR pruning rule. For a K4 configuration it gives
`4 ≤ pinnedMultiplicity A p` at every center `p`, and the exact reformulation
of the target is the existence of a center with multiplicity at most three.
The current `(S-EXACT)` support rows already encode the usable K4 consequence
by selecting four witnesses. They do not assert that the physical radius
class has exactly four points.

The only generic cardinality reduction admitted on the current Phase-3 spine
is the existing `k = 4, n = 10` scope for the `counterexample_card_ge_ten`
consequence and its already-audited `S-MINCUT` encoding. Do not add clauses
for a fifth or sixth co-radial point, full-shell exactness, or
`NoQFreeAfterDeletion`: no universal producer for those statements is
available in the current schema, and no generic upper bound on pinned
multiplicity has been proved.

The other checked consequences are route-specific. Use
`no_diameter_under_k4` only in an MEC-boundary search that supplies its
noncollinearity and convex-independence hypotheses; use
`six_mul_card_le_iCount_of_K4` only in a search that models `iCount` and has
an independent producer for the corresponding upper bound. The
blocker-fiber multiplicity disjunctions belong to the ATAIL
`CriticalShellSystem` route and must not be copied into the generic Phase-3
cell CNF.

Full physical-radius partitions, named cap/deletion roles, off-support
disequalities, and aligned-cap constraints are reserved for a separate
pinned-multiplicity schema. The existing projected-static-v3 implementation
does not satisfy that gate: it still treats the four selected witnesses as a
support and keeps `MetricRow.exact = false`. That future schema requires its
own semantics contract, decoder/validator, replay/blocking artifacts, and
small-cell acceptance gate before any of its clauses can enter production.

### ATAIL pinned-multiplicity ingress boundary (2026-08-01)

The proved local result
`CollisionCrossHit P Pρ ∨ GeometricMultiplicityResidual P Pρ` is an ATAIL
source-level disjunction, not a generic Phase-3 learned clause. Preserve the
actual `CriticalShellSystem` rows, vertices, cap/blocker provenance, and
omission/membership fields in named ATAIL packet types. Dispatch through the
checked acyclic ATAIL coordinator to branch-specific consumers; the
coordinator is source-clean wiring, while only proved child contradictions
count as closure.

Generic Phase-3 CEGAR must not encode or learn ATAIL blocker-fiber
disjunctions, cap/blocker identities, same-cap or omission provenance,
negative-membership facts, or named-source finite completeness. It may consume
a separately proved positive-row metric consequence only after an ATAIL
branch produces the required positive antecedent. SAT, `UNKNOWN`, bounded
shadows, and finite realization failures remain conditional evidence.

### Phase-3 CEGAR implementation status (2026-08-04)

The performance work is now represented by a fail-closed, testable accelerator
layer rather than changes to the production proof contract.  The checked
implementation includes:

- authenticated append-only journal prefix checkpoints in
  `census/p97_search/phase3_journal_checkpoint.py`;
- a validated prefix-bank cache in
  `census/p97_search/phase3_prefix_bank_cache.py`;
- timing and cold-start/process-profile instrumentation in
  `census/p97_search/benchmarks/phase3_cegar_benchmark.py`;
- read-only productivity telemetry/mining in
  `phase3_productivity.py` and `phase3_productivity_miner.py`; and
- held-out detector portfolio/adaptation tooling in
  `phase3_portfolio.py` and `phase3_portfolio_adapter.py`.

The journal checkpoint and prefix-cache paths authenticate their source
identity and fall back to authoritative replay on a miss or mismatch.  The
productivity and portfolio paths are diagnostic/PARKED-SPEC: they do not select
detectors, admit clauses, alter the cascade, or turn `UNKNOWN` into a negative
result.  The benchmark now measures loader replay, CNF construction, manifest
hashing, solver, certificate/minimizer, journal/artifact I/O, terminal proof,
and publication buckets, including persistent-solver parse/invocation and
worker wall time.

The corresponding unit and integration tests live under
`census/p97_search/tests/`.  These changes improve observability and restart
cost without changing the frozen journal/certificate semantics.  Production
promotion still requires a differential corpus, authenticated replay, and a
fresh terminal proof; no timing result or portfolio proposal is a closure
result.

### Producer-quality CEGAR acceptance gate (2026-08-05)

The useful-data question is now an explicit per-iteration gate. Every
accepted CEGAR record must carry:

* the live leaf identifier and a hash of its ingress hypotheses;
* the finite schema, cardinality scope, and source theorem that justify the
  encoded variables;
* the exact certificate/replay hashes and the learned clause;
* the named Lean producer, lift, and consumer that the record is intended to
  feed; and
* a classification of the result as LOCAL_CERTIFICATE,
  UNIFORM_PRODUCER, or LIFTED_CONSUMER.

LOCAL_CERTIFICATE records may improve the bank and remain regression data,
but do not count as universal progress. A UNIFORM_PRODUCER must prove a
source-level predicate from the live binders and be independent of the finite
enumeration. A LIFTED_CONSUMER must additionally provide the
general-cardinality/bounded-obstruction lift and land in a named terminal.
The producer and consumer theorem names, together with a no-sorryAx axiom
audit, must be present before a finite UNSAT is promoted.

The scheduler should optimize for reusable source predicates rather than raw
models blocked. A run therefore stops as a diagnostic when a fixed budget
produces only local certificates, repeated clauses, or SAT models that do not
exercise a missing ingress field. Its report must instead name the smallest
missing field (for example B1's particular-source outsideFirstApexFiber or
physical deletion-survival witness). This turns SAT and bounded survivors
into actionable producer targets and prevents another large finite census from
being mistaken for universal closure.

The first enforcement layer is implemented in
`census/p97_search/phase3_productivity.py`: newly emitted productivity records
carry an authenticated `ingress_contract`.  A run that supplies no
source-level contract is recorded honestly as `LOCAL_CERTIFICATE` with
`promotion_eligible = false` and an explicit missing-field list.  The validator
rejects `UNIFORM_PRODUCER` and `LIFTED_CONSUMER` records unless their live leaf,
ingress hash, finite schema, cardinality scope, source theorem, producer,
consumer, and (for the lifted class) lift theorem are all named.  Existing
v1 journals remain readable; the stricter contract applies to new records and
promotion tooling.

The production driver now accepts an optional `ingress_contract` and threads it
through `_commit_sat_classification` into the authenticated productivity
record.  This makes the gate operational at the point where a lane produces
data: a lane cannot claim producer evidence merely by writing a sidecar report.
If the argument is omitted, the record remains an authenticated but explicitly
non-promotable local certificate.  The integration test
`test_ingress_contract_survives_authenticated_driver_record` checks that an
explicit contract survives the JSONL append and hash chain unchanged.
When a contract is declared, it is also bound into the run configuration;
resume and shard-coverage replay therefore fail closed if the declaration is
omitted or changed.

The read-only miner now includes an `ingress` summary with counts by evidence
class, live leaf, promotion eligibility, and missing contract field.  The
driver also accepts `--ingress-contract PATH` (together with
`--productivity-telemetry`) so a bounded lane can declare its named target in
an authenticated JSON file.  This is an observability and targeting aid only:
an explicit `LOCAL_CERTIFICATE` remains non-promotable, and no contract file
can manufacture a source theorem, lift, or terminal consumer.
For promoted contracts, the ingress-hypothesis pin is checked as a canonical
64-character hexadecimal SHA-256 value rather than accepted as an arbitrary
placeholder.

A check of the three existing P10A sample journals
(`scratch/p10a-gate-*/observed/productivity.jsonl`) confirms why this gate is
needed: each contains one authenticated record, but all three classify as
`LOCAL_CERTIFICATE`, have `live_leaf = UNDECLARED`, and have zero
promotion-eligible records.  These artifacts are valid regression/telemetry
data, not producer evidence; the next targeted lane must supply an explicit
contract before its SAT output can answer a named universal-closure question.

The first contract-bound diagnostic was run against the driver that actually
emits these records, rather than attaching an E or B1 label to the wrong
encoder.  The contract is
`scratch/p10a-targeted-ingress-contract.json`, and the authenticated run is
`scratch/p10a-targeted-run/`.  With no bootstrap bank, projected-static-v3,
`max_new_raw = 1`, and a five-second solver budget, it reached a deliberate
`CHECKPOINT`: one raw SAT assignment, one `learned-structural` record at
`equality-duplicate-center`, no survivor, and no terminal DRAT proof.  The
read-only miner reports one targeted `LOCAL_CERTIFICATE`, zero
promotion-eligible records, and the missing fields
`ingress_hypotheses_sha256`, `source_theorem`, `producer_theorem`,
`lift_theorem`, and `consumer_theorem`.

This is useful process evidence, not a closure result.  It confirms that the
new gate captures the exact finite schema and exposes the missing universal
bridge, while also confirming that this Phase-3 driver is not itself a B1/E
frontier ingress.  The next producer run must use a driver whose finite schema
is source-faithfully derived from the chosen B1 or E leaf, then replace the
`NO_LEAN_LANDING:` local target with a real leaf and a hashed ingress theorem
before any finite result can be considered for promotion.

## 5. Package work orders and smoke gates

The current production handoff is the E1 core specified above.  The matrix
below is the secondary computational/fallback order for the remaining
packages; it must not be read as a new exact-cardinality search order.  It is
ordered by leverage (leaves narrowed per source-faithful result), with the
shared base encoder built once and instantiated per family — A and C share
blocker semantics, D/E share the residual frame.  A package verdict is not
promotion evidence until its ingress, replay, consumer, and general-cardinality
lift are all named.

| Order | Pkg | CNF seed (from the family docs' combinatorial sub-constraints) | Smoke gate |
|---|---|---|---|
| 1 | A-core (6) | Partition T = {z_d} ∪ I_u ∪ I_v, |I_u| = |I_v| = 2 disjoint; β-pattern with β(x) = a₁ iff x ∈ Cl(a₁,r); CD overlap ≤ 2; cap-growth trichotomy; leaf deltas A2–A8 (β(source) placement × N_u/N_v row-heaviness) | Encoder must find SAT on the 15-point witness's incidence type restricted to the layers it realizes; leaf-delta consistency: A3–A5 and A7–A8 deltas mutually exclusive by construction |
| 2 | C-core (2) | Same skeleton as A (Γ₂ = {z*} ∪ I_u ∪ I_v); C1 placement trichotomy; C2 explicit collision arm | Same witness gate; C1 trichotomy exhaustiveness checked against A's version |
| 3 | E (8) | Four-workstream E1 pipeline for the eight named leaves in the recorded inventory: canonical exact-15 archetypes; general Lean soundness cuts (beginning with seven-source critical-shell mutual omission); finite Boolean exact-15 coverage; source-faithful bounded-obstruction or deletion/minimality lift to general cardinality. Preserve the cover bound, cap-sum identity, `n ≥ 15`, full unique-four shell semantics, directed-omission provenance, and E9 low-hit clauses. | Reproduce the kernel-checked low-hit arithmetic on a hand-built 15-point pattern; reject any exact-15 certificate lacking checked archetype coverage, and reject any claimed uniform closure lacking the general-cardinality lift. The four workstreams are routes, not four closed leaves. |
| 4 | FreshThird/F-Γ (2 on-spine) | Γ restated in `lean/scratch/f3c-redundancy-bank/F3cRedundancy.lean`; pairs-disjointness; shell ∩ cap = sources; deltas for cross-blocker coincidence and the common cap-source surface together with the blocker-multiplicity residual. The normalized-remaining, first-non-hit, and first-fiber branches are compatibility adapters | Fixed-slot completeness is unavailable: a 17-point shadow and an unbounded four-point-block extension survive. Route the two on-spine leaves through geometric/global bridges, not a closed named universe |
| 5 | D-R (2) | Two disjoint selected 4-classes K₁ ∩ K₂ = ∅; no-five-row at a₂; D2's five role-swap equalities S ↔ S′ | Verify the five syntactic role/cap aliases under the double renaming; do not assert `S′′ = S` or packet equality |
| 6 | D-E (2) | Exact-five class; D3 distinct-centers vs D4 common-center arm; D4's exactly-2-on-bisector cardinality | D4's bisector-2 clause must be consistent with the banked `b1_bisectorSet_eq_pair` mechanism (Dumitrescu L1 bound ≤ 2) |
| 7 | B (3) | B2 canonical-row forcing + mutual-omission survival; B3 removable-iff-survival (`lean/scratch/b-family-bank/`). The live B1 normal form `b1_live_normalForm` now reconstructs support equality, both cross-memberships, and the exact two-point intersection from the leaf's own binders. The `B1-direct-shadow` is SAT at 162 variables/109 clauses; separate support-equality, cross-membership, and physical-exclusion pin runs are DRAT-verified UNSAT. | Treat B1 as ingress-corrected but still open: its remaining B1-gap needs a global shell/cap/no-`(m,4,4)` producer; do not label it `OMITTED_PREREQUISITE_INGRESS_MISSING` |

Validation status 2026-07-28 is historical: A, C, E, D-R, D-E, and B
encoders passed their smoke gates. The current B1 result is the split
diagnostic above, not a live-leaf closure. F-Γ has no sound fixed-slot
encoder; its separate unbounded counting audit is the applicable gate result.
Rationale for the fallback order: A-core is the largest single package lever
(6 leaves close or die together on the package verdict before any leaf delta
is touched); C amortizes A's encoder; the remaining packages are smaller or
partly pre-constrained by banked facts.  None of these package runs displaces
the E1 core as the current uniform production target.

## 6. Lean ingress (landing verdicts on the spine)

Three validated routes, chosen per artifact size:

1. **Small case trees** (≲ dozens of cases): direct Lean case analysis /
   `decide` over the finite abstraction, stated as a lemma whose hypotheses
   are re-derived from the leaf's actual binders (the b3_gap_refuted
   pattern: hypothesis instances, no new axioms).
2. **Trimmed-CNF valuation bridge** (thousands of clauses): the
   `IndexedSource` precedent — 8,703 trimmed clauses proven satisfied by an
   explicit valuation, all kernel-checked. Reuse its layout for any package
   whose UNSAT core is large; drat-trim first, replay the trimmed core.
3. **Farkas / counting certificates**: the 802-schema precedent for
   cardinality layers (cap growth, cover bounds, row-heaviness pigeonholes)
   — certificates land as cardinality-free lemmas parameterized over n.

Metric kernels from Layer-2 obstructions land as standalone theorems with
exact rational data inlined (Nullstellensatz replay, `Fraction`-verified
before formalization), then get consumed by the leaf's case tree.

## 7. Compute substrate

Budget (Adam, 2026-07-28): all of flux plus 24 cores on this box.

- **Local (24 cores)**: Layer-1 CNF verdict runs (CaDiCaL parallel over
  leaf deltas and symmetry-blocked type enumeration), sympy + `Fraction`
  certificate verification, drat-trim. All seven package verdicts are
  local-scale work.
- **flux (16 slots, dedicated)**: Layer-2 realization sweeps and
  mining-oracle batches via the census-554 NFS work queue
  (`/opt/nfs/erdos9796-flux-bridge/`, driver `CENSUS554_QUEUE=1`,
  heartbeat-sized deadlines, local fallback). Size batches to ~40 total
  slots (flux 16 + local overflow); known gotchas: run driver/workers
  outside the sandbox (NFS EPERM), skip AppleDouble `._*` files.
- **Optional escalation**: the SAT-Modulo-Symmetries + co-certificate
  learning lane (`docs/notes/sms-ccl-application-recommendation-2026-07-13.md`)
  fits Layer 1's symmetry blowup exactly but is explicitly not authorized —
  {{NEEDS_ADAM_INPUT}} before adopting.

## 8. Sequencing (sessions, not wall-clock)

The earlier session bullets below preserve the completed computational
triage.  The current execution handoff is the E1 core above, with the package
matrix used only if that route needs a certified secondary consumer.

### Revised execution order after the 2026-08-04 audit

* **P0 — repair contracts before new production runs.** A-core's finite-domain
  truncation is repaired by its `GE25` abstraction and regression gate. Audit
  every other universal-package encoder for the same defect. Record the
  five-part ingress contract in §0 before accepting a future `UNSAT` as a
  candidate landing.
* **P1-E — make the next E result a producer/consumer bridge.**  Factor the
  left/right adjacent-cap mirror pair, consume the verified
  `endpointFresh_exists_selectedRow_escape_twoShellSeed` producer, and prove a
  universally quantified consumer-ready `Good` escaping-row theorem.  The
  exact-15 search remains a coverage/regression tool until the
  general-cardinality deletion or bounded-obstruction lift is proved.
* **P1-F-Γ — run the long-lead producer lane in parallel.**  Target a uniform
  common-first-apex-radius/reciprocal-C-row producer, a profile-independent
  terminal, or a complete index-transport theorem for the hard-coded
  `oppIndex1` packet.  Do not add another fixed-`n` FreshThird production
  enumerator while the `m=2` stratum persists for every `n≥17`.
* **P2-Rigid221 — aggregate the exact-four family.**  Search for one
  generalized cap-growth/row-count theorem dominating the 13 leaves rather
  than adding leaf-specific SAT clauses.  Every added clause must be justified
  by that source theorem.
* **P3-B1/D — consume corrected ingress and target the global gap.**
  `b1_live_normalForm` supplies the support equality, cross-memberships, and
  exact two-point intersection.  It does not provide the third bisector
  carrier.  Target a source-faithful global shell/cap/no-`(m,4,4)` producer or
  a closed MEC/minimality terminal before any new B1 computation.  D-E and
  D-R should likewise share a producer before another package enumeration.

- **Current handoff (2026-08-02)**: the broad
  `false_of_retainedOmission_triApexAllLarge_core` obligation and its
  reverse-hit/fresh and endpoint-critical-fiber children are checked
  dispatchers.  Attack
  `false_of_retainedOmission_reverseHitFresh_endpointCrossHit_triApexAllLarge_core`
  through its checked `A = J`, `A = X`, `X = C`, and generic-role split.  The
  three coincidence children are five-role metric/full-shell problems; the
  generic child requires global cyclic-order coverage across all surviving
  placements.  Mine the complementary endpoint common-deletion branch, the
  three-distinct-blocker ordinal-cycle branch, and the paired-common-deletion
  branch separately.  Keep all eight
  wired through the existing all-large-cap
  coordinator.  A leaf counts as closed
  only after the focused Lake, proof-blueprint reference/spine, and
  transitive-axiom gates pass.  Do not open a new card-12/13 census as a
  substitute.
- **Endpoint retarget (2026-08-04)**: the four surviving `A = J`/`X = C`
  endpoint orders have exact-rational strictly convex named local witnesses,
  and the 120-insertion QF_NRA audit reports 22 SAT, 82 Kalmanson-core UNSAT,
  and 16 UNKNOWN.  Retire named local metric/order mining as a closing route.
  Start the next producer from the source-faithful deletion boundary:
  `B2 = Sigma_A/Sigma_B`, the two O-centered `B1` supports, and their
  overlap-at-most-two constraints.  The target is a global full-carrier/K4
  coupling with an explicit adapter to an existing `False` consumer; a new
  local placement assertion is not an admissible target because the
  source-faithful named local packets have exact rational witnesses.  Local
  SAT witnesses are not global models and solver outcomes are not Lean
  closure.
- **Session 1**: base incidence encoder + A-core instantiation + A smoke
  gate; A-core package verdict run. Deliverable: verdict or a concrete
  encoding blocker. DONE 2026-07-28: all gates pass; verdict = SAT on all
  8 runs (base, base+P, five leaf deltas, A1) at the seed layer —
  `census/frontier-packages/a_core/RESULTS.md`. Next per §4: CEGAR
  iteration 2 (add omitted families — E8 bisector localization, E5 radius
  uniqueness, survival arms) before Layer-2 type enumeration; (EQ4)
  transitivity landed as spec v1.1 (validated `8f27d00a`).
  Iteration 2 spec'd as v1.2 §9 (`dc2e7d65`) and dispatched 2026-07-28:
  families (E8a–d), (E5a/b), (DEL3) |Δ|=2 under 𝔓, (N8) n≥14 from the
  F chain, (FB) frontier-pair selector, (CD4)/(CD5) B-set structure,
  (R1'), gamma cap atoms; four new UNSAT probes. DONE (`9e8ed3d5`):
  verdict still SAT ×8; base+P now pins |Δ|=2 exactly.
  F-Γ note: FrontierLedger's `census/f_gamma` (convo #2455–#2456) found
  fixed-slot completeness UNAVAILABLE for F-Γ (unbounded n=17+k family
  survives) — session-2 F work must route through their lane, not a new
  fixed-slot encoder.
- **Session 2**: C, E, F-Γ instantiations + smoke gates + verdicts (encoder
  amortized); begin leaf-delta runs for whichever package returned UNSAT.
  C and E DONE 2026-07-28 (specs `d7fedf4e`, `75e9c6a0`; encoders
  `6e2b82e5`, `ff02082b`): C-core remains SAT ×3 after the 2026-08-04
  GE25 universal-cardinality repair (base 928/21690, base+C1 938/21719,
  base+C2 964/21797), with the overflow gate, all prior gates, and all 8
  orchestrator probes passing; BM6 ruled not-carried (no (P2) analogue in
  the C doc — unsound to assert); E remains SAT as its spec expected — the
  15-point shadow satisfies the counting core, G-SHADOW witness gate passes
  with a faithful point-by-point mapping. E's 2026-08-04 replay now uses
  exact `0,...,24` plus `GE25` buckets (base 565/20160); all five probes
  remain DRAT-verified and the new overflow gate passes. F-Γ remains
  FrontierLedger's lane. New third lane green-lit at design level: the
  P97-level bounded counterexample search (shell-hypergraph census,
  k-parameterized, banked theorems as pruning rules, census-554 per-cell
  engine as chassis; refutation branch is self-certifying, k=3 arm =
  end-to-end positive control). Design doc next.
- **Session 3**: D-R, D-E, B; full live-frontier triage matrix. DONE
  2026-07-28: D-R SAT ×3, D-E SAT ×4, B2/B3 plus pinned arms SAT; all
  negative smoke probes DRAT-verified. The historical B1
  `OMITTED_PREREQUISITE_INGRESS_MISSING` label was retired on 2026-08-04:
  `b1_live_normalForm` now supplies support equality, both cross-memberships,
  and the physical-class exclusions to the encoder. The refreshed B1 shadow
  is SAT (162 variables, 109 clauses), with three adversarial omission pins
  DRAT-verified UNSAT. This is now an official source-faithful diagnostic SAT
  verdict, not a closure; the remaining gap is global.
  Independent cross-audits passed; D-E's one composite provenance label was
  corrected without changing its CNF. The live frontier is now 20 after the
  F3 split; see
  `census/frontier-packages/SESSION3-TRIAGE-2026-07-28.md`.
- **Sessions 4+ (secondary/fallback)**: no package produced a live-leaf UNSAT core for replay.
  Continue with the Phase-3 exact-shell census and independently certified
  realization/infeasibility work on survivors; add CEGAR clauses only after
  proving the corresponding metric/global consequence. Kernel spine
  re-census after every landing batch; convo post per checkpoint. Phase-3
  gates are now green, including exact tiny enumeration, terminal DRAT,
  resume/tamper, and interruption controls. The first bounded runs are
  `PARTIAL`: `(3,9)` has 100 raw / 29 canonical OPEN survivors and combined
  `(4,10,(4,4,5))` has 100 raw / 100 canonical OPEN survivors. This rules out
  treating more Layer-1 enumeration by itself as the next closing step; the
  next compute consumer is the realization arm, with numeric failures kept
  `UNRESOLVED` unless independently certified.
  The original 100-model `(4,10,(4,4,5))` artifact later became stale after
  the rule-bank hash changed. It was regenerated under the current bank as
  `k4-n10-profile-445-combined-bounded100-current-20260728`; strict artifact
  verification passes and all 100 canonical digests agree with the original
  prefix. The fail-closed realization adapter expands this current prefix into
  all 24 cap-compatible hull orders per survivor: 2,400 deterministic local
  leaves across 24 shards.  Their current screened outcomes and trust scope
  are recorded in `census/p97_search/PHASE3-RESULTS.md`; the initial
  all-`UNRESOLVED` state is historical only. `flux.local` is no
  longer in the compute plan after a crash; the campaign is local-only with at
  most 24 single-threaded solver workers.

## 9. Honest limits

- The exact-cardinality-11 `FiniteN11Closure` endpoint is a verified
  regression closure, not a universal `FrontierLiveClosure` closure.  The
  E1 core and the D-R, D-E, A/C, F-Γ, and B residuals remain live until their
  own load-bearing consumers are proved.
- A package-level incidence-SAT verdict does not kill the package — only an
  audited exact realization does, and even that is conditional on
  minimality/no-(m,4,4) (not finitely checkable). Both hypotheses are
  omitted from Layer 1, which is sound for the UNSAT direction.
- The CEGAR loop's stall residue is the (Q)-flavoured metric content; if
  every package stalls there, the plan's output is the exact minimal open
  metric statement per package — named, not hand-waved — and that becomes
  the single target for whatever comes next.
- A package-level UNSAT result closes only its finite or conditional package
  theorem.  It closes a universal live leaf only after a source-entitled
  ingress/coverage theorem proves that every live instance enters that package
  (or after another checked universal lift supplies the same implication).

## 10. 2026-08-04 projected-static-v3 migration checkpoint

The corrected projected-static-v3 depth-5 wave completed on 20 selected
canonical shards at
`scratch/p97-distinct-distance-lane/phase3_projected_depth5_v3_wave_canary_20260804`.
Eleven shards reached fresh `SHARD_STRUCTURAL_UNSAT_VERIFIED` terminal status
with DRAT-verified shard-local proofs.  Nine shards reached bounded
`CHECKPOINT` after 2 raw and 2 classified SAT assignments each; all nine had
zero structural survivors and 2 dynamic learned cores.  The nine checkpoint
directories were resumed with the exact original provenance and
`--max-new-raw 2`; all replay manifests matched their prior manifests after
canonical JSON normalization.

This is a migration and restart-integrity result, not closure of a universal
Lean leaf.  The wave is only a selected 20-shard subset of the depth-5
partition, and projected-static-v3 still uses four selected support witnesses
with `MetricRow.exact = false`.  Its terminal certificates are therefore
finite, shard-local structural evidence.  Promotion still requires the
five-part ingress/consumer/lift contract recorded in the migration note,
including a general-cardinality theorem.

## 11. 2026-08-04 FreshThird global-cut audit

The post-round theorem-bank audit covered the retained-omission CEGAR
artifacts through v38 and the round-6/round-7 multiplicity reports.  The hard
v35 canary returned `UNKNOWN` on all twelve assignments; v36 and v37 producer
diagnostics remained `SAT`; v38 was cancelled.  These are theorem-mining
results only, not universal closure or a Lean landing.

The strongest source-faithful candidate was exact-shell square separation,
whose Lean primitives are
`CriticalFourShell.dist_ne_radius_of_mem_A_not_mem_support` and
`CriticalFourShell.support_eq_radius`.  It targets the retained-omission
encoding and has no adapter to the live FreshThird packet.  The available
non-hit primitives produce only one-sided deletion survival or a two-point
support-intersection bound.  The double-deletion center-equivalence consumer
requires a `SurvivorPairRelocationPacket` and a double-erasure hypothesis;
`CrossPairDeletionView` exposes only a disjunction of single deletions.  The
outside-pair/Kalmanson consumers additionally require both points outside a
common cap and a boundary-order packet, while the noncanonical FreshThird arm
provides only one-inside/one-outside data.

A focused Lean 4.27 PARKED-SPEC probe
`scratch/freshthird_equalcenter_samecap_probe_20260804.lean` confirms the
remaining equal-center `sameCapWithInternalFiberSource ×
sameCapWithInternalFiberSource` product only forces the two cap indices to
coincide (and carries the existing support/cap memberships).  It does not
force that common index to be `oppIndex1`, nor does it produce a contradiction.

Operational consequence: keep the two on-spine FreshThird obligations open and do not
launch another fixed-cardinality enumerator.  The next admissible producer is
one of: (i) an accumulator turning the two single-deletion views into a
double-deletion packet, (ii) a common first-apex radius with reciprocal
cross-row incidence, or (iii) a mixed-incidence metric/order terminal.  A
bounded `UNSAT`, external square-separation clause, or unconditional wrapper
does not satisfy the ingress/consumer/lift contract and receives no closure
credit.

## 12. 2026-08-04 P10B held-out portfolio gate

The first real multi-record P10B corpus gate has now been completed under
`scratch/p97-distinct-distance-lane/p10b-heldout-gate-20260804/`.  The
read-only adapter authenticated and replayed 40 v3 source records; an
independent second replay produced byte-identical scenarios and portfolio
reports.  On the deterministic 31-record training / 9-record held-out split,
the fixed and fitted detector orders both had zero semantic disagreements and
9/9 held-out matches, but identical replayed cost (`1,296,835 ns`) because all
40 traces terminated at `metric-core`.

This is a reproducible negative diagnostic, not a portfolio promotion,
production speedup, or closure result.  The adapter's authenticated report
digest is
`c7af4cc466eb14f7fc9710056e2427080692ca69690ed13560f25ffe0633c8ee`; the
byte-level scenario and portfolio-report digests are
`99fe9035e6c13102798f4a4b8d39aa8049d47ac0ade76562a360ec98d3631de3` and
`210c5935f69322b04a7261d5d963fc22e91c2a5062a4b3eaabbb941ba980bbde`.
The next P10B target is therefore genuine detector-diversity coverage from a
real bounded CEGAR corpus, or an explicit semantic-equivalent Class-B
consumer with source-to-CNF and certificate-replay contracts.  Detector
diversity must not be synthesized or relabeled merely to satisfy the gate;
the Class-A cascade and terminal trust boundary remain unchanged.

## 13. 2026-08-04 universal-ingress and producer gate

The current production target is the 30 load-bearing spine `sorry` theorems
reported by the live blueprint, plus the induced `sorryAx`; older coordinator
counts such as 18 and the superseded 28-leaf snapshot are historical
bookkeeping and must not be used as the kernel closure count.

Every future computational campaign must declare its Lean ingress contract
before the solver run.  The contract must identify (a) the live universal
hypotheses, (b) the finite object extracted from them, (c) the symmetry or
coverage theorem, (d) the cardinality scope, (e) the exact-certificate replay
theorem, and (f) the existing terminal `False` consumer.  A bounded `UNSAT`
without a proved lift to the universal hypotheses is evidence for theorem
discovery only.

The former A-core scope defect is repaired: exact cardinalities `0,...,24`
are augmented by a `GE25` overflow bucket, and every concrete arithmetic tuple
has an abstract image. The dedicated overflow gate and all package probes
pass; all package variants remain SAT. This fixes the soundness contract but
does not close an A leaf. The same scope audit still applies to every other
universal encoder with a finite cardinality domain.

Execution order is now **consumer-contract-first**.  Before proving or mining
another producer, name an existing kernel-clean `False` consumer, write its
exact ingress contract, and show which single missing premise the proposed
work will discharge.  A source-clean theorem with no such consumer remains
banked/off-spine and receives no closure credit.  E remains a near-term lane
only where the existing terminal consumes the proposed `Good` escape and its
general-cardinality lift.  FreshThird remains the long-lead lane, but no new
uniform index-transport or metric/order producer is promoted until it names the
direct `freshOutsideFirstBlockerFiber` ingress and its coverage argument in
advance.
Further fixed-`n` enumeration remains paused.  The 13 Rigid221/exact-four
leaves should be treated as a hypothesis lattice and approached through one
generalized counting theorem only after a checked dispatcher consuming that
theorem has been identified.  B1 is no longer an ingress-missing package:
`b1_live_normalForm` reconstructs the formerly omitted support and
intersection facts, and `false_of_b1_global_gap_or_closed_terminal` is its
checked consumer; B1 work must target one of that consumer's three exact arms.
D-E currently has no banked all-cardinality consumer beyond its live sorries,
so it is not a producer target until such a direct contradiction is found.
FreshThird/F-Γ remains a critical-path dependency, but source-clean producer
boundaries without terminal ingress do not reduce its two authoritative
on-spine leaves.  The normalized and first-non-hit routes are compatibility
code, not additional spine leaves.

The 2026-08-04 Rigid221 lattice audit also rules out a tempting but circular
aggregation. From a banked source-heavy packet one can prove routinely that
`sourceRowInteriorCount = 2`; however, proving the source blocker is not `v`
before constructing that packet is equivalent to the live A3 terminal, and
proving `S.oppCap2.card = 5` from the packet is equivalent to eliminating the
live A6 large-cap arm. Packaging those two conclusions as a single “good
normal form” is therefore not an upstream producer and must not be counted as
progress. No existing theorem-bank result closes any of the 13 leaves. The
closest binder-matched banked result, the D1 two-apex deletion-pair producer,
still lacks a terminal consumer. The next Rigid221 theorem must add genuinely
new global cap/deletion information and dominate a checked dispatcher; it
cannot merely restate A3 and A6 positively.

The B1 local reduction is now present in the production module rather than
only in the scratch bank. `FrontierLiveClosure` exposes the source-clean
`b1_live_normalForm`, the exact two-point `b1_live_bisectorSet_eq_pair`, and
the conditional `b1_live_false_of_third_bisector_carrier`. These declarations
are standard-axiom-only and build-checked; they reduce the collision leaf to
the named global third-bisector producer but do not supply that producer or
close the terminal `sorry`.

### 13.1 Per-package ingress contracts

The following contracts are the minimum gate for calling a package run
production.  They are deliberately stated at the consumer boundary; a
certificate or finite `UNSAT` without the indicated lift remains diagnostic.

| Package | Scope and extracted object | Required producer/lift | Replay and named consumer |
|---|---|---|---|
| A-core | Universal A-core binders; finite blocker/cap incidence valuation with exact `0,...,24` values and a sound `GE25` overflow bucket | A general-cardinality coverage theorem using only overflow-safe predicates; no finite exact-cardinality truncation may be reintroduced | Exact certificate replay in the A-core adapter, followed by the six A terminal leaves |
| E1 | The eight retained-omission leaves; exact-15 archetype plus source-faithful selected-row/omission packet | A `Good` escape producer and a proved exact-15-to-arbitrary-cardinality lift | Authenticated exact-rational/Boolean replay, then the existing E terminal consumer for each arm |
| FreshThird/F-Γ | The live two-source collision-row packet retaining cap indices, blocker fiber, and source-row omission data | **Partial:** the current on-spine load-bearing ingress is `false_of_twoCapSources_freshOutsideFirstBlockerFiber`; common-radius and normalized residual routes are compatibility-only. **Required next:** a source-entitled terminal and universal lift for the outside-first packet | Source-faithful certificate replay plus the on-spine `false_of_twoCapSources_freshOutsideFirstBlockerFiber` consumer |
| B1 | Live B1 binders after `b1_live_normalForm`; finite B1-gap incidence/bisector abstraction | A global shell/cap/no-`(m,4,4)` producer yielding the third-bisector contradiction, with a lift back to the live binders | Replay `census/frontier-packages/b_core/out/manifest.json`: verified SAT `B1-direct-shadow` plus the three DRAT-verified pin runs; then feed the existing `false_of_twoDistinctExactFourMutualOmissionJointDeletions_blockerCollision` consumer |

The historical F-Γ table count of two declarations is not a closure count;
the recorded snapshot lists two FreshThird leaves on the publish spine; the
normalized, first-non-hit, and first-fiber declarations are
off-spine compatibility code.

## 13.2 B1 producer route (2026-08-04)

The B1 local seam is now source-clean and should be treated as a reduction,
not as the missing global theorem.  In particular,
`b1_live_normalForm`, `b1_live_bisectorSet_eq_pair`, and
`b1_live_false_of_third_bisector_carrier` prove that a live blocker collision
would be contradicted by a carrier point `c` satisfying

```text
c ∈ D.A ∧ c ≠ common_actual_blocker ∧ c ≠ S.oppApex2 ∧
dist c first.deleted.1 = dist c second.deleted.1.
```

The stronger, equivalent search target is that the relevant deleted-source
bisector fiber has at least three carrier points.  The existing `hfive`
hypothesis is not such a producer: five points in one physical radius class
need not lie on this bisector.  Consequently, a bounded B1 `UNSAT`, or a
conditional theorem that assumes the third point, remains diagnostic until a
universal lift is proved.

The first producer-side geometric constraint is now landed and build-checked:
`b1_physicalClass_secondCapInterior_card_ge_three` derives at least three
strict second-cap members from `hfive` using the general ordered-cap
`card - 2` bound.  This is a genuine source-level narrowing, but it does not
yet produce a point omitted from both live rows: each row can still cover two
of the three interior members.  The companion
`b1_common_blocker_mem_secondCapInterior_of_bisectorSet_eq_pair` adapter, and
its B1 wrapper
`b1_live_common_blocker_mem_secondCapInterior_of_deleted_sources_interior`,
show that two interior deleted sources would force the common blocker into the
same strict cap.  They intentionally take the saturated fiber equality as an
explicit hypothesis, so neither adapter hides the remaining producer gap.

The B-core diagnostic now carries that boundary as an authenticated
`census/frontier-packages/b_core/producer_contract.json`, copied into its
manifest.  The contract names the live ingress and consumer, the three
acceptable global-gap output interfaces, the exact bisector-fiber query
(`card ≥ 3`, equivalently a new point outside the saturated two-point fiber),
and the required universal lift.  It is intentionally `PARKED-SPEC` with
promotion disabled until a source-level
producer and lift are present; this prevents a stronger-looking named-local
CNF from being mistaken for B1 closure.

The closest source-clean global result is
`ATailTwoCollisionGlobalProducer.exists_capSource_thirdCanonicalRow_omits_each_collisionPair`.
It consumes a `RetainedInteriorBlockerCollision`, full deletion robustness,
disjoint source pairs, and a cap of size at least eight, and produces a
cap-source/cross-survival packet.  That packet is not itself a B1 bisector
point.  The current F3c coordinator and its downstream leaves are still
`sorry`-backed, so they are not admissible terminal consumers for this route.

The first adapter audit is now complete and is negative.  The B1 packet cannot
be coerced into `RetainedInteriorBlockerCollision`: that structure is a
first-apex-radius object and requires a positive double-deletion witness and a
common-deletion packet for `S.oppApex1`, whereas B1 supplies second-apex
late-row deletions and a blocker equality for `lateFirstApexSystem R`.  The
first-apex exact-four residual also says that every first-apex class member
individually blocks, so the required positive double-deletion witness is in
the wrong direction.  The theorem banks contain no bridge repairing these
missing fields.  This route is retired rather than silently treating the two
packet types as equal.

The next implementation slice is now build-checked.  The initial attempted
trichotomy was marked `PARKED-SPEC` after the focused build exposed an invalid
row identification: rows belonging to the two deleted sources cannot be used
as the original `u`/`v` rows required by the prescribed joint-deletion
constructor.  The active source-faithful theorem
`b1_live_interior_joint_deletion_or_small_cover` instead proves the exact
three-way split:

1. both deleted sources are strict second-cap interior points;
2. an interior point outside the two deleted points and both live rows yields
   a new `ExactFourMutualOmissionJointDeletion` packet; or
3. the whole strict-cap interior slice is covered by those two deleted points
   and the two live rows.

This is a genuine producer-facing reduction, but not closure: the third
branch is the remaining finite-set/global-terminal obligation, and the first
branch still needs the existing bisector saturation consumer.

The next source-clean refinement is now also installed as
`b1_live_interior_deleted_or_third_or_live_source_interior`.  It preserves the
third-point branch and adds the following exact alternative: if the cover
branch has neither deleted source in the strict cap, then one of the original
live sources `u` or `v` is in that cap.  The proof uses the existing
`criticalFourShell_inter_selectedClass_card_le_two` kernel twice.  Each live
row contains its own source, so under the contrary assumption that both live
sources are exterior, each row covers at most one point of the strict-cap
slice; the two rows therefore cover at most two points, contradicting the
source-clean lower bound of three.  This is still producer progress, not a
terminal contradiction: the live-source-interior arm needs a new global
consumer or a further cap/minimality refinement.

The immediate work order is therefore:

1. Target an explicit `B1GlobalGapOrClosedTerminal` producer directly from
   the B1 binders and global shell/cap/minimality/no-`(m,4,4)` data: either
   produce the third bisector point (or the stronger fiber-card bound), or
   land in a separately kernel-closed global terminal.
2. Resolve the remaining interior-source subgap: consume the new
   `u`-or-`v`-strict-cap arm with a global theorem, or strengthen the same
   row-count argument to force two interior deleted sources / a terminal.
3. Use the existing cap-source theorem only as a conjecture generator or
   diagnostic comparison; its cap-source/cross-survival output is not a B1
   consumer.
4. Keep exploratory versions marked `PARKED-SPEC` until a proved producer and
   its universal lift exist.  The first finite search should add only
   source-proved global constraints, and must report SAT/UNKNOWN as negative
   evidence rather than closure.
5. Wire a successful third-point branch directly to
   `b1_live_false_of_third_bisector_carrier` (or the new fiber-card consumer);
   promote only with the same-change consumer, build, and axiom audit.

The source-faithful ingress for the remaining interior-source arm is now
factored as
`exists_exactFourMutualOmissionSourceContext_of_fivePointInteriorSource`.
Given a strict second-cap source, its outside-first-apex-fiber witness, and
the surviving `q`/`w` deletion, this producer composes the existing
five-point row bound, omitted interior peer, mutually omitted pair, blocker
separation, and joint-deletion constructor into a full
`ExactFourMutualOmissionSourceContext` and an
`ExactFourMutualOmissionJointDeletion`.  It is reusable ingress for the
Rigid221 route, not a B1 closure: the B1 cover branch still does not identify
its particular live `u` or `v` with this source, and the downstream coordinator
still reaches sorry-backed terminal leaves.  The next producer task is to
bridge that identification (or produce the missing outside/survival fields)
from the B1 live-source-interior arm.

The named-source refinement is now also build-checked and axiom-audited as
`b1_live_both_interior_outside_or_firstApexClass_split`.  For two distinct
live sources in the strict second-cap interior it proves one of three exact
outcomes: both sources are outside the first-apex fiber and one has the
required physical deletion-survival witness; one source is outside and the
other is in the first-apex class; or the symmetric cross case.  The proof
uses the public first-apex marginal-cardinality and bad-outside-pair
cardinality consumers, so it is a genuine source-level producer.  It still
does not close B1: the two cross cases need a global consumer, and the
survival disjunct must be connected to the existing exact-four coordinator.

#### Concrete B1 escape producer (2026-08-05)

The next non-circular producer is now source-clean and build-checked:
`b1_live_exists_third_interior_escape`.  Under the complete B1
mutual-omission/blocker-collision binders, it uses the general ordered-cap
`card - 2` bound and the already-proved B1 row normal form to produce a point
`t` in the strict second-cap interior with all of the following properties:

1. `t` is distinct from both deleted sources;
2. `t` is outside the first deleted source's saturated common selected row;
3. deleting `t` preserves four points at the common blocker; and
4. the actual blocker selected at `t` is different from the common blocker.

This is the first B1 producer that changes the live geometric packet rather
than merely restating a conditional bisector consumer.  The focused module
build and targeted `#print axioms` audit report only `propext`,
`Classical.choice`, and `Quot.sound` for this theorem.  It still does **not**
produce a third point on the deleted-source bisector, so it cannot feed
`b1_live_false_of_third_bisector_carrier` or the fiber-card consumer directly.
The next exact target is a source-level theorem consuming this escaped point
and its different actual blocker—by a blocker-multiplicity, row-cap, or
no-`(m,4,4)` argument—and then a universal lift for the resulting terminal.
The B-core contract records this theorem as a partial producer while keeping
`producer_theorem` and `lift_theorem` unset; its status remains
`PARKED-SPEC / promotion_eligible = false`.

#### B1 escape consumer packet (2026-08-05)

The escaped point is now connected to an existing source-clean shell
consumer.  `b1_live_escape_small_overlap` composes the third-interior escape
with `selected_support_inter_card_le_two_of_not_mem_other_selected_support`
and returns the escaped point's selected-shell intersection with the first
deleted source's selected shell as a cardinality-at-most-two packet.  The
packet also preserves the different-center and deletion-survival facts, so it
is the correct input for a future global blocker-multiplicity, row-cap, or
no-`(m,4,4)` producer.

`b1_live_false_of_escape_overlap_ge_three` is the corresponding conditional
terminal adapter: a source-level theorem supplying a universal overlap lower
bound of three for every admissible escaped point would contradict the packet
immediately.  That lower bound is not currently source-entailed.  The latest
audit instead leaves the equal-center/same-support and distinct-center/
at-most-two alternatives as the exhaustive source dichotomy.  Accordingly,
these declarations are a source-clean consumer packet and a conditional
terminal, not B1 closure; the B-core contract keeps `producer_theorem` and
`lift_theorem` unset and remains non-promotable.

#### Exact-four pinned-multiplicity arm (2026-08-05)

The first concrete producer arm for the escaped-blocker route is now
source-clean.  The new generic theorem
`pinnedMultiplicity_eq_four_of_isUniqueFourCenter` proves that a unique-four
centre has pinned multiplicity exactly four.  The existing
`selectedClass_eq_support_of_pinnedMultiplicity_eq_four` then identifies the
selected four-point support with the entire physical radius class at its
selected radius.  The B1-specific adapter in `B1Live.lean` applies these
facts to `centerAt` and feeds the resulting physical-class statement to the
existing overlap consumer.  All three declarations are kernel-checked with
no `sorryAx`.

The generic multiplicity producer belongs in `JointDeletionCore`, while the
`centerAt` adapter belongs in `B1Live`; this respects the sharded import graph
without changing the frozen umbrella or shard order.  The result is a
source-clean `μ = 4` normalization arm, not a new universal B1 closure.  It
does not yet transport the escaped blocker to a third carrier on the
deleted-source bisector, produce the existing fiber-card contradiction, or
prove the universal lift needed for B1 closure.  The next producer target is
therefore the global centre-transport branch: reanchor the escaped physical
class and its overlap packet to an existing third-bisector or fiber-card
consumer, or derive a source-level contradiction from that packet.  The
B-core producer and lift fields remain unset.

Status: the local reduction, fiber-card consumer, three-point strict-cap
constraint, row-count refinement, cap-localization adapters (including the
full live-binder wrapper that discharges bisector saturation internally), and
the source-faithful five-point ingress producer are **PROVEN**; the cap-source
adapter is **DISPROVED AS AN INTERFACE**; the direct global producer and the
bridge from the B1 live source to the reusable ingress are **CONJECTURED**;
finite B1 searches are **DIAGNOSTIC**.  The next exact target is the global
centre-transport producer: reanchor the escaped physical class and its
at-most-two overlap packet to the live-source-interior consumer inside
`B1GlobalGapOrClosedTerminal` (or to the existing fiber-card/third-bisector
consumer), with the reusable ingress fields made explicit.  The
`μ ≥ 5` label is no longer a free numerical branch for `centerAt`: the
source-clean `isUniqueFourCenter_centerAt` theorem applies to every admissible
`centerAt t`, and the new producer reduces that centre to `μ = 4`.  The
remaining issue is transport, not an unbounded choice of centre multiplicity.
The universal lift remains a separate required step.

#### B1 μ≥5/centre-transport implementation slice (2026-08-05)

The FrontierLiveClosure sharding gate is complete at `9feb86f6`, so the B1
route is now extended in `FrontierLiveClosure/B1Live.lean` without editing the
frozen umbrella or changing shard order.  This implementation slice is
complete and build-checked.  It adds:

* `pinnedMultiplicity_eq_four_of_isUniqueFourCenter` in
  `JointDeletionCore.lean`;
* `b1_live_canonical_blocker_pinnedMultiplicity_eq_four`, which applies the
  producer to every admissible `centerAt t`; and
* `b1_live_escape_physicalClass_inter_firstShell_card_le_two`, which rewrites
  the escaped selected shell as its full physical radius class and reuses the
  existing overlap consumer.

`lake-build Erdos9796Proof.P97.ATail.FrontierLiveClosure.B1Live` passes, and
targeted axiom audits of all three declarations report only the core axioms
`propext`, `Classical.choice`, and `Quot.sound`.  No new `sorry` was added and
no current B1 sorry is closed by this slice.  Since
`isUniqueFourCenter_centerAt` already applies to every admissible `centerAt t`,
the apparent `μ ≥ 5` alternative is not a free numerical branch at that
centre; the unresolved part of the route is the global centre transport.

The next mathematical producer is a theorem that turns the escaped physical
class and its at-most-two overlap packet into either a third deleted-source
bisector carrier, the existing fiber-card contradiction, or a separately
kernel-closed global terminal.  The universal lift remains a separate
required step, so this slice is **PRODUCER INFRASTRUCTURE / NON-PROMOTABLE**
rather than B1 closure.

## 13.3 FreshThird double-erasure and endpoint-consumer audit (2026-08-05)

The FreshThird global-route audit is now complete. The equal-center packet
does have a source-clean endpoint consequence:
`allCollisionEndpointsOmitted_of_equalCenterHits` proves that every collision
endpoint is omitted from both exact-four rows. This is only an omission
packet, however; no source-clean FreshThird consumer currently accepts it.
The available endpoint-omission terminals and the first-fiber descent route
remain `sorryAx`-dependent, so they cannot be promoted as closure.

The final theorem-bank audit found no import-reachable exception. The nearest
source-clean candidates are still insufficient: `false_of_freshThird_sameCapCrossRowAlignment`
requires both Q sources outside one common cap, `false_of_freshThirdEqualCenter_sameCapOppIndex`
handles only the canonical `oppIndex1` cap, and
`false_of_two_freshThirdCrossRowHits_distinctCenters` requires unequal source
centers. The outside-pair/Kalmanson candidates additionally require common-cap
boundary-order data that the live packet does not carry. External RVOL and
legacy candidates are either schema-incompatible or unreachable from the
publish spine.

The double-erasure machinery does not repair that gap. A
`CrossPairDeletionView` supplies one disjunctive survival fact for one pair,
while `selectedFourClass_survives_double_erase_of_not_mem` is useful only after
both erased points are already known to lie outside the selected support. The
double-erasure machinery still does not produce a
`SurvivorPairRelocationPacket`, and no complete `oppIndex1` transport has
landed. An independent source-level common-radius adapter is now recorded in
§13.5, but it handles only the negative retained-radii branch and one
equal-center/noncanonical same-cap arm. In particular, the same-cap
noncanonical arm still permits one Q source inside and one outside the cap,
and the distinct-cap arm has no source-clean order/Kalmanson consumer.

Accordingly the active anchor is
`false_of_twoCapSources_freshOutsideFirstBlockerFiber`; the normalized-remaining
route is off-spine compatibility code.  The next admissible FreshThird
milestone is to supply a source-entitled terminal and universal lift for the
outside-first packet, while retaining cross-blocker coincidence as the other
on-spine leaf, or choose one of these alternatives:

1. a terminal common-radius/reciprocal-incidence theorem covering the
   remaining normalized residual and retained-radii branches;
2. a genuine cyclic-order/Kalmanson consumer for the distinct-cap packet; or
3. a stronger double-deletion relocation theorem whose hypotheses are
   derivable from the live C/Q binders.

No new bounded-`n` search or wrapper should be called closure until it has an
explicit Lean ingress theorem, a universal lift, and a same-change on-spine
consumer. Current FreshThird computations remain **DIAGNOSTIC**. The
outside-first residual remains **OPEN / ON-SPINE / LOAD-BEARING**. The
normalized residual, first/second non-hit branches, and common-radius adapters
remain **OFF-SPINE / COMPATIBILITY-ONLY** for the current publish spine.

## 13.4 FreshThird relocation-packet field audit (2026-08-05)

The packet interfaces were checked field-by-field before attempting another
adapter. `CommonDeletionTwoCenterPacket` requires one fixed deleted point
`q`, two distinct carrier centers, deletion survival at both centers, the two
exact q-deleted rows, and the associated blocker inequalities. The active
FreshThird surface supplies neither a common deleted point nor deletion
survival at the two cap-source centers. Its two `CrossPairDeletionView`s
instead say only that each collision pair has one selected-support omission at
a given cap-source row; the equivalence is a per-pair disjunction, not a
double-deletion or common-q witness. Moreover, distinct C source vertices do
not imply distinct `H.centerAt` values, so the center-separation field is also
not derivable from `C.sources_ne`.

`SurvivorPairRelocationPacket` is even more specific: its two fresh points
must lie on one `S.oppApex1` radius outside the surplus cap, both deletions
must survive at `S.oppApex2`, and their actual blockers must avoid that apex.
The live `FreshThirdBlockerFiber` gives fresh points with equal blocker values
and mutual selected-row incidence, but no common `S.oppApex1` radius,
first-apex marginal membership, or `S.oppApex2` deletion-survival facts.
Consequently there is no source-clean C/Q-to-relocation adapter to land.

The next producer must explicitly construct one of the following interfaces:

* a fixed-q two-center packet, with survival at both cap-source centers and
  a proof that the two independent omission disjunctions select the same q,
  center separation, and a consumer of its exact-row overlap;
* a common-radius relocation packet supplying the two `S.oppApex2` survivors;
  or
* a new mixed theorem that consumes the existing pairwise omission views
  directly and proves the normalized compatibility residual contradiction.

Adding a coercion, wrapper, or `Nonempty` shell without those fields would be
bookkeeping only and would preserve the same `sorryAx` dependency. This
field audit still rules out the relocation route, but the alternate
common-radius ingress is now recorded in §13.5. This dated audit is retained as
historical compatibility analysis; the current status is **OPEN / ON-SPINE /
load-bearing** only for the outside-first blocker-fiber leaf, while this
relocation/common-radius route is off-spine compatibility work.

## 13.5 FreshThird common-radius ingress (2026-08-05, implementation checkpoint)

The common-radius producer is now explicit and source-clean. The existing
theorem
`exists_two_capSources_thirdBlocker_crossPairDeletionSurvivals_of_commonRadius`
in `TwoCollisionGlobalProducer.lean` supplies two distinct cap-interior
sources whenever there is a radius `r` such that

```
2 ≤ (SelectedClass D.A S.oppApex1 r ∩
      S.capInteriorByIndex S.oppIndex1).card
```

and `r` differs from both retained collision radii. The new adapter
`exists_commonRadius_twoCapSourceThirdCanonicalRowSurface_of_not_retained`
extracts exactly that premise from failure of
`FirstCapMultiPointRadiiRetained` and retains the two source rows together
with their `r`-membership. The equal-center/noncanonical same-cap consumer
`false_of_commonRadius_equalCenters_noncanonicalSameCap` is also source-clean.

This is a genuine producer ingress, but not yet closure. The coordinator has
now been refactored so that the common-radius provenance is not discarded:

* `false_of_twoCapSources_freshThirdBlockerFiber` splits on
  `FirstCapMultiPointRadiiRetained` before normalization;
* the negative branch carries the strengthened packet through
  `false_of_twoCapSources_freshThirdBlockerFiber_on_commonRadius_surface` and
  `false_of_twoCapSources_freshThirdBlockerFiber_core_commonRadius`;
* `FreshThirdTwoCapSourceObstruction.freshThirdNormalizedResidualRemainingCase_of_residual`
  performs the exhaustive residual-to-remaining conversion; and
* `false_of_twoCapSources_freshThirdBlockerFiber_normalized_remaining_commonRadius`
  sends the equal-center/noncanonical same-cap arms to the source-clean
  `false_of_commonRadius_equalCenters_noncanonicalSameCap_packet` consumer.

The remaining arms deliberately stay explicit: first/second non-hit cases,
distinct/non-distinct-cap cases without the common-radius consumer, and the
retained-radii branch remain compatibility-route analysis.  Thus the
implementation is a source-clean producer adapter, but it does not alter the
current on-spine outside-first target or provide closure.

The next implementation slice is therefore concrete:

1. prove a terminal for the on-spine outside-first residual (or a single
   stronger producer that covers it);
2. either obtain an independent producer for the retained-radii branch or
   prove that the retained branch is already covered by the same global
   incidence argument; and
3. retain the common-radius packet and its consumer as compatibility code; it
   does not enter the current proof-blueprint spine unless a future refresh
   shows a direct consumer edge.

Until the outside-first arm reaches a proved terminal, this adapter receives
producer and compatibility credit only. It must not be counted as closure or
as evidence that the two on-spine FreshThird obligations have been reduced to
a finite search.

## 13.6 FreshThird producer construction (2026-08-05, no-search handoff; historical compatibility route)

This dated construction sheet is retained for its source contracts and
negative diagnostics.  The normalized coordinator discussed below is
off-spine compatibility code in the current proof-blueprint graph; the active
load-bearing FreshThird ingress is the outside-first blocker-fiber theorem.

The missing producer is not an import or a theorem-bank lookup.  It is a new
cap-wide transport theorem.  Its exact contract is now fixed before any
further computation:

```text
C : TwoCapSourceThirdCanonicalRowSurface P Pρ
Q : FreshThirdBlockerFiber P Pρ
firstInteraction : FreshThirdCapSourceInteraction P Pρ C.firstSource Q
secondInteraction : FreshThirdCapSourceInteraction P Pρ C.secondSource Q
crossRowResidual : FreshThirdCrossRowResidual P Pρ C.firstSource C.secondSource Q
```

The historical producer was intended to run before
`FreshThirdNormalizedResidualRemainingCase` was constructed and to return one
of the following *actually consumable*
interfaces:

1. the hypotheses of `FreshThirdSameCapCrossRowAlignment`, consumed by
   `false_of_freshThird_sameCapCrossRowAlignment` (the two non-hit adapters
   are now source-clean); or
2. two `FreshThirdCrossRowHit` packets together with unequal source centers,
   consumed by `false_of_two_freshThirdCrossRowHits_distinctCenters`; or
3. a common-radius packet whose equal-center interaction has a noncanonical
   source cap, consumed by
   `false_of_commonRadius_equalCenters_noncanonicalSameCap_packet`.

The fixed-`q` two-center deletion packet is still a useful *diagnostic
producer*, but it has no source-clean FreshThird terminal.  It cannot be
counted as a closure interface until a new downstream theorem consumes it.

The construction is deliberately staged.  The two source-clean antecedents
are already landed and axiom-audited: a surviving source-row omission gives
blocker-center separation via
`freshThirdCapSourceNonHit_center_ne_of_sourceRowOmission`, and the retained
radii branch gives a double-deletion/minimal-core packet via
`exists_freshThird_retained_minimalDeletionCoreProducer`.  The only new
mathematical bridge is the cap-wide transport step.  The polarity matters:
`FreshThirdSameCapCrossRowAlignment` is a consumer, not an output that can be
derived from a normalized non-hit.  Its two endpoint-membership fields
directly contradict `sourceRowOmission`.

The first concrete slice of that transport step is now landed.  The
source-clean theorem `false_or_freshCap_ne_opp_of_commonRadius_distinctCaps`
proves, for a distinct-cap common-radius interaction, the exact disjunction

```text
False ∨
  (sourceCap = S.oppIndex1 ∧ freshCap ≠ S.oppIndex1 ∧
   Q.source₁.1 ∉ S.capByIndex S.oppIndex1 ∧
   Q.source₂.1 ∉ S.capByIndex S.oppIndex1).
```

It is compiled on Lean 4.27 and is now destructured at the compatibility
residual
instead of being erased by a constructor replay.  The second concrete slice,
`freshThird_commonRadius_distinctCaps_dual_packet`, transports the same split
through the equal-center second row: both source-cap indices are canonical,
both fresh-cap indices are noncanonical, the indices agree across rows, and
both fresh endpoints are outside the canonical cap.  That dual packet is now
wired into the equal-center residual branch.  These are producer boundaries;
they do not close the residual by themselves.  The next proof must consume
the resulting canonical-source/different-fresh-cap packet.  A theorem-bank
search is no longer an acceptable next step: either prove a canonical-row
transport lemma for that packet, or add the missing cyclic-order/incidence
hypothesis and consume it with an existing Kalmanson/shared-pair terminal.  A
bounded solver run may only distinguish those two contracts; it cannot be
promoted as the producer.

The cyclic-order slice is now also source-clean:
`freshThird_canonicalSource_differentFreshCap_sharedPairCyclicPacket` builds a
whole-carrier `BoundaryIndexing` and returns the shared-pair alternation,
together with the canonical source-cap, different fresh-cap, cap-interior,
and two outside-canonical-cap facts.  The audit of existing consumers is
decisive here: `CapCrossingKalmanson` requires a strict four-index chain, while
the packet supplies only the alternating order
`btw(sourceCenter, freshCenter, q1) ↔ ¬btw(sourceCenter, freshCenter, q2)`.
That alternating four-point pattern is realizable, so it cannot be promoted
as a contradiction or repaired by another wrapper.

The first construction step is now source-clean and compiled on Lean 4.27:
`freshThird_canonicalDifferentCap_endpointPlacement`.  Given the distinct
source/fresh centers and the dual source-row support packet, it returns the
whole-carrier boundary indices, the exact four-way placement of the two
endpoints (one between the centers and the other outside), and membership of
both endpoints in both shell supports.  This is a genuine producer with no
fixed-`n` or cardinality bound.  It is not closure: the remaining task is to
consume this placement/support packet with a strict Kalmanson chain, a
third-shell/reciprocal-incidence packet, or an existing outside-overlap
terminal, and then wire that consumer into the compatibility residual.

The next producer is therefore one explicit source theorem, not another
search campaign.  Its contract is:

```text
canonical source center in S.oppIndex1,
fresh center in a different cap,
q1 and q2 outside S.oppIndex1,
equal source centers, and the shared-pair alternation
  ==> either
      (a) a strict cap/Kalmanson index chain accepted by an existing terminal,
      or
      (b) a five/six-point placement carrying a third shell equality or
          reciprocal-incidence packet accepted by a new metric terminal.
```

The proof should consume the anchored cap order from the `SurplusCapPacket`
interval lemmas and the full source-row/deletion hypotheses.  If the cap
partition cannot supply (a), the theorem must construct (b); proving only the
alternation, or enumerating fixed `n`, is insufficient.  Until this one bridge
is proved and called by the compatibility residual, that route-local sorry
remains open; the current load-bearing spine gap is the outside-first
blocker-fiber ingress, and the packet theorems are source-clean producers only.

The staged proof is:

* split the three `Fin 3` cap placements of the C and Q centers;
* use the source-clean alignment adapters for the same-cap placement;
* use `false_of_two_freshThirdCrossRowHits_distinctCenters` for the two-hit,
  unequal-center placement;
* transport retained survival to the common-radius consumer where its
  hypotheses are available; and
* isolate the only placement not covered by those consumers: the C source
  center lies in `S.oppIndex1` while the Q blocker center lies in a different
  cap.  The source-clean dual packet now supplies the complete two-row
  incidence interface for that placement.  The remaining concrete target is
  its consumer: a canonical-row transport lemma, a cyclic-order/shared-pair
  adapter, or a new cap-wide separator proved from the full source-row,
  cap-cardinality, deletion, and no-`(m,4,4)` data.

This is a finite `Fin 3` cap-index/cardinality argument, not a larger fixed-`n`
enumeration.  A solver run is admissible only as a conjecture check for the
alignment lemma; its result is diagnostic until a general Lean proof and an
on-spine consumer land in the same change.  If the alignment lemma is false,
the countermodel must be used to formulate the stronger order/incidence
alternative, rather than restarting an unconstrained search.  Until that
consumer bridge is proved, the normalized-residual compatibility route remains
genuinely open; the two source-clean packets above are producers, not closure
of the current outside-first spine.

## 13.7 FreshThird producer decision gate (2026-08-05)

The unbounded theorem-bank search is now **RETIRED-AS-WORKSTREAM**, and the
fixed-`n` producer search is **DIAGNOSTIC-ONLY**.  The bounded exact-rational
probe for the obvious one-sided implication was satisfiable in both non-hit
orientations: a `FreshThirdCapSourceNonHit` can coexist with the other
interaction without yielding either `FreshThirdSameCapCrossRowAlignment` or a
cross-row hit.  This
is a negative result about that proposed producer, not evidence against the
live theorem.

At this checkpoint, two source-faithful bridge families were prioritized:

1. **Retained-arm transport.**  The retained deletion packet supplies omitted
   endpoints `x` and `y` on the two distinct collision radii.  Consequently it
   cannot be passed directly to the existing
   `RetainedRadiusBlockerMatching` / `RetainedInteriorDirectedOmission`
   producer, whose interface is same-radius.  A new source-clean theorem must
   transport the cross-radius packet to same-radius blocker matching, or return
   one of the existing FreshThird consumers (a cross-row hit or same-cap
   alignment) directly.
2. **Equal-center/different-cap bridge.**  The landed dual packet and endpoint
   placement give a canonical source cap, a different fresh cap, two endpoints
   outside the canonical cap, and shared-pair alternation.  Alternation alone
   is realizable and is not a Kalmanson contradiction.  The missing theorem
   must add a strict consumer-ready boundary chain or produce a third-shell /
   reciprocal-incidence packet from full K4, deletion minimality, cap
   cardinality, and no-`(m,4,4)`.

These bridge families remain admissible, but they are not exhaustive;
Sections 13.10 and 13.12 record the broader four-arm consumer ingress and the
retained-producer split.  The immediate implementation target at this
checkpoint was a single source theorem for one of these bridges, followed by
its on-spine consumer.  No new wrapper, bounded certificate, or larger
fixed-`n` census counts as producer progress until it supplies that theorem
and the target's transitive axiom audit is free of `sorryAx`.

### 13.8 Triple-shell escape extraction checkpoint (2026-08-05)

The first construction step is now source-clean and importable.  The former
escape proof lived in the downstream retained-core shard, which cannot be
imported by `TwoSourceFreshThirdResidual` because that path would cycle through
`TwoSourceClosure` and `TwoSourceFirstFiberCollision`.  The proof pattern was
therefore extracted upstream into
`ATail/FrontierLiveClosure/TwoSourceTripleShellEscape.lean`.

Its producer is
`exists_freshThird_selectedRow_escape_tripleShellSeed`.  Given both retained
collision packets and any third carrier source, it forms the union of their
three exact four-shell supports (cardinality at most 12), uses the live
`|D.A| ≥ 14` branch to prove that seed proper, and applies global K4 plus
deletion minimality to obtain a selected row centered in the seed with a point
outside it.  The module and the importing FreshThird residual both compile on
Lean 4.27.  This is a genuine source-level producer, but it is not a
contradiction and does not yet close the anchor.

The next implementation slice is sharply delimited: preserve the escaped
row's center, selected support, and outside point, then prove a bridge to one
of the existing FreshThird consumers.  The bridge must either (i) show that
the escaped row contains both `Q.source₁` and `Q.source₂`, yielding a new
cross-row hit, (ii) derive the cap-wide alignment packet, or (iii) produce the
strict Kalmanson/third-incidence data for the canonical-source/different-
fresh-cap arm.  Merely invoking the escape producer, adding another wrapper,
or recording the outside point as an unconsumed packet is not closure.

### 13.9 Source-faithful escape-cover producer (2026-08-05)

The first bridge-adjacent producer is now landed in
`ATail/FrontierLiveClosure/TwoSourceFreshThirdResidual.lean` as
`exists_freshThird_escape_with_sourceFaithful_cover`.  It consumes the
triple-shell escape row and returns, in one source-level packet:

* its center and selected four-point support;
* an outside point `z` with a source witness `z ∈ D.A`;
* localization of `z` to one of the three cap interiors;
* the inherited blocker fact `¬ HasNEquidistantPointsAt 4 (D.A.erase z) ...`;
* either exact center equality with `H.centerAt z` and shell-support equality,
  or distinct centers with selected-support overlap at most two.

The theorem compiles directly on Lean 4.27 and is intentionally upstream of
the downstream retained-core shards, so it does not introduce an import cycle.
It is a source-clean intermediate producer, not a complete consumer-ready
producer or closure.  Before terminal ingress, a strengthening must identify
the named seed label and prove the corresponding endpoints in `K.support`.
Those facts may then feed the existing two-hit consumer; otherwise the route
must prove the cap-wide alignment or strict boundary-chain alternative from
the same packet and the full source-row/deletion hypotheses.  Do not widen the
seed, add another wrapper, or launch a fixed-cardinality census without first
proving that endpoint-support strengthening and its consumer hypotheses.

The trust audit is complete: both this theorem and
`exists_freshThird_selectedRow_escape_tripleShellSeed` report exactly
`[propext, Classical.choice, Quot.sound]` under `#print axioms`; neither
depends on the normalized residual's `sorryAx`.  The normalized-remaining
declaration is now an off-spine compatibility route; the current producer
dependency closure instead terminates at the open
`false_of_twoCapSources_freshOutsideFirstBlockerFiber` ingress.  This separates
the checked anonymous escape-cover packet from the still-missing named
seed-label transport, endpoint-support facts, and consumer ingress.

An audit of the consumer interface makes the next strengthening precise:
the existential `center ∈ seed` and an anonymous escaped `K` are not enough
to instantiate a FreshThird hit.  The next producer must retain a named seed
label (one of the two collision shells or the chosen cap-source shell) and
prove the corresponding endpoint memberships in `K.support`, together with
the escaped point.  If those memberships cannot be proved, the packet must
instead return the strict boundary/order alternative explicitly.  Choosing
`source := Q.source₁` does not supply this: seed membership is only a Finset
union membership, not equality with that source center.  This is the concrete
reason the old search loop could not close the leaf.  These fields are the
immediate strengthening target for this anonymous packet, not a claim that
the later route inventory has only one construction arm.

## 13.10 Producer construction route after the exact-incidence audit (2026-08-05; historical compatibility route)

This dated four-arm construction route is retained as historical source-contract
analysis.  Its normalized-residual consumer is off-spine in the current
proof-blueprint graph; the active load-bearing FreshThird route is the
outside-first blocker-fiber ingress.  The producer was no longer a theorem-bank
search target at that checkpoint, and the source packets established the input
boundary before
`FreshThirdNormalizedResidualRemainingCase` is formed, with

```text
C : TwoCapSourceThirdCanonicalRowSurface P Pρ
Q : FreshThirdBlockerFiber P Pρ
firstInteraction, secondInteraction
  : FreshThirdCapSourceInteraction at C.firstSource/C.secondSource
cross-row residual data and all deletion/blocker witnesses
```

The output is a source-clean, immediately consumed disjunction:

1. a `FreshThirdSameCapCrossRowAlignment` packet;
2. two `FreshThirdCrossRowHit` packets with unequal source centers;
3. a transported `CommonRadiusTwoCapSourceThirdCanonicalRowSurface` with the
   hypotheses of the existing common-radius terminal; or
4. on the exceptional canonical-source/different-fresh-cap arm, a named
   strict metric chain accepted by an existing Kalmanson consumer, or a
   named third-shell/reciprocal-incidence packet accepted by a new proved
   metric terminal.

The fourth arm is the actual remaining producer.  Its input must retain the
canonical source cap, the different fresh cap, both endpoint memberships in
both shell rows, the exact two-point overlap, the endpoint placement, the
full source-row deletion-survival facts, blocker equality/inequality, and the
cap-cardinality/no-`(m,4,4)` hypotheses.  It must not replace these with an
anonymous escaped row or a fixed-cardinality abstraction.

Two proposed shortcuts are now ruled out by checked evidence.  The exact
incidence probe (`scratch/freshthird_exact_incidence_probe-20260805.out`)
enumerates 36 packet-compatible alternating orders and gives an explicit
alternating order in which the strict-late Kalmanson chain fails.  The exact
rational square witness

```text
c=(0,0), f=(2,0), q₁=(1,1), q₂=(1,-1)
```

has all four shared distances squared equal to 2 while the relevant
Kalmanson inequality is strict (`2√2 < 4`).  Thus endpoint alternation and
cyclic order cannot be the producer.  Separately, the common-radius audit
shows that the normalized residual carries no radius or selected-class
intersection data; a common-radius packet can enter only through an upstream
retained/non-retained split or a new transport theorem.  Calling the existing
common-radius closer from the residual would therefore be an invalid wrapper,
not a source-clean producer.

The bounded computation now has one permitted role: encode the complete
exceptional-arm ingress above and test one positive clause at a time (strict
metric chain, reciprocal-incidence edge, or third-shell equality).  A SAT
model discards that clause; an UNSAT result is only a certificate candidate.
Promotion requires an exact replay, a Lean proof that every arbitrary-size
ingress packet maps to the encoding (including overflow cases), and a
source-clean consumer wired to the compatibility residual in the same change.
No additional order-only search, fixed-`n` census, or theorem-bank lookup is
authorized as progress.  Until this fourth-arm producer and its consumer are
proved, the normalized-residual compatibility `sorry` remains open; the
current sole load-bearing FreshThird gap is the outside-first ingress;
the existing escape, endpoint, dual, and cyclic packets remain source-clean
producer boundaries only.

## 13.11 B1 global-transport consumer contract (2026-08-05)

The B1 centre-transport route now has a checked, source-level consumer
contract in `FrontierLiveClosure/B1Live.lean`.  The new
`B1GlobalTransportContext` packages the complete live B1 packet once, and
`B1GlobalGapOrClosedTerminal` is the exact disjunction that a future producer
must establish.  Its three arms are:

1. a point different from the common blocker and `S.oppApex2` on the bisector
   of the two deleted sources;
2. cardinality at least three for that bisector fiber; or
3. for every admissible escaped physical-class point, selected-shell overlap
   at least three with the first deleted-source shell.

`false_of_b1_global_gap_or_closed_terminal` feeds these arms to the existing
third-bisector, fiber-card, and escaped-overlap terminals.  The focused
`lake-build Erdos9796Proof.P97.ATail.FrontierLiveClosure.B1Live` build passes,
and a targeted `#print axioms` audit reports only `propext`,
`Classical.choice`, and `Quot.sound` for the consumer.  This is **PROVEN
CONSUMER INFRASTRUCTURE**, not B1 closure: the producer and its
arbitrary-cardinality lift remain unset.

The source audit is negative for the existing adapters.  The generic
three-hit machinery requires retained `oppApex1` collisions at distinct
radii; `SevenSourceCriticalShellDichotomy` supplies support/saturation data
but no bisector or blocker output; and the B1 fiber is already saturated at
the two-point set `{common blocker, S.oppApex2}`.  Therefore the next exact
mathematical target is a global minimality/cap-row/no-`(m,4,4)` producer of
the three-arm disjunction, followed by a universal lift.  No fixed-cardinality
solver run is a promotion step until that ingress contract is proved.

On 2026-08-06 this producer boundary was promoted from a parked contract to
the explicit load-bearing theorem
`b1_globalGapOrClosedTerminal_of_counterexample` in
`FrontierLiveClosure/TwoDeletionCollision.lean`.  The former negative leaf
`false_of_twoDistinctExactFourMutualOmissionJointDeletions_blockerCollision`
now only packages its live binders as `B1GlobalTransportContext` and applies
the checked three-arm consumer.  Coordinator-interface frontier before:
one `False`-valued blocker-collision `sorry`; after: one positive
`B1GlobalGapOrClosedTerminal` producer `sorry`, with the old theorem a checked
adapter.  This is a one-for-one obligation-shape refactor: it removes no
load-bearing `sorry`, proves no global producer, and does not close B1 or the
exact-12 robust branch.  Its value is that theorem mining and CEGAR now have
the exact promoted predicate they must establish instead of targeting an
opaque contradiction.  Focused verification of the importing
`TwoDeletionCollision` source passes directly under Lean 4.27.  A transitive
Lake rebuild remains deferred until the ongoing `Census554` import refactor
lands.

## 13.12 FreshThird retained-producer audit (2026-08-05)

**2026-08-08 update:** the broad consumer described below is now source-closed
through the downstream acyclic split in §13.24.  The remaining local
obligation is the strictly narrower `FreshThirdAcyclicHardResidual`; the old
request for a cap-wide alignment producer is retired rather than pending.

The retained-arm construction has now been extracted upstream, without an
import cycle, in
`ATail/FrontierLiveClosure/TwoSourceFreshThirdRetainedProducer.lean`.
Its source-clean top-level theorem,
`freshThird_acyclic_canonical_consumerPacket`, returns either a cross-radius
double-deletion witness with a `MinimalDeletionCore` at `S.oppApex1`, or a
`CommonRadiusTwoCapSourceThirdCanonicalRowSurface` packet.  The isolated
producer module and the importing residual both build under Lean 4.27; the
producer's transitive audit has no `sorryAx`.

This is a producer milestone, not closure.  The consumer audit found that
`MinimalDeletionCore` currently yields only cap-cardinality bounds, while the
existing Kalmanson/Five/Six consumers require a strict five- or six-point
chain, a third selected row, or both endpoints outside the two middle
centres.  The FreshThird packet has two rows and an alternating placement with
one endpoint between the centres.  The downstream retained-core consumer also
forms an import cycle and ultimately reaches the live target sorry.

The exact remaining work is therefore a new source-level bridge that either
transports the cross-radius deletion core to a same-radius retained consumer,
or derives a third-shell, reciprocal-incidence, or strict-order packet from
full K4, deletion minimality, cap cardinality, and the no-`(m,4,4)` hypothesis,
followed by an unconditional consumer wired to the outside-first on-spine
target.  Until that bridge exists, the outside-first sorry remains the
load-bearing FreshThird gap; normalized-residual and retained/common-radius
routes are compatibility-only.  Fixed-`n` searches, order-only adapters, and
wrappers are not promotion steps.

## 13.13 Direct FreshThird consumer audit (2026-08-06)

**2026-08-08 update:** the positive `FreshThirdSameCapCrossRowAlignment`
producer route below is historical.  Existing consumers prove that such an
alignment is itself impossible, so producing it under the non-hit premises is
logically equivalent to proving the whole residual by contradiction.  The
source-faithful replacement and current anchor are recorded in §13.24.

The final import-reachability audit confirms that the normalized-residual
route is compatibility-only rather than the current publish-spine anchor.
The exact branch obligations recorded here remain useful for that compatibility
route, but the active spine target is now the outside-first ingress:

* `firstNonHit` and `secondNonHit` can be consumed by
  `false_of_freshThird_firstNonHit_of_capWideAlignment` and its symmetric
  counterpart, but only after a new producer supplies
  `FreshThirdSameCapCrossRowAlignment`.  The existing
  `freshThirdCapSourceNonHit_center_ne_of_sourceRowOmission` supplies center
  separation for an omission and does not supply the cap placement or the two
  endpoint memberships required by that alignment packet.
* The equal-center same-cap/noncanonical arm is consumed only when an
  upstream `CommonRadiusTwoCapSourceThirdCanonicalRowSurface` supplies the
  selected-class/radius fields required by
  `false_of_commonRadius_equalCenters_noncanonicalSameCap_packet`.
* The equal-center distinct-cap arm is not closed by
  `false_or_freshCap_ne_opp_of_commonRadius_distinctCaps` or by
  `freshThird_commonRadius_distinctCaps_dual_packet`; both are producer
  disjunctions that retain an exceptional canonical-source/different-fresh-cap
  packet.  A new terminal must consume that packet, or transport it to an
  existing terminal with all its endpoint and deletion-survival data intact.

Consequently, the outside-first anchor remains genuinely open and on-spine.
The next mathematical change must prove a source-level cap-wide/third-incidence
bridge (with an arbitrary-cardinality lift) and wire it directly to
`false_of_twoCapSources_freshOutsideFirstBlockerFiber`.  No additional
theorem-bank search, fixed-`n` UNSAT result, or compatibility wrapper counts as
progress until it provides that consumer contract.

## 13.14 FreshThird local-route falsification (2026-08-06)

An exact-rational strictly convex octagon has now been constructed for the
apparently strongest local packet: the source and fresh rows are distinct
exact four-point classes of one common radius, their intersection is exactly
the two named points, both cross-row endpoint hits hold, and the fourth
`FreshThirdAlternatingEndpointPlacement` arm is realized.  Nevertheless the
third hit fails.  One coordinate realization uses

`s=(0,1)`, `f=(0,-1)`, `p=(-2,0)`, `q=(2,0)`,
`x±=(±82/61,-48/61)`, and `y±=(±82/61,48/61)`;

the source row is `{p,q,x-,x+}`, the fresh row is `{p,q,y-,y+}`, both have
radius squared `5`, while `dist(f,s)^2 = 4` and `s` is not in the fresh row.
The convex-order determinants are positive in exact rational arithmetic.

This is a **PROVED NEGATIVE DIAGNOSTIC**, not a counterexample to the full
Lean theorem: it omits the global deletion/minimality obligations.  It does
show that adding common-radius, exact-K4, overlap, cyclic-order, or endpoint
placement clauses alone cannot supply the missing producer.  The next
source-level target must therefore expose a genuinely global fact, such as a
no-four-point witness after erasing the relevant fresh source, or an
iterated-blocker equality `centerAt(s) = f` strong enough for
`CriticalShellSystem.source_mem_selectedFourClass` to force the missing point
into the fresh row.  Any computational campaign for this lane must include
that premise in its ingress contract; another local-order matrix is
diagnostic only.

## 13.15 FreshThird global-deletion ingress audit (2026-08-06)

Historical/off-spine compatibility audit: the normalized residual named in this
section is not the current publish-spine anchor.  Its source-interface lessons
remain useful, while the active load-bearing ingress is the outside-first
blocker-fiber theorem.

The existing deletion and selected-shell APIs were checked as the last
source-clean bridge for the normalized residual.  They do not provide the
missing premise:

* `ATailSurvivalCover.selectedSupports_eq_of_actualBlockers_eq` transports
  selected-shell support only after an equality of `centerAt` values for two
  known sources.
* `CriticalPairFrontier.cross_deletion_survives_iff_not_mem_selected_support`
  relates deletion survival to omission from the selected support at a
  source's own center; it does not turn a FreshThird source-row omission into
  a fresh-center obstruction.
* `CriticalShellSystem.source_mem_selectedFourClass` and
  `selectedFourClass_support_eq_shell` force membership only after a
  `SelectedFourClass` at the relevant center has already been supplied.
* The closest blocker-equality consumers in `AnchoredDoubleDeletionProducer`
  require a `SurvivorPairRelocationPacket`, double frontier-deletion
  hypotheses, and an explicit `hnotFour`; `FreshThirdBlockerFiber` has none of
  these fields.

The residual does have a source-clean escape theorem,
`exists_freshThird_escape_with_sourceFaithful_cover`, but its escaping point
is an unnamed `z` outside the triple seed.  It supplies a no-four deletion at
`centerAt z`, not the named `Q.source₁`/`Q.source₂` source-row omission and
endpoint transport needed by the FreshThird consumers.

Thus no type-correct global-deletion route currently exists from the active
`FreshThirdBlockerFiber`/source-row-omission packet.  The next producer must
prove, at arbitrary cardinality, either an iterated equality such as
`centerAt source = freshCenter` together with a selected-four-class witness,
or a direct no-four deletion obstruction that can be consumed by the existing
survival APIs.  Until that producer lands, the normalized-residual
compatibility route remains open; adding another wrapper, bounded certificate,
or local incidence matrix would not advance the current outside-first spine.

## 13.16 FreshThird source-faithful global-ingress CEGAR (2026-08-06)

Historical CEGAR/compatibility route: the finite ingress artifacts and source
lessons below are retained, but the normalized coordinator they analyze is
off-spine.  The current proof-blueprint spine has the outside-first
blocker-fiber theorem as the load-bearing FreshThird leaf.

The global-deletion proposal has now been tested at `n = 17`, profile
`(6,8,6)`, and at the first larger slack profile `n = 19`, `(6,10,6)`:

`scratch/retained-omission-e1/round5-general-cegar/n19_freshthird_global_ingress_probe.py`.

The earlier claim that cap exhaustion identifies the two leftover `n = 17`
indexed-cap slots with `Q.source₁,Q.source₂` was false.  Those source fields
are free existential carrier selectors; the literal Python labels `q1,q2`
name anonymous cap slots only.  The first `n = 19` artifact
`20260806T044857Z.json` is therefore **invalid and superseded**: besides
forcing Q into those two slots, it encoded blocker distinctness tautologically
and attached the residual interactions to the literal labels rather than the
dynamically selected C-source slots.

The repaired encoder keeps Q free, indexes each interaction by C-source slot,
uses genuine blocker inequality, and includes the center-in-cap-interior and
both-Q-source membership fields of the two geometric interaction constructors.
It also compares canonical-row centers to the apex points themselves rather
than to the apex vertices' blocker centers.

The query explicitly requires both C sources to avoid Q-source identity,
membership in the selected Q row, and blocker-center equality with Q.  Its
source-entitled refinements now include:

1. **global chosen-row closure:** from every carrier singleton, repeatedly
   adjoining the chosen K4 row at each reached center reaches the full carrier;
   this is a necessary finite consequence of
   `exists_center_all_selectedFourClass_escape_of_proper_subset`;
2. **two-circle intersection:** chosen exact four-classes at distinct carrier
   centers intersect in at most two points, matching
   `SelectedFourClass.inter_card_le_two`;
3. **center-cap row count:** whenever a chosen-row center lies in an indexed
   cap, its row hits that cap at most twice, matching
   `CapSelectedRowCounting.selectedFourClass_inter_capByIndex_card_le_two`.
4. **exact retained first-apex classes:** the P and Pρ radius classes each
   have exactly four carrier points, meet the indexed-cap interior in exactly
   their named endpoint pair, and have distinct radii.  These are the direct
   Boolean translations of `hfrontierFour`, `hρfour`,
   `hfrontierInteriorEq`, `hρInteriorEq`, and `hρne`;
5. **the source-level radius dichotomy:** the solver is run separately in the
   `aligned` branch, where every repeated first-apex radius in the indexed-cap
   interior is one of the retained radii, and the `common` branch, where the
   two selected C sources share a new first-apex radius distinct from both
   retained radii;
6. **retained mutual omissions and tri-apex exclusion:** the two localized
   common-deletion packets force `r1 ∉ row(p1)` and `p1 ∉ row(r1)`, and
   `T.no_center_covers_all_apices` forbids one radius class from covering all
   three apices;
7. **the aligned retained-deletion core:** one P endpoint and one Pρ endpoint
   omitted by `C.firstSource` are deleted, its exact four-row survives, and
   every remaining first-apex radius class has size at most three.  Together
   with the exact retained P/Pρ classes this is precisely the finite content
   of `FreshThirdRetainedDeletionCorePacket`.  It is imposed only in the
   `aligned` branch, where the source producer proves it.
8. **the two remaining apex-rich packets:** at `surplusApex` and `oppApex2`,
   every model has either one radius class of size at least six or two distinct
   radius classes of size at least four, exactly translating
   `ApexRichClassStructure`;
9. **branch-preserving opposite-cap patterns:** the same S6/D44 witnesses used
   for richness contain respectively all four or two-plus-two points of the
   appropriate strict opposite-cap interior, as proved by
   `OppositeCapRichClassInteriorPattern`;
10. **checked rich-slice localization:** every named source blocker is assigned
    its actual strict cap, every selected shell meets a rich radius class in at
    most two points, and two hits in a rich strict-cap slice force the blocker
    row into that cap.  These are the finite translations of
    `criticalShell_inter_selectedClass_card_le_two_of_apexRich` and
    `criticalShellCenter_mem_capInteriorByIndex_of_two_hits`.

Every one of `firstNonHit`, `secondNonHit`, and `equalCrossRowCenters` remains
`SAT` in both radius branches at both cardinalities.  The canonical six-case
artifacts are:

* `artifacts-n17-global-ingress/20260806T053029Z.json`;
* `artifacts-n19-global-ingress/20260806T052605Z.json`.

This is **bounded external countermodel evidence**, not a Lean counterexample:
the model still omits exact Euclidean realization and a universal-cardinality
ingress/lift.  It does, however, falsify the current proposal that named
FreshThird ingress follows from the encoded K4 incidence, the retained
deletion core and radius dichotomy, chosen-row closure, pairwise circle
intersection, cap-local row counting, mutual omission, and tri-apex exclusion
alone.

The richer six-case `n = 17` rerun also remains `SAT`.  Its canonical artifact
is:

* `artifacts-apex-rich-localized-n17/20260806T055802Z.json`.

This additionally falsifies an incidence-only producer based on the complete
S6/D44 branch data and the currently checked rich-cap localization consumers.
In particular, `ApexRichClassStructure` is not by itself the missing ingress
at this abstraction level.  These are still bounded abstract models, not
Euclidean counterexamples and not a refutation of the live Lean theorem.

The Lean retained packet was also corrected in the same round:
`FreshThirdRetainedDeletionCorePacket` now preserves the proved first-apex
blocking fact
`¬ HasNEquidistantPointsAt 4 ((D.A.erase x).erase y) S.oppApex1`
instead of discarding it after constructing `MinimalDeletionCore`.  This is a
source-interface repair, not a closed leaf.  The next production result must
use a fact absent from the enriched model: exact Euclidean/cyclic-order metric
content or a stronger named deletion-transfer theorem.  A sufficient producer
would force, for a named C/Q source whose blocker lies in cap `i`, two points of
its selected shell in a rich radius slice of a distinct cap `j`; the existing
`false_of_criticalShell_center_in_cap_of_two_hits_in_distinct_cap` would then
close that branch immediately.  The enriched SAT matrix shows that this
two-hit producer cannot be derived from the encoded incidence, cap, richness,
and localization facts alone.  Further variants of that abstraction are not
the production path.

### 13.16.1 FreshThird named endpoint-deletion ingress (2026-08-06)

The exceptional canonical-source/different-fresh-cap arm now has a checked,
cardinality-free metric landing path.  The source theorem
`freshThird_canonicalDifferentCap_fivePointKalmansonOrder` extracts the four
possible five-point boundary orders.  The Kalmanson theorem
`CapCrossingKalmansonBridge.false_of_freshThird_four_order_arms` eliminates
each order once the order-selected endpoint is equidistant from the other
shared endpoint and the canonical source.

The metric premise has now been replaced by an explicit global-deletion
contract.  The proved theorem
`endpointCentered_dist_eq_of_two_blocked_deletions` says that, at a carrier
center `q`, simultaneous failure of K4 after deleting `x` and after deleting
`y` puts `x` and `y` on one critical four-shell centered at `q`, and hence
proves `dist q x = dist q y`.  The checked minimal consumer
`false_of_freshThird_canonicalDifferentCap_of_orderSelectedEndpointDeletionObstructions`
accepts only the two named deletion obstructions at the endpoint selected by
the realized boundary-order arm and feeds the resulting equality to the
Kalmanson terminal.  This is a source-clean producer contract, not a closed
FreshThird leaf: the active
`false_of_twoCapSources_freshOutsideFirstBlockerFiber` theorem still has no
proof of the required source-entitled terminal; the normalized-remaining route
is compatibility-only.

In any one of the four boundary-order arms, only the two deletion failures at
the order-selected endpoint are needed.  The exact arbitrary-cardinality
complement of that pair is now checked in Lean.  The theorem
`deletion_survives_iff_exists_selectedFourClass_avoiding` trims a surviving K4
witness after deleting `x` to an ambient `SelectedFourClass` whose support
avoids `x`, and proves the converse.  Thus it is an exact representation, not
a weakening.  The theorem
`endpointDeletionPair_blocked_or_survivingRow` then proves that a named pair
of deletions either both block or supplies an explicit selected four-row
avoiding one of the two deleted points.

The order-indexed theorem
`freshThird_orderSelectedEndpointDeletionObstructions_or_survivingRow`
specializes this dichotomy to the endpoint selected by each of the four
Kalmanson orders.  Finally,
`freshThird_canonicalDifferentCap_orderSelectedEndpointDeletionOutcome`
composes it with the source-proved boundary order.  It gives a
cardinality-free, source-faithful ingress:

```text
canonical different-cap FreshThird packet
  -> order-selected two-deletion obstruction (immediate Kalmanson closure)
     OR exact selected four-row avoiding one named deleted point.
```

This is a genuine producer, but not yet closure: the first arm is consumed by
the checked Kalmanson terminal, while the new exact-row arm has no contradiction
consumer yet.  The next CEGAR query must therefore retain the direct/mirror
boundary arm and encode the **surviving-row complement** of the exact dynamic
clause

```text
delete(canonicalSource) blocks K4 at qSelected
and
delete(otherEndpoint) blocks K4 at qSelected.
```

Rather than ask only whether that clause is forced, the query should enumerate
the exact four-point support supplied when either conjunct fails and mine a
source-entitled contradiction or finite obstruction covering every such row.
The universal ingress no longer needs to be guessed: the checked outcome
theorem supplies it.  A bounded UNSAT result nevertheless remains diagnostic
until a proved arbitrary-cardinality obstruction/lift covers those surviving
rows and feeds a live residual consumer.

The exact bounded query is now implemented at
`scratch/retained-omission-e1/round5-general-cegar/freshthird_dynamic_endpoint_deletion_probe.py`.
It keeps the C/Q sources as dynamic selectors, encodes the exceptional
canonical-source/different-fresh-cap packet, and defines deletion failure by
the exact finite negation of `HasNEquidistantPointsAt 4 (A.erase deleted)
qSelected`.  It deliberately does **not** assume the stale `no_named_ingress`
condition and does not enable the older literal-`q1`/`q2` cyclic-order metric
encoding.  Each invocation instead takes one of the two endpoint mappings and
one of the four source-proved order arms, then derives `qSelected`; the caller
can no longer choose an endpoint inconsistent with its order arm.  Cyclic
order itself is not re-encoded: the Lean order theorem supplies the external
case index, and the incidence model is otherwise a relaxation of that arm.
Consequently SAT may be spurious, while bounded UNSAT must cover all eight
indexed cases before it supplies even bounded evidence for the dynamic clause.

Schema 4 strengthens the aligned-radius ingress with the checked source fact
`firstFiberCapSource_firstApexRadius_eq_singleton_of_aligned`, as exported by
`freshThird_acyclic_canonical_consumerPacket`: each dynamically selected
canonical C-source first-apex radius meets its indexed cap in exactly that
source.  This was already a logical consequence of the older finite clauses,
but it is now a named constraint group and a versioned part of the query
contract, so future survivor-row cuts can use it directly and its presence can
be audited.  The common-radius branch deliberately does not receive this
aligned-only fact.

Construction-only validation of schema 4 has passed for both finite profiles
and both radius modes without calling `solver.check`:

- `n = 17`, `firstNonHit`, aligned-radius mode, `q1-outside` mapping, order
  arm 2 (derived selected endpoint `q1`): 48,954 assertions and 87 labelled
  constraint groups;
- `n = 19`, `equalCrossRowCenters`, aligned-radius mode, `q2-outside` mapping,
  order arm 3: 74,352 assertions and 87 labelled constraint groups;
- `n = 19`, `equalCrossRowCenters`, common-radius control, `q1-outside`
  mapping, order arm 1 (derived selected endpoint `q2`): 74,350 assertions and 85
  labelled constraint groups.

The corresponding `BUILT_NOT_SOLVED` artifacts are under
`scratch/retained-omission-e1/round5-general-cegar/artifacts-dynamic-endpoint-deletion/`;
each records `solver_check_called = false`.  The schema-4 self-check also pins
the two aligned singleton-ingress declarations.  Thus the encoder contract is
now statically valid for the exact obstruction-versus-surviving-row dichotomy.
Schema 4 records the five checked Lean ingress declarations, and any SAT run
extracts a deterministic exact four-point radius support for every true
survival alternative, together with the deleted point it avoids and the full
finite radius class.  A round must not be reported as covering the order
theorem unless its matrix covers both mappings, all four arms, and both
surviving-row alternatives at the derived selected endpoint.  There is not yet
a SAT/UNSAT result, post-round current-wave-data general-theorem mine,
arbitrary-cardinality survivor-row obstruction, or closed Lean leaf.

The Lean landing interface now matches that dynamic contract exactly.
`FreshThirdOrderSelectedEndpointDeletionObstructions` records the realized
order arm together with only its selected endpoint's two deletion failures;
`false_of_freshThird_orderSelectedEndpointDeletionObstructions` proves the
generic cardinality-free Kalmanson contradiction; and
`false_of_freshThird_canonicalDifferentCap_of_orderSelectedEndpointDeletionObstructions`
supplies the direct/mirror source-row metric adapter.  The focused
`TwoSourceFreshThirdFiber` build and proof-blueprint re-index both pass on Lean
4.27.  These declarations introduce no new `sorry` and remove the former need
for a producer to establish all four endpoint obstructions.  They are checked
consumers.  The new outcome declarations above additionally close the
universal-ingress gap by exposing the complementary row data; the historical
compatibility route still needs its row-valued complement eliminated, while
the current outside-first ingress remains open on-spine.

The disjunction has now been narrowed once more in checked Lean.  The theorem
`freshThird_canonicalDifferentCap_exists_orderSelectedEndpointSurvivingRow`
composes the exact outcome with the Kalmanson consumer: its deletion-
obstruction arm proves `False`, so every live canonical-different-cap instance
unconditionally returns a boundary indexing, the direct/mirror endpoint
names, the realized order arm, and the exact ambient `SelectedFourClass`
surviving one of the two named deletions.  A focused Lean 4.27 source check of
`TwoSourceFreshThirdFiber.lean` passes.  This closes no load-bearing `sorry`,
but it removes the already-solved disjunct from the remaining producer
contract.  The next mathematical target is therefore exactly the arbitrary-
cardinality elimination of this returned survivor row; neither another
deletion-obstruction wrapper nor a query that omits the row support advances
the spine.

Schema 6 of `freshthird_dynamic_endpoint_deletion_probe.py` retains the exact
live common-radius scope from schema 5 and adds the missing source-level cap
contract.  The general Lean producer
`selectedClass_inter_capByIndex_card_le_two` states that every positive-radius
selected class centered in an indexed closed cap meets that cap in at most two
points.  The encoder applies precisely this bound to every radius class at the
order-selected endpoint; because deletion only removes points, the same bound
holds for either survivor class queried by the probe.  Its
`live-equal-common-dual` scope requires `equalCrossRowCenters`, common-radius
provenance, canonical slot 0, both C-source interactions in the
canonical-source/different-fresh-cap constructor, and equality of the two
C-row centers.  It also asserts the checked
`freshThirdEqualCenterExactFourRow_of_hits` consequence, so both C rows are
exactly the named four-source support rather than a solver-reconstructed
coincidence.  SAT artifacts additionally expose the complete radius class,
role membership, and cap-composition counts behind each trimmed exact
four-support.  Construction-only validation passes for all sixteen queries at
`n = 17` (two endpoint mappings, four order arms, and the canonical-source or
other-endpoint surviving alternative), without calling `solver.check`.  Those
sixteen source cases quotient exactly to four distinct solver formulas:
selected endpoint `q1` or `q2`, crossed with canonical-source or other-endpoint
survival.  Production runs therefore execute those four representatives and
retain the sixteen-case construction matrix as the coverage gate.  No
coverage is lost by this quotient: the sixteen construction-only cases and the
four formula keys are checked by the schema-6 self-test.

The source ingress was checked directly under Lean 4.27 on 2026-08-06.  Direct
compilation passed for `PartitionFromMEC`, `CapSelectedRowCounting`,
`TwoSourceFreshThirdFiber`, `TwoSourceFreshThirdRetainedProducer`, and
`TwoSourceFreshThirdResidual`; the last module required only passing the full
section-variable packet to the retained producer.  This was a focused source
gate, not a fresh full-project build: the attempted Lake target build expanded
to 10,892 stale transitive targets and was stopped after an unrelated
`SevenPointTwinFourCircleCollision` elaboration consumed more than 75 minutes.

The four schema-6 production representatives at `n = 17` are all **SAT**:
`q1/canonical-survives`, `q1/other-survives`,
`q2/canonical-survives`, and `q2/other-survives` (about 15--17 seconds each;
no timeout or `unknown`).  These bounded models show that the general cap-class
bound is a valid ingress strengthening but does not eliminate the live branch.
No `sorry` closed in this round.  The immediate gate is a census of the four
survivor motifs followed by a source-entitled theorem that rules out their
shared structure; rerunning the obsolete obstruction-versus-survivor
dichotomy would not address the current Lean consumer gap.

The post-round bank audit initially identified cyclic boundary order as the
missing bridge, but a direct production-source trace corrected that diagnosis.
`freshThird_canonicalDifferentCap_boundary`,
`freshThird_canonicalDifferentCap_endpointPlacement`,
`freshThird_canonicalDifferentCap_sourceSupportPlacement`, and
`freshThird_canonicalDifferentCap_fivePointKalmansonOrder` already supply the
cardinality-free boundary and five-point order for this constructor.  The
actual missing bridge is **positive incidence for the order-selected surviving
row**: the current cap-split survivor records an avoided deletion and a
`≤ 2`/`≥ 2` cap composition, but not two later boundary witnesses shared with a
known row.  Consequently
`CapCrossingKalmanson.false_of_two_selected_rows_shared_late_pair` cannot yet
fire.  Schema 7 should encode only the Kalmanson exclusions justified by the
existing five-point order, then census the remaining row incidences; it must
not assume the desired shared memberships.

### 13.16.2 Schema-7 Kalmanson census and source-producer gate (2026-08-06)

Schema 7 implemented exactly the preceding bounded diagnostic.  It adds only
the four Kalmanson exclusions justified by
`freshThird_canonicalDifferentCap_fivePointKalmansonOrder` and the checked
four-arm consumer; it does not assert the missing shared memberships.  The
complete `n = 17`, `live-equal-common-dual` matrix covers two endpoint maps,
four order arms, and the canonical-source/other-endpoint survivor alternatives.
All sixteen source cases are **SAT**, with no timeout or `unknown`.  Every
witness has an exact four-point selected surviving support; fifteen have a
four-point full radius class, while one has a larger full class.  Concrete
support labels and cap-composition vectors vary and are not universal motifs.
This is bounded incidence evidence only: it proves neither Euclidean
realizability nor a general-cardinality countermodel, and closes no `sorry`.

The required post-round theorem-bank pass found no existing FreshThird,
equal-center, normalized-residual, or surviving-row theorem that consumes all
sixteen survivors.  In particular, the already checked deletion-obstruction
consumer requires both named deletions to block K4, whereas these cases retain
a selected row.  This remains compatibility-route evidence; the live
on-spine FreshThird residual is the outside-first blocker-fiber theorem.

This schema-7 branch is only one constructor family of the load-bearing
residual.  A fresh constructor audit gives the complete remaining obligation
matrix:

1. `firstNonHit`: produce `FreshThirdSameCapCrossRowAlignment` for the first
   source, or an equivalent global contradiction.  The other source's
   interaction is still arbitrary at this interface.
2. `secondNonHit`: the symmetric alignment/contradiction obligation.  A
   side-parametric producer should discharge both non-hit constructors.
3. `equalCrossRowCenters` with two distinct-cap noncanonical interactions:
   prove the shared-late-pair producer below.  This is the exact schema-7
   branch.
4. `equalCrossRowCenters` with two noncanonical same-cap interactions under
   the aligned-retained ingress: transport that ingress to the common-radius
   consumer or prove a separate metric/global-deletion contradiction.  The
   existing common-radius wrapper already closes this same-cap arm when the
   stronger common-radius surface is available.

The mixed equal-center interaction products and the canonical-cap variants
are already source-closed in the coordinator.  Therefore the shared-late-pair
producer is a genuine compatibility-branch reduction, but it is not by itself
closure of the current on-spine
`false_of_twoCapSources_freshOutsideFirstBlockerFiber`.

The precise next source-level producer is now fixed.  From the live
`FreshThirdAcyclicCanonicalConsumerPacket`, the canonical different-cap
five-point order, and the row returned by
`freshThird_canonicalDifferentCap_exists_orderSelectedEndpointSurvivingRow`,
construct:

1. a second selected row `BRow`;
2. indices `ia < ib < ic < id`; and
3. membership of `boundary ic` and `boundary id` in both the surviving row and
   `BRow`.

Those conclusions are exactly the input of
`CapCrossingKalmansonBridge.false_of_two_selected_rows_shared_late_pair`, so
the consumer and universal lift already exist once this producer is proved.
The missing mathematics is positive global row incidence, not cyclic order or
another local deletion dichotomy.

Accordingly this remains a historical/off-spine production milestone for the
distinct-cap branch.  The current production milestone is a source proof and
direct wiring for the outside-first blocker-fiber ingress
`false_of_twoCapSources_freshOutsideFirstBlockerFiber`.  A
schema-8 dynamic shared-late-pair query may be used as a hypothesis probe or
countermodel generator while developing the producer, but it must not be
classified as a production closure run until Lean supplies the source
entitlement.  Clauses hard-coded to the accidental schema-7 labels, or merely
asserting that the survivor contains a collision source, are not admissible.
The full post-round evidence and theorem audit are recorded in
`scratch/retained-omission-e1/round5-general-cegar/schema-v7-round-summary.md`
and `schema-v7-theorem-bank-audit.md` in the same directory.

### 13.16.3 Schema-8 correction and coherent-row Schema-9 gate (2026-08-06)

Schema 8 did **not** soundly negate the proposed shared-pair producer.  It
introduced free existential selectors for the surviving row, comparison row,
and pair, then asserted the negation of the selected instance.  Its effective
shape was `∃ selectors, ¬ Shared(selectors)`, whereas a countermodel to the
producer requires `¬ ∃ selectors, Shared(selectors)`.  The public Schema-8 run
paths are disabled before solver or artifact work.  Its historical sixteen
SAT results are invalid as countermodels and receive no mathematical or
closure credit.

The accompanying source audit did establish one useful correction.  At every
critical-shell blocker center,
`CriticalShellSystem.selectedFourClass_support_eq_shell` proves that any
selected four-class supplied by global K4 has exactly the chosen critical
shell support.  Thus a finite relaxation may use one coherent global row per
center; it may not choose different row supports for different source
projections at the same center.

Schema 9 repairs the quantifier polarity without introducing selector
variables.  For every selected endpoint center `c`, radius anchor `a`, and
coherent global-row center `b`, it defines the deletion-surviving radius class
`Aclass(c,a)` and asks whether its intersection with row `b` contains two
points on the same side of the open boundary interval between `c` and `b`.
The countermodel query is the literal negation of the finite disjunction over
all `17^3 = 4913` triples.  Dynamic endpoint roles, the full boundary
permutation, and all four source-proved five-point order arms are retained.
This remains an external bounded relaxation: it has neither Euclidean
realization semantics nor an arbitrary-cardinality Lean ingress/lift.

The Schema-9 self-check passes on all sixteen endpoint-map/order/deletion
cases, checks the candidate count and absence of selector variables, and
includes an UNSAT polarity canary.  The complete sixteen-case run at a
30-second per-case timeout returned **0 SAT, 0 UNSAT, and 16 UNKNOWN**.  This is
no verdict on the producer and closes no `sorry`.

The mandatory post-round global theorem-bank pass searched all eight indexed
Lean corpora and the four required sibling/legacy registries.  It found
single-row producers such as `exists_selectedFourClass_of_globalK4` and the
conditional consumer `selectedFourClass_shared_pair_separated`, but no theorem
forcing a second coherent row, exact two-point intersection, or a
nonalternating shared pair from the live FreshThird/global-K4/deletion/cap
packet.  The first missing source bridge is therefore unchanged: produce two
distinct row centers with a shared pair and its boundary placement, then feed
the checked shared-pair/Kalmanson consumer.

Before changing the mathematical abstraction, Schema 10 should encode the
same Schema-9 negation in solver-friendly direct form: for each `(c,a,b)` with
`b != c`, `Avalid(c,a)` implies at most one shared point inside the open
interval and at most one outside it.  Equivalence and polarity self-checks are
mandatory.  Any resulting CEGAR verdict remains diagnostic until a general
Lean producer and lift are proved, and it must again be followed by a
current-wave-data general-theorem mine, with one bounded reuse preflight only
if that mine yields a concrete candidate.  The three-constructor residual
interface remains the
correct coordinator granularity; no further load-bearing split is authorized
unless the same change closes at least one resulting arm.

The detailed contracts and audits are in
`scratch/retained-omission-e1/round5-general-cegar/schema-v9-contract.md` and
`schema-v9-global-theorem-bank-audit.md`.

### 13.16.4 Schema-10/11 status and direct nonalternation consumer (2026-08-06)

Schema 10 implemented the solver-friendly direct form specified above.  Its
Boolean/count equivalence checks pass, but the authenticated sixteen-case
matrix returned **0 SAT, 0 UNSAT, and 16 UNKNOWN** at the 30-second per-case
timeout.  This is no closure result.

The next source strengthening is now checked in
`TwoSourceFreshThirdResidual`.  The two exposed exact four-supports have exact
two-point overlap and therefore form a six-point seed.  Global minimality
produces a single pinned seed center, distinct from both exposed row centers,
such that every positive physical radius class there meets the seed in at
most three points.  The public producer
`exists_freshThirdCrossRow_pinnedCenter_universal_escape_dichotomy` additionally
states the source-faithful canonical-blocker/support dichotomy for every
selected row and every point escaping the seed.

Schema 11 adds the exact six-point seed and the correctly quantified pinned
center to Schema 10.  Its formula chooses the center once before all radius
anchors and applies the nonalternation negation at that same center.  The
stronger universal blocker/support dichotomy is **not** yet encoded.  A single
30-second diagnostic case returned `UNKNOWN`; no full Schema-11 matrix has
been run, and no bounded result is promoted.

The Lean consumer boundary has been simplified and closed.  The new packet
`FreshThirdSharedPairNonalternationPacket` records two distinct exact selected
rows sharing two distinct points for which boundary betweenness relative to
the row centers has the same truth value.  The theorem
`false_of_freshThirdSharedPairNonalternationPacket` proves this packet false
directly from `SurplusCOMPGBank.btw_sep`.  It is cardinality-free, typechecks
under Lean 4.27, and removes the previously stated need to rotate a boundary
indexing into `FreshThirdSharedLatePairPacket` form.

The certificate ingress immediately above that consumer is now also checked.
`exists_selectedFourClass_preserving_pair` trims any four-or-larger physical
radius class to an exact `SelectedFourClass` while retaining two named shared
points.  `false_of_selectedClass_and_row_shared_pair_nonalternating` consumes
the resulting named-witness certificate directly, and
`false_of_selectedClass_and_row_two_shared_on_one_arc` provides the
count-facing form used by the finite query: cardinality at least two in either
the inside-arc or outside-arc shared-point filter is enough for contradiction.
All three declarations are ambient-cardinality-free and typecheck under Lean
4.27.  Thus exact-four trimming, witness extraction, and the final geometric
consumer are no longer part of the promotion gap.

The mandatory post-round indexed Lean and historical-bank audit found no
producer connecting the pinned six-point/multiplicity packet to either shared
pair consumer.  The remaining distinct-cap work is therefore source
production, not consumer construction: prove that the pinned physical radius
class and some coherent comparison row have at least two shared boundary
points on one of the two open arcs between their centers.  The Lean ingress
then performs all witness selection and exact-four trimming.  A computational
UNSAT would still require an arbitrary-cardinality finite-pattern ingress/lift
establishing precisely this one-arc count before it could close the universal
Lean leaf.  Until that producer or lift is proved, the active FreshThird
residual and its other non-hit/same-cap families remain open.

### 13.16.5 Equal-center six-case ingress and non-hit symmetry (2026-08-07)

The equal-center constructor now has a source-level finite center-domain
ingress in
`TwoSourceFreshThirdResidual`.  Under the two positive cross-row hits and the
exact two-point row overlap,
`exists_freshThirdEqualCenter_pinnedCenter_sixWayIngress` proves that the
globally pinned center is either one of the four named source points or belongs
to `freshThirdCrossRowFreshRemainder`, whose cardinality is exactly two.  The
producer also proves that the named finset has cardinality four and is disjoint
from that remainder, so these are six distinct center cases.  The same witness
retains the positive-radius seed-intersection bound and the
universal blocker/support escape dichotomy for every selected row and every
point outside the six-point seed.  This is an exact, cardinality-free ingress;
it does not truncate the ambient carrier and does not select a favorable row.
The six-case ingress itself passed focused elaboration under Lean 4.27 before
the producer decomposition below.

The checked case split in
`false_of_twoCapSources_freshThirdBlockerFiber_normalized_remaining` is retained
as an off-spine compatibility decomposition.  Its three constructor-local
obligations are:

1. `false_of_freshThird_firstNonHit`, retaining the second interaction and the
   complete acyclic ingress;
2. `false_of_freshThird_secondNonHit`, retaining the first interaction and the
   complete acyclic ingress; this branch is now a proved adapter, not an
   independent residual; and
3. `false_of_freshThirdEqualCenter_noncanonicalInteractions`, retaining both
   noncanonical interactions and the complete acyclic ingress.

This corrects two invalid positive-producer interfaces discovered by the
source audit.  A `FreshThirdSameCapCrossRowAlignment` is itself contradictory,
and the two `FreshThirdCapSourceNonHit` constructors respectively negate its
center-inequality or source-row-membership fields.  Therefore the former
`freshThird_firstNonHit_capWideAlignment` and reflected theorem could only
have been proved after deriving the entire branch contradiction and applying
`False.elim`; they were disguised `False` leaves rather than useful positive
producers.  The direct residuals expose the actual mathematical work.

The equal-center positive interface had the same problem in a different
form.  The canonical two-point overlap is proved to be cyclically separated:
one point satisfies `btw ic id` exactly when the other does not.  It therefore
does not source-produce the two shared points on one arc requested by the old
`exists_freshThirdEqualCenter_oneArcSharedPairObstruction`.  The equal-center
leaf now asks directly for `False`; its mixed
`distinctBlockersDifferentCaps`/`sameCapWithInternalFiberSource` products
close by strict-cap uniqueness, while the coherent distinct/distinct and
same-cap/same-cap products remain explicit proof branches inside the one
residual symbol.

The broad coordinator contains no proof hole and immediate constructor fan-out
remains three.  However, the second-non-hit branch is not a separate
mathematical obligation.  `false_of_freshThird_secondNonHit` swaps only
`C.firstSource` and `C.secondSource`, reruns the proved
`freshThird_acyclic_canonical_consumerPacket` producer for the swapped surface,
and applies `false_of_freshThird_firstNonHit`.  This source-only symmetry proof
passes focused Lean 4.27 elaboration; it does not identify `P` with `Pρ` or the
separate common-radius surface with the current `C`.

The remaining proof sites in this decomposition are compatibility obligations,
not the current kernel frontier.  `false_of_freshThird_firstNonHit` and
`false_of_freshThirdEqualCenter_noncanonicalInteractions` remain useful for
the historical normalized route, but the current on-spine load-bearing leaf is
`false_of_twoCapSources_freshOutsideFirstBlockerFiber`.  No data from the
opposite interaction or the acyclic retained/common-radius packet is erased.

This is a source-closed compatibility decomposition, not unconditional
mathematical closure.  The equal-center center selector nevertheless has a
complete source entitlement: the center domain, exact remainder cardinality,
multiplicity clause, and universal escape clause all arrive from Lean rather
than being assumed by an encoder.  The selected-row and outside-seed
quantifiers are still unbounded, so this is not yet a finite-object extraction
theorem for the whole branch or a closure of the active outside-first leaf.

The next non-hit milestone is the first-source direct contradiction for the
source-entitled packet
`(acyclic ingress, FreshThirdCapSourceNonHit, opposite interaction)`.  For
theorem discovery it is useful to analyze the retained and common-radius
ingress arms separately, but the common-radius arm contains a separately
produced surface rather than transport data identifying it with the current
`C`; no proof or encoder may silently make that identification.  The two
non-hit constructor arms now share this single obligation through the checked
source-swap adapter.

The next equal-center milestone is a direct contradiction for either coherent
interaction product.  The six-way ingress remains valid and useful, but its
multiplicity and universal escape clauses do not by themselves imply a
same-arc pair.  A computational attempt must target the direct `False`
contract and provide a sound bounded-obstruction/lifting theorem over all six
center possibilities, retaining the universal escape dichotomy and complete
ingress provenance.  Bounded `UNSAT`, or a model that assumes the rejected
alignment/same-arc packet, remains diagnostic only.

### 13.16.6 Common-radius surviving-row incidence leaf (2026-08-07)

The common-radius equal-center specialization is no longer routed through a
broad fallback.  The source now proves the complete dual-cap packet with
`freshThird_commonRadius_distinctCaps_dual_packet`, selects the exact boundary
indexing and endpoint row with
`freshThird_canonicalDifferentCap_exists_orderSelectedEndpointSurvivingRow`,
and stops at the explicit compatibility residual off the current publish spine
`false_of_freshThird_commonRadius_distinctCaps_survivingRow`.

This subsection is retained as historical route analysis.  The current
proof-blueprint spine does not route through this common-radius residual; the
authoritative on-spine FreshThird ingress is
`false_of_twoCapSources_freshOutsideFirstBlockerFiber` (with
`false_of_crossBlockerCoincidence` as the other on-spine leaf).

The former target
`freshThird_commonRadius_distinctCaps_survivingRow_exists_sameSideSharedPair`
had the incidence polarity backwards.  Distinct row centers and the exact K4
intersection bound do not force two points shared by the fresh shell and the
endpoint row.  The new source-closed theorem
`freshThird_orderSelectedEndpointCapSplitSurvivingRow_exists_two_outside_freshShell`
proves the actual universal consequence: for every order-selected endpoint
survivor row, its center differs from the fresh-shell center, its intersection
with the fresh shell has cardinality at most two, and hence at least two of its
four support points lie outside the fresh shell.

The old theorem
`exists_freshThird_commonRadius_distinctCaps_survivingRow_oneArcSharedPairObstruction`
is retained only as a compatibility interface and now follows by `False.elim`
from the direct residual.  It is not a second obligation and its positive
one-arc conclusion is not being claimed as a source producer.

This is a one-for-one interface correction inside the common-radius helper,
not a closed obligation or a change to the current two-leaf FreshThird publish
frontier.  The first-source non-hit, generic equal-center, and common-radius
residuals described here are all off-spine compatibility declarations.  The
generic and common-radius leaves are not
interchangeable: the latter retains the common-radius surface, both complete
cap-interaction packets, the proved dual-cap packet, and the exact surviving
endpoint row.

The direct residual must now consume the proved outside-shell pair together
with global minimality, the complete dual-cap interactions, cap membership,
and cyclic order.  The six-way ingress and v38/v39 did not encode that full
packet, so no existing fixed-`n` solver result is promotable here.  Any new
computational route must specify a source-faithful finite ingress for this
exact residual and a cardinality-independent bounded-obstruction/lifting
theorem before an `UNSAT` result can close it.  In particular, bounded search
for the retracted positive shared pair is retired.

The next source reduction is now checked in Lean 4.27.  The selected-row
lemmas retain the actual endpoint identity, prove that the same exact row has
at least two points outside each exposed shell, and refine the local outcome
to either a point outside their six-point union or an exact `2+2` cover of the
row by the two shells.  The cover itself is retained, rather than merely its
cardinalities.  A source-faithful linear probe of the resulting named local
`2+2` abstraction is SAT in all eight order/deletion arms.  This is evidence
that the local two-shell incidence and named Kalmanson clauses alone do not
close the leaf; it is not a Euclidean countermodel or a universal result.  The
required post-round theorem-bank pass found no existing import-reachable
consumer for all eight arms.

Global minimality now removes the locally rigid `2+2` outcome whenever its
pinned center is the selected endpoint.  The checked theorem
`freshThird_pinnedEndpointRow_escape_or_offEndpoint` chooses one pinned center
in the exact six-point seed and one exact order-selected endpoint row, retains
which of `qOutside` or `qBetween` centers that row, and proves the following
cardinality-free dichotomy:

1. the pinned center differs from the selected endpoint; or
2. the endpoint row contains a point outside the six-point seed, and that
   point carries the full source-level blocker-equality/support-equality versus
   distinct-blocker/small-overlap dichotomy.

Indeed, if the pinned center equals the endpoint and the row were covered
`2+2`, all four row points would lie in one positive-radius class inside the
seed, contradicting the pinned multiplicity bound of three.  The route-local
`false_of_freshThird_commonRadius_distinctCaps_survivingRow` body now consumes
this producer, the equal-center exact-four reconstruction, the six-way
named-or-two-point-remainder localization, and the endpoint-name transport
from `hnames`.  No `sorry` has closed at this checkpoint.  The remaining
direct work is to eliminate the off-endpoint center cases and the genuine
outside-seed blocker cases using the retained dual-cap/order packet; no new
bounded computation should be treated as production unless it covers those
two universal arms and has an arbitrary-cardinality lift.

### 13.16.7 Exact-support elimination and full deletion-fan frontier (2026-08-07)

Historical/off-spine compatibility route: this section records a genuine
source-level reduction, but the current proof-blueprint spine does not consume
this deletion-fan coordinator.  The active FreshThird ingress is the
outside-first blocker-fiber leaf named in section 13.3.

The exact-support arm of that residual is now kernel-proved in Lean 4.27.
`false_of_freshThird_exactSupport_cyclicTriangle` cuts the boundary order at
one shared source, reconstructs the three shared-pair cyclic separations for
the source, fresh, and selected endpoint rows, and feeds the resulting strict
six-point order directly to
`TwoTripleRowSixPointEuclideanObstruction.false_of_six_ccw_two_triple_row_equalities`.
Thus the exact `2+2` common-radius support is impossible without any finite-`n`
assumption or solver trust.

The former route-local
`false_of_freshThird_pinnedEndpoint_globalResidual` is consequently proved and
is now a thin adapter into the stronger off-spine compatibility successor
`false_of_freshThird_pinnedEndpoint_outsideSeedResidual`.  The coordinator
frontier changes from one unresolved theorem with three immediate terminal
alternatives

1. off-endpoint row escape plus a deletion blocker;
2. off-endpoint exact common-radius support; and
3. endpoint row escape plus a deletion blocker,

to one unresolved theorem with only alternatives 1 and 3.  The strict measure
decrease is deletion of alternative 2 from the source-produced terminal sum;
the raw `sorry` count remains one.  The successor also records explicitly the
source center in the first-cap interior, the fresh center in a different cap,
both fresh sources outside the first cap, and the selected endpoint row's
non-first-cap `≤ 2` inside / `≥ 2` outside split.  Its immediate consumer is the
proved global residual, but this route remains off-spine after the current
proof-blueprint refresh.

That normalization is now source-proved, uniformly over all four points of the
selected row.  `SourceFaithfulSelectedFourDeletionFan` records for every support
point its canonical blocker-cap location, genuine failure of the corresponding
deleted K4 instance, and the complete equal-center/exact-support/non-robust versus
distinct-center/at-most-two-overlap dichotomy.
`sourceFaithfulDeletionFan_of_triApexAllLargeContext` constructs this packet from
the existing global tri-apex context without a finite-cardinality assumption.
Both remaining alternatives of
`false_of_freshThird_pinnedEndpoint_outsideSeedResidual` now carry this complete
four-point fan, rather than only one favorable outside-seed deletion.

The live target is therefore the **fan-to-consumer lift**, not another blocker
producer.  Four cap-localized blockers give a finite repeated-cap normalization,
but that fact alone is not contradictory.  A closing lift must additionally
produce one of the hypotheses accepted by an import-reachable terminal: two
distinct same-cap centers bisecting a common outside pair, a shared pair with the
required cyclic-arc placement, or a carrier-wide cap/row-count contradiction.
The existing retained-collision localization bank does not supply this lift: it
requires a `RetainedRadiusCollision` and joint membership of its two fixed sources
in an actual row, neither of which follows from the FreshThird deletion fan.
`FrontierCommonDeletionEscape` is not imported by the active chain and in any
case ends at a conditional normal-form consumer requiring the missing
contradiction externally.

The corrected CEGAR round must encode precisely the complete four-point fan and
all source-permitted aliases.  In particular, unnamed or cross-role points may
not be forced distinct; distance positivity and strict order constraints may be
asserted only for pairs proved distinct by the Lean ingress.  It must exhaust
the equality partition of blocker centers and every permitted canonical-support
intersection.  The earlier 416-row probe violated this alias requirement and is
discarded as closure evidence.  After the corrected round, a global theorem-bank
pass must test its exact survivor motifs before any new producer is formalized.

Solver output remains theorem-discovery evidence only.  Production closure still
requires a cardinality-independent Lean lift from the full fan to a checked
terminal consumer.  No fixed-`n` `UNSAT` result by itself closes
`false_of_freshThird_pinnedEndpoint_outsideSeedResidual`.

#### 13.16.7.1 Corrected metric-core checkpoint (2026-08-08)

The first sound assumption-tracked exact replay has now reduced one genuine
motif-free structural survivor to five equal-radius assertions.  In its actual
cyclic order the six roles are

```text
a1_2 < w0 < w1 < b1 < pinnedCenter < b0,
```

and the three actual selected rows contain the pairs

```text
b1:{a1_2,w1},   pinnedCenter:{w0,w1},   b0:{a1_2,w0}.
```

After renaming these six points in increasing order, this is exactly the
support-first triangle consumed by
`KalmansonThreeEqualitySchemas.false_of_support_first_two_k2_three_selected_rows_triangle`.
The independent cvc5 replay agrees with the exact QF_LRA contradiction.  This
is a bank hit, not a new metric theorem and not yet a Lean closure.

This triangle is distinct from the endpoint exact-support triangle already
eliminated by `false_of_freshThird_exactSupport_cyclicTriangle`.  It belongs to
the surviving outside-seed deletion-fan arm: the pinned row supplies one pair,
while two canonical blocker rows supply the other pairs through aliases that
the source-faithful encoding permits.  The current Lean fan producer exposes
the pinned row and the blocker rows, but it does not force the additional
shared anonymous support point or one fixed six-role cyclic order.

The corrected production question is therefore finite semantic coverage:
does every source-faithful fan survivor contain one of the support-first,
support-first reflected, center-first, or center-first reflected triangle
motifs, after exhausting all point aliases, endpoint names, blocker
partitions, both cross-deletion directions, and cyclic rotations?  The CEGAR
loop must query the negation of the union of all such genuine motifs; finding
one motif in one sampled model is insufficient.  A universal Boolean `UNSAT`
result may be promoted only with a checked finite coverage theorem whose Lean
adapter constructs the three `SelectedFourClass` rows and six boundary indices.
A Boolean survivor must instead be preserved and passed to exact metric replay
for the next semantic obstruction.  The current 29/30-literal projected cuts
are temporary model blocks and must not be presented as the source-level lift.

#### 13.16.7.2 Universal-triangle scope correction (2026-08-08)

The first follow-up "universal" triangle-complement run was not universal and
is retained only as a restricted regression.  Its `triangle_union` used the
cap-synchronized pair and its one-way cross-deletion survivor, and enumerated
only the three physical rows `(blocker z, pinned row, blocker w)`.  The
independent mutual-cross pair supplied by
`nonrobustCenter_or_exists_mutualCrossDeletionRows_of_sourceFaithfulFan` was
present in the branch packet but was dead data in the motif union.  In
particular, the repeated-cap pair and the mutual-cross pair are independent
source witnesses and must not be identified.

The resulting SAT model therefore proves only that the restricted
blocker/pinned abstraction need not contain one of the four six-point triangle
schemas.  It is not a survivor for the complete Lean ingress contract.  The
reported fixed-model metric contradiction remains useful theorem-discovery
evidence, but an artifact mismatch (`timeout` in the aggregate result versus
`unsat` in the replay file) must be resolved before that replay is reused.

The corrected coverage contract must keep the two witness pairs independent
and range over every source-entitled actual selected row: the canonical-source
row, fresh row, pinned row, order-selected endpoint row, the four canonical
blocker rows, and any materialized cross-deletion survivor rows.  A triangle
arm may enter the union only when the source packet supplies its three row
origins, six positive support incidences, and an injective `BoundaryIndexing`
with the required strict six-index order.  Rank aliases alone do not establish
that ingress; indeed the frozen restricted survivor aliases several named
roles and so cannot itself instantiate a consumer requiring an injective
boundary.

The existing bank provides the cardinality-independent terminal consumers,
including the four orientation variants in
`KalmansonThreeEqualitySchemas` and the bridge consumers in
`CapCrossingKalmanson`.  The endpoint exact-support producer
`freshThird_exactSupport_threeRowCyclicSeparations` already supplies and closes
one different branch.  No banked theorem presently transports the remaining
outside-seed cap/mutual fan to the needed positive support/order packet.  Thus
the immediate target is the missing source producer or a sound exhaustive
coverage theorem for precisely that packet, not another fixed-model metric
cut.

#### 13.16.7.3 Source-faithful lazy-round checkpoint (2026-08-08)

The corrected coverage engine now keeps the repeated-cap and mutual-cross
witness pairs independent and distinguishes canonical blocker rows from the
materialized one-way and two-way cross-deletion rows.  Canonical blocker rows
are unconditional consequences of the deletion fan; only materialized rows
retain their source survival guards.  Required row-center equalities are part
of each Kalmanson motif.  The obsolete monolithic `triangle_union`, whose
blocker guard could discard valid canonical-row triples, has been removed in
favor of model-local motif discovery and guarded blocking.

The first configured branch slice is
`outside_fresh_between_source_canonical`, with fresh and endpoint rows in cap
1, repeated-cap witness `(0,1)`, and independent mutual witness `(0,1)`.
Five successive exact metric cores were UNSAT in both Z3 and cvc5 and were
blocked.  All five have the same tracked 5-assertion core of width 25; they use
the active one-way cross survivor `1 -> 0` together with the independent
mutual survivors `0 <-> 1`.  The sixth core is Z3-UNSAT but cvc5 timed out; it
is unverified and was not blocked or promoted.  A structural SAT survivor
therefore remains after the five verified cuts.  This run covers one branch
only and establishes no universal result or Lean closure.

The mandatory global theorem-bank pass found matching cardinality-independent
consumers in `CapCrossingKalmansonBridge` and
`FivePointEuclideanObstruction`, but no import-compatible producer for their
ingress.  The first missing bridge is a universal source theorem that names
the actual `SelectedFourClass` rows and their positive support incidences,
preserves the repeated-cap and mutual-cross pairs as independent data, and
uses `BoundaryIndexing` to transport those points injectively to one accepted
strict CCW order schema.  The current computational artifacts are therefore
theorem-discovery evidence for that producer, not a replacement for it.

Artifacts:

- `scratch/p97-consumer-first/freshthird_cross_row_kalmanson_universal_20260808.py`;
- `scratch/p97-consumer-first/freshthird_cross_row_kalmanson_universal_20260808.results.md`;
- `scratch/p97-consumer-first/freshthird_lazy_round_bank_pass_20260808.md`;
- `scratch/p97-consumer-first/freshthird_row_origin_audit_20260808.md`.

#### 13.16.7.4 Resumable coverage and call-6 replay checkpoint (2026-08-08)

The sixth configured-branch metric core remains unauthenticated.  Its Z3
result is `unsat`, but cvc5 timed out both in the original 120-second replay
and in an independent 600-second replay using the four-job portfolio.  The
exact 2,467,036-byte SMT2 input is now preserved as
`freshthird_cross_row_kalmanson_universal_20260808.call6.core.smt2` with
SHA-256
`f05cc2958df24414d69e835887096cd1d392d759c7bc5790783d0ef0f08f6174`.
This core remains unverified and is neither blocked nor promoted.

The coverage runner now supports a deterministic `FRESHTHIRD_BRANCH_START`
in addition to the number of slices requested by `FRESHTHIRD_BRANCH_LIMIT`,
writes a completed-slice checkpoint after every branch, accepts a separate
result path through `FRESHTHIRD_OUT`, and bounds metric cuts independently via
`FRESHTHIRD_MAX_METRIC_CUTS`.  Previously every continuation restarted at
branch 1 and metric cuts were not bounded by the motif-cut budget.  A smoke
run starting at branch 2 processed exactly branch 2 and, with both cut budgets
set to zero, correctly reported `sat_after_cut_budget` rather than a survivor.

The configured structural product contains 576 slices:

\[
4\ \text{order arms}
\times 2\ \text{fresh-cap choices}
\times 2\ \text{row-cap choices}
\times 6\ \text{repeated-cap pairs}
\times 6\ \text{independent mutual pairs}.
\]

This is only the configured abstraction product.  Completing those 576 slices
would not by itself prove exhaustive coverage of the Lean ingress: the
source-to-encoder alias, endpoint/name, blocker-witness, positive-incidence,
and boundary/CCW lift obligations in Sections 13.16.7.1--13.16.7.3 remain in
force.  No `sorry` is closed at this checkpoint.

The mandatory post-round theorem-bank audit found no producer matching the
call-6 cross/mutual packet.  The nearest cardinality-independent consumers are
`CapCrossingKalmansonBridge.false_of_five_ccw_three_shell_equalities_of_index_size`,
`CapCrossingKalmansonBridge.false_of_six_ccw_two_k2_three_selected_rows`,
`FivePointEuclideanObstruction.false_of_five_ccw_second_two_selected_rows`,
and `false_of_freshThird_orderSelectedEndpointDeletionObstructions`.  Their
weakest currently visible missing antecedent is a universal source theorem
deriving the generic consumer's three named shell equalities from the active
one-way cross survivor and the independent two-way mutual survivor, followed
by the injective boundary/image, convexity, CCW, and strict-order lift.
Retaining all three survivors as actual `SelectedFourClass` rows with positive
support incidences would be a stronger sufficient producer.  The agentic Lean
search exhausted the configured GPT-5.3-Codex-Spark quota, then its automatic
fallback found the generic five-point consumer; scoped current-corpus search
and the required general theorem registries confirmed that the producer is
still absent.

Additional artifacts:

- `scratch/p97-consumer-first/freshthird_cross_row_kalmanson_universal_20260808.call6-replay.results.md`;
- `scratch/p97-consumer-first/freshthird_cross_row_kalmanson_universal_20260808.call6-bank-audit.md`;
- `scratch/p97-consumer-first/call6_agentic_search.txt`;
- `scratch/p97-consumer-first/freshthird_cross_row_kalmanson_universal_20260808.resume-smoke.results.md`.

## 13.17 Rigid221 `BlockerV` deleted-row class elimination (2026-08-06)

The `v`-row-blocker-is-deleted branch has been reduced without increasing its
active obligation fan-out.  Before this checkpoint, the immediate coordinator
called one coarse `sorry` knowing only
`centerAt v = jointDeletion.deleted`.  It now performs the source-covered
classification of the deleted point's row blocker against the exact physical
five-class.

The on-class arm is kernel-proved.  The five possible blocker identities are
eliminated by the existing three-edge ordered-cap cycle, a new four-edge
ordered-cap cycle, `centerAt_ne_source`, `center_not_mem_support`, or the
incompatible pair of strict-betweenness placements.  Both the four-edge cycle
theorem and the aggregate on-class contradiction have only `propext`,
`Classical.choice`, and `Quot.sound` in their axiom closures.

The sole remaining child is
`false_of_exactFourRigid221_sourceHeavy_secondOppositeLarge_pentagonBlockerV_vRowBlockerDeleted_deletedRowBlockerOffClass`.
It retains the parent packet and gains two source-proved facts: the deleted
row's blocker lies in the strict second-cap interior and lies outside the exact
physical five-class.  Thus the immediate logical split has two arms but active
constructor fan-out one; the coordinator-interface frontier changes from one
coarse deleted-row obligation to one strictly stronger obligation.  The
narrowing measure is the number of admissible physical-five-class identities
for that blocker, reduced from five to zero.  `proof-blueprint spine` confirms
that the new residual is the only `sorry` below the deleted-row coordinator and
is still reachable from `Problem97.erdos97_rhs`.  This is
**CLOSED-TO-RESIDUAL**, not kernel closure of the parent pentagon branch.

The off-class child has now been narrowed again without adding a leaf.  Let
`C` be the exact physical five-class, `c := centerAt deleted`, and
`e := centerAt xu`.  Source-row equalities and two-hit localization put both
`c` and `e` in the strict second-cap interior.  The checked four-hook cycle,
center/source exclusion, center/support exclusion, and selected-support
uniqueness prove that `c` and `e` are distinct from each other and from all
five points of `C`.  Hence that strict cap interior contains seven named
points, the second closed cap has cardinality at least nine, and the cap-sum
identity strengthens the residual bound from `12 ≤ |A|` to `15 ≤ |A|`.
That producer is now public, together with the kernel-clean corollary
`false_of_exactFourRigid221_sourceHeavy_secondOppositeLarge_pentagonBlockerV_vRowBlockerDeleted_deletedRowBlockerOffClass_card_le_fourteen`.
Thus the exact-12, exact-13, and exact-14 strata of this residual are explicitly
banked rather than only discharged inside the coordinator; the corollary has
axiom closure `propext`, `Classical.choice`, and `Quot.sound`.

The selected row centered at `c` now also has at most one hit in `C`: two hits
would put its actual blocker in the same strict cap as `c` and two distinct
points of `C`, contradicting the checked three-equidistant-points cap lemma.
Thus exact cardinalities 12--14 and the entire two-hit arm are eliminated.
The coordinator-interface frontier and immediate constructor fan-out remain
one.  This is a genuine two-coordinate narrowing (`|A| ≥ 15` and
`|selectedRow(c) ∩ C| ≤ 1`), but the surviving universal residual is still a
load-bearing `sorry`.

The exact-cardinality-15 four-row obstruction is now banked separately in
`BlockerVExactFifteenFourRowCoverage`.  Its finite theorem exhausts the two
source-compatible cyclic orders and all `15^4` choices of the four rows'
two-point outside supports.  Under pairwise cyclic separation, every one of
the `2 * 15^4` cases contains one of sixteen explicit three-row motifs.  A
proof-facing dispatcher sends those motifs to three cardinality-independent
strict-Kalmanson kernels in `KalmansonThreeEqualitySchemas`:

- `false_of_six_ccw_three_shell_equalities_140_250_354`;
- `false_of_five_ccw_three_shell_equalities_043_140_203`; and
- `false_of_five_ccw_three_shell_equalities_103_243_340`.

The three metric kernels use only `propext`, `Classical.choice`, and
`Quot.sound`.  The finite coverage theorem uses the accepted
`native_decide` compiler-trust boundary.  The dispatcher itself introduces no
new obligation.

The source adapter is now proved.  It derives the exact `(5, 4, 9)` closed-cap
profile at cardinality fifteen, exhausts the seven-point strict second-cap
interior by the seven named points, constructs the cyclic label embedding and the four
outside pairs, and proves `PositionEmbedding` and `RealizesRows` from the live
Rigid221 packet.  The bank theorem
`pairwiseSeparated_of_positionEmbedding_realizesRows` then derives
`PairwiseSeparated` from the injective CCW boundary and the two-center
bisector separation theorem; it is not a third source obligation.

Consequently
`false_of_exactFourRigid221_sourceHeavy_secondOppositeLarge_pentagonBlockerV_vRowBlockerDeleted_deletedRowBlockerOffClass_card_eq_fifteen`
is a checked contradiction with no `sorryAx`.  Its axiom closure is exactly
`propext`, `Classical.choice`, `Lean.ofReduceBool`, `Lean.trustCompiler`, and
`Quot.sound`, reflecting the accepted `native_decide` finite-coverage trust
boundary.  The authoritative targeted build of
`FrontierLiveClosure.Rigid221SourceHeavy` passes.

The old universal leaf is now a proved coordinator: its cardinality-fifteen
arm calls the theorem above, while its sole live child is the explicit
`..._card_ge_sixteen` theorem carrying `16 ≤ D.A.card`.  Thus exact
cardinalities 12, 13, 14, and 15 are closed for this Rigid221 residual.  This
does **not** exclude all 15-point P97 counterexamples or close the universal
parent branch; it narrows this one on-spine residual from `15 ≤ |A|` to
`16 ≤ |A|` without increasing active constructor fan-out.

During the bank audit a precedence bug in the original `PairwiseSeparated`
definition was corrected by parenthesizing the entire betweenness equivalence,
and the corrected `2 * 15^4` coverage was rerun and passed.

The exact-cardinality-16 stratum is now eliminated as well.  The cap-sum
identity leaves two second-cap profiles.  In the cap-ten profile, the eighth
strict-cap point belongs to none of the four selected rows, so deleting that
gap reduces the complete row packet to the checked exact-fifteen bank.  In the
cap-nine profile, the seven named points exhaust the strict cap interior and
there are seven outside points.  The new
`BlockerVExactSixteenFourRowCoverage` bank exhausts
`2 * 7 * choose(7, 2)^4` assignments: two source-forced orders, seven cyclic
positions for the anonymous outside point, and one outside pair for each of
the four rows.

Every pairwise-separated assignment contains one of the two previously
banked three-equality motifs or one of two new seven-point four-equality
motifs.  The latter are consumed by four orientation-neutral, general-cardinality
theorems in `KalmansonFourEqualitySchemas`.  Their axiom closures are exactly
`propext`, `Classical.choice`, and `Quot.sound`; only the finite coverage
theorem uses the accepted `native_decide` compiler-trust boundary.

The source adapters for both cap profiles are proved and the former
`..._card_ge_sixteen` theorem is now a checked coordinator.  Its sole live
child is
`false_of_exactFourRigid221_sourceHeavy_secondOppositeLarge_pentagonBlockerV_vRowBlockerDeleted_deletedRowBlockerOffClass_card_ge_seventeen`.
Thus exact cardinalities 12 through 16 are closed for this one on-spine
Rigid221 residual, and its lower frontier is now `17 ≤ |A|`.  This does not
exclude all 16-point P97 counterexamples.  Immediate constructor fan-out
remains one.

## 13.18 Rigid221 exact-17 three-shell obstruction bank (2026-08-06)

The exact-17 full-cover audit repeatedly produced contradictions supported by
three same-center distance equalities on only four, five, or six cyclically
ordered vertices.  The exact linear classifier has now exhausted that fragment
under positivity, strict triangle inequalities, and the full strict Kalmanson
system.  It finds 116 irreducible fixed-order patterns, partitioned into 24
orientation-preserving rotation classes (4 on four vertices, 12 on five, and
8 on six) and 12 dihedral classes.

`KalmansonThreeEqualitySchemas` now contains a kernel-clean representative of
every rotation class.  Seven previously missing chiral orientations were
added at this checkpoint; all have axiom closure exactly `propext`,
`Classical.choice`, and `Quot.sound`.  The generic theorem
`false_of_cyclicShift_ccw`, together with its concrete three-shell consumer,
provides the Lean soundness bridge from a checked fixed-order representative
to its cyclic rotations.  The exact-17 miner therefore expands the 40 literal
bank entries to all 116 classified rotations.  Reflections are not inferred:
both chiral rotation classes are represented explicitly.

This closes a theorem-bank coverage gap, not the exact-17 stratum.  The live
source hypotheses have not yet been proved to force one of the 116 motifs, and
the universal residual remains the load-bearing `..._card_ge_seventeen`
obligation.  The next accepted result must therefore be one of:

1. a source-faithful exact-17 coverage theorem forcing a banked motif;
2. a new bounded obstruction extracted from a surviving full-cover model and
   promoted to a cardinality-independent Lean theorem; or
3. a cardinality-independent producer/lift that bypasses exact-17.

The complete census, limitations, and theorem list are recorded in
`docs/rigid221-three-shell-classification-2026-08-06.md`.

## 13.19 Rigid221 exact-17 seven-point schema-C ingress (2026-08-07)

The first authenticated full-cover survivor after completing the three-shell
bank yielded a new bounded obstruction rather than a Euclidean model.  In its
true encoded boundary order, seven roles
`a < b < c < d < e < f < g` support five shell equalities centered at four
selected rows:

```text
a:{f,b},   f:{a,d,g},   c:{d,g},   e:{f,b}.
```

`KalmansonFourEqualitySchemas` now proves the resulting strict-Kalmanson
contradiction in both orientations and exposes direct selected-row consumers.
The two consumers have axiom closure exactly `propext`, `Classical.choice`,
and `Quot.sound`.  The production matcher checks the four row supports
directly, verifies that both Lean consumers are present, and has positive,
negative, reflected-order, fail-closed, and authenticated-terminal regression
tests.

The direct exact-17 CNF now blocks every rotation and seven-point subset in
both orientations, contributing 272,272 unique clauses.  The old terminal
assignment violates exactly one such clause.  Prior exact-17 checkpoints were
merged into 420 unique learned patterns before resuming CEGAR against the new
static bank.

This is the plan's intended computation-to-theorem loop: a finite survivor
produced a bounded obstruction, the obstruction became a kernel-clean general
theorem, and its source-faithful selected-row ingress was wired back into the
enumerator.  It does **not** yet prove that every exact-17 assignment contains
schema C, so the on-spine `..._card_ge_seventeen` theorem remains open pending
terminal Boolean UNSAT or the next authenticated survivor and obstruction.

## 13.20 Rigid221 exact-17 schemas D--F and successor wave (2026-08-07)

The first schema-C successor wave did not yield a live Euclidean model.  Its
authenticated terminal census is:

- 1,512 assignments examined by 16 independent workers;
- 1,451 assignments rejected by an already banked obstruction;
- 58 assignments rejected by exact linear arithmetic;
- three initial metric timeouts, all rejected on fresh exact replay; and
- 13 workers stopped at the configured iteration cap rather than terminal
  Boolean UNSAT.

The wave therefore produced new theorems, not exact-17 closure.  Three minimal
successor cores were promoted as schemas D, E, and F.  Each now has increasing-
and decreasing-order metric theorems plus increasing- and decreasing-order
direct selected-row consumers in `KalmansonFourEqualitySchemas`.  The
production matcher consumes the row supports directly and fails closed unless
the Lean consumers are present.  No producer without a consumer was added.

The static exact encoding adds 148,512 schema-D clauses, 148,512 schema-E
clauses, and 272,272 schema-F clauses.  With the 1,610 deduplicated learned
patterns from the completed wave, the C--F exact CNF has 272 variables and
1,933,791 clauses, with SHA-256 digest
`7b5c525ef0fa2422fd00aa752156e4530f266013b7cea658a98ff5816576bd0c`.

The next production action is the already launched 16-path successor search.
Its admissible outcomes remain the same: terminal Boolean UNSAT can feed the
exact-17 on-spine leaf, while any surviving assignment must be authenticated
and reduced to the next bounded obstruction with a direct source consumer.
Until one of those outcomes is proved, exact-17 and the universal Rigid221
parent remain open.

## 13.21 Generic two-Kalmanson cancellation bank (2026-08-07)

The exact-17 linear-UNSAT journals exposed a cardinality-independent
certificate family not covered by the fixed schemas A--G.  Take two strict
Kalmanson inequalities, each in either the adjacent-sides or inner-outer form.
If selected-row equalities identify the multiset of their four left-hand
distance terms with the multiset of their four right-hand terms, then summing
the strict inequalities gives the contradiction `X < X`.

`GenericRowNogoodCertificate` now contains a checked data representation for
the two ordered quadruples, the two Kalmanson forms, a permutation of the four
terms, and four executable row-equality paths.  The direct theorem
`false_of_twoKalmansonCancellationData_of_check` consumes convex independence,
the CCW boundary realization, the live selected-row metric equalities, and the
checked certificate.  Its audited axiom closure is exactly `propext`,
`Classical.choice`, and `Quot.sound`; it uses neither `sorryAx` nor
`native_decide`.

The production bank now searches the equality graph for this certificate
before invoking general linear arithmetic and fails closed unless the Lean
consumer is present.  Unit tests include an authenticated exact-17 core,
deletion of each indispensable row, and missing-consumer rejection.  All 33
producer-bank tests pass.

An authenticated replay over all 609 mined exact-17 `linear_unsat` journal
records matched 126 and left 483 unmatched.  The matches cover all four form
pairs: 45 adjacent/adjacent, 29 adjacent/inner-outer, 30
inner-outer/adjacent, and 22 inner-outer/inner-outer.  Thus roughly one fifth
of the previously expensive linear terminals now have a small ordinary-Lean
consumer.  This replay is theorem-family coverage of the recorded terminals,
not coverage of the exact-17 Boolean universe.

The live source-frozen wave was not restarted: its processes imported the
older bank before this checkpoint and have already learned the corresponding
row clauses through exact linear arithmetic.  Fresh successor launches will
use the generic matcher automatically.  Exact-17 and the on-spine
`..._card_ge_seventeen` obligation remain open.  A terminal exact-17
certificate still requires source-faithful Boolean coverage and a Lean
cardinality adapter; universal closure additionally requires a
cardinality-independent producer or lift.

## 13.22 Positive weighted Kalmanson cancellation bank (2026-08-07)

The 483 records left unmatched by the two-inequality consumer have now been
classified exactly.  Every one is supported only by strict Kalmanson
inequalities and selected-row equalities: no positivity or triangle inequality
is needed.  Of these, 401 cancel with unit coefficients.  All 483 admit a
positive rational cancellation; after clearing denominators and dividing by
the common factor, every coefficient is in `{1,2,3}`.  The largest recorded
certificate contains 53 inequalities, total integral weight 68, and uses 15
boundary points.

`GenericRowNogoodCertificate` now contains the cardinality-generic checked
consumer
`false_of_weightedKalmansonCancellationData_of_check`.  Its data repeats the
two left and two right edges of each strict Kalmanson inequality according to
its positive natural-number weight.  Executable checks verify cyclic order,
positive weights, equality of the two repeated-edge multisets, and one
primitive selected-row/edge-flip equality path for every paired occurrence.
The theorem then sums all strict inequalities and contradicts the checked
multiset equality.  Lean reports axiom closure exactly `propext`,
`Classical.choice`, and `Quot.sound`.

The production interface keeps discovery and checking separate.  Z3 may
propose the primitive weights, but
`certify_weighted_kalmanson_cancellation` independently reconstructs and
checks the exact integral cancellation before it emits a record naming the
Lean consumer.  It fails closed if the consumer source is absent.  The 33-test
producer-bank suite includes an authenticated non-unit exact-17 core, rejection
of an altered weight, and missing-consumer rejection.

Authenticated replay checked all 483 remaining records.  Combined with the
126 two-inequality matches from §13.21, every one of the 609 mined exact-17
`linear_unsat` records now belongs to a kernel-clean cardinality-independent
certificate family.  The weighted replay artifact is
`scratch/rigid221-blockerv-exact17-20260806/weighted-kalmanson-consumer-replay.json`
with SHA-256
`c2daa7eafa2e275370b9b83c00e1768c5b1598ee21a396ea6313955c32f986b2`.

This closes the theorem-soundness classification of the recorded linear
terminals, not exact-17.  The live on-spine leaf still needs a source-faithful
finite-coverage theorem showing that every exact-17 Boolean survivor is
eliminated, followed by its cardinality adapter.  Universal closure of the
`17 ≤ |A|` residual additionally needs a cardinality-independent producer or
lift.

## 13.23 Exact-17 cap reductions and cap-nine frontier (2026-08-07)

The source packet itself gives a deterministic reduction for two of the three
exact-17 second-cap profiles.  When the second cap has cardinality eleven, its
strict interior has nine points.  The seven named Rigid221 points occupy seven
of them, and the four source rows omit both remaining points.  Deleting those
two gaps gives a cyclic-order-preserving double-skip embedding into the checked
exact-15 four-row bank.  When the second cap has cardinality ten, the analogous
single unused point reduces to the checked exact-16 bank.

The corresponding Lean theorems
`..._card_eq_seventeen_secondCapEleven` and
`..._card_eq_seventeen_secondCapTen` are source-clean.  Their audited axiom
closures are exactly `propext`, `Classical.choice`, `Lean.ofReduceBool`,
`Lean.trustCompiler`, and `Quot.sound`: no `sorryAx`, with the compiler trust
coming only from the accepted finite-bank `native_decide` boundary.

The former single `17 ≤ |A|` child is therefore a checked coordinator with two
live children:

1. exact cardinality seventeen with second-cap cardinality nine; and
2. `18 ≤ |A|`.

This is a genuine two-coordinate narrowing, but it is not full exact-17 or
full-P97 closure.  The cap-nine child is now the only exact-17 stratum of this
Rigid221 residual and is the source-faithful CEGAR target.  Because the split
replaces one live leaf by two narrower live leaves, immediate constructor
fan-out changes from one to two even though the ten- and eleven-cap strata are
closed.

## 13.24 FreshThird acyclic hard-residual reduction (2026-08-08)

The outside-first FreshThird ingress has now been normalized all the way to a
single downstream hard residual.  The source-clean producer remains in
`TwoSourceFreshThirdRetainedProducer.lean`, while its consumers and adapters
have moved to `TwoSourceClosure.lean`, after the exact-row terminal bank.  This
placement avoids an import cycle and allows the split to consume existing
terminals rather than restating their hypotheses upstream.

The broad theorem
`false_of_twoCapSources_freshOutsideFirstBlockerFiber_acyclicIngress` now has
an ordinary Lean proof.  Its `#print axioms` still contains `sorryAx`
transitively, because it calls the new load-bearing theorem
`false_of_twoCapSources_freshOutsideFirstBlockerFiber_acyclicHardResidual`.
Thus this checkpoint is a one-for-one strict frontier strengthening, not an
unconditional or net `sorry` closure.

The new residual has exactly three provenance-preserving constructors.  Its
first constructor has since been strengthened by one further source-clean
normalization:

1. an aligned retained packet together with reciprocal source-row
   cross-membership, a source-checked shared-endpoint deletion-core packet,
   and the exact first-fiber remainder described below;
2. an aligned retained packet together with one of the two oriented
   six-center source-provenance exact-row packets and its source-produced
   fixed-triple audit frame; or
3. a common-radius canonical surface together with one of the same two
   oriented six-center source-provenance exact-row packets and its
   source-produced fixed-triple audit frame.

The eliminated common-radius reciprocal-incidence arm is split by blocker
equality.  Distinct blockers close with the source-clean mutual-membership
terminal.  Equal blockers route to the existing exact-row first-fiber
collision terminal; that route remains transitively dependent on the two
claimed exact-row obligations in `TwoSourceFirstFiberCollision.lean`, so it
must not be reported as project-level closure.

A repository-scoped agentic theorem-bank search found no universal consumer
for the raw `SixCenterDeletionSurvivalPacket`.  The nearby hits are
exact-cardinality results or downstream wrappers.  The raw packet is no
longer the hard-residual interface: ordinary Lean theorem
`sixCenterDeletionExactRowsBoundary_of_survival` now materializes all six
survivors as exact deleted K4 rows.  Its new
`SixSurvivorExactRowsBoundary` retains the complete existing
`FiveSurvivorExactRowsBoundary`, an exact four-point row for the sixth center,
the sixth center's inequality from the deleted point's blocked actual center,
and the six-center cardinality-six fact.
`twoCapSourcesSixCenterExactRowsBoundary_of_survival` performs the conversion
without choosing a source orientation, and both one-sided constructors now
carry a strengthening of `TwoCapSourcesSixCenterExactRowsBoundary`.
`SixSurvivorExactRowsSourceProvenanceBoundary` additionally preserves the two
collision sources in `B₀`, the complete four-label support equality for
`B₁`, the surviving source in `B₅`, and common-deletion omission from all
three rows.  The orientation-preserving wrapper is
`TwoCapSourcesSixCenterSourceProvenanceBoundary`, derived by ordinary Lean in
`twoCapSourcesSixCenterSourceProvenanceBoundary_of_exactRows`.  The six-row
boundary itself now produces a `U3FixedTripleAuditFrame` at the deleted
point's actual blocker center through
`SixSurvivorExactRowsBoundary.exists_fixedTripleAuditFrame`, and
`SixSurvivorExactRowsBoundary.exists_u3AuditObstruction` composes it with
`U3FixedTripleAuditFrame.exists_qDeleted_escape_or_criticalFourShell` to
produce the exact escaping-row/critical-shell witness.  The oriented wrapper
`TwoCapSourcesSixCenterSourceProvenanceFixedTripleAuditBoundary` retains that
explicit obstruction in both six-center constructors, and is now the actual
hard-residual interface.  This is a one-for-one source-clean strengthening of
the same load-bearing residual, not a `sorry` closure.  Fixed-`n` UNSAT may mine a bounded
obstruction from this exact ingress, but it cannot promote directly until Lean
has either a source-level bounded-core theorem or a general-cardinality lift.
Erasing the aligned versus common-radius provenance would still weaken the
landing contract.

The live FreshThird surface now has an explicit source-clean cardinality
contract.  `card_ge_seventeen_of_one_cap_card_ge_eight` combines the cap-sum
identity with one indexed cap of cardinality at least eight and all three caps
of cardinality at least six.  Its FreshThird adapter
`twoCapSourceSurface_carrier_card_ge_seventeen` applies the designated
first-cap bound and the tri-apex all-large-cap context, proving
`17 ≤ D.A.card`.  Consequently exact 15 and 16 are not live FreshThird strata:
an exact-15 run is useful only as a deliberately incomplete negative control,
not as evidence about this residual.  Exact 17 is the minimum source-compatible
finite diagnostic, but even exact-17 UNSAT cannot close the universal leaf
without the bounded-core theorem or general-cardinality lift just described.
At that minimum, `twoCapSourceSurface_exact_seventeen_cap_profile` sharpens the
contract to the exact indexed cap profile `(8, 6, 6)`, with the designated
first cap having cardinality eight.

The bounded exact-17 canary includes the C-side paired incidence and pointwise
cap-composition abstraction.  It does **not** encode the complete live
`FreshOutsideFirstBlockerFiber` ingress: `C.firstSource` and `C.secondSource`
are first-cap-interior points, whereas `Q.source` and `Q.otherOutsidePoint`
lie outside the closed first cap.  The C-side abstraction is **SAT** in Z3 4.16.0,
with an independently checked concrete assignment.  cvc5 1.3.3 returned
`unknown` on the unpinned full positive formula after 30 seconds, but accepted
the complete Z3 assignment when every variable was pinned.  Both solvers reject
all ten malformed-clause controls; exact-15 live-cap arithmetic is separately
`UNSAT`, as it must be because the live FreshThird surface forces cardinality at
least seventeen.  The exact-17 model has cap profile `(8, 6, 6)`, strict
interior profile `(6, 4, 4)`, exactly four first-cap interior points after the
two distinct cap sources are removed, and at least five blocker centers.
The last fact is only the finite pigeonhole consequence of the source-clean
blocker-fiber bound: seventeen sources and fibers of cardinality at most four
require at least five centers.  The positive model still omits the live
four-point role-separation invariant, Euclidean metric constraints,
selected-class adjacency, boundary/cyclic order, crossing data, and the
universal lift.  It is therefore a diagnostic consistency witness for the
C-side retained abstraction, not a Euclidean counterexample or Lean closure.
The audited artifacts are under
`scratch/p97-consumer-first/freshthird_six_center_global_k4_v2/`.

A consumer-first audit of that six-row packet found no direct contradiction
theorem.  The nearest source-clean terminals are
`CapCrossingKalmansonBridge.false_of_six_ccw_two_k2_three_selected_rows`,
`SixPointSparseEuclideanObstruction.false_of_six_ccw_two_selected_rows`, and
`SixPointEuclideanObstruction.false_of_six_ccw_three_selected_rows`.  The six
deleted K4 rows convert source-cleanly to `SelectedFourClass` rows, but the
packet does not yet supply boundary indices and cyclic order or the six to
eight cross-row support memberships those terminals require.  Therefore the
next six-center producer must expose order and cross-row incidence; merely
materializing more row wrappers would not reduce the live frontier.

One cardinality-independent obstruction has nevertheless been isolated and
proved at the generic selected-four-class level:
`selectedFourClass_inter_pair_card_le_one_of_two_saturated_centers`.  Once two
distinct carrier centers are already equidistant from a retained pair, every
selected four-class at a third distinct center meets that pair in at most one
point.  The six-center specialization applies this to both remaining physical
rows `B₃`, `B₄` and both retained source pairs.  This is a pinned-
multiplicity exclusion cut, not a contradiction: anonymous filler points can
still complete all four-point rows.  The smallest positive producer that
would close through the existing bisector consumer must instead force at least
one of the four opposite incidences

```text
P-pair ⊆ B₃  ∨  P-pair ⊆ B₄  ∨  Pρ-pair ⊆ B₃  ∨  Pρ-pair ⊆ B₄.
```

Any arm supplies a third distinct perpendicular-bisector center and closes
immediately.  The current source interface proves the complementary
cardinality-at-most-one facts, so the missing theorem has to use additional
global K4/minimality or cyclic-order information; another local incidence
matrix cannot manufacture it.

The completed exact-17 model confirms that this positive incidence is not
forced by the retained incidence and pointwise cap-composition clauses: each of
`B₃` and `B₄` may avoid, or meet in only one point, either retained pair,
and the two rows may jointly avoid either pair.  A support-level lower bound on
their own-cap interior intersections can be reconstructed by replaying the
adjacent one-hit/outside argument, but anonymous fillers make that strengthening
compatible with the model, so it is not a closure producer.  Construction of
the `U3FixedTriplePacket`, `U5DangerousTriple`, and bounded audit frame is no
longer missing: the six-row boundary supplies all three source-cleanly.  The
exact remaining terminal premise is `RowwiseConfinedQDeletedClasses`, or,
equivalently, a source-level contradiction for the explicit alternative
produced by `U3FixedTripleAuditFrame.exists_qDeleted_escape_or_criticalFourShell`.
That theorem must either confine every audit-center q-deleted row to the bounded
support, or rule out the escaping row / ambient critical-shell alternative
using the six-center provenance, global K4/minimality, or cyclic order.  A separate
finite-set observation—four exact four-point rows with pairwise intersections
at most two have union cardinality at least seven—is sharp and may be banked as
a solver cut, but it does not close the universal residual.

The earlier first-nonhit alignment proposal is now rejected.  Constructor by
constructor, the non-hit alternatives either contradict one requested
membership, put the two named points in the wrong row, identify rather than
separate the centers, or place a named point inside the cap where the proposed
alignment requires it outside.  Moreover the bank already proves every such
alignment impossible.  Therefore a theorem producing the alignment would
already be a proof of `False` and provides no intermediate bridge.

The aligned ingress has now been strengthened before any further finite work.
`FreshThirdAlignedRetainedConsumerPacket` retains a complete
`FreshThirdAlignedSourceDeletionCorePacket` for **each** canonical cap source,
not only for the first source, and it retains the original
`FirstCapMultiPointRadiiRetained` hypothesis so later consumers may reselect
deletion endpoints without reconstructing alignment.  Each packet records the chosen endpoint from
each retained pair, both endpoint omissions from the source row, survival of
that exact source row after the double deletion, failure of every first-apex
K4 after the same deletion, and the resulting first-apex
`MinimalDeletionCore`.  This is an ordinary source theorem and the focused
build is green.  It fixes a real information-loss defect: the minimal-core
structure records its restored rows but deliberately does not retain the
fully-deleted first-apex failure from which it was produced.

The promised finite-role extraction is now also kernel-checked.  The fixed
payload is named `FreshThirdAlignedFixedDeletionCorePacket`; the exhaustive
four-way disjunction for one source is
`FreshThirdAlignedSourceDeletionCoreCases`; and
`freshThird_alignedRetainedConsumerPacket_sourceDeletionCoreCases` derives
that disjunction for both canonical sources.  Hence the aligned constructor
has exactly sixteen joint endpoint-choice arms before blocker equality or
any further geometric split.  This coverage theorem is universal in the
carrier and introduces no upper-cardinality truncation.  It is the required
Lean ingress for a new finite schema, not by itself a contradiction.

The reciprocal-membership arm has since been reduced further by ordinary Lean
proof.  The exact two-pair omission split gives either a collision endpoint
omitted from both source rows or complementary endpoint memberships.  The
complementary arm is impossible: equal blockers would put the two sources and
all four collision endpoints on one four-point support, while distinct
blockers contradict the checked off-cap bisector terminal.  Therefore
`commonCollisionEndpointOmission_of_mutualCrossMembership` produces a common
omitted endpoint without choosing one as an assumption.

That endpoint is no longer discarded.  The fixed-endpoint theorem
`freshThird_acyclic_fixedDeletionCorePacket_of_omitted` shows that any omitted
endpoint chosen from each retained pair produces the complete survival,
first-apex failure, and minimal-core packet.  Consequently
`freshThird_alignedCommonDeletionCorePairPacket_of_commonOmission` preserves
one endpoint shared by the two source deletion cores while allowing the other
endpoint to differ.  This is the strengthened first constructor of
`FreshThirdAcyclicHardResidual`.  At the finite role level the original sixteen
joint choices satisfy `x₀ = x₁ ∨ y₀ = y₁`, leaving twelve unique arms.

The aligned reciprocal-incidence constructor is now reduced one step further
by the ordinary Lean theorem
`freshThird_alignedMutualFirstFiberResidual_of_mutualCrossMembership`.  It
produces exactly one of:

1. an equal-blocker packet carrying blocker equality, a common indexed
   cap-interior location for the blocker center, and equality of the two exact
   selected supports; or
2. a distinct-blocker packet that records which blocker lies in the first
   strict cap, the exact intersection of that blocker's row with the first
   cap, and a fully normalized
   `FirstFiberOutsidePairExactRowsOrCrossedThreeRowsResidual` in the matching
   source orientation.

For distinct blockers, the checked ordered-cap bisector theorem shows that at
least one blocker's **interior index** is the first cap.  The existing
first-fiber outside-pair theorem gives the corresponding raw exact-row/crossed
residual; `selectedShell_inter_firstCap_eq_sourcePair` and
`firstFiberOutsidePair_exactRows_or_crossedThreeRows` then promote it to exact
supports for all three named rows in either crossed constructor.  The
strengthened packet retains blocker distinctness, positive first-cap interior
membership, and the source orientation instead of forcing later consumers to
reconstruct them.
The equal-blocker arm is retained explicitly but no longer as a bare equality.
`exists_blockerCenter_mem_capInteriorByIndex` supplies its common cap index,
and `selectedSupports_eq_of_actualBlockers_eq` supplies the common exact
support.  The packet now also records a conditional first-cap consequence: if
the common index is `oppIndex1`, the common row meets the first cap in exactly
the two canonical sources and all four collision endpoints are omitted from
both source rows.  This follows from the general two-point cap/selected-row
bound and does not assume equal first-apex radii.  The index is deliberately
not identified with the first cap: aligned retention gives different
first-apex radii, so the existing common-radius equal-blocker shell theorem is
not applicable.  This is a strict strengthening of the existing hard
residual, not a new `sorry` and not a closure claim.  The focused
`TwoSourceClosure` build is green.

The crossed-three-row/shared-fourth subcase has now been tested against the
strongest local Kalmanson projection currently justified by the named packet.
The v1 census imposed its three exact selected-row equalities on all 60 strict
six-role cyclic orders and left 40 SAT orders.  The v2 census added the two
source-proved cross-distance disequalities, split into four strict sign arms;
190 of 240 arms were UNSAT in both Z3 and cvc5, but 50 survived.  Restricting
those survivors to the contextual first-cap placement in which the three row
centers form one cyclic cap block leaves 18 orders and 72 sign arms: 66 are
UNSAT and six survive.  A final QF_NRA probe placed each of those six survivors
as an actual strict convex Euclidean hexagon; all six are SAT, and one has an
exact rational coordinate model checked by direct substitution against all 25
projected constraints.  Thus even the three exact row equalities, both cross
signs, strict convexity, and the contiguous center-cap block do not imply a
Kalmanson contradiction.  This refutes that projected consumer bridge, not the
full Lean source packet.  The reproducible artifacts and exact witness are
under
`scratch/p97-consumer-first/freshthird_crossed_shared_fourth_v{1,2_cross_inequalities,3_convex_cap_block}/`.
No larger local order matrix is justified here until a new global source
theorem supplies collision-source provenance, blocker-map saturation, or
another carrier-wide K4 clause that excludes the rational survivor.

The first requested blocker-map saturation clause is now source-proved, but
it does **not** exclude the shared-fourth rational survivor and therefore does
not justify rerunning the v1--v3 shared-fourth matrix.  For an arbitrary
`FirstFiberCrossedThreeRowExactSupports` packet with distinct mutually
incident source blockers,
`FirstFiberCrossedThreeRowExactSupports.sharedFourth_or_sourceDeletionSaturation`
proves either equality of the two unnamed fourth points or a `3 × 3` product:
each fourth point independently survives deletion of the first source,
survives deletion of the second source, or has the only source-blocker
equality compatible with its crossed support.  The companion theorem
`sharedFourth_or_selectedRowOmissionSaturation` converts the six survival
alternatives, through the general
`cross_deletion_survives_iff_not_mem_selected_support`, to exact omissions
from the canonical selected rows at the two fourth points' actual blockers.
Both results are cardinality-independent ordinary Lean producers.  They add
no assumption and close no `sorry`.

This clause is distinct from the older
`freshthird_cross_deletion_cegar_20260807.py` and
`freshthird_cross_deletion_metric_cegar_20260808.py` abstractions.  Those
scripts model a cap-synchronized survivor pair and a separate independent
mutual pair; they do not retain the typed crossed packet, its two named fourth
points, this ten-way split, or a universal Lean lift.  Conversely, the new
Lean theorem supplies only row omission or blocker equality.  It does not yet
supply a cyclic position, cap index, or positive support incidence for either
new actual-blocker row.  A pure local incidence encoder can therefore satisfy
the nonshared branches with anonymous row fillers, while the shared branch is
already realized by the exact rational v3 witness.

That localization step is now source-proved.  The ordinary Lean theorem
`exists_blockerCenter_capIndex_and_boundaryPosition` assigns the actual
blocker of either fourth point to one indexed cap and the corresponding
direct/mirrored boundary interval.  Applying it to both fourth points gives a
cardinality-independent cap/order packet for every one of the ten saturation
branches; it adds no assumption and closes no `sorry` by itself.

The first finite campaign over the combined packet is recorded under
`scratch/p97-consumer-first/freshthird_crossed_saturation_v1/`.  It
materializes both fourth-point selected rows as genuine exact four-element
supports, preserves physical-point aliasing, enumerates both source
orientations, all ten saturation branches, and the twelve source-deletion arm
pairs, and treats its 27 slots only as a compression of the named points and
anonymous row members—not an ambient-cardinality bound.  An initial weaker
over-approximation omitted the live endpoint-pair disjointness and first-cap
membership clauses; its 240/240 SAT result is retained only as a diagnostic.
After those source clauses were restored, all 240 positive cases remained SAT
in both Z3 and cvc5, while the overfull-row and equal-source-blocker controls
were UNSAT in both solvers.  Therefore the complete named
incidence/cap/order/saturation layer still does not close a branch.

The mandatory post-round global theorem-bank pass found no already-proved
terminal combination that closes a survivor.  The exact blocker-function,
row-equality, omission-saturation, and shared-pair cyclic-separation theorems
are already represented.  The remaining live consumers require additional
metric/cyclic row interaction or full `MinimalDeletionCore` semantics.

That last reusable-consumer refinement has now also been exhausted.  The
branch-survival rerun universally forbids every instance, over the six
materialized actual selected rows and the compressed actual boundary order,
of both
`CapCrossingKalmansonBridge.false_of_two_selected_rows_shared_late_pair` and
`CapCrossingKalmansonBridge.false_of_four_selected_rows_chained_late_pair`.
All twenty orientation/saturation-branch representatives still have a
deletion-arm witness that is `SAT` in both Z3 and cvc5; the two negative
controls remain `UNSAT` in both solvers.  This represents the same 240-case
logical space, with sound early stopping after the first existential arm
witness in each branch.  The authenticated summaries are
`results/kalmanson_two_row_branch_survival/summary.json` and
`results/kalmanson_two_four_row_branch_survival/summary.json` under the v1
campaign directory.  The four-row replay uses shared definitional atoms for
row-at-center membership and selected-row center rank; this shrinks each SMT
artifact without changing its formula.

The mandatory global bank pass after each Kalmanson round found no further
consumer whose antecedent is supplied by this ingress.  The three-, six-, and
seven-row Kalmanson consumers require positive support incidences, metric
equalities, or additional ordered rows that the deletion-omission packet does
not produce.  Therefore **pause this local structural CEGAR lane**.  Its next
admissible input is one new cardinality-independent source theorem producing
one of those positive motifs, a full minimal-deletion-core consequence, or a
formally stated bounded obstruction with arbitrary-cardinality lift.  Do not
assign invented identities or incidences to anonymous fillers, and do not add
another existing-consumer matrix without such a producer.

The source-provenance strengthening justified one fresh, bounded
named-incidence canary under the new schema namespace
`freshthird_six_center_provenance_v1`.  It encoded only the six exact
four-point rows, common-deletion and own-center omission, the new `B₀`/`B₁`/
`B₅` labels, and the eight-incidence motif consumed by
`U5QDeletedK4Class.three_exact_classes_tetrahedron_incompatibility`.  Z3 4.16.0
reports `SAT` both with some motif required and with all such motifs forbidden;
the four provenance-negative controls are `UNSAT`.  Therefore the new source
facts are correctly represented but do not propositionally force that checked
tetrahedron consumer.  This canary does not encode Euclidean realizability,
carrier-wide K4, cap order, or a general-cardinality lift, so it is negative
theorem-discovery evidence rather than closure.  The script, survivor, and
trust statement are under
`scratch/p97-consumer-first/freshthird_six_center_provenance_v1/`.
Do not enlarge this incidence schema.  The next admissible input is a uniform
source theorem adding a cross-row center incidence, a common support point, or
cyclic-order information, or a different checked consumer that matches the
actual `B₀`/`B₁`/`B₅` packet.

The independent v1 structural canary for the pre-normalized sixteen-arm packet
is source-faithful at the named Boolean/cardinality layer: Z3 reports `SAT` for
its positive instance, the deliberately overfull-row negative smoke is
`UNSAT`, and cvc5 independently replays the same `sat`/`unsat` pair.  It does
not encode Euclidean geometry or `MinimalDeletionCore` internals.  This is an
important negative result: row cardinality, reciprocal incidence, singleton
slices, endpoint omissions, and Boolean existence of the two deletion cores
do not close the branch.  A larger structural matrix with no new geometric or
global source theorem is therefore not a production task.

The source-faithful v2 structural canary then encoded the strengthened
shared-endpoint packet itself.  It enumerated all twelve unique joint arms,
with independent Z3 and cvc5 checks.  Every positive arm is `SAT`; the
overfull-row and missing-common-endpoint negative smokes are `UNSAT` in both
solvers, and the fail-closed `UNKNOWN` smoke is rejected.  This exhausts the
present support/cardinality/deletion-existence abstraction: enlarging that
Boolean schema cannot close the live branch.  The exact artifacts and landing
contract are under
`scratch/p97-consumer-first/freshthird_aligned_common_deletion_v2/`.  These
results are theorem-discovery diagnostics, not Euclidean models, a universal
lift, or a Lean closure.

The v3 source-fidelity expansion added the exact four-point `Q` first-fiber row
and expanded each nonempty minimal core to two exact-four ambient shell
supports with their checked pairwise disjointness.  All twelve shared-endpoint
arms remained `SAT` in both Z3 and cvc5.  The overfull-source-row,
overfull-`Q`-row, and forced-core-overlap negative smokes were `UNSAT` in both
solvers.  Thus the named `Q` row and the presently exposed minimal-core shell
facts still do not yield a structural contradiction.  The artifacts and exact
origin/landing contract are under
`scratch/p97-consumer-first/freshthird_aligned_q_core_v3/`.

The v4 metric projection then exhaustively checked all `(8-1)!/2 = 2520`
cyclic orders of the eight named collision, blocker-center, and `Q` labels
modulo rotation and reversal.  Each arm imposed positive symmetric distances,
strict triangle inequalities, all strict convex-boundary Kalmanson inequalities,
and only the source-justified first-fiber shell equality.  Every order was
`SAT` in Z3, with zero `UNSAT` or `UNKNOWN` arms.  This is again a bounded
diagnostic, not a Euclidean realization.  It proves that cyclic order plus the
single named row equality cannot close the branch; a larger local
Kalmanson model is forbidden until a new source theorem supplies an additional
row equality or global clause.  The artifacts are under
`scratch/p97-consumer-first/freshthird_aligned_q_kalmanson_v4/`.

The first finite canary for the strengthened equal-blocker ingress is also
complete.  It encodes the actual equal blockers, their existential common
indexed cap, exact selected-support equality, reciprocal source membership,
both retained deletion packets, and the common deletion-core endpoint.  It
does **not** identify the common cap with the first cap.  The refreshed canary
now guards the exact shell/cap intersection and all-endpoint-omission clauses
by `commonIndex = oppIndex1`, exactly as the Lean producer does.  The guarded
first-cap arm is `SAT`, and all twelve normalized shared-endpoint arm pairs
remain `SAT`; the overfull-row and deliberately missing-common-endpoint
controls are `UNSAT`, and `UNKNOWN` is fail-closed.  No arm is pruned.
The exact source-origin and landing contract are recorded beside the artifacts
under `scratch/p97-consumer-first/freshthird_aligned_mutual_ingress_v1_*`.
Therefore the strengthened equal-blocker packet still needs a new metric or
global source theorem; Boolean support/deletion constraints alone cannot close
it.

The six-center lane has also preserved the tri-apex S6/D44 provenance through
the common deletion in a source-clean scratch theorem.  For the two apices
outside the first cap, the same theorem couples each surviving full selected
class to its actual cap-interior slice: S6 retains one class of cardinality at
least five with at least four points in the corresponding cap interior; D44
retains two distinct-radius cap slices of cardinality at least two together
with the original full-class survivor disjunction.  This is a valid ingress
strengthening, but it has not been promoted because it has no consumer yet.

The corrected tri-apex matrix then tested all eight S6/D44 assignments under
both blocker modes with one shared deletion.  Its final `separated` tier also
enforces the source-level disjointness of the second and third cap interiors
and excludes both canonical first-cap sources from those two interiors.  All
16 positive queries remain `SAT` in both Z3 and cvc5; all nine negative
controls are `UNSAT` in both.  Thus the missing six-center contradiction is
not cap-interior separation or the coupled rich-slice cardinality alone.  The
survivors still evade any relationship between the anonymous exact deleted
rows and the actual radius/source/order identities needed by a metric
consumer.  The artifacts and trust statement are under
`scratch/p97-consumer-first/freshthird_aligned_q_core_v6/tri_apex_rich_matrix/`.
This remains theorem-discovery evidence, not a bounded-obstruction theorem,
universal lift, Euclidean realization, or Lean closure.

The existing retained/mutual CEGAR script is not a production encoder for this
constructor.  Its variables called `mutual` describe omission/deletion
survivors rather than the two actual cross-row memberships.  It also omits the
typed canonical sources, unequal first-apex radii, singleton first-apex cap
slices, the two endpoint choices, exact source-row omissions, the two
double-deletion K4 survivors, their first-apex failures and minimal cores, and
the blocker/source/cyclic-order data needed by a lift.  Its structural scan and
model-specific metric UNSAT results therefore remain diagnostic only.  The
replacement finite ingress must be extracted from the strengthened packet,
must enumerate the two-by-two endpoint choices for both source orientations,
and must state its universal Lean lift before any UNSAT result is promoted.

The apparent theorem-bank shortcut through
`false_of_twoDistinctExactFourMutualOmissionJointDeletions` has now been
audited against the live aligned packet and is **not** a closure route.  Its
equal-blocker arm immediately consumes the still-open producer
`b1_globalGapOrClosedTerminal_of_counterexample`; its distinct-blocker arm
also reaches open global leaves after the checked cross-omission split.  The
only unconditional geometric kernel extracted from that proof is the usual
three-distinct-bisector contradiction.  It cannot be instantiated here:
the two aligned cap sources have provably different distances from
`S.oppApex1`, so the physical first apex is not the required third bisector.
Likewise, the two source-produced `MinimalDeletionCore`s reconstruct the same
two retained first-apex radius classes.  They prove disjointness and the
already-compatible first-cap lower bound six, but do not produce a new shell,
third bisector, strict descent, or contradiction.  Repackaging either result
would therefore only move a `sorry`, not close one.

The exact-17 aligned-boundary v1 canary is a bounded, role-defective diagnostic;
it does not establish that adding the complete live incidence and cyclic-order
ingress leaves the gap open.  The model under
`scratch/p97-consumer-first/freshthird_aligned_boundary_v1/` combines the
exact-17 global incidence layer with the full
`FreshThirdAlignedMutualBlockerBoundaryPacket`: distinct indexed blocker caps,
the zero/surplus/first-/second-apex boundary placements, both direct and mirror
cap-block orders, cyclic separation, two reciprocal finite rows, unequal
first-apex radii and singleton slices, the common omission, and the
source-produced deletion-core facts.  One reciprocal row incorrectly uses
`q_source = Q.source` as a canonical C source, contradicting the live
role-separation invariant.  Both the direct and
mirror positive instances are `SAT` in Z3, with independently validated
assignments; cvc5 returned `unknown` on the unpinned positives.  Both solvers
reject the four malformed controls (overfull row, missing common omission, bad
boundary order, and bad cyclic separation).  This is finite diagnostic
evidence only, not a Euclidean realization or universal lift, and it exhausts
only the role-defective finite adapter.  It does not exhaust the complete live
named incidence/order packet.  Any repaired schema must first keep the two
canonical C sources separate from the two outside Q points.

The crossed-radius branch has since passed the first of those producer gates.
The source-clean ordinary-Lean chain
`selectedClass_exactOne_eachAdjacent_of_card_four_of_interior_card_two`,
`exactFourTwoRadiusAdjacentCapGrid`,
`exists_fourHits_radialCyclicOrder_oppIndex1`, and
`freshThird_exists_fourHits_strict_cross_distance` extracts four adjacent-cap
hits on the two exact first-apex radius classes, places them in one
cut-independent convex cyclic order, and proves the strict inequality

```text
dist rL rR + dist rhoL rhoR < dist rL rhoR + dist rhoL rR.
```

Targeted builds pass and the new declarations' transitive axiom closures do
not contain `sorryAx`.  This is a **producer**, not a contradiction: the live
packet still has no source-entitled reverse weak inequality or equality for
the same four points.

The pre-role-audit exact-17 metric replay under
`scratch/p97-consumer-first/freshthird_adjacent_grid_metric_v1/` preserves the
live cap/block permutation and disjointness of unequal exact radius supports,
but it inherits the v1/v2 canonical-source role defect.
Four of the eight discrete order arms survive the structural layer.  Their
complete 17-point MEC, non-obtuse-apex, strict-convex-order, exact-cap, and
coordinate-linked distance stages are exact Z3 `SAT` with independent exact
readback.  A rational-circle parameterization has now resolved the first
semantically connected metric stage for the frozen direct-0 arm: one exact
rational 17-point witness satisfies the eight prescribed first-apex circle
memberships, every first-apex nonmembership, and the strict radius order.
Independent `Fraction` readback checks all 680 strict boundary triples, the
MEC/disk and non-obtuse-apex conditions, exact cap composition, distinctness,
and every radius predicate.  Pinning that witness into the original
unparameterized `grid_members` and `grid_exact` formulae returns `SAT` from
both Z3 and cvc5.  All four frozen support projections also have exact rational
witnesses, although only direct-0 has been carried through the full geometry
and exact grid at this checkpoint.

This is an exact **local CE motif**, not a P97 counterexample and not a
FreshThird closure.  The two blocker-centered exact source rows, singleton
own-cap source slices, the strict Kalmanson conclusion, unsampled incidence
signatures, carrier-wide K4/minimality, and any general-cardinality lift remain
omitted.  The earlier apparent contradictions were encoding defects (a stale
cap permutation and support overlap between unequal radii) and were removed.

A subsequent ingress audit found a further role-separation defect in the
aligned finite adapter.  The canonical sources `C.firstSource` and
`C.secondSource` both lie in `S.capInteriorByIndex S.oppIndex1`, while the
`FreshOutsideFirstBlockerFiber` source `Q.source` and its
`Q.otherOutsidePoint` both lie outside the closed first cap.  Therefore the
adapter may not identify either canonical source with either outside point.
The source-clean Lean ingress invariant
`canonicalSources_ne_freshOutsideFirstBlockerFiber_outsidePoints` records all
four inequalities.  The earlier aligned adapter mislabeled
`q_source = Q.source` as one of the two canonical C sources, so its exact
rational witness remains valid evidence
for the local adjacent-grid motif only; it is not a model of the complete live
aligned ingress.

The corrected CEGAR contract must consequently retain four separate named
points—`C.firstSource`, `C.secondSource`, `Q.source`, and
`Q.otherOutsidePoint`—together with three separately proven row packets: the
two canonical-source selected rows and the exact first-collision row
`{P.source₁, P.source₂, Q.source, Q.otherOutsidePoint}`.  The immediate CEGAR
task is to add those exact rows and the singleton canonical-source slices to
the parameterized model before invoking any global consequence.  A frozen
diagnostic in which two generic blocker-centered rows shared three
noncollinear points was `UNSAT` in Z3 and cvc5, as forced by the ordinary
circle-intersection bound, but that frozen row identification did not preserve
the three live row roles and is not closure evidence.

The first corrected three-role replay now uses `C.firstSource = 0`,
`C.secondSource = source5`, and the separate outside pair
`(Q.source, Q.otherOutsidePoint)`.  Its three exact rows are centered at the
actual blockers `b_at(0)`, `b_at(source5)`, and `b_at(Q.source)`.  This repairs
the point-role collision but does not yet instantiate the aligned-mutual hard
constructor: its frozen first C row contains `source5`, while its frozen second
C row omits `0`, contradicting the required
`TwoCapSourcesMutualCrossMembership`.  It is therefore a role-correct but
branch-incomplete diagnostic.  Unpinned Z3 and cvc5 runs remain `UNKNOWN` or
time out from the geometry stage onward.  The
previous direct-0 rational adjacent-grid witness is `SAT` through `grid_exact`
in both solvers but becomes `UNSAT` when pinned into the corrected row stage.
This pinned rejection has no uniform mathematical content: exact `Fraction`
readback shows that each proposed four-point row has four distinct squared
distances from its center, so the frozen witness satisfies none of the three
row circles.  It is only one rejected proposal, not a CEGAR cut or a finite
coverage result.  The next aligned-mutual bounded round must first enumerate
two exact C rows that both contain the two canonical sources and whose
intersection is exactly that source pair, then solve those rows and the
separate exact Q row unpinned (or parameterize them exactly) before adding the
singleton slices and Kalmanson consumer.  The six-center constructors require
their own boundary-derived row contract rather than reuse of this mutual one.
Any positive result remains a local exact-17 motif until a source-level
producer and general-cardinality lift are proved.

That aligned-mutual support experiment has now been run with two explicit
pre-deletion C rows.  The finite structural layer found a Z3 model with the
two canonical sources in both exact-four supports and with their intersection
equal to exactly the source pair.  The separate Q row was kept distinct.  Z3
also found and exactly validated a rational 17-point geometry for the
underlying carrier, but the combined `grid_members`, exact-row,
singleton-slice, and Kalmanson stages remained `UNKNOWN` or timed out.  Thus
this round establishes only that the corrected finite incidence prefix and a
related exact metric carrier are separately realizable; it does not exhibit
one model satisfying their conjunction.

Two audits prevent promotion of any verdict from that first implementation.
First, its cvc5 wrapper sent two `check-sat` commands because
`solver.to_smt2()` had already emitted one, then accepted the first `sat`
token despite cvc5 returning a nonzero protocol-error exit.  That wrapper has
now been replaced by a single-query, fail-closed protocol.  The regenerated
structural query is `SAT` in Z3 and cvc5, and the exact rational geometry
witness replays as `SAT` when pinned in both solvers.  The combined
`grid_members`, `grid_exact`, three-row, singleton-slice, and Kalmanson stages
remain unresolved: Z3 times out and cvc5 exits on timeout, which the repaired
wrapper records as an error rather than accepting as `SAT`.  Protocol controls
for duplicate queries and misleading `sat` output on a nonzero/error exit all
reject as intended.  Thus the repair validates the earlier exact geometry
witness but supplies no row-level contradiction or closure.  Second, the
structural master imported the six-center boundary base.  Those six deleted-row and
provenance constraints belong to the other, mutually exclusive constructors
of `FreshThirdAcyclicHardResidual`; their presence strengthens the
aligned-mutual model with hypotheses unavailable in the live branch.  A
`SAT` result remains a legitimate consistency diagnostic for the weaker
named prefix, but an `UNSAT` result from this mixed master would not be an
admissible contradiction of the aligned-mutual leaf.

The replacement finite ingress must therefore be built from the
aligned-mutual packet alone and must split exactly along the four constructors
of `FirstFiberOutsidePairExactRowsOrCrossedThreeRowsResidual`: the two
`FiveSurvivorExactRowsBoundary` deletion choices and the two orientations of
`FirstFiberCrossedThreeRowExactSupports`.  It must retain which canonical
blocker lies in the first cap and the exact intersection of that source row
with the first cap.  No six-center row may be imported into this master.  The
collision-five-center deletion arm is being developed separately; the next
consumer-first computational target here is one crossed-three-row orientation,
followed by its reversed orientation.  As before, exact-17 results are theorem
discovery and regression evidence only until a cardinality-independent
producer or bounded-obstruction lift lands in Lean.

One further role distinction is binding in this replacement.  The two points
named by `Q.outside_eq_pair` are the outside members of the selected shell
centered at the actual blocker of `P.source₁`.  They are not, from the current
source, the outside hits of either apex-centered radius in
`ExactFourTwoRadiusAdjacentCapGrid`.  The grid remains a separate source-clean
metric packet.  An encoder may include both packets, but it must not identify
their point labels or transfer circle equations between them without a new
Lean theorem.  Such an alias is a malformed-ingress control, not a symmetry
normalization.

The mandatory post-round theorem-bank and source audit found no existing
reverse metric consumer at this interface.  In particular, the tempting
endpoint-deletion route is not merely missing four facts: the relevant
endpoint theorem is typed for `FreshThirdBlockerFiber`, with two fresh sources,
whereas the live anchor has `FreshOutsideFirstBlockerFiber`, with one source and
one outside point.  There is no source-clean adapter between those packets.
Consequently the endpoint theorem is not a consumer for this residual, and
adding its hypotheses would both change the ingress and move the live `sorry`.
The exact-`Q` theorem bank starts strictly downstream of the missing bridge:
it can normalize a supplied five-center residual to exact rows or crossed
three-row supports, propagate provenance from an existing six-survivor exact
row boundary, and saturate an already constructed crossed-row packet.  No
theorem constructs any of those packets from the adjacent grid and the current
outside-first ingress.  The Kalmanson bank likewise contains strict consumers
and strict contradictions, but no non-strict or `Q`-specific reverse inequality
producer.  The active residual therefore remains open at this interface.

The row-round bank does provide two exact reusable consumers for the corrected
contract.  `SelectedFourClass.inter_card_le_two` bounds the intersection of
two exact selected four-classes at distinct centers, and
`false_of_firstFiber_explicit_overlap_card_ge_three` closes if a distinct
selected row meets the explicit `Q` collision shell in at least three points.
The existing theorem
`selectedSupports_inter_eq_sources_of_mutualCrossMembership_distinctBlockers`
also identifies the intersection of the two mutually incident canonical rows
as exactly their two sources.  These are consumers/cuts, not the missing
producer: the live packet still has to force a three-point overlap or another
incompatible incidence among the three correctly distinguished rows.

The fixed-deletion-core bank does not supply that producer.  A
`MinimalDeletionCore` gives one exact four-shell per deleted endpoint and
pairwise-disjoint restored supports inside that individual core.  Combined
with the endpoint and unequal-radius premises, its strongest current cap
consequence is `capByIndex_card_ge_six_of_two_sources`.  The aligned common-
deletion packet additionally identifies one endpoint omitted by both selected
source rows, but gives no equality or disjointness between the two different
cores.  Consequently these packets provide negative incidence and cap-size
lower bounds, but no positive incidence into a normalized C/Q row, no blocker
equality, no new cap composition beyond the existing first-cap bound, and no
row confinement.  A global theorem-bank search for such a bridge returned no
match.

The smallest currently identified positive producer with an immediate banked
consumer would force some normalized selected source row to meet a rich class
in a different cap in at least two points.  With the two blocker-cap indices
distinct, `false_of_criticalShell_center_in_cap_of_two_hits_in_distinct_cap`
would then close.  This is a specification for the missing theorem, not a
consequence of the present deletion-core API.  The source-faithful crossed-row
CEGAR round should therefore test and mine exactly this kind of positive
cross-cap incidence (or an equivalent three-point row overlap), rather than
adding more cap-cardinality clauses already implied by the existing cores.

The existing crossed-row K4 saturation theorem does not fill this gap.
`sharedFourth_or_selectedRowOmissionSaturation` says that the two unnamed
fourth points either coincide or omit one source from their own selected row
(unless their blockers collapse to a named source blocker).  The deletion
cores say instead that collision endpoints are omitted from the two source
rows.  Selected-row membership is not symmetric, so these two directions do
not compose.  A 17-label incidence shadow realizes the blocker-equality arms,
the aligned common-deletion cores, and all named exact-four supports while
keeping every normalized distinct-cap rich-slice intersection at most one and
every overlap with the explicit Q shell at most two.  This is not a Euclidean
`CounterexampleData` model, but it is a rigorous countermodel to closure from
the named local incidence clauses.  Accordingly, the next producer attempt
must use a genuinely stronger source layer—full-carrier K4/minimality or new
global geometry—not another rearrangement of the same local row packet.
An independent full-carrier theorem-bank audit found no existing bridge at
that stronger layer either: the available K4/minimality APIs yield directional
source membership, deletion-core disjointness, cap-label pigeonholes, cap-size
lower bounds, and blocker-fiber bounds, but no lower bound on either target
intersection.  The next finite round must therefore encode those global
consequences explicitly and use the resulting model or core to discover a new
uniform theorem; another source search is not a substitute for that round.

That source-faithful incidence round is now complete under
`scratch/p97-consumer-first/freshthird_aligned_mutual_crossed_v1/`.  It keeps
the four canonical-source/outside-point roles distinct, materializes the
direct crossed-three-row constructor and its exact four-point rows, and checks
the shared-fourth/omission-saturation theorem.  The structural baseline and
both the shared- and distinct-fourth arms are `SAT` in Z3 and cvc5; negating
the saturation clause is `UNSAT` with the theorem and `SAT` when that one
clause is removed.  Thus saturation is a genuine cut but not a closure.
The separate full-carrier incidence stage assigns a K4 witness row to every
one of the 17 points, locks unique-four blocker rows, enforces same-blocker row
equality, distinct-center intersection at most two, blocker fibers at most
four, and all three source-derived apex-rich cap patterns.  Even with both
target producers negated it remains `SAT` in both solvers, and the exported
assignment passes an independent validator.  All malformed controls are
`UNSAT` in both solvers; no final query is `UNKNOWN` or `ERROR`.

This is a countermodel to the named incidence abstraction, not a simultaneous
Euclidean `CounterexampleData` model and not a P97 counterexample.  The four
named row circles are separately rationally realizable, but the metric fixture
does not realize all 17 selected shells, cap-arc geometry, and the global
incidence assignment at once.  Therefore neither a distinct-cap rich-slice
two-hit nor a three-point overlap with the explicit `Q` shell can be obtained
from carrier-wide K4/minimality incidence alone.  The next discriminating
round must couple the complete selected-row assignment to one convex Euclidean
carrier and its shared cyclic/cap order.  Its admissible output is either an
exactly checked local counterexample motif or a finite obstruction from which
a cardinality-independent source theorem and general-cardinality lift can be
proved; bounded `UNSAT` by itself is not a universal Lean closure.

The first shared-coordinate follow-up is now complete under
`scratch/p97-consumer-first/freshthird_aligned_mutual_crossed_metric_v1/`.
It first landed the missing retained consequences in
`TwoSourceFreshThirdRetainedProducer`: the two rich first-apex classes have
exactly the retained radii up to swap, both canonical sources are absent from
every multi-point first-cap slice, and the adjacent-cap grid yields a strict
cross-distance inequality once the common cyclic order is supplied.  The
original frozen incidence assignment was immediately source-invalid: it put a
canonical source in a non-singleton rich slice.  After coupling the rich
slices exactly to the retained pairs, a corrected incidence assignment again
survived in both solvers and passed its independent validator.

Freezing that corrected incidence assignment into one shared Euclidean
coordinate problem produced a first joint Z3/cvc5 `UNSAT` only at the
cumulative `named_rows_and_singletons` stage (1,083 clauses).  Exact deletion
minimization reduced it to the two direct opposites

```text
d2(firstApex, point10) = d2(firstApex, C.firstSource)
d2(firstApex, point10) != d2(firstApex, C.firstSource).
```

The equality came from a proposed first-apex K4 witness row containing both
points; the inequality came from the aligned singleton first-apex slice, with
`point10` another strict-first-cap point.  Each single clause is satisfiable,
their union is `UNSAT` in both solvers, and the same result holds for the two
source-local named packets.  No convex-order, Kalmanson, cap-geometry,
selected-support, rich-class-cardinality, or blocker-exactness clause survives
minimization.  Thus this is not a finite geometric obstruction and supplies no
new contradiction theorem.  It is exactly the already source-clean rule
`firstFiberCapSource_not_mem_firstApex_multiPointRadius_of_aligned` (and its
two-source retained-packet corollary) specialized to one bad proposed K4 row.

The required next CEGAR correction is therefore an incidence-preflight cut:
if a first-apex K4 witness row contains either aligned canonical source, it
must omit every other strict-first-cap point.  Re-enumerate the exact-17
aligned-mutual direct-crossed incidence packet with that rule before launching
another coordinate solve.  A surviving assignment must still be coupled to
the exact named C rows, separate Q row, singleton slices, blocker exactness,
and common cyclic geometry.  An `UNSAT` assignment remains only a bounded
proposal rejection unless its minimized core yields a cardinality-independent
source theorem or a proved bounded-obstruction lift.  No Lean `sorry` was
closed by this round.

The first post-cut re-enumeration is also complete under
`post_core_cut_v2/`.  The corrected incidence packet remains `SAT` in Z3,
cvc5, and internal Z3 and passes an independent validator.  Its first-apex K4
witness support is `{1,11,15,16}`: it meets the strict first cap only in
`C.secondSource = 1`, so it satisfies the new singleton/K4 preflight and does
not repeat the preceding defect.  The corresponding shared-coordinate replay
is exactly validated through the geometry and cap-classification stages, but
becomes jointly `UNSAT` in Z3 and cvc5 when the cumulative three-apex
`rich_radius_pattern` clauses are added (921 clauses).

This v2 result is still one frozen exact-17 assignment, not finite coverage.
A mandatory global theorem-bank pass found no existing theorem that turns the
simultaneous three-apex rich pattern into a contradiction or consumes any
constructor of `FreshThirdAcyclicHardResidual`; the proved singleton and
exact-retained-radius APIs license inputs to the query but do not prove its
metric `UNSAT`.  The immediate gate is exact global and source-packet core
minimization of those 921 clauses.  Promote only if the surviving core states
a cardinality-independent geometric lemma available from the live packet;
otherwise treat it as another assignment cut and re-enumerate.  No larger
coordinate campaign is authorized before that classification.

That minimization is now complete.  Global tracked extraction followed by
fresh deletion reduces the 921-clause query to the subset-minimal four-clause
chain

```text
d2(apex2, point7) = d2(apex2, point3)
d2(apex2, point7) = richRadius2.0
d2(apex2, point3) = richRadius2.1
richRadius2.0 != richRadius2.1.
```

The core is `UNSAT` in internal Z3, Z3 CLI, and cvc5; every drop-one is `SAT`
in both external solvers and passes exact substitution and independent
`Fraction` replay.  Packet minimization leaves only the K4 common-radius
equalities, the strict-cap rich-slice equalities, and D44 radius distinctness;
each packet drop-one is likewise exactly checked `SAT`.

This is again an incidence-assignment defect, not the sought simultaneous
metric obstruction.  The arbitrary K4 witness at `apex2` crossed the two D44
rich arms.  Existing source-clean Lean already forbids this, generically by
`selectedClass_radius_unique_of_mem` and
`selectedClass_disjoint_of_radius_ne`, and in the exact six-point D44 cap by
`selectedFourClass_support_eq_one_of_twoRichClasses_of_cap_card_eq_six`.
Accordingly the next exact-17 re-enumeration must impose the radius-consistency
preflight: an equal-distance K4 witness support cannot meet both distinct D44
arms; in the six-point cap it must be one entire rich class.  This supplies no
new live producer and closes no `sorry`.  Run a fresh theorem-bank audit, then
re-enumerate before any further shared-coordinate solve.

That source-faithful re-enumeration is complete under `post_rich_cut_v3/`.
The exact-17 direct-crossed incidence query remains `SAT` in Z3, cvc5, and
internal Z3.  Its independently validated survivor selects D44 at both
nonfirst six-point caps, and each opposite-apex selected-four support now has
strict-cap projection equal to one complete D44 arm.  The complementary S6
rule is also present and branch-guarded: its selected support projects to a
subset of the unique rich arm of cardinality at least two.  Thus the query no
longer repeats either the singleton/K4 or crossed-D44 preflight defect.

On one shared coordinate system, the survivor has exact-rationally validated
`SAT` models through `geometry_core` and `cap_classification`.  Intermediate
K4, selected-support, rich-radius, and full-rich-class stages remain
`unknown`/timeouts.  The first stage jointly rejected by external Z3 4.17 and
cvc5 1.3.3 is `blocker_exactness` at 1,070 cumulative clauses; in-process Z3
4.16 times out there.  This exact status separation is important: no earlier
stage is claimed `UNSAT` merely because a solver timed out.

Exact core minimization subsequently reduced the v3 blocker failure to an
inclusion-minimal nine-clause equality chain: eight source-entitled K4
common-radius equalities force one off-row point onto the exact circle of the
blocker row at center `8`, contradicting `blocker_exact_8_13`.  Z3 and cvc5
both reject the core, every drop-one query is `SAT`, and the satisfying
drop-one assignments pass exact substitution; two also pass independent
`Fraction` replay.  This is not a new geometry theorem.  It is precisely an
instance of the existing source-clean interface
`Problem97.Census554.EqualityCore.ExactOffCircleCore`, consumed by
`false_of_exactAt_of_exactOffCircleCore`; the required exactness at an actual
blocker is supplied by
`Problem97.Census554.GeneralCarrierBridge.exactAt_blocker`.  The banked
consumer therefore justifies a guarded incidence separator, but the one frozen
occurrence still supplies no universal FreshThird producer.

That separator has now been tested source-faithfully in
`post_exact_off_circle_cut_v4/`.  A lazy union-find/path CEGAR loop rejects the
v3 assignment and adds a guarded cut for every discovered equality-closure
path from a member edge of an actual blocker row to an excluded edge.  After
six `SAT` iterations and nine cuts it reaches a closure-clean exact-17
direct-crossed incidence survivor.  The final one-`check-sat` query is `SAT`
in external Z3 4.17.0 and cvc5 1.3.3, and the inherited structural validator,
the v3-cut validator, and an independent closure/path verifier all pass.
Exactness is applied exactly at blocker-image centers, not at the four unused
centers.  Thus `ExactOffCircleCore` is a sound reusable preflight, but it does
not close this finite branch.

The shared-coordinate replay of the v4 survivor finds no jointly `UNSAT`
stage.  `geometry_core` and `cap_classification` are `SAT` in Z3 with exact
substitution and `Fraction` replay; the row-equality preflight and all later
K4, selected-row, rich-radius, blocker-exactness, and named-row stages are
timeout or `unknown` at the recorded 60-second limits.  The mandatory
post-round bank audit finds no finite-to-universal lift and no theorem that
turns the whole surviving row system into `False`.  Conditional metric
consumers such as
`FiveRowCircleIntersectionGeometry.false_of_five_row_metric_data` and
`SevenPointOrbitCollision.seven_point_orbit_collision` remain usable only
after a literal source-level hypothesis map supplies all of their required
order/equality data.  No P97 counterexample, exact-17 coverage theorem,
universal lift, Lean closure, or `sorry` closure follows from v3 or v4.

The consumer-first v5 mapping audit has now completed that gate without
launching another solver query.  Against the closure-clean survivor,
`false_of_five_row_metric_data` and its negative-orientation adapter have zero
complete maps: even after requiring all six signed-area signs from the live
Direct/Mirror boundary blocks, the best source-entitled mapping supplies only
six of the ten distance equalities.  The all-role-injective minimum deficit is
`{OA_AC, OA_AX6, OA_OC, OA_OD}`.  The audit deliberately ignores the frozen
v4 numeric rank and intersects both arms of the live blocker-separation
equivalence; using the coordinate proposal as source order would falsely make
the consumer look closer.

`seven_point_orbit_collision` also has zero complete maps.  In its least
restrictive theorem-faithful mode the enumerator initially reports the four
formal two-equality alternatives

```text
{OA_OB, BC_BV}
{AO_AB, BC_BU}
{AO_AB, VA_VU}
{AO_AB, WO_WU}.
```

Expanding the role assignments back to carrier points shows that all four are
degenerate and unusable.  Every missing field equates a non-diagonal edge
between distinct carrier points with a diagonal self-edge.  Its metric
equality would therefore contradict point distinctness by itself; conversely,
the proposed disequality feasibility query is already forced and would be
trivially `SAT`.  These two-equality deficits are artifacts of permitting role
collisions, not plausible source producers, and no solver round should be run
against them.  The production equality bank now enforces this structurally via
`EqualityCore.EdgeClosure.eq_of_closure_to_diagonal` and
`EqualityCore.EdgeClosure.not_closure_to_diagonal_of_ne`, both ordinary Lean
proofs from `EdgeClosure.sound`, metric separation, and realization
injectivity.

The corrected nondegenerate audit is now complete.  Requiring both sides of
every omitted equality to be non-diagonal raises the theorem-faithful minimum
to four fields, with ten alternatives:

```text
{OA_OB, OA_OC, BC_BV, WO_WB}
{OA_OB, AO_AB, BC_BU, BC_BV}
{OA_OB, AO_AB, BC_BU, WO_WB}
{OA_OB, AO_AB, BC_BV, WO_WB}
{OA_OB, AO_AB, VA_VU, WO_WB}
{OA_OB, AO_AB, WO_WB, WO_WU}
{OA_OB, BC_BU, BC_BV, WO_WB}
{OA_OB, BC_BV, WO_WB, WO_WU}
{AO_AB, AO_AV, AO_AW, CA_CV}
{AO_AB, BC_BU, BC_BV, WO_WB}
```

For the first viable map, the roles are
`O=r₁`, `A=p₂`, `B=oppositeFourth`, `C=W=qOther`, `U=qSource`, and
`V=r₂`; its four missing equations are

```text
dist r₁ p₂ = dist r₁ oppositeFourth
dist r₁ p₂ = dist r₁ qOther
dist oppositeFourth qOther = dist oppositeFourth r₂
dist qOther r₁ = dist qOther oppositeFourth.
```

The all-role-injective minimum is also four equalities, with the unique
deficit `{AO_AB, AO_AV, AO_AW, CA_CV}` and role map
`O=oppositeFourth`, `A=oppApex1`, `B=qOther`, `C=qSource`,
`U=carrierIndex14`, `V=r₁`, `W=secondSource`.  Its missing packet is

```text
dist oppApex1 oppositeFourth = dist oppApex1 qOther
dist oppApex1 oppositeFourth = dist oppApex1 r₁
dist oppApex1 oppositeFourth = dist oppApex1 secondSource
dist qSource oppApex1 = dist qSource r₁.
```

The scratch artifact expands every alternative to carrier labels and exact
equations and validates the non-diagonal guard.  No solver was launched.  A
mandatory post-v5 bank audit finds no source-clean theorem deriving the
discarded formal two-equality pairs from
`TwoCapSourceThirdCanonicalRowSurface`,
`FreshThirdAlignedRetainedConsumerPacket`, the Direct/Mirror boundary packet,
and the live `FaithfulCarrierPattern`; the carrier expansion explains why.
No partial generic consumer accepts the six-of-ten FiveRow or
eleven-of-thirteen SevenPoint data.

The source-entitlement audit of all forty omitted fields is now complete.
None is already source-entitled.  Five alternatives contain at least one
equality forbidden by the live blocker exact-row/off-row API; the remaining
five alternatives (`M2`, `M5`, `M7`, the unique injective `M9`, and `M10`)
contain only genuinely open equalities.  Thus the SevenPoint adapter is not
exhausted, but no complete packet is currently available to a consumer and no
metric-feasibility query is yet justified.  The five open alternatives share
one producer shape: prove that a missing named endpoint belongs to a named
exact `rowPattern` or `CriticalFourShell`; the existing realization and
support-radius APIs then supply the corresponding equality.

The first equality of the injective `M9` map was then audited as the smallest
possible endpoint-membership target:

```text
dist oppApex1 oppositeFourth = dist oppApex1 qOther.
```

This is not a wiring lemma.  The current canonical-surface,
aligned-retained, Direct/Mirror boundary, and faithful-carrier packets do not
contain the required cross-component membership.  In the crossed constructor,
`oppositeFourth` belongs to the opposite collision row and `qOther` belongs to
a different first-fiber row; the named blocker centers are distinct.  The
constructor interface therefore leaves this first-apex equality unconstrained.
A theorem that assumes the two memberships and merely converts them to a
distance equality would repackage the missing premise and must not be counted
as a producer.

The only lower-arity metric bypass found in the bank is also inapplicable.
`FourPointTwoCircleBisectorOrderCore.false_of_core_of_same_side` consumes two
source-entitled shell equalities, but additionally requires a positive
same-side signed-area product.  The live FreshThird endpoint placement is
alternating across the center chord, giving the opposite-side order rather
than this premise.  Direct/Mirror boundary blocks do not change that sign.
Thus the direct-crossed consumer search is exhausted at the current interface:
resume it only after a new uniform positive-incidence or order producer lands.

Do not introduce Q/grid aliases, frozen numeric order, exactness at unused
centers, arbitrary-K4 support claims, or a finite-to-universal promotion.
Universal closure still requires a source-clean theorem forcing a complete
viable packet in every live residual, or a separate general-cardinality lift.

The next closure work is consequently:

1. attack the aligned reciprocal-membership arm through its new exact split.
   In the direct-crossed subcase, the named canonical-source rows, separate
   exact `Q` collision row, singleton source slices, exact-off-circle cuts, and
   literal consumer maps have already been added and audited.  Do not repeat
   those ingress rounds or search again for cyclic order.  The corrected
   source-entitlement audit leaves five all-open four-field packets and five
   packets with a source-forbidden equality.  The injective `M9` membership
   audit and the two-circle same-side audit above show that neither is current
   wiring.  Park this direct-crossed metric-consumer route until a new uniform
   positive-incidence or order theorem supplies the missing premise.  Do not
   query the four degenerate two-equality alternatives: their missing fields compare
   nonzero edges with self-edges and cannot be source producers.  If every
   viable four-field packet contains a source-forbidden equation, classify the
   SevenPoint adapter as exhausted for this motif and return to a uniform
   producer or a different consumer.  Run metric feasibility only after a
   complete source-plausible packet has actually been produced.  The universal
   Lean target remains a
   consumer of the actual `FreshOutsideFirstBlockerFiber` packet; do not use the
   two-fresh-source endpoint blocker theorem as if it were type-compatible.
   A finite `UNSAT` is useful only with a bounded-obstruction/general-cardinality
   lift, while a finite `SAT` remains a local motif rather than a P97
   counterexample.
   For the equal-blocker case, use the new common-cap/common-support packet to
   split honestly on whether the existential common index is the first cap.
   The first-cap subcase already carries the exact shell/cap intersection and
   all endpoint omissions.  The existing first-fiber and joint-deletion
   terminals intrinsically retain either a common first-apex radius or an open
   B1/global producer, so they are not source-clean adapters for this subcase.
   Both the first-cap and non-first-cap equal-blocker subcases still need a new
   metric or global producer.  Any promoted finite result must identify a
   bounded obstruction
   or prove a lift, and must not silently replace the existential cap index by
   the first cap.  For the
   distinct-blocker case, consume the stronger named
   `FreshThirdAlignedDistinctBlockerFirstCapResidual`: its two deletion
   constructors already carry five exact deleted rows, and its two crossed
   constructors already carry `FirstFiberCrossedThreeRowExactSupports` in the
   correct orientation.  The crossed-three-row consumer search is exhausted
   at the current interface as described above.  The alias-aware exact-17
   five-row preflight now covers both source orientations, both deleted-Q
   choices, and both possible first-apex retained rows.  All eight ingress
   packets are `SAT` in z3 and cvc5 and pass independent assignment replay.
   More importantly, all 24 queries obtained by forcing one of the three old
   first-fiber consumer predicates are `UNSAT` in both solvers.  This is not a
   finite obstruction: distinct selected-class centers bound overlap with the
   first collision row by two, while the q-deleted shells omit the deleted Q
   point.  Hence explicit overlap at least three, both outside-Q hits plus a
   first-pair hit, and both outside-Q hits at either available first-cap center
   are incompatible with the deletion ingress itself.  Do not
   continue to target these three consumers or describe their negations as a
   survivor cut.  The mandatory post-round theorem-bank audit found no other
   source-clean consumer at the named-incidence interface.

   The first source-faithful named-coordinate probe after that audit rejected
   one frozen `first/qsource/radius` proposal, but did not reject the five-row
   constructor.  Its dual-solver `UNSAT` core was the single geometric atom
   asserting that carrier slot `1` lay strictly outside the closed first cap:
   the frozen incidence assignment had aliased that slot both with the outside
   point `Q.otherOutsidePoint` and with the fixed cap endpoint `S.oppApex2`.
   The production theorem
   `freshOutsideFirstBlockerFiber_outsidePoints_ne_firstCapEndpoints` now makes
   the corresponding source contract explicit.  It proves that both Q points
   are distinct from both fixed first-cap endpoints using only public endpoint
   membership and the two `FreshOutsideFirstBlockerFiber` nonmembership fields;
   its axiom audit contains only `propext`, `Classical.choice`, and
   `Quot.sound`.  Therefore the four endpoint/Q non-alias clauses are valid for
   all eight finite tags, while the v3 computation remains only a rejection of
   one malformed frozen proposal.  The next admitted finite round must
   re-enumerate all eight tags with these clauses already present and replay
   any resulting shared-coordinate packets.  It must not promote the one-tag
   `UNSAT` to tag coverage, a universal producer, or a Lean contradiction.

   That admitted v4 round is now complete.  All eight structural tags remain
   `SAT` in both z3 and cvc5 after the endpoint/Q clauses, and both assignments
   per tag pass the independent structural validator.  Of the resulting 24
   frozen shared-coordinate stages, 22 are bounded-inconclusive.  Two
   `exact_offsupport` proposals are `UNSAT` in both solvers after deletion
   minimization: `first_qother_rho` has a six-source-atom equality path through
   `S0Row`, `S1Row`, and the actual deleted-blocker row, while
   `second_qother_radius` has an eight-source-atom path through `PRow`,
   `PRhoRow`, `Rh`, and that blocker row.  Every single-source-atom deletion
   from either minimized core is `SAT` in cvc5.  These results reject two
   frozen support assignments only; they do not cover either tag, much less
   the five-row constructor.

   The mandatory post-v4 global theorem-bank pass identifies both cores as
   instances of the existing exact-support transport principle exposed by
   `Problem97.Census554.GeneralCarrierBridge.exactAt_blocker`: equal-distance
   transport from a supported blocker edge to an excluded blocker edge is
   impossible.  It finds no existing FreshThird producer or coverage theorem
   supplying the full ten edge closures and six orientations needed by
   `FiveRowCircleIntersectionOrderCore.false_of_core` (or its reflected
   form).  Therefore the next finite round must enumerate source-admissible
   row supports, compute provenance-preserving equality closure, and learn only
   the weakest support clause witnessing an exact blocker member/off-support
   collision.  It must not rerun the same frozen nonlinear proposals with
   longer timeouts or mistake one equality-path rejection for tag coverage.

   The prescribed closure-clean support census is now complete in
   `scratch/p97-consumer-first/freshthird_five_survivor_equality_path_v5/`.
   It varied source-admissible supports independently in all eight exact-17
   tags and learned eight replayable, source-minimal equality-path cuts: six
   paths of length two and two of length three, with seven terminating at the
   exact deleted-blocker row and one at `PRow`.  Both z3 and cvc5 nevertheless
   produced an equality-clean survivor for every tag, and all sixteen final
   assignments pass the independent structural and union-find validators.
   Thus the exact-support equality-path consumer is real but insufficient even
   for this finite abstraction.  Another equality-only wave has no remaining
   closure claim; the next round must begin with a new source-entitled global
   producer or a different consumer.  This remains exact-17 abstraction
   evidence, with no Euclidean realization, general-cardinality lift, Lean
   theorem, or `sorry` closure.

   The mandatory post-v5 theorem-bank audit found no canonical declaration
   that consumes the equality-clean survivors or supplies the missing
   FreshThird producer.  The closest source-clean endpoint is
   `Problem97.Census554.EqualityCore.false_of_exactAt_of_exactOffCircleCore`.
   Its generic ingress is already implemented: `GeneralCarrierBridge` provides
   `rowPattern`, `realizes`, `exactAt_blocker`, and the complete
   `false_of_shellMetricCoreAlternative` consumer, while global K4 can build a
   `FaithfulCarrierPattern` preserving prescribed selected four-classes on a
   finite nonempty center seed.  The remaining equality-core gap is therefore
   not another abstraction layer.  It is a FreshThird-specific producer of an
   actual `EdgeClosure` path from a member of one of the pinned exact rows to a
   point excluded by the corresponding blocker row.  V5 proves that the
   current exact-17 support abstraction does not force such a path in any of
   its eight tags, so another equality-only wave is unauthorized.

   A complete `FiveRowCircleIntersectionOrderCore` remains the other exact
   endpoint.  The strongest source-faithful role map currently identified is
   `O = blocker(source)`, `A = blocker(Pρ.source₁)`,
   `C = oppApex1`, `D = oppApex2`, and `E = surplusApex`.  Its signed endpoint
   would follow from the single shared-boundary chain
   `idx(O) < idx(A) < idx(D) < idx(E) < idx(C)`, but
   `FreshThirdAlignedMutualBlockerBoundaryPacket` does not locate those five
   centers in that chain.  The same packet also does not supply the ten
   support-incidence equalities or the three auxiliary witnesses needed for
   the core's edge closures.  Once those fields are produced, the Lean adapter
   is routine; producing them is the genuine geometric/global-K4 gap.  Neither
   endpoint authorizes another equality-path or Kalmanson finite wave.

   Following that census and its mandatory global theorem-bank pass, the
   immediate theorem target is a
   *different* source-clean consumer for either five-exact-row deletion
   constructor, compatible with the exact B0/B1 omissions and not assuming a
   common first-apex radius or equal blockers.  The most concrete existing
   endpoint remains an exact map into
   `FiveRowCircleIntersectionOrderCore`; it requires ten edge-closure
   equalities and six signed orientations not supplied by the current packet.
   Otherwise a new source theorem must contribute a metric/order identity or
   a global-K4/minimality clause that uses the asymmetric five-row pattern
   rather than forbidden positive hits.  The twelve structural arms and all 2520 current
   cyclic-order projections are already exhausted.  Do not launch a larger
   Boolean or Kalmanson matrix before a new source theorem supplies an
   additional row equality or global clause;
2. for both six-center arms, stop extending the Boolean cap-incidence matrix
   unless a new source theorem supplies an actual row/radius/order identity.
   Mine a bounded obstruction only from the complete
   source-provenance exact-row boundary packet (six explicit deleted rows, the
   `B₀`/`B₁`/`B₅` source labels, the deleted point's blocked actual center,
   and six distinct survivor centers).  The v1 canary proves that those named
   facts, even together with pointwise cap composition, do not force the
   tetrahedron motif or any `B₃`/`B₄` retained-pair hit.  The U3 dangerous
   triple, fixed-triple audit frame, and concrete escaping-row/critical-shell
   witness are now produced in ordinary Lean.  The live packet has additionally
   been strengthened to `SixSurvivorU3ExactRadiusAuditObstruction`: its dangerous
   radius has exact filtered cardinality three, and every escaping row carries
   both a `U5SelectedCandidateSkeleton` and the resulting off-circle inequality.
   The generic frame API now also proves
   `U3FixedTripleAuditFrame.qDeletedRow_dangerousCircle_distribution`: every
   exact q-deleted four-row at an audit center has at most two points on
   `{deleted} ∪ T`, and therefore at least two points off that dangerous
   circle.  The same two-circle argument is now exposed generically through
   `U5DangerousTriple.toSelectedFourClass` and
   `CriticalFourShell.inter_dangerous_p_circle_card_le_two`; consequently
   `U3FixedTripleAuditFrame.criticalFourShell_dangerousCircle_distribution`
   gives the identical at-most-two/on-circle and at-least-two/off-circle bounds
   for the critical-shell alternative.  The exact-radius obstruction packet
   retains both cardinality bounds in both alternatives.

   The source-faithful U3 obstruction wave then checked the six audit-center
   choices separately in the escape and shell arms (twelve cases total).  Every
   base query was `SAT` in both Z3 and cvc5 and passed the independent validator.
   The wave did not force an escape to return to the canonical support, a
   three-point survivor-row collision, or a consumer-ready positive incidence
   in the shell arm.  These
   are finite abstraction results only; they close no Lean theorem and do not
   construct a P97 counterexample.  The mandatory post-wave global theorem-bank
   pass found no existing universal producer for either arm (after the agentic
   backend reached its usage limit, the pass completed against the ordinary
   Lean corpus and all four canonical registries).

   The exact escape-side gap is now a source theorem producing
   `RowwiseConfinedQDeletedClasses`, or an independent theorem forcing every
   escaping candidate to return to the bounded support or collide with a named
   row.  The shell arm now carries the source-clean dangerous-circle
   distribution bounds (intersection at most two and off-circle support at
   least two).  Its remaining gap is an adapter from that emitted
   `CriticalFourShell` to the row pattern, realization, label map, edge closures,
   and `ExactOffCircleCore` premises consumed by
   `Census554.EqualityCore.false_of_criticalFourShell_exactOffCircleCore`; merely
   importing that consumer is insufficient.  The immediate theorem target is
   therefore a source-clean contradiction for one of those explicit arms.  Any
   adjacency, cyclic-order, or positive cross-row
   incidence producer should be judged by whether it discharges that exact
   alternative; then prove the corresponding universal producer or lift before
   promoting a certificate.

   The ordinary-Lean adapter
   `SixSurvivorExactRowsBoundary.false_of_u3ExactRadiusAuditObstruction_of_rowwiseConfined`
   now makes the escape endpoint precise: a theorem uniformly supplying
   `F.RowwiseConfinedQDeletedClasses` for every fixed-triple frame with the
   source-produced exact dangerous-radius cardinality three closes the entire
   six-row boundary immediately.  The adapter is source-clean and conditional;
   it does not manufacture the confinement producer and therefore closes no
   live residual by itself.

   The authorized simultaneous-six-center wave is now complete under
   `scratch/p97-consumer-first/freshthird_u3_simultaneous_sixcenter_20260809/`.
   A pre-run source audit corrected the intended contract: the six U3 audit
   centers are unrelated to the six survivor-boundary centers; arbitrary
   q-deleted witnesses are not canonical rows; and no same-center identity,
   actual-blocker provenance, or blocker-fiber bound may be projected onto
   them.  The single run instead retained the licensed distinct-center
   two-circle bounds and the new dangerous-circle distribution theorem.  The
   latter reduced the exact structural pattern bank from 1440 to 468.

   Z3 4.17.0 and cvc5 1.3.3 agreed on all twelve cases, with no unknowns,
   timeouts, crashes, or invalid readbacks.  The finite all-confined schema is
   semantic-UNSAT after exhaustive independent classification of all 468
   patterns, as expected from the existing bounded consumer.  The live
   escape-or-critical-shell abstraction remains SAT: one validated readback
   uses one confined q-deleted center, two escaping centers, and three shell
   centers.  This is neither a Euclidean realization nor a counterexample.
   It isolates the same two universal gaps without forcing a new named
   collision: canonical escape return/collision, or named-support incidence and
   blocker provenance for `CriticalFourShell`.  The shell-side
   dangerous-circle distribution itself is now source-clean; it has no current
   named-row or metric/order consumer.

   No second wave is authorized from this result.  The mandatory fresh global
   theorem-bank pass is complete (`POSTBANK.md`; nthdegree message `#4264`).
   Agentic search hit its model-usage limit, so the pass fell back to the
   ordinary indexed Lean corpus and all four canonical theorem registries.  It
   found no source-clean return/collision theorem, universal six-row
   confinement producer, shell-to-blocker/named-row provenance theorem, or
   direct consumer for the full escape-or-shell packet.  A subsequent direct
   source derivation added only the generic shell dangerous-circle distribution;
   it did not add a closer.  The narrowest
   missing general-cardinality input is therefore either a canonical
   escape-return/collision theorem (equivalently, universal rowwise
   confinement) or an independent `CriticalFourShell` theorem supplying named
   dangerous-circle/blocker provenance.  Any future finite contradiction still
   requires one of those Lean producers or a bounded-obstruction lift.

   The follow-up shell-distribution wave is complete under
   `scratch/p97-consumer-first/freshthird_u3_simultaneous_shell_distribution_20260809/`
   (nthdegree message `#4278`).  It retained the source-clean critical-shell
   exactness and dangerous-circle bounds, and again separated the already
   impossible all-confined q-deleted schema from the live escape/shell
   alternatives.  Z3 and cvc5 agreed throughout, but no named shell incidence,
   blocker identity, return, or descent was forced.  Its mandatory global
   theorem-bank pass (`#4282`) found no existing shell-to-False consumer or
   source bridge to the required CriticalShellSystem blocker data.  This was a
   second diagnostic refinement, not a closure result.

   The next source step makes the finite ingress exact.  A critical four-shell
   can be converted to a q-allowed K4 witness; any shell point outside the old
   bounded support is consequently a new selected off-dangerous-circle
   candidate.  Shifting the U3 frame to that candidate yields the ordinary-Lean
   dichotomy `exists_escaping_shift_or_confinedCriticalFourShell`: either the
   distinguished candidate leaves the old support, or one confined critical
   shell is exposed.  More strongly, the source audit proves directly that,
   in the absence of such an escaping shift, every one of the six audit centers
   has either a confined exact q-deleted four-row or a confined exact critical
   four-shell.  This statement is now implemented as
   `MixedConfinedAuditPacket` and
   `exists_escaping_shift_or_mixedConfinedAuditPacket`.  A combined Lean 4.27
   check of the new U5 and U3 adapters succeeds; the axiom audit contains no
   `sorryAx` (the older bounded consumer retains its approved
   `Lean.trustCompiler`/`Lean.ofReduceBool` profile).  A dependency-aware Lake
   check remains pending behind the unrelated full-build lock.  This is the
   precise mixed packet used by the next census.  It does not identify shell
   rows with q-deleted rows: a critical shell contains the deleted point `q`,
   so it cannot populate the existing `U5BoundedAuditSupport` consumer.

   The exact mixed-mode census is complete under
   `scratch/p97-consumer-first/freshthird_u3_mixed_confined_exact_20260809/`
   (nthdegree message `#4286`).  It exhausts all 64 q-deleted/critical-shell
   mode assignments on the eight source-entitled labels and counts 1,552,476
   compatible six-row support tuples.  Every mode is SAT in both Z3 and cvc5,
   with independent readback validation.  The encoding retains exact row
   cardinality, q membership/omission by mode, own-center omission, pairwise
   two-circle intersection bounds, dangerous-circle distribution, and the
   critical-shell off-support radius disequalities.  It is an incidence census,
   not a Euclidean realization or counterexample, and closes no Lean theorem.

   The mandatory post-census global theorem-bank pass is complete (nthdegree
   message `#4294`).  Agentic search again reached its model-usage limit, so the
   audit completed with ordinary global and scoped Lean search plus all four
   canonical theorem registries.  It found no mixed q-deleted/shell consumer,
   no U3 shift no-cycle/return theorem, no q-allowed finite-audit closer, no
   FreshThird producer for `ExactOffCircleCore`, and no source bridge from the
   six audit centers to blocker-cycle/fiber bounds.  Therefore no successor
   incidence-only CEGAR wave is authorized.  A follow-up source audit estimates
   the smallest named Euclidean layer at only eight points and about 22 real
   variables, so solver size is not the obstruction.

   A subsequent ordinary-Lean source theorem supplied one genuinely new clause
   and therefore authorized exactly one successor wave.  A critical four-shell
   containing the dangerous point `p` puts its carrier center on the
   perpendicular bisector of `p` and `q`; Dumitrescu's two-center bound then
   shows that at most two of the six pairwise-distinct audit centers can carry
   such shells.  This is recorded by
   `MixedConfinedRow.false_of_three_criticalFourShell_rows_containing_p` and the
   universal `shell_p_at_most_two` field of
   `MixedSixRowPatternWithDangerousCircle`.  The theorem is cardinality
   independent and source-clean; it is a new solver cut, not a contradiction
   for the mixed packet.

   The single authorized successor wave is complete under
   `scratch/p97-consumer-first/freshthird_u3_mixed_confined_exact_20260809/`
   `successor_dangerous_triple_shell_p_cut_20260809/` (nthdegree message
   `#4376`).  The new cut removes 65,520 of 1,552,476 tuples in 42 of the 64
   mode arms.  Exact readback, Z3, and cvc5 agree: 63 arms remain
   SAT-abstraction, while the all-six-critical-shell arm is finite-UNSAT (all
   216 support tuples are removed).  A minimal finite core uses exact row
   cardinality, q membership, pairwise intersection at most two, the
   dangerous-circle intersection bound, and `shell_p_at_most_two`; own-center
   omission is unnecessary.  The original exact finite theorem landed as
   `U3MixedFiniteExtraction.exists_qDeleted_mode_of_mixedSixRowPatternWithDangerousCircle`:

   ```lean
   MixedSixRowPatternWithDangerousCircle ->
     Exists fun c => (row c).mode = .qDeleted
   ```

   The executable reflection is
   `U3MixedFiniteExtraction.shellPatternExists_false`.  The source-level count
   is now strictly stronger than that first reflected theorem.  If at most one
   of the six rows were q-deleted, at least five would be critical shells.  Each
   shell contributes exactly three incidences on the seven non-`q` labels, for
   at least 15 incidences, while the perpendicular-bisector multiplicity bound
   permits at most two incidences per label, for total capacity 14.  The
   ordinary theorem
   `MixedSixRowPattern.exists_two_qDeleted_of_uniform_shell_multiplicity`
   therefore produces two distinct q-deleted modes without another solver
   wave.

   `MixedConfinedAuditPacket.exists_two_confined_qDeletedRows_of_mode`
   transports those two modes back to two distinct actual confined q-deleted
   rows among the six audit centers.  The stable strengthened API
   `MixedConfinedAuditPacket.exists_two_confined_qDeletedRows_with_intersection`
   additionally packages the exact overlap range
   `1 ≤ (B₁ ∩ B₂).card ∧ (B₁ ∩ B₂).card ≤ 2`: the lower bound follows because
   both four-rows lie in the same seven-point support after erasing `q`, and
   the upper bound is the existing distinct-center two-circle theorem.  The
   boundary-level adapter
   `SixSurvivorExactRowsBoundary.exists_two_confined_qDeletedRows_with_intersection_of_mixedFrame`
   is imported by `TwoSourceClosure`; its weaker two-row adapter and the earlier
   one-row adapters remain valid but are subsumed for this route.  Lean 4.27
   direct checks and the locked producer-module and dependency-aware
   `TwoSourceClosure` builds succeed under the approved trust profile.  A fresh
   spine/axiom refresh remains the final promotion check for this checkpoint.

   This is a strict mode descent: every mixed packet has at least two
   q-deleted rows and hence at most four critical shells.  It does not produce
   six q-deleted rows and does not close the escape arm or the no-shift arm.  No
   live `sorry` closed at this checkpoint.  The new boundary adapter is a
   banked source producer/adapter, not yet kernel-reachable from the publish spine,
   because the active residual does not yet construct its
   `MixedConfinedAuditPacket` premise.

   The mandatory post-wave theorem-bank audit is complete (nthdegree message
   `#4382`).  The agentic backend again reached its usage limit, so the audit
   completed against the live Lean source and all four canonical registries.
   It found no existing consumer of one q-deleted row plus critical shells, no
   escape/return or blocker-descent bridge, and no theorem deriving the finite
   mode-exclusion statement above.  A post-landing source audit (nthdegree
   message `#4447`) found no then-existing no-shift, return, or cycle theorem.
   That historical negative result has now been superseded by the landed
   provenance-preserving step and finite-cycle APIs described below.

   A fresh theorem-bank and live-source audit after the two-row strengthening
   likewise found no existing contradiction consumer for two arbitrary
   confined q-deleted rows.  The banked two-circle theorems give pairwise
   intersection at most two, and the seven-point support count strengthens this
   to intersection cardinality one or two.  Those facts do not supply a
   dangerous center, reciprocal center membership, or the `p`/cross incidences
   required by the nearest U5 incompatibility kernels.  The next mixed-arm
   producer must either lift the two rows to the existing all-row confined
   consumer or produce those missing positive incidences and feed a named U5
   terminal.

   The escape arm now has the source-clean provenance-preserving relation
   `U3EscapingAuditStep` and the one-step producer
   `U3FixedTripleAuditFrame.exists_escapingAuditStep_or_mixedConfinedAuditPacket`.
   Each escape constructor retains the actual q-deleted row or critical shell,
   its escaping support point, and the definitional `shiftOfEscape` successor.
   `U3EscapingAuditCycle.exists_mixed_or_step_cycle` now carries out the finite
   orbit extraction: every exact-radius initial frame yields either a frame
   with `MixedConfinedAuditPacket`, or an infinite source-faithful step sequence
   with a return cycle of period at least four.  The proof uses the finite frame
   embedding together with `step_not_eq`, `no_two_cycle`, and `no_three_cycle`.
   The boundary adapter
   `SixSurvivorExactRowsBoundary.exists_mixedFrame_or_u3EscapingAuditCycle`
   wires this disjunction into `TwoSourceClosure`.  The relevant Lean 4.27
   builds are green with no new `sorry`; this is a decomposition, not a
   contradiction, and no live `sorry` closed.

   The remaining escape obligation is now precisely a strict well-founded
   measure or a cycle-specific contradiction for a source-faithful cycle of
   period at least four.  The mixed endpoint still needs either an all-row
   confinement lift or the reciprocal/dangerous-center/`p`-cross incidence
   producer consumed by an existing U5 terminal.  Do not start another CEGAR
   wave until one of those source theorems contributes a new source-entitled
   clause to the surviving mode arms.

   The eight-point layer is a **projection**, not an exact-cardinality model.
   An actual countermodel at any carrier cardinality supplies the same eight
   named points, and every source-derived equality or inequality among those
   points survives after the anonymous carrier points are forgotten.  Thus an
   exact finite coverage theorem for the mixed support patterns, followed by a
   contradiction using only those named-point clauses, would already be a
   uniform general-cardinality argument; it does not require `D.A.card = 8` or
   a separate deletion lift.  Conversely, the encoder must not assert that an
   arbitrary q-deleted four-subset is the whole physical radius class, nor add
   disequalities against unnamed carrier points.  Those stronger exactness
   facts are source-entitled only for a `CriticalFourShell` and are unnecessary
   for a sound weakened projection.  `U5FiniteExtraction.false_of_auditedBadPattern`
   is the existing production precedent for this named-label projection.

   The production contract for a computational continuation is therefore:
   (i) extract and cover every mixed q-deleted/critical-shell four-support
   pattern on the eight labels; (ii) attach only the metric clauses supplied by
   the corresponding source constructor; and (iii) replay a finite collection
   of ordinary geometric incompatibility kernels in Lean.  The remaining
   universal work is one of two genuinely new higher-level producers: (a) a
   well-founded shift/return/collision theorem that prevents indefinite support
   escape, together with a terminal at the returned frame; or (b) a named-point
   geometry or order incompatibility that eliminates every covered mixed
   support pattern.  Computation should resume only after that ingress contract
   is implemented and the prospective metric clauses are mapped to named Lean
   consumers;

   A source audit also rules out deriving (a) from carrier finiteness alone.
   `shiftOfEscape` replaces `(u,a₀,a₁)` by `(y,u,a₀)` and proves only that `y`
   lies outside the immediately preceding bounded support.  Consequently the
   abstract four-cycle
   `(A,B,C) → (D,A,B) → (C,D,A) → (B,C,D) → (A,B,C)` respects every retained
   freshness fact.  The support cardinality is constant, the shift is a
   relation rather than a canonical self-map, and the available off-circle
   fact supplies no strict potential.  A return argument therefore needs a
   genuinely new cumulative-freshness, monotone-rank, or no-cycle theorem; it
   must not be inferred from finiteness;
   and
3. keep the common-radius/equal-blocker exact-row obligations in their
   separately claimed lane rather than duplicating them here.

No further FreshThird fan-out should be introduced unless a child is closed in
the same change or the replacement theorem is a demonstrably stricter single
residual, as at this checkpoint.

### FreshThird source-helper publication checkpoint (2026-08-13)

Commit `9b9f1b04` publishes the current source-clean FreshThird helper bank and
the direct FirstNonHit frontier shape.  The five touched Lean modules pass a
targeted `lake-build`.  The newly proved helper declarations were also checked
individually for transitive axioms; they use only the expected foundational
axioms and do not introduce `sorryAx`.  They expose conditional deletion-fan
packets, cap-local blocker-fiber bounds, common-radius/same-blocker shell
consequences, deletion-survival witnesses, the exact blocked-triple/row-overlap
landing equivalence, and retained-packet symmetry.

This is theorem-bank and ingress progress, not closure.  The refactor leaves
`false_of_freshThird_firstNonHit` as the direct open `False` residual and makes
the formerly open overlap existential a compatibility consequence via
`False.elim`; the number of open sorries in that module is unchanged.  The
missing mathematical producer remains carrier-wide: it must force one actual
selected row at a center distinct from the Q-row center to block three Q-row
deletions, equivalently to overlap the Q row in at least three points.  No
bounded-core or general-cardinality lift currently turns a fixed finite search
into that producer.

Commit `33accb2f` separately publishes the four previously omitted exact-12
duplicate-center membership-pilot shards and repairs their coordinator's
append-membership proof.  Its targeted build is green.  Those generated shards
use governed `native_decide` only to validate 100 bank records; their own
headers correctly state that they prove neither coverage nor UNSAT.  Together
with the earlier terminal-consumer dependency repair at `0beb6161`, this makes
the checked Lean infrastructure reproducible from the public tree, but it does
not provide a terminal certificate, all-cell coverage, a universal lift, or a
live-sorry closure.

### 13.24.1 FreshThird crossed-three-row seventh-center producer (2026-08-10)

The crossed-three-row leaf has now been reduced source-cleanly to one strictly
narrower residual.  The broad declaration
`false_of_capSource_firstFiber_crossedThreeRowExactSupports` is proved by the
following producer chain:

1. `collisionFiveCenterFaithful_to_sixCenterFaithfulResidual` restores the
   omitted collision-blocker row, placing all six exact selected rows in one
   `FaithfulCarrierPattern`;
2. `exists_freshThird_crossed_faithfulPatternEscape` chooses an escaping point
   from a class of that same pattern; and
3. `FirstFiberCrossedFaithfulPatternEscape.actualBlocker_ne_sixCenters` proves
   that the escape point's actual blocker is distinct from the common crossed
   row center, both first-source blocker centers, and all three indexed apices.

The replacement terminal was
`false_of_capSource_firstFiber_crossedSeventhBlockerFaithfulResidual`, whose
input `FirstFiberCollisionCrossedSeventhBlockerResidual` retains, in each of
the four deletion arms, the six-row faithful boundary, the escape witness, and
the seventh actual blocker outside those six centers.  It was initially a
one-for-one strict refinement.  The 2026-08-10 source-closure checkpoint below
supersedes that intermediate status.

The next source audit exposed a stronger common U3 ingress that bypassed the
seventh-row case split.  It remains useful theorem-bank material, but the live
closure no longer consumes it: the canonical-override route below is shorter
and does not require a mixed-row or escape-cycle terminal.

A fresh consumer audit found no existing theorem that accepts the seventh-
blocker packet.  The source interface has nevertheless been sharpened without
adding another terminal.  The boundary now provides:

1. `escapeRow_actualBlockerRow_dichotomy`: the escaping faithful row has the
   same center as the escape point's canonical actual-blocker row, or the two
   rows have intersection cardinality one or two;
2. `escapeRow_support_eq_actualBlockerRow_of_center_eq`: the equal-center arm
   identifies the complete faithful supports;
3. `actualBlockerClass_deletionFan` and `escapeClass_deletionFan`: both rows
   carry source-faithful deletion fans;
4. `exists_mutualCrossDeletionRows_of_escapeCenter_eq_oppApex1`: the
   first-apex arm produces mutually surviving crossed deletions; and
5. `exists_repeatedBlockerCap_pair_outcome`: the canonical seventh row has two
   sources whose actual blockers lie in one strict cap, with the remaining
   five-way blocker/cap/cross-deletion outcome made explicit.

These are cardinality-independent producers, not contradictions.  On the
supplementary seventh-row route, the shortest currently visible bridges remain
any one of:

1. both frontier points belong to the seventh blocker's canonical row, feeding
   a third-center common-pair contradiction;
2. that row has a three-point overlap with one installed faithful class,
   feeding the existing faithful-pattern overlap bound; or
3. the seventh row extends an installed arm to the exact five-row boundary
   required by the existing blocker-outside-or-row consumer.

The direct U3 ingress leaves one smaller universal terminal.  Its exact-radius
obstruction has two constructors: a q-deleted exact four-row escaping the
eight-point bounded support, or a `CriticalFourShell` with the dangerous-circle
distribution bounds.  Existing source-clean reductions turn repeated escapes
into either a mixed confined audit frame or a provenance-preserving step cycle
of period at least four.  The mixed arm now supplies two confined q-deleted
rows with intersection cardinality one or two, but no theorem forces the
reciprocal or dangerous-center incidences needed by a contradiction consumer.
The cycle arm retains its row/shell provenance, but no available metric,
boundary-order, or rank theorem makes it a strict descent.  The existing
rowwise-confinement terminal is only conditional: the present packet does not
produce uniform confinement for every audit center.

The first source-faithful two-arm diagnostic was run only after those ingress
facts were available.  Its `equal_center` and `first_apex` arms are SAT in both
Z3 and cvc5, with independent exact selected-field readback; malformed support
mismatch and center-collapse controls are UNSAT in both solvers.  This is a
finite Boolean incidence diagnostic only: it supplies neither a Euclidean
realization nor exact-cardinality coverage, a universal lift, a counterexample,
or Lean closure.  The target was already small enough for the solvers, so
larger timeouts or further local decomposition would not change the result.

The mandatory post-wave global theorem-bank search found no promoted consumer,
exact-17 coverage theorem, or finite-to-universal lift for this packet.  The
remaining U3-route obligations at that checkpoint were therefore explicit:

1. close the direct U3 terminal by proving either the missing positive
   incidences for the mixed two-row packet or a strict well-founded measure
   ruling out every provenance-preserving escape cycle;
2. alternatively, prove a source-faithful terminal consuming either the
   equal-row/deletion-fan packet or the first-apex mutual-cross-deletion packet
   on the supplementary seventh-row route;
3. if finite exact-17 computation is used again, prove exhaustive coverage of
   every admissible assignment rather than one frozen motif; and
4. prove the general-cardinality obstruction or lift needed to reach the live
   universal leaf.

The current packet proves none of the positive incidences listed above.  In
particular, distinct row centers supply only an intersection upper bound, while
the two cross-deletion-survival arms in the repeated-cap outcome have no current
consumer.  Do not run another local crossed-row/Kalmanson matrix: four of its
six boundary matchings are impossible, while both monotone survivors have
exact-rational strictly convex Euclidean realizations.  The next useful theorem
must be a carrier-wide positive-incidence or blocker-transport producer for the
mixed U3 rows or seventh row, or a strict descent/no-cycle theorem retaining
enough row provenance to reach an existing terminal.

#### 13.24.1.1 Source-closure checkpoint (2026-08-10)

The crossed-seventh terminal is now proved without a replacement `sorry`.
Every B7 arm already provides an escaping carrier point outside `namedSeed`.
The three source-row support-to-`namedSeed` lemmas therefore give omission
from the first collision row, the opposite collision row, and the cap-source
row.  These omissions feed the extracted upstream
`false_of_freshCanonicalRowOverride`, which now calls
`false_of_capSource_freshThirdBlockerFiber_normalizedOnly`.  That adapter uses
only the normalized FreshThird constructors and ends at the existing
`false_of_twoCapSources_freshThirdBlockerFiber_normalized_residual`; it does
not call the generic core that previously created a dependency cycle.

The resulting classification is source closure, not unconditional closure.
The crossed-seventh U3 child and its anchored `sorry` are gone, while the
already-existing normalized FreshThird leaves remain load-bearing.  A locked
Lean 4.27 target build of `TwoSourceFirstFiberCollision` succeeds.  A fresh
`proof-blueprint sync` at build hash `7dea73d9a2c3` reports matching source and
kernel call graphs, 35 on-spine open symbols, and 41 effective declarations
with `sorry`, down from 42 before this change.  The U3 mixed-row and cycle
packets remain valid theorem-bank results, but are no longer a prerequisite for
this live branch.

The literal open anchor is now
`TwoSourceExactCollisionRowsTerminal.
exists_freshThird_firstNonHit_selectedRow_overlap_card_ge_three`.  It retains
the acyclic canonical consumer packet, the first-source non-hit, and the
second-source interaction, but states the exact missing positive incidence:
a selected row at a center distinct from the canonical Q-row center overlaps
the Q row in at least three points.  The former
`false_of_freshThird_firstNonHit` declaration is now a proved compatibility
adapter from that producer to the existing clean two-circle terminal, so all
downstream callers are unchanged.  This rewrite does not reduce the open-sorry
count; it makes the one remaining obligation explicit.  Do not introduce
another local alignment producer or further case fan-out; computation is
justified only after a source-faithful producer/consumer contract is stated
and the bounded theorem-reuse preflight for that stated candidate has been
run.

#### 13.24.1.2 First-non-hit retained-core audit (2026-08-10)

The 128 source-labelled QF_LIA slices remain only a structural diagnostic:
all 128 are `SAT` in Z3 and cvc5, while the malformed controls are `UNSAT`.
They establish no Euclidean model, counterexample, finite coverage theorem,
general-cardinality lift, Lean theorem, proof of the new overlap producer, or
unconditional closure of `false_of_freshThird_firstNonHit`.

The retained/common packet does not entail the previously proposed
boundary/order bridge.  For the first source, the two non-hit constructors
make that bridge impossible: `sameBlocker` contradicts the bridge's required
center inequality, while `sourceRowOmission` contradicts one of its required
Q-row endpoint memberships.  Retract the prior authorization for another
boundary/order computation.

Minimal-core normalization adds no contradiction.  For each
`MinimalDeletionCore`, `MinimalDeletionCore.shellAt_radius_eq` identifies a
`P`-endpoint shell with the retained `radius` exact-four class and a
`Pρ`-endpoint shell with the retained `ρ` class.  Pairwise-disjoint supports
then only restate separation of distinct exact-radius classes.  Common
deletion does not force equal witness cores, equal partners, a shared shell,
or an endpoint collision; the resulting disjoint classes are compatible with
`firstCap.card ≥ 8` and with the singleton source slices.

The source-clean local producer
`freshThird_alignedCommonDeletionCorePairPacket_of_commonOmission` constructs
the common-deletion packet, but no source-clean terminal consumes that packet.
The same-blocker/same-blocker subbranch does yield equal source-row centers and
mutual source incidence.  The apparent mutual-first-fiber adapter is not a
consumer for this branch: it requires `FreshOutsideFirstBlockerFiber`, whereas
the anchor supplies `FreshThirdBlockerFiber`; its downstream hard-residual
terminal is also still a `sorry`.

The common-radius ingress was audited separately.  Its existential surface is
not connected at the type level to the current `C`, `Q`, non-hit, or second
interaction, and current adapters do not transport its radius/cardinality data
to them.  It therefore supplies no independent clean consumer for this leaf.
The existing source-clean global multiplicity ingress
`collisionRows_sourceCleanMultiplicityIngress` stops at
`CollisionCrossHit ∨ (GeometricMultiplicityResidual ∧
TwoCollisionGlobalSplit)`; neither arm currently implies a terminal accepted
by this residual.

The precise clean landing contract is now the literal theorem
`exists_freshThird_firstNonHit_selectedRow_overlap_card_ge_three`:

```lean
∃ source : CriticalShellSystem.CarrierVertex D.A,
  H.centerAt source.1 source.2 ≠
      H.centerAt Q.source₁.1 Q.source₁.2 ∧
  3 ≤
    ((H.selectedAt source.1 source.2).toCriticalFourShell.support ∩
      (H.selectedAt Q.source₁.1 Q.source₁.2).toCriticalFourShell.support).card
```

The source-clean terminal
`false_of_centerAt_selectedFourClass_inter_card_ge_three` then closes the
former `False` interface immediately by taking the Q row as the selected
four-class.  No current source-clean theorem supplies this producer from the
retained/common ingress and the non-hit/interaction product.

Hard gate: do not repeat or enlarge the local 128-case incidence wave and do
not add another alignment or case-split residual.  A new solver experiment is
authorized only after a source-clean theorem supplies the displayed overlap
packet, or another equally explicit packet accepted by a clean terminal.  A
finite experiment may test a fixed candidate shape, but it cannot replace the
cardinality-independent producer or a proved finite-to-universal lift.

#### 13.24.1.3 First-non-hit local-closure boundary (2026-08-11)

A constructor-by-constructor source audit sharpens the hard gate.  In the
retained same-blocker/same-blocker arm, the two canonical source rows have the
same center and support as the Q row, and the common-omission subarm produces a
`FreshThirdAlignedCommonDeletionCorePairPacket`.  This does not saturate the
actual-blocker fiber: the live packets do not prove the four named carriers
distinct from one another, an alias only decreases the fiber cardinality, and
no source-clean theorem produces a fifth carrier.  Consequently
`actualBlockerFiber_card_le_four` is compatible with this arm rather than a
contradiction.

In the omission/omission arm, a shared deleted endpoint together with distinct
source centers yields a clean `CommonDeletionTwoCenterPacket`.  Every current
source-clean consumer of that packet stops at a paired-row, adjacent-grid,
robust-row, or large-cap outcome; none produces the required three-point
overlap or `False`.  Different deleted endpoints have no deletion-transport
theorem, and equality of the two source centers is not contradicted by the
packet.  The geometric interaction constructors already expose exactly two
common row points, so they do not reach the three-overlap terminal either.

The common-radius same-blocker/same-blocker arm gives the strongest local
normal form: the common exact-four row is precisely the two canonical sources
and the two Q endpoints, while the canonical-source pair lies on one
`oppApex1` radius.  Existing cap localization forces the common row center
into the canonical cap; it does not contradict the configuration.  The named
data still provide only two perpendicular-bisector centers, `oppApex1` and the
common blocker, while the clean metric terminal needs a third.

Therefore the remaining work is genuinely global.  The next admissible
producer must use carrier-wide K4/minimality, cap order, or metric geometry to
produce either a new distinct-center row overlapping the Q row in at least
three points, or a direct cyclic/metric contradiction of the exact-four normal
form.  Repackaging the local deletion cores, splitting aliases, or rerunning
the unchanged finite incidence abstraction cannot close the anchor.  This
checkpoint is a negative theorem-bank audit and closes no `sorry`.

#### 13.24.1.4 First-non-hit named-row exclusion (2026-08-11)

Two source-clean production lemmas now formalize the complete local boundary
for the two named canonical-source rows:

* `freshThirdCapSourceNonHit_centerEq_or_inter_card_le_two`; and
* `freshThirdCapSourceInteraction_centerEq_or_inter_card_le_two`.

For every constructor of `FreshThirdCapSourceNonHit` and
`FreshThirdCapSourceInteraction`, the named source row either has the same
blocker center as the canonical Q row, or has a distinct center and support
intersection of cardinality at most two with the Q row.  The omission arms use
deletion survival to separate the blocker centers and then the generic
two-circle intersection bound; the two geometric interaction arms already
record the exact two-point intersection.  A Lean 4.27 check of
`TwoSourceFreshThirdResidual.lean` succeeds, and scratch axiom checks of both
lemmas report only `propext`, `Classical.choice`, and `Quot.sound`.

Consequently neither `C.firstSource` nor `C.secondSource` can witness
`exists_freshThird_firstNonHit_selectedRow_overlap_card_ge_three`.  Further
splitting of the eight local constructor products cannot close the anchor.  A
proof through the existing clean three-overlap terminal must produce a genuinely
new selected row.

The narrowest source-faithful global producer currently identified is a
three-blocked-deletions theorem.  It must supply a carrier source whose blocker
center differs from the Q-row center and a finite set `W` of at least three
points in the Q-row support such that deletion of every `w ∈ W` is blocked at
the new center:

```lean
∃ source : CriticalShellSystem.CarrierVertex D.A,
  H.centerAt source.1 source.2 ≠
      H.centerAt Q.source₁.1 Q.source₁.2 ∧
  ∃ W : Finset ℝ²,
    W ⊆
      (H.selectedAt Q.source₁.1 Q.source₁.2).toCriticalFourShell.support ∧
    3 ≤ W.card ∧
    ∀ w ∈ W,
      ¬ HasNEquidistantPointsAt 4
        (D.A.erase w) (H.centerAt source.1 source.2)
```

This packet reaches the live overlap producer without another geometric
assumption: `source_mem_critical_support_of_no_qfree` puts every point of `W`
in the new selected row, and `Finset.card_le_card` gives the required
three-point intersection.  Existing carrier-wide K4 and source-faithful escape
theorems do not yet produce the three blocked deletions at one distinct center;
they provide a row or an escaping point without the required endpoint
transport.  The next proof or computational theorem-mining step must therefore
target this producer (or a direct clean metric contradiction), not another
local case split.  This checkpoint strengthens the production theorem bank but
does not close a `sorry`.

#### 13.24.1.5 First-non-hit cardinality-independent preflight and metric gate (2026-08-11)

The source-mapped FOL packet in
`scratch/p97-consumer-first/freshthird_firstnonhit_fo_v1/` has no
carrier-cardinality or finite-domain axiom.  Mace4, stopped after its first
model, found a domain-eight model of the named incidence abstraction.  This is
a finite abstraction countermodel only, not a Euclidean realization or a P97
counterexample.  Vampire refuted both landing-contract controls: an explicit
three-point overlap at distinct centers and the stronger three-blocked-
deletions packet.  These refutations validate the clean Lean consumer; they do
not produce the live witness or close the `sorry`.

A scoped theorem-bank and source audit also rejects the proposed reverse-
Kalmanson shortcut.  The retained packet proves the strict inequality

```text
d(rL,rR) + d(rhoL,rhoR) < d(rL,rhoR) + d(rhoL,rR),
```

but `FreshThirdAlignedCommonDeletionCorePairPacket` contains only omission,
deletion-survival, and minimal-core data.  It neither identifies its deleted
endpoints with the four adjacent-cap hits nor supplies any metric relation
among those hits.  The opposite weak inequality would immediately contradict
the strict cut, but it is an additional global theorem, not a consequence of
the current interface.

The three-blocked-deletions formulation is **not** a weaker production gate.
`cross_deletion_survives_iff_not_mem_selected_support` identifies deletion
failure at a selected-row center with membership in that selected support.
Consequently, three distinct points of the Q row whose deletions are blocked
at one distinct center are exactly the required three-point overlap, written
in deletion language.  The Vampire refutation is therefore a landing-contract
control, not evidence for an intermediate producer.

The production gate is a genuinely stronger source-clean carrier-wide fact
that forces those memberships: for example, a row-relocation theorem, a
cap-order/metric theorem tying a newly produced actual row to three Q-row
points, or a direct contradiction.  The existing five-source blocker-fiber
and deletion-fan banks stop at distinct blockers or common-deletion packets;
they do not supply a third Q-row incidence.  Named-incidence SAT, the two
logical control refutations, and the retained-grid strict inequality remain
preflight evidence only; none is universal closure.

#### 13.24.1.6 First-non-hit metric and exact-17 stop result (2026-08-11)

The next bounded metric checks separate local feasibility from a frozen
full-carrier rejection.  The named same-blocker configuration has an exact
rational Euclidean realization: the Q row contains the two Q endpoints and
the two canonical sources on one circle, the retained endpoints lie off that
circle, and both Z3 and cvc5 accept the exact witness.  A malformed control
placing the same point on two distinct radii is rejected by both solvers.  The
artifacts are in
`scratch/p97-consumer-first/freshthird_firstnonhit_sameblocker_metric_v1/`.
This proves only that the named local geometry is not the missing
contradiction; it is not a P97 counterexample because it omits the complete
carrier-wide K4, minimality, cap-order, and deletion ingress.

One exact-17 replay in the `fullcarrier_exact17/` subdirectory is dual-solver
UNSAT after the rich-radius groups are added.  The small conflict is a frozen
incidence inconsistency: a chosen K4 support at one apex contains points from
two declared distinct rich-radius arms.  The live FirstNonHit packet does not
force that chosen support or that cross-arm incidence.  Thus the result
rejects one proposed exact-17 assignment; it does not cover all assignments,
produce the required distinct-center three-overlap row, or lift to arbitrary
carrier cardinality.  It closes no Lean obligation.

This round establishes a hard stop for further ad hoc fixed-assignment waves.
Another computation is production-relevant only after one of the following
contracts is present:

1. a source-faithful exhaustive encoder whose variables range over every live
   K4/selected-row choice, together with a proved bounded-obstruction or
   general-cardinality lift; or
2. a new cardinality-independent source theorem forcing a distinct-center
   selected row to contain at least three points of the Q row, equivalently
   forcing three Q-support deletions to be blocked at that same center.

Until one of those contracts is proved, the honest status is that current
computational methods can refute candidate incidence assignments and discover
cuts, but cannot close this universal `sorry`.  Broad theorem search and
additional local constructor splitting are therefore paused.

#### 13.24.1.7 First-non-hit finite abstract ingress (2026-08-12)

The first production contract named above is now available in a weaker and
more useful form.  The source-clean theorem
`exists_freshThird_qRow_boundedSharedRadiusPair_or_minimalDeletionCore`
projects every live canonical Q row to bounded named data:

- a fresh center outside the exact four-point Q support;
- a nonempty blocking set `V` contained in that support, hence `V.card ≤ 4`;
- failure of K4 after deleting `V`; and
- either a same-radius pair in `V`, or a `MinimalDeletionCore` with one exact
  four-point restoration shell for each of the at most four labels in `V`.

This is deliberately **not** an induced finite carrier or a smaller
`CounterexampleData`.  K4 is not downward-hereditary, so restricting the live
carrier would be unsound.  Instead, the finite encoder must forget anonymous
witnesses and retain only source-proved fields of this packet.  Its formal
ingress obligation is

```text
LiveFirstNonHit -> exists valuation, EncodedWeakPacket valuation.
```

Accordingly, an exact `UNSAT` certificate for `EncodedWeakPacket`, followed by
kernel-checked coverage and the existing clean terminal, would refute every
live carrier without a finite-to-induced-carrier lift.  The encoder may not
assert absence of omitted witnesses, identify the packet with the whole
carrier, impose a finite carrier cardinality, or add global K4/row facts not
separately derived from the source.  Any retained, non-hit, interaction, cap,
or blocker clause used by the certificate must have its own explicit source
map into the finite valuation.

This theorem does not itself close a `sorry`.  It licenses one scoped
source-mapped abstraction wave.  `SAT` remains diagnostic only; `UNSAT` is
promotion-relevant only with the live-to-packet theorem, exact certificate
replay, kernel-checked finite coverage, and a named on-spine consumer in the
same landing.  The remaining mathematical risk is that the weakened packet is
still satisfiable, in which case the next step must be a new uniform source
clause rather than another fixed-cardinality or frozen-assignment wave.

#### 13.24.1.10 Corrected FirstNonHit incidence projection (2026-08-12)

The later corrected packet in
`scratch/p97-consumer-first/freshthird_firstnonhit_fo_v2/` repairs a stale
incidence model that had omitted the two retained-pair blocker equalities and
their blocker-center inequality.  The corrected packet also retains the live
lower bound through fifteen pairwise-distinct carrier witnesses.  A bounded
Mace4 search at domain size fifteen timed out and Prover9 found no proof; both
outcomes are **inconclusive** and are not evidence for either satisfiability or
contradiction.

The corrected projection is nevertheless satisfiable.  The independent
artifact in
`scratch/p97-consumer-first/freshthird_firstnonhit_fo_v2_explicit_model/`
gives an explicit fifteen-carrier assignment.  Its Python checker validates
every corrected v2 clause family, and separately generated pinned SMT queries
are `sat` in both Z3 4.17.0 and cvc5 1.3.3.  The malformed pinned control is
`unsat` in both solvers, with clean exits and empty stderr.  The assignment
uses a saturated four-source Q blocker fiber and keeps every distinct-center
row intersection at cardinality at most two.

This is an **incidence-projection SAT witness only**.  It omits Euclidean
coordinates, strict cap geometry and cyclic order, selected-radius metric
equalities, the full deletion packets, and the complete P97 minimality
interface.  It is not a P97 counterexample, not a general-cardinality model,
not a finite-to-universal lift, and it closes no Lean `sorry`.

A fresh theorem-bank search after this correction found no source-clean
producer for the live terminal.  The exact missing contract remains a carrier
source with blocker center distinct from Q's blocker together with at least
three Q-support points whose deletions are all blocked at that source center.
The clean generic blocked-deletion lemma then puts those three points into the
new selected row and the existing two-circle consumer closes the branch.
Current named rows cannot supply the witness: each is either centered at Q or
has intersection cardinality at most two.

Accordingly, the pure blocker/row-incidence abstraction is now exhausted for
this anchor.  The next admissible refinement must add a new source-proved
cap/cyclic-order or metric clause, or provide a formally proved bounded-
obstruction/general-cardinality lift before further finite enumeration.  The
safe six-anchor-plus-nine-fresh symmetry reduction recorded in
`scratch/p97-consumer-first/freshthird_firstnonhit_fo_v2_optimization_audit/`
does not change this status and need not be run: the explicit model already
settles the corrected incidence projection as satisfiable.

#### 13.24.1.12 FirstNonHit cap-fan route hard stop (2026-08-13)

A source-level audit has now exhausted the proposed endpoint cap-fan route
without launching another CEGAR wave.  The clean fan theorem can produce two
row points whose actual blocker centers lie in one strict cap and then splits
into equal-blocker and cross-deletion alternatives.  Neither alternative
reaches the live three-overlap terminal:

- in the equal-blocker alternative, equality of the actual blockers does
  identify the two exact selected supports, but the API does not synchronize
  the fan's blocker cap with the endpoint row's `rowCap`, put the endpoint row
  center in that blocker cap, or put the chosen pair outside it;
- the cross-deletion alternatives retain only one blocked deletion at each
  actual center, whereas the clean landing theorem needs three Q-support
  deletions blocked at one center distinct from `qCenter`.

The specialized retained-collision localization theorem does not repair this
gap.  It can identify an actual-row center with a common blocker only after a
`RetainedRadiusCollision` and a row containing that retained collision pair
are already supplied.  The arbitrary fan pair has neither the retained-radius
membership nor the pre-existing common-blocker packet required by that
theorem.  Thus it cannot create the missing blocker equality or cap
synchronization.

This is a source-interface obstruction, not a finite SAT result and not a Lean
closure.  No mandatory post-wave theorem search is due because no solver wave
was run.  Retire this cap-fan route rather than extending its local case split.
The live gate remains
`exists_freshThird_firstNonHit_selectedRow_overlap_card_ge_three`: future work
must either prove a genuinely carrier-wide source theorem producing three
Q-support incidences at one distinct actual center, or first prove a formal
bounded-obstruction/general-cardinality lift before resuming finite search.

#### 13.24.1.15 FirstNonHit six-named-point order audit (2026-08-13)

The targeted pro-model response has been audited against the live source.  Its
proposed `FreshThirdQRowActualBlockerFiberPacket` is not a new producer: it
already packages a distinct actual blocker center together with at least three
sources in that center's actual blocker fiber whose values lie in Q's selected
row.  This is a stronger restatement of the active three-overlap gate, not a
strict reduction of the frontier.  Do not add the suggested `_core` wrapper or
resume the four-bit quotient on the strength of that packet.  The response's
16-case incidence model remains an interface obstruction only; it omits
Euclidean realization, cyclic order, global minimality, and carrier-wide
coupling.

The response's six-point follow-up does expose one authorized, genuinely new
computation.  In the geometric interaction constructors
`distinctBlockersDifferentCaps` and `sameCapWithInternalFiberSource`, the live
packet supplies two distinct row centers, their exact shared two-point chord,
two non-chord remainder points in each selected-four row, and the four metric
equalities consumed by
`TwoTripleRowSixPointEuclideanObstruction.false_of_six_ccw_two_triple_row_equalities`.
The first missing antecedent is a source-entitled cyclic placement of one
remainder from each row.  Enumerating the cyclic orders of these six named
points is cardinality-free role enumeration inside every live instance; it is
not a fixed-`n` census or an induced-subcarrier reduction.

The next executable checkpoint is therefore an exact order-type audit for the
two geometric constructors.  It must:

1. state and validate the live-to-six-role ingress, including distinctness,
   exact row intersections, the four squared-distance equalities, and every
   boundary-order fact used by the encoder;
2. enumerate every cyclic order compatible with those proved facts and every
   legal choice of the two remainder roles;
3. replay each eliminated order in exact arithmetic against the existing
   five/six-point kernels, while retaining an exact Euclidean witness for every
   surviving order;
4. emit complete order-coverage and provenance artifacts, then run the
   mandatory theorem mine only on this audit's new eliminations and survivors;
5. formalize the weakest source-clean cyclic-placement lemma found and wire it
   directly into the two geometric interaction arms, with a targeted build,
   transitive axiom audit, and fresh spine check before claiming closure.

If every admissible order is eliminated, the promoted result may close only
the two geometric interaction arms after the Lean ingress and consumer are
proved.  If any order survives, stop the unchanged search, publish its exact
witness, and name the additional cap-placement or global-order producer needed
to exclude it.  The `sameBlocker` and `sourceRowOmission` constructors are not
covered by this six-point lane; keep them parked behind a separate
source-level equality/incidence producer.  This subsection authorizes the
order audit only and claims no FirstNonHit or Lean `sorry` closure.

#### 13.24.1.16 FirstNonHit six-point outcome and source retarget (2026-08-13)

The exact order audit changes the status of §13.24.1.15 from an open
computation to a bounded negative route result.  The live branch is slightly
more asymmetric than the earlier shorthand suggested: `data` is a
`FreshThirdCapSourceNonHit` for the first source, while only
`secondInteraction` can enter one of the two geometric constructors.  The
local audit therefore tests the two selected-four rows supplied by that
geometric second interaction; it does not model the first-source non-hit arm.

Fixing one named chord endpoint as the cyclic anchor gives 120 oriented orders
of the six roles.  The proved shared-pair separation leaves 40 admissible
orders.  Twelve match proved lower-level Euclidean kernel schemas: four lie in
the generated two-triple-row schema set and eight in the generated sparse
six-point schema set.  This is deliberately weaker than saying that the
current boundary declarations directly consume all twelve words.  Two matches
have a direct linear-order adapter, six require a cyclic cut, and four require
both a cyclic cut and orientation reversal.  The remaining 28 orders are
exactly realizable over the rationals.  In particular, the stronger
two-complete-row fragment has the following strict-convexity witness (common
chord endpoints `A,D`, row centers `B,F`):

```text
A  = (-1, 0)                 D  = (1, 0)
B  = (0, 1/2)                F  = (0, -1/2)
C1 = (-41/37, 24/37)         C2 = (-121/109, 69/109)
E1 = (61/58, -51/58)         E2 = (31/29, -24/29)
```

Its cyclic order is `A,F,E1,E2,D,B,C1,C2`; the two exact supports are
`{A,D,C1,C2}` and `{A,D,E1,E2}`, with intersection `{A,D}` and common squared
radius `5/4`.  This is a witness only for the local two-row abstraction.  It
omits the cap-placement fields, the first-source non-hit packet, and all
carrier-wide coupling, so it is neither a model of the live branch nor a Lean
closure.

The finite checkpoint is now complete.  The deterministic enumerator and
replayer are
`census/p97_search/freshthird_firstnonhit_six_point_order_audit.py`, the
focused test is
`census/p97_search/test_freshthird_firstnonhit_six_point_order_audit.py`, and
the authenticated artifact is
`certificates/p97_freshthird_firstnonhit/audit.json`.  Its payload, coverage,
and order digests are respectively
`157da0a582144704b1e0308032a79e652b92d9f0a07d1a395e549101cbbcc20c`,
`2bd55080774b727a269ec0d58371d10549fe0219efbd4f54f2aebdc767cb2d39`,
and `5f4e72233b1b9aee18631cb18e64b0a1d28cf0b5920d836e70300a50b5583a7a`.
Replay covers all 120 anchored words, the 40-word source subset, every generated
schema match, and all 28 exact rational witnesses; it leaves zero `UNKNOWN`.
Five focused tests and Ruff pass.

The source-faithful Lean ingress is now frozen in
`FreshThirdTwoRowSixPointIngress.lean`.  It proves the exact two-row support
arithmetic, legal remainder choices, six-point distinctness, four metric
equalities, both geometric second-interaction ingresses, and the shared-pair
cyclic separation derived from the live `D.K4` boundary.  It is wired into the
`FrontierLiveClosure` umbrella, whose targeted build succeeds.  All six new
exports have transitive axiom sets consisting only of `propext`,
`Classical.choice`, and `Quot.sound`; there is no `sorryAx`.

Accordingly, stop unchanged six-role enumeration after that checkpoint.  The
next source target is a cap-placement/global-order producer, not another
two-row kernel search: prove that the cap fields of either geometric
constructor exclude all 28 exact survivor words, equivalently forcing every
legal remainder choice into one of the twelve kernel-schema words.  Promotion
through all twelve would additionally require the recorded cyclic-cut and
reverse-orientation adapters, but those adapters cannot remove any of the 28
realizable words.  This contract is meaningful on both arms of
`FreshThirdAcyclicCanonicalConsumerPacket` and is the narrowest direct consumer
of the finite audit.

There is also a stronger three-row route, but it must not be advertised as a
consumer of arbitrary `hingress`.  On the common-radius arm only, one may
produce a selected-four endpoint row centered at one of the shared chord
endpoints whose exact support is the two canonical sources together with the
two fresh-row remainders.  That is precisely the missing input of
`freshThird_exactSupport_threeRowCyclicSeparations`, whose existing consumer
turns the three shared-pair separations into the formal six-point
contradiction.  The retained ingress arm does not supply a
`CommonRadiusTwoCapSourceThirdCanonicalRowSurface`, so it must instead obtain
the cap-order theorem above, promote to common-radius data by a separate
source theorem, or reach the existing selected-row overlap-cardinality
terminal.  The rational survivors show that every such producer must use cap
or global data; none follows from the two circle rows alone.

The mandatory theorem mine for this wave has one negative and one positive
output.  Negatively, two exact selected-four circle rows with exact two-point
overlap admit strict-convex rational realizations, so no universal
two-row-only contradiction schema is available.  Positively, the reusable
consumer boundaries are now exact: a cap-order exclusion of the 28 survivor
words works on both ingress arms (followed by the small recorded adapters),
while the endpoint-row theorem feeds the existing three-row cyclic consumer
only after common-radius ingress has been exposed.  The
`sameBlocker` and `sourceRowOmission` constructors remain out of scope for this
lane.  No FirstNonHit arm or load-bearing `sorry` is closed by this audit.

#### 13.24.1.17 FirstNonHit common-radius W4 metric probe (2026-08-13)

A single bounded nonlinear wave tested one source-audited exact-17
representative of the common-radius `sameBlocker × sameBlocker` FirstNonHit
arm.  The live source first produces a four-point set `W` in the strict
canonical cap and outside the Q selected row, with deletion survival at the Q
blocker center.  It does not synchronize the actual blockers of the four
points, put the four points on one radius, or relate their actual selected rows
to the Q row.  The computational representative therefore records separately
which additional label, cap, retained-endpoint, and named-row assignments are
frozen rather than universally source-entitled.

The staged shared-coordinate query has the following authenticated result:

1. `geometry_core` (705 assertions) is SAT in Z3Py and external Z3.  Exact
   substitution and rational `Fraction` replay pass, and the pinned model is
   SAT in cvc5.  Unpinned cvc5 times out.
2. `cap_classification` (756 assertions) has the same result and validates the
   exact frozen closed-cap profile `8,6,6`.
3. `canonical_three_radii` (780 assertions), which first couples the canonical,
   retained-P, and retained-Pρ strict-cap pairs to three positive pairwise
   distinct apex radii, is inconclusive: Z3Py returns `UNKNOWN:timeout` and
   external Z3 and cvc5 time out.
4. `selected_row_equalities` (795 assertions) and `blocker_exactness` (834
   assertions) are likewise inconclusive under the same 60-second budgets.
5. Three malformed controls are UNSAT in Z3Py, external Z3, and cvc5.

The exact models from the first two stages authenticate only strict-convex
geometry and the frozen cap layout; their unconstrained radius variables are
not radial witnesses.  No solver status from this wave proves or refutes the
three-radius coupling.  The artifacts and fail-closed verifier are under
`scratch/p97-consumer-first/freshthird_firstnonhit_common_w4_metric_v1/`.

The mandatory wave-only theorem mine produces no concrete general theorem
candidate: there is no UNSAT core, forced invariant, or recurring
source-faithful survivor motif.  Accordingly this result does not trigger a
new Lean-corpus search.  It is not a FreshThird counterexample, a universal
survivor, a finite-to-universal lift, a Lean proof, or closure of the anchored
`sorry`.  Do not rerun the same frozen query merely with longer timeouts.  A
successor must add a materially new source-entitled coupling—such as actual
blocker/row synchronization for W—or first formalize a bounded-obstruction and
general-cardinality lift.

#### 13.24.1.18 FirstNonHit prescribed remainder and cap-only hard stop (2026-08-13)

The six-point ingress now has a source-clean prescribed-remainder form.  The
general adapter
`selectedFourClass_twoRow_six_point_ingress_of_left_remainder` accepts a
specified point of the left selected support outside the right support.  Its
FreshThird specialization
`freshThird_secondSource_prescribed_remainder_ingress_of_geometric_data`
uses `C.secondSource` and records its strict canonical-cap membership.  The
conclusion deliberately retains the alias arm
`C.secondSource.1 = H.centerAt Q.source₁.1 Q.source₁.2`; current source
hypotheses do not exclude that equality.  Both declarations build in the
targeted Lean job, and their transitive axiom sets contain only `propext`,
`Classical.choice`, and `Quot.sound`.

The corresponding cap-interval projection has now been exhausted rather than
assumed contradictory.  The deterministic enumerator
`census/p97_search/freshthird_firstnonhit_cap_interval_audit.py` fail-closed
replays the 40-word six-point artifact, prescribes the second cap source in
the distinguished strict cap, and enumerates both source-entitled interaction
arms.  Marker/role endpoint use is represented as physical coincidence, not
as adjacency.  The omitted first cap source is tracked only as cap-membership
metadata; no identity or order relative to the six roles is inferred.  The
focused tests and the original six-point tests pass 9/9, and Ruff is clean.
The authenticated artifact is
`certificates/p97_freshthird_firstnonhit/cap_interval_audit.json`, with payload
SHA-256
`30ff09caaad06331f4fce7ff3b0ccd6a5466441b43437b8397d0eefc33047789`
and record SHA-256
`9b589c8a2987e72d31188a036d6b66606232dbcfa95738f84a58d0f7aace796d`.

The result is a hard stop for the cap-only target stated in §13.24.1.16:
all 28 rational survivor words admit a distinct-strict-cap extension, all 28
admit a same-strict-cap/closed-source extension, and all 28 admit the stronger
endpoint-coincidence version.  The twelve kernel-schema words also admit both
interaction arms.  Thus the currently exposed cap fields exclude 0 of 40
source-alternating words.  This is an authenticated finite combinatorial
extension result, not a Euclidean realization, a P97 model, a formal
independence theorem, or closure of the anchored `sorry`.

Consequently the next admissible FirstNonHit producer is carrier-wide.  It
must couple named strict-cap off-Q sources to their actual blockers and
selected supports (or produce an equivalent blocked-deletion triple), rather
than add more cap labels or six-role orders.  The weakest existing landing is
the three-point-overlap terminal: produce one actual center distinct from the
Q center whose selected row contains at least three Q-row points, equivalently
three Q-row deletions blocked at that center.  A successor finite query must
therefore include the named sources, each source's actual blocker and selected
support, the Q row, and the source-clean deletion-survival links.  Before any
finite verdict is promoted, it additionally needs a bounded-obstruction or
deletion-minimality lift to arbitrary carrier cardinality.  The common-radius
W4 packet in §13.24.1.17 is a useful ingress for this synchronization query,
but its present cap placement and Q-center deletion survivals do not supply
the missing actual-row incidences by themselves.  No FirstNonHit branch or
load-bearing `sorry` is closed at this checkpoint.

#### 13.24.1.19 W4 polarity correction and pinned-endpoint retarget (2026-08-13)

The direct W4-to-three-overlap target from §13.24.1.18 is now retired.  The
source-clean theorem
`freshThird_commonRadius_sameBlocker_exists_four_sources_with_two_qRow_omissions`
combines the four-source common-radius packet with the exact distinct-circle
relocation bound.  For every `z ∈ W`, it proves all of the following:

1. `z` lies in the strict canonical cap and outside the Q selected support;
2. its actual blocker differs from the Q blocker;
3. its actual selected support meets the Q support in at most two points;
4. deleting `z` preserves K4 at the Q blocker; and
5. at least two Q-support points are omitted from `z`'s actual selected row,
   with deletion of each omitted point preserving K4 at `z`'s blocker.

Thus the W4 sources have the opposite polarity from the three-blocked-deletion
terminal: they formally supply two or more *surviving* Q-row deletions and
overlap at most two.  No source-faithful CEGAR query may select a W4 source as
the promised distinct-center row of Q-overlap at least three.  The theorem
builds in the targeted `TwoSourceFreshThirdResidual` job and its transitive
axiom set is exactly `propext`, `Classical.choice`, and `Quot.sound`.

The corrected universal finite ingress is the already source-produced
pinned-endpoint outside-seed residual, not raw W4.  It contains an escaping
selected-four row, the full `SourceFaithfulSelectedFourDeletionFan`, endpoint
and boundary-row data, cap placement, and order information.  The generic fan
consumers reduce this packet to center nonrobustness, same-cap blocker
collision/cross-deletion rows, or mutually surviving cross-deletion rows.  No
proved theorem currently makes those outcomes incompatible with the retained
endpoint, outside-seed witness, `hrowAt`, and cap/order data.

Accordingly the next exact target is a source-clean pinned-endpoint fan
incompatibility theorem consuming those row-valued outcomes while retaining
the full endpoint/outside-seed/cap-order packet.  This is a
cardinality-independent ingress: a finite search is admissible only if it
encodes that exact packet and emits a replayable obstruction accepted by the
new consumer.  A cap-only or fan-Boolean projection is too weak and is not a
production query.  This checkpoint closes no FirstNonHit branch and no
load-bearing `sorry`; it removes an impossible producer target and sharply
narrows the next theorem/CEGAR contract.

#### 13.24.1.21 W4 repeated-omission synchronization maximum (2026-08-13)

The cardinality-independent W4 audit has now extracted the strongest generic
synchronization forced by the corrected omission polarity.  The source-clean
theorem
`freshThird_commonRadius_sameBlocker_exists_two_repeated_qRow_omissionSuccessors`
produces two distinct points of the exact Q row.  Each point is omitted by the
actual selected rows of two distinct W4 sources in the strict canonical cap,
and deletion of that point preserves K4 at each of those two actual centers.
Its proof is a finite incidence count internal to the universal packet: four
sources each omit at least two points from a four-point Q row, so two distinct
Q-row points are each omitted at least twice.  No finite carrier bound or
solver result is used.

Both possible blocker-center follow-ups have been audited against the clean
consumer bank:

* If the two source centers associated with one omitted point are distinct,
  the data forms a generic two-center common-deletion packet.  Existing
  source-clean consumers only normalize that packet into further escape,
  robustness, or exact-row residuals; none yields `False` or the required
  three-point Q-row overlap.
* If centers coincide, the repeated pairs induce actual-blocker fibers on two,
  three, or four distinct W4 sources.  The clean cap-filter bound says only
  that a fiber containing at least three strict-canonical-cap sources has its
  blocker center outside the canonical cap.  It does not contradict K4,
  deletion minimality, or the W4 packet.  No exported theorem synchronizes
  that blocker center back into the canonical cap.

Thus repeated omission is the maximum conclusion of the raw W4 incidence
route under the current source interface.  Its polarity remains opposite the
FirstNonHit terminal, and neither center partition converts it into a blocked
deletion triple.  No further W4-only case split or solver wave is admissible
without a materially new source theorem.  In particular, this checkpoint does
not close a FirstNonHit branch or any load-bearing `sorry`.

The next production route therefore remains §13.24.1.20: extract the full
universally produced pinned-endpoint fan packet, including its endpoint,
outside-seed, exact-row, cap, metric, and cyclic-order fields, to a bounded role
structure with a formal arbitrary-cardinality lift.  A structurally different
source theorem that closes one of that packet's row-valued outcomes is an
equally valid successor.  Raw W4, cap-only, incidence-only, and fixed-cardinality
projections remain diagnostic rather than closure campaigns.

#### 13.24.1.29 Exact pinned-row deletion semantics and repaired finite survivor (2026-08-14)

The nonrobust pinned-center arm now has an exact arbitrary-cardinality
deletion semantics.  The generic theorems
`selectedFourClass_survives_erase_iff_not_mem_of_not_fullyDeletionRobust`
and `selectedFourClass_survives_erase_iff_robust_or_not_mem` identify survival
of a selected four-class after deleting one carrier point with the disjunction
between full deletion robustness and nonincidence of that point.  For an
`IndexedSourceFaithfulSelectedFourFan`, the source-membership hypotheses reduce
this further: every indexed fan-source deletion survives exactly when the
pinned center is fully deletion robust, and in the nonrobust arm all four such
deletions are blocked.

The finite query projection now carries that same exact law rather than a
one-way approximation.  The query packet exposes corresponding consumer
lemmas: at a nonrobust pinned center, deletion survival is equivalent to
nonincidence, while each actual fan source supplies a blocked deletion and a
row incidence.  The normalized source status also records that a nonrobust
center is distinct from all three rich apices; robustness attached to an apex
arm is used only after the corresponding center equality is known.

The diagnostic configuration was repaired to satisfy this stronger source
theory.  It is an exact finite model of the encoded source theory;
no source-level synchronization theorem is present.  A previous diagnostic assertion that
the boundary row avoided both adjacent caps was false and has been replaced by
the exact profile: all four boundary slots avoid the first cap, two lie in the
row cap, two lie outside it, and two lie in the fresh cap.  Thus the current
vocabulary already exposes fresh-cap boundary witnesses.  What it does not
source-prove is a synchronization of those witnesses with the indexed fan
sources, blocker rows, or a cyclic order strong enough for an existing metric
consumer.

Consequently no CEGAR or terminal-UNSAT campaign is authorized on the current
finite vocabulary, and no exact-cardinality result is being promoted to this
arbitrary-cardinality leaf.  The generic deletion theorem, indexed fan adapter,
and production `TwoSourceFreshThirdResidual` target have a focused green
governed build.  The explicit finite survivor is isolated one-way in
`TwoSourceFreshThirdResidualDiagnostics`; the production module does not import
that diagnostic module.  The former 42 separate `native_decide` checks were
replaced by direct rank-congruence, finite-case, and kernel `decide` proofs.
The isolated diagnostic target now completes its governed build in 13 seconds,
and both `diagnosticConfiguration_sourceTheory` and
`FreshThirdPinnedEndpointOutsideSeedFiniteQueryContract.not_of_currentSourceTheory`
audit to exactly `[propext, Classical.choice, Quot.sound]`, with no suspicious
source patterns.  This remains diagnostic evidence, not closure evidence.

The previously omitted load-bearing finite-map producer
`fourth_fiber_or_larger_known_fiber_of_four_omissions` is committed at
`991132e6`.  It is consumed by the four-omission FreshThird ingress and has the
same standard-three axiom footprint; it is a multiplicity alternative, not a
contradiction or a replacement for the missing row synchronizer.

This is a source-interface reduction only.  The theorem
`false_of_freshThird_pinnedEndpoint_outsideSeedResidual` still contains its
original `sorry`, remains off the current published kernel spine, and no
FreshThird branch is closed.  The remaining planned producer must synchronize one of the
boundary/fresh-cap witnesses with an actual pinned fan or blocker row (or
provide an equivalent source-owned cyclic-order relation).  Until then, no
finite replay or downstream contradiction consumer closes this leaf.

The required one-time theorem-bank reuse preflight was run against repository
revision `62abdcfc4a73e50ae666eaf2c309d4d424c8cd4e` plus the current exact-deletion
worktree.  The frozen weakest diagnostic synchronizer is the off-endpoint
statement that the first `Q` selected four-row has nonempty intersection with
either the pinned fan row or one indexed blocker row.  The existing
packet-level contradiction consumer
`FreshThirdPinnedEndpointOutsideSeedQueryPacket.false_of_qRow_overlap_card_ge_three`
requires three common points with the pinned fan row.  It uses only the
source-proved inequality between the pinned center and the first `Q`-row
center, so it applies in every normalized fan arm; the former
center-blocker-specific declaration remains as a compatibility wrapper.
The nonrobust arm also has a source-level conditional contradiction consumer:
`FreshThirdPinnedEndpointOutsideSeedQueryPacket.false_of_nonrobust_qRow_blocked_deletions`
derives `False` from any three points of the first `Q` row whose individual
deletions all block K4 at the pinned center.  It is backed by the generic
cardinality-independent theorem
`card_le_inter_selectedFourClass_of_blocked_deletions`.

This individual-deletion contract must not be conflated with the separate D44
depletion packet under investigation in the rich-apex equality lane.  There a
whole set `V` is deleted at once and each memberwise restoration preserves K4;
that collective blocking statement supplies none of the individual blocked
deletions required here.  Its `V.card ≥ 3` consequence therefore remains a
CEGAR clause or a row-identification antecedent, not a fan-overlap producer.

The indexed candidate
`exists_distinct_outsideCap_escape_or_crossDeletion` is proved under its stated
hypotheses; it preserves the actual outside fan pair and yields blocker escape
or one cross-deletion survival.  It has no `Q`-row parameter and supplies
neither overlap contract.  Likewise,
`freshThird_pinnedEndpointRow_escape_or_offEndpoint` produces the stated
boundary-escape and source-faithful-fan packet; its conclusion does not assert
positive `Q`-row/fan incidence.  The
three-point theorem above is a consumer of the missing overlap, not a producer.
No noncircular theorem-bank declaration supplies the first common point.

The first missing antecedent is therefore exact: a source theorem relating the
fresh `Q` row to the pinned fan or one of its canonical blocker rows.  Adding
that overlap directly to the finite source theory, deriving it from the finite
query rejection contract, or using the open residual itself would be circular.
A merely nonempty overlap would eliminate the current diagnostic but would not
close the live leaf; promotion requires either the three-point fan overlap or a
new source-clean consumer of the weaker overlap together with the retained
endpoint order and cap data.

#### 13.24.1.32 Exact cap-eight alias cycle and polar-order checkpoint (2026-08-14)

The exact canonical-cap-eight subcase now has a source-clean finite normal
form.  The strict canonical cap has six points and is exactly the disjoint
union of the two retained pairs and the two canonical sources.  The retained
blocker centers lie in that six-point set outside their own retained pairs;
the common FreshThird blocker center lies in the retained four-point union;
and the three blocker centers are distinct.  Finite alias counting therefore
forces a two-cycle at the pair level or one of the two orientations of a
three-cycle.  The scratch declarations in
`lean/scratch/freshthird-firstnonhit-cap-eight/CapInteriorSix.lean` also retain
the exact canonical-cap traces of the three selected rows: the two retained
rows meet the cap in their own retained pair, while the common FreshThird row
meets it in the two canonical sources.  These declarations pass Lean 4.27 and
their axiom audits contain only `propext`, `Classical.choice`, and `Quot.sound`.

This exact incidence packet is not itself a contradiction.  In a two-cycle,
the aliases provide own-row membership where the existing blocker-cycle
consumer requires the reverse cross-row membership.  The packet supplies no
joint-deletion structure, nonalternating boundary relation, or ordinal
comparison accepted by an existing clean terminal.  The missing information
is therefore metric/boundary synchronization, not another finite alias split.

The bounded artifacts under
`scratch/p97-consumer-first/freshthird_firstnonhit_cap8_blocker_cycle_v1/`
first tested the complete six-point rational-direction chart, modulo
translation, rotation, positive scaling, and the antipodal ray excluded by
convex independence.  The source-entitled model has three positive pair
radii, all twenty strict increasing-triple orientation constraints, and the
exact equal-distance equations for every alias.  Of 198 alias cases, Z3 found
12 exact-rational `SAT` witnesses, all independently replayed; cvc5 timed out
on those 12, and the other 186 cases timed out in both solvers.  No base case
was `UNSAT`.  An earlier cocircular/unit-circle encoding was stronger than the
Lean ingress and is explicitly retracted.

The source-clean packet in
`lean/scratch/freshthird-firstnonhit-cap-eight/PolarOrderPacket.lean` then
added the fifteen apex-relative strict-area inequalities supplied by one
shared direct-or-mirror boundary indexing.  A single authorized refinement
replayed only the 12 previous Z3 witnesses:

- one case was `UNSAT` in both Z3 and cvc5;
- nine were Z3 `UNSAT` with cvc5 timeout;
- two timed out in both solvers; and
- no `SAT` witness survived the bounded replay.

The positive and malformed controls behaved as expected.  This does not prove
the cap-eight subcase: eleven replayed cases lack a dual-solver conclusion and
the 186 earlier unknown aliases were deliberately not expanded.  The mandatory
wave-only theorem mine found no new general theorem beyond the already proved
polar-order packet.  Accordingly this lane stops here.  No larger cap-eight
alias matrix or timeout extension is authorized without a new source-proved
clause or a formal finite-to-universal landing contract.  The live FirstNonHit
requirement remains the cardinality-independent synchronization of three
`Q`-row points at one distinct actual blocker row, or a direct clean geometric
contradiction.  This checkpoint closes no FirstNonHit branch and no
load-bearing `sorry`.

#### 13.24.1.33 Source/fresh two-row order cut and finite-ingress completion (2026-08-14)

The pinned-endpoint finite ingress now records two previously omitted
source-proved facts.  Both canonical source roles lie in the first cap
interior, and the exact source and fresh selected rows overlap in exactly the
two FreshThird endpoints.  The arbitrary-cardinality `ofView` theorem proves
both statements from the live packet.  The diagnostic assignment has been
repaired accordingly and still satisfies the strengthened source theory, so
neither fact is a missing contradiction.

Two conditional five-point Euclidean replay adapters are formalized in
`FreshThirdPinnedEndpointFivePointCuts`.  They transport exact finite-view row
roles into the existing generic five-point consumers without bounding the
ambient carrier.  Both build with the standard three axioms only.  Neither
pattern occurs in the explicit diagnostic assignment, so they are reusable
CEGAR cuts rather than closure evidence.

A bounded theorem-discovery probe found one genuinely order-sensitive cut in
the diagnostic's source/fresh subsystem.  With all eight roles distinct, the
total order

`freshSourceOne < freshCenter < freshSourceTwo < sourceCenter <`
`canonicalSource < canonicalSecondSource < freshRemainder0 < freshRemainder1`

and the two exact-row equality families are metric-realizable without convex
order but inconsistent with strict convexity.  Exact-radius exclusions are
not needed.  The fail-closed legacy-Z3 result is
`direct-metric-rows-426acea19ecd80bf929d`: the 34-constraint metric relaxation
is `SAT`, while adding the 48 convex-order constraints makes the 82-constraint
system `UNSAT`.  The result is recorded at
`scratch/p97-consumer-first/freshthird_pinned_endpoint_two_row_order_probe_result.json`
with SHA-256
`0fce193683da6643b3f2a1dd8a80cee10069e418d369f36b5e8bd83fa9e6583f`.

This is one untrusted discovery cut, not a coverage theorem.  The live packet
fixes only one five-role chain; the remaining three role positions are free,
the two row centers may alias private support roles of the other row, and the
eight chain/orientation choices admit 2,688 distinct total orders before
aliasing.  A proposed all-order run was terminated after its QF_NRA workers
failed to respect the intended bounded shutdown; it emitted no counts or
coverage artifact.  No result from that aborted run is admissible.  The
tracked-core attempt also timed out.  Accordingly the immediate live bridge
remains source-level fan/Q synchronization (or a new bounded, replayable
ordered-core family with complete alias/order coverage).  This checkpoint
closes no load-bearing `sorry`.

#### 13.24.1.34 Exact-three Q-fiber synchronization landing (2026-08-14)

A comparison with the earlier complete six-point campaign prevents the new
single-order cut from becoming another open-ended local-order search.  The
two-row-only abstraction was already exhausted: 40 source-admissible anchored
orders split into twelve proved kernel exclusions and 28 exact rational
strict-convex survivors, and the subsequent cap-interval projection excluded
zero of those 40 words.  The live eight-role order has additional labels, but
it does not add a theorem forcing the private supports into the one forbidden
word found in §13.24.1.33.  Therefore no raw 2,688-order rerun is authorized.
Any successor order campaign must begin with a new source theorem that removes
one of the rational survivor families or with a complete, bounded replay
contract for genuinely stronger carrier-wide data.

The exact-three `Q`-fiber arm now has a production Lean landing in
`FreshThirdQFiberThreeSynchronization`.  If the actual blocker fiber of
`Q.source₁` has cardinality three, its point image is exactly the four-point
`Q` support with the boundary source erased.  The remaining contradiction
requires precisely two positive synchronization facts:

1. the unique nonfiber boundary source belongs to the pinned fan row; and
2. at least two points of the three-point fiber image belong to the pinned fan
   row.

The module exposes both fields separately and packages an intrinsic finite
certificate over three `Fin 4` fan indices.  Replaying such a certificate
produces three actual common points between the `Q` row and the pinned fan row,
then closes through
`FreshThirdPinnedEndpointOutsideSeedQueryPacket.false_of_qRow_overlap_card_ge_three`.
The ambient carrier is not enumerated.  The targeted build passes, and the
generic fiber-image theorem, direct two-field consumer, and indexed replay
consumer each have exactly the standard axiom set `propext`,
`Classical.choice`, and `Quot.sound`.

The exact-three boundary has now also been exported into the existing
packet-independent finite configuration.  The new
`FreshThirdQFiberThreeFiniteBoundaryConstraint` chooses the unique nonfiber
slot among the four exact `Q`-row slots, proves that it is one of the two
fresh-remainder slots rather than a named `Q` source, and records two
conditional, source-proved laws.  If a nonboundary slot aliases an indexed fan
source, that fan source's canonical blocker center equals the common `Q`
center; if the boundary slot aliases a fan source, its blocker center differs
from the common `Q` center.  The companion production theorems also retain the
one-way omission-successor data and the exact pinned-center/fresh-remainder
dichotomy.  The theorem
`FreshThirdQFiberThreeFiniteBoundaryConstraint.ofView` derives the finite laws
from the actual blocker fiber, and
`FreshThirdQFiberThreeBoundary.false_of_finiteQueryContract` is the intrinsic
arbitrary-cardinality replay bridge.  No ambient carrier bound or exact-`n`
reduction appears in either declaration.

The replay contract now includes the generic geometric laws for every visible
selected-row pair, not merely for the `Q`/fan pair named by the terminal:
distinct-center rows overlap in at most two points, and every two shared points
are separated by the two centers in cyclic boundary order.  Both finite
constraints are proved from the actual `SelectedFourClass` rows by
`FreshThirdVisibleRowGeometryConstraint.ofView` and
`FreshThirdVisibleRowSharedPairSeparationConstraint.ofView`.  They are therefore
source clauses available to every later CEGAR wave, not learned assumptions.

The same replay contract now includes both visible five-point Euclidean
obstruction families from `FreshThirdPinnedEndpointFivePointCuts`.  The
production theorem `FreshThirdVisibleFivePointConstraint.ofView` derives the
two universal finite-role cuts from actual packet rows.  Its companion Boolean
checker is propositionally equivalent to the source statement.  The diagnostic
is discharged by small finite row-pair and common-point lemmas using ordinary
`decide`; no `native_decide` remains.  The arbitrary-carrier replay theorem
itself remains an ordinary Lean proof.

This extra fidelity is not itself the missing producer.  The kernel-checked
diagnostic configuration still satisfies the complete finite source theory,
both generic visible-row geometry constraints, both visible five-point cuts,
and the exact-three boundary constraint: its fan and `Q` rows are disjoint, so
the conditional
blocker-center laws hold vacuously.  The theorem
`FreshThirdQFiberThreeFiniteQueryContract.not_of_currentSourceTheory` makes the
stop rule kernel-visible.  Therefore a solver run over only the newly extended
vocabulary cannot soundly terminate in universal `UNSAT`; it first needs a
carrier-wide theorem forcing positive fan/`Q` incidence or routing the
disjoint case into an already proved terminal.

The carrier-wide producer audit found no hidden theorem supplying those
incidences.  The global K4 and source-faithful fan producers return anonymous
selected rows; global card-minimal deletion returns only a collective blocking
set; and no-`(m,4,4)` has already been consumed into cap-size and apex-richness
data.  None identifies the boundary source or two `Q`-fiber points with the
pinned fan.  Those facts must not be inferred from the existing APIs.

The omitted source data is now exported separately in
`FreshThirdQFiberThreeCarrierFan`.  Its carrier-fan view indexes the actual
four-point `Q` row, identifies the unique nonfiber boundary index, normalizes
that index into the distinct-blocker deletion packet, and normalizes every
other index into the common-`Q`-center packet.  It also constructs the complete
source-faithful deletion fan on the boundary source's own blocker row.  All
construction and normalization theorems are arbitrary-cardinality and audit
to the standard `propext`, `Classical.choice`, and `Quot.sound` set.  They add no
fan/`Q` synchronization assumption.

This landing deliberately does not assert that the three fan indices exist.
The current exact-three incidence projection permits the pinned fan row to be
disjoint from the `Q` row, and the source/fresh two-row geometry does not repair
that gap.  The next exact target is to add the new `Q`-row and boundary-row fan
data to the intrinsic finite query, then mine the resulting disjoint survivors
for one uniform cap/order, cross-deletion, or row-pattern theorem.  The landing
consumer remains either the three-index synchronization certificate or an
existing geometric/cross-deletion terminal.  Cap labels, raw cyclic orders,
or the old first-order fan projection alone are insufficient.  This checkpoint
sharpens the source ingress and consumer but closes no load-bearing `sorry`.

The first carrier-query implementation is now Lean-owned.  The new
`FreshThirdQFiberThreeCarrierFiniteQuery` module joins the old pinned
vocabulary to the actual four-slot `Q` row, the unique boundary blocker's row,
and the complete second-order deletion fan on that row.  Its combined Boolean
assignment keeps equality, incidence, cap, boundary-order, metric, deletion,
and nonrobustness atoms over the shared finite role set.  Nonboundary `Q`
blockers are normalized to the already named `freshCenter` and `Q` row by the
source theorem; the unique distinct blocker and genuinely new rows remain
explicit.

`FreshThirdQFiberThreeCarrierFiniteSourceTheory` proves the complete finite
theory from every arbitrary-cardinality packet and exact-three boundary.  It
retains the old pinned source theory through an explicit propositional bridge,
proves alias congruence for every solver-visible predicate, and adds exact
`Q`-row coverage, fresh-remainder and named-source aliases, blocked
deletions, cap witnesses, overlap-at-most-two clauses, and every second-order
fan packet, and exposes the packet-independent `QueryContract` replay adapter.
No pinned-fan/`Q` synchronization is assumed.  The next computational target
is now exact: encode this complete source theory, enumerate the remaining
disjoint survivors, and mine the first uniform row/cap/cross-deletion clause
that is both absent from the current theory and provable at source.  This
implementation checkpoint still closes no load-bearing `sorry`.

The first structural-CNF successor is now complete under the strengthened
execution contract. Commit `08a48e01` adds a transitive source snapshot,
strict full-signature replay, repository-bound Lean certificates for every
learned cap-alternation clause, validation of all prior learned clauses, and a
tamper-checked terminal artifact inventory. The prelaunch snapshot covers
2,864 local Lean files plus the toolchain and dependency lockfile and has
content hash
`d2675aa417c5078fa309b27650d674bc63926adf941692a6edc0cc4b54dd470e`.
Preflight and postflight agree exactly.

`wave-0001` terminates as `BUDGET` in all four boundary cells. Each cell is
structural SAT after twelve independently replayed `NoAlternatingCap` clauses,
but every terminal model fails the full source replay on the named
`source__pinned_source_theory` group and still exposes a thirteenth valid
cap-alternation refinement. Across the four cells the 48 certificates are four
copies of one `0101` role pattern and four copies of eleven `1010` role
patterns, all in cap 1. An independent post-run pass replayed all 48 parented
certificate records, and terminal re-entry verified every artifact hash
without another solver call.

This is neither SAT evidence for the live source theory nor an UNSAT result.
The wave-only mine yields no new mathematical theorem: the uniform obstruction
is precisely the already-proved no-alternation law. Therefore do not raise the
cut budget or repeat this schema. The next solver implementation must encode
the complete no-alternation family compactly or in a source-total batch, with
an independent equisatisfiability/replay argument, before a successor wave.
No new general theorem-bank search is triggered by this result because the
only candidate is already the clause source theorem.

#### 13.24.1.35 FirstNonHit seven-row theorem and repaired execution contract (2026-08-14)

The FirstNonHit exact-three incidence survivor supplied one fixed thirteen-row
equality packet.  Its equality superset is complex-empty: two independent
`msolve` declaration orders and a characteristic-zero Singular computation
all returned the unit ideal.  A bounded row deletion pass did not authenticate
a solver-minimal core, but its seven-row candidate was subsequently proved
directly in Lean.  The new theorem-bank module
`P97/Census554/ThirteenPointSevenCircleCollision.lean` proves that the fixed
thirteen-label pattern has no injective planar realization.  The proof uses
all seven selected rows, normalizes by a Euclidean similarity, and ends in the
root-free identity

`(L^2 - R^2) * (3 * epsilon * t + 2) = 23`.

The direct incompatibility theorem, its generic `RowPattern`/`EdgeClosure`
adapter, and the fixed-pattern consumer all build with exactly `propext`,
`Classical.choice`, and `Quot.sound`.  The discovery packet and row-subset
artifacts are hash-bound in the module documentation, but they are not trusted
by the Lean proof.

This theorem is a reusable cardinality-independent CEGAR cut, not the missing
FirstNonHit producer.  A source-mapped successor searched each of the
`retained`, `common`, and `common_sameblocker` abstractions for an injective
occurrence of the seven-row motif.  Every first readback was motif-free and
was replayed as `SAT` by Z3 and cvc5.  Thus the cut admits zero learned
instances and does not establish finite coverage.

The follow-up equality-only algebra wave also fails to supply a new geometric
obstruction.  The `common` survivor is non-unit in both `msolve` orders and
Singular, which proves only complex nonemptiness of that positive equality
table.  The `retained` survivor is `UNKNOWN` because one `msolve` order found a
non-unit ideal while the independent bounded runs timed out.  No real,
convex, or P97 realization follows from either result.

That audit also exposed a source-fidelity defect in the raw
`common_sameblocker` readback.  It placed five pairwise-distinct carrier
sources in one actual-blocker fiber and six pairwise-distinct points in one
selected support, contradicting the existing source theorems
`actualBlockerFiber_card_le_four` and `CriticalFourShell.support_card = 4`.
The quotient had also omitted `firstSource != secondSource` while failing to
allow all source-legal aliases between those sources and the `Q` roles.  A
minimal repaired replay with the two cardinality cuts and correct aliasing is
again `SAT` in both Z3 and cvc5: it aliases the source roles legally and moves
the extra `Q` role off the common blocker.  The malformed packet's CAS result
has no P97 meaning and must not be cited as a survivor.

Accordingly the active FirstNonHit goal remains the direct, source-clean proof
of
`TwoSourceExactCollisionRowsTerminal.false_of_freshThird_firstNonHit`, but its
immediate execution contract is now narrower:

1. repair the complete FirstNonHit quotient in every ingress arm with the
   actual-blocker-fiber bound, exact selected-support cardinality, distinct
   canonical sources, and all source-legal aliases;
2. replay exactly one bounded wave with the proved seven-row cut and
   independent exact readback validation;
3. if that repaired abstraction is `SAT`, stop equality-only CEGAR and extract
   one genuinely source-entitled FirstNonHit clause absent from the survivor;
4. if it is `UNSAT`, do not promote the result until a source-total finite
   coverage theorem and a general-cardinality lift have been proved.

The first all-arm repaired replay (`repaired_quotient_v2`) is an authenticated
infrastructure `UNKNOWN`, not solver evidence.  Its Python Z3 driver parsed
each `:named` assertion as a label implication but called `solver.check()`
without enabling the label assumptions.  The resulting raw `SAT` assignments
violated hard clauses, and cvc5 rejected all exact pins.  The source gate,
input hashes, and static label catalogs passed, but no model or verdict from
that run is admissible.  The next executable step is therefore one
fresh-namespace replay that calls `solver.check(*labels)` and first proves a
named-false smoke query `UNSAT` in both Z3 and cvc5.  It must not import any v2
readback or terminal evidence, and it retains the same one-wave, bounded,
no-escalation contract above.

The corrected fresh-namespace v3 replay then passed the named-false smoke in
both solvers and returned independently validated `SAT` models for all three
ingress abstractions, with zero seven-row occurrences.  Its smallest missing
source clause was

`C.firstSource.1 ∈ S.capInteriorByIndex S.oppIndex1`.

This is not a conjectural producer: it is already the second field of
`C.firstSource_data : CapSourceThirdCanonicalRowWitness ...`.  A complete
field audit then showed that it was only the first recorded missing atom, not
a complete ingress diagnosis.  The quotient represents the two source
identities, their own exact-four supports, and their distinctness, but omits
the cap-cardinality margin, both canonical-cap memberships, exclusion from
the four retained endpoints, separation from the retained blocker centers and
two named apices, and both `CrossPairDeletionView` packets.  Therefore v3 is a
valid SAT result for the encoded abstraction but not a source-total
FirstNonHit survivor.

In accordance with the contract above, there must be no v4 equality-only
replay.  The next lane must import the complete
`CapSourceThirdCanonicalRowWitness` ingress and use those cap, deletion, and
center-separation fields in a consumer-shaped cap-order or metric refinement;
merely adding the first omitted bit and resolving the same incidence quotient
would repeat the exhausted CEGAR pattern.  A direct source trace found no
currently import-reachable terminal that consumes the full packet: the
cap-wide-alignment closer still lacks the alignment producer, while the new
seven-row theorem still lacks a source-proved thirteen-role/seven-row
incidence occurrence.  The immediate mathematical work is therefore a new
uniform incidence/order producer, not another finite equality table.

The exact-three pinned-fan synchronization work in Section 13.24.1.34 is a
parallel attack on the pinned-endpoint residual.  It is not an ingress theorem
for `false_of_freshThird_firstNonHit` and must not be counted as progress on
this anchor unless an explicit acyclic source bridge is later proved.  This
checkpoint closes no load-bearing `sorry`.

## 13.25 Exact-17 cap-nine all-core replay correction (2026-08-08)

The source-faithful exact-17 cap-nine Rigid221 exporter previously admitted an
identity error in its two-Kalmanson replay path.  The stage predicate checked
that some member of the same theorem family was present, while the
equality-label exporter could substitute a different core extracted from the
minimized row system.  A record could therefore be authenticated as a valid
family hit without proving that the exact serialized labels, rows, order,
quadrilaterals, and cancellation path were the theorem instance used to emit
the clause.  No universal or Lean closure had been promoted from this path,
but the affected finite successor CNFs were not suitable as production
coverage artifacts.

The repaired bank now has two fail-closed operations:

1. `certify_two_kalmanson_cancellation` reconstructs and checks the exact
   recorded core, including its boundary labels, source labels, selected rows,
   two inequality forms and quadruples, endpoint comparison, cancellation
   permutation, and complete path;
2. `enumerate_two_kalmanson_cancellations` deterministically enumerates every
   exact admissible core in the complete verified row system.  It does not use
   a minimized family representative as a proxy for the original model.

The historical direct-six bank was then migrated by rechecking its parent
artifacts against their recorded hashes and current exact certifiers.  The
migration rescanned 274 legacy two-Kalmanson occurrences into 408 exact cores
before bank-level deduplication.  Together with the other authenticated
theorem families, the resulting bank contains 1,111 deduplicated records:
938 formalized records, 173 positive weighted records, and 63 distinct
two-Kalmanson records.  Separately, exhaustive inspection of the twenty v10
source models found 750 exact serialized two-Kalmanson cores and 596 distinct
endpoint-comparison clauses; the earlier first-hit export had retained only
twenty such cuts.

The corrected v11 source-faithful export is:

- 74,813 variables;
- 2,503,787 clauses;
- 1,108 learned nogoods;
- 640 equality-label cuts; and
- CNF SHA-256
  `aede44af37dd7e157a6f289deedcdf7f75b41a9501d01729dec5969152ca31d7`.

An independent exact validator regenerated the candidate byte-for-byte,
replayed a CaDiCaL model, checked three source Z3 models, checked 145,975
structural clauses, and replayed all twelve static theorem families together
with the transitive convex-five-point digests.  Its terminal status is `PASS`.
The artifacts are under
`scratch/rigid221-blockerv-exact17-20260806/source-faithful-cap9-direct-cnf-v11-exact-all-cores/`.

A fresh 24-seed CaDiCaL portfolio, seeds 1201 through 1224 at `nice +10`, was
launched only after that validation passed.  All twenty-four searches returned
`SAT`; there was no finite closure in this round.  All twenty-four assignments
then passed the DIMACS check, source-Z3 pinning, independent source model
checker, and exact theorem-bank replay.  Every model contained at least one
instance of the already formalized two-Kalmanson cancellation theorem; two
models additionally contained a six-point two-circle arc-overtake obstruction.
The complete-model census found 900 exact serialized two-Kalmanson cores and
684 distinct endpoint-comparison clauses across the twenty-four models.  These
are new instances of existing mathematics, not new theorem schemas, and are
being compiled into the next source-faithful successor CNF.  An UNSAT solver
result would still require an exact proof replay and the existing
source-to-finite Lean ingress before it could close the on-spine cap-nine
theorem.

This checkpoint is a **finite CEGAR soundness repair and strengthened search
round**, not exact-17 closure, not closure of the Rigid221 production leaf, and
not full P97 closure.

## 13.26 Exact-17 lazy PIQD Wave53 checkpoint (2026-08-10)

The later lazy PIQD lane has reached Wave53 without changing the claim
boundary.  The Wave53 controller processed the authenticated
5,895,215-clause root `postgate-wave52-five-point-direct-witness.cnf` as `SAT`
in 155.5 seconds end-to-end after encountering a detached session.  PIQD
reported only 130 ms inside CaDiCaL; the remaining time is root rehydration
and custody overhead.
The returned model is total and satisfies the complete DIMACS root.  Source
replay and exact linear arithmetic reject its selected-row equality system.
The accumulated static family missed the model, but the complete theorem bank
found an existing cardinality-independent two-Kalmanson-cancellation
certificate.

The mandatory post-wave search then ran the complete selected-row theorem
matcher rather than admitting the large generic orbit.  It found one anchored
instance of
`FivePointEuclideanObstruction.false_of_five_ccw_two_selected_rows`, three
anchored instances of its reversed-second companion, and one anchored instance
of
`TwoTripleRowSixPointEuclideanObstruction.false_of_six_ccw_two_triple_row_equalities`.
There was no anchored four-point consumer.  The smallest fixed-order ingress
therefore authorizes exactly the five-literal clause
`[-123, -125, -252, -248, -246]` on boundary points
`[11, 7, 15, 5, 13]`.

The authenticated but not-yet-live successor is
`postgate-wave53-five-point-direct-witness.cnf`: 74,813 variables,
5,895,216 clauses, SHA-256
`140c27618f8d12528cefd52a943caa3d254406163f461731f713a775f9a351b5`.
The Wave53 post-wave receipt validates and binds the solve, model, source
analysis, repository-wide theorem search, Lean consumer, one-clause fragment,
and successor root.

At nearly 5.9 million clauses, formula growth is now a material engineering
cost.  Future lazy waves should prefer one witnessed clause from the smallest
direct consumer over a complete generic orbit.  A further refinement is
justified only after the same mandatory search shows what reusable theorem or
previously banked consumer rejects the fresh model.  This checkpoint is finite
branch contraction only: exact-17 coverage, universal P97 closure, and a
production `sorry` closure all remain false.

## 13.27 Exact-17 lazy PIQD Waves54-55 checkpoint (2026-08-10)

The authenticated Wave53 successor has now been admitted to the live PIQD
session, followed by two further lazy refinement waves.  Wave54 solved the
5,895,216-clause root in 11.154 seconds of CaDiCaL time.  The mandatory
general-theorem search found six anchored five-point matches and six anchored
six-point matches, with no anchored four-point match.  The smallest selected
reusable consumer was
`SixPointSparseEuclideanObstruction.false_of_six_ccw_two_selected_rows`, so the
post-wave gate authorized only the witnessed six-literal clause
`[-269, -261, -260, -108, -100, -98]`.  This produced the
5,895,217-clause root with SHA-256
`48b6a0fad3c7afb939b546a265d1428a168780d8ff32b8fc8774aca01c261218`.

Wave55 solved that authenticated root in 7.987 seconds of CaDiCaL time.  Its
mandatory search found two direct and four reversed-second anchored five-point
matches, with no anchored four- or six-point match.  The selected direct
consumer
`FivePointEuclideanObstruction.false_of_five_ccw_two_selected_rows` authorized
the single five-literal clause `[-169, -174, -120, -122, -114]`.  The current
live and byte-for-byte re-exported PIQD root therefore has 74,813 variables,
5,895,218 clauses, and SHA-256
`5549a26a422e8ae388717aabe29e39c85effda9047c13b2d9959039667a4aa29`.

Thus Waves54-55 grew the inherited root by exactly two clauses rather than by
two full theorem orbits.  The one-witness policy is controlling formula growth.
Both models nevertheless missed the accumulated static family and were
rejected only by complete theorem-bank matching plus exact linear arithmetic;
the static family bank is therefore still incomplete.  The main wall-clock
cost is now PIQD root custody and hashing rather than SAT solving.

Continue for exactly one Wave56 refinement under the same discipline: solve
the authenticated live root, run the mandatory repository-wide theorem search,
and admit at most one smallest source-backed witnessed clause after the
post-wave gate.  Do not expand a generic orbit merely because a known theorem
matches.  These waves remain finite Rigid221 exact-17 branch contraction; they
do not close exact-17 globally, a universal P97 leaf, or any production
`sorry`.

## 13.28 Exact-17 cap-nine Lean-to-SAT route correction (2026-08-10)

The Wave63 root is now the frozen endpoint of the old Python-first refinement
route. The historical waves remain authenticated finite evidence, but no
Wave64 refinement is a production closure step. The earlier instruction to
continue one model-at-a-time refinement is superseded.

The reason is a proof-ingress gap, not a PIQD transport failure. The current
lane starts from a Python finite model, emits raw DIMACS, and independently
replays selected Python source predicates. The `lean_fol` smoke is a
hand-authored IR fixture rather than a Lean-source exporter. There is no Lean
theorem deriving the current label map, actual next-row center, candidate
domain, and all normalized placements from the hypotheses of
`false_of_exactFourRigid221_sourceHeavy_secondOppositeLarge_pentagonBlockerV_vRowBlockerDeleted_deletedRowBlockerOffClass_card_eq_seventeen_secondCapNine`.
Consequently even terminal `UNSAT` for the current root would certify only that
submitted finite abstraction.

The authoritative replacement is

```text
live Lean cap-nine hypotheses
  -> proved finite normal form with explicit labels and center mapping
  -> checked Lean-to-SAT export
  -> PIQD solve and exact terminal certificate
  -> Lean coverage of all placements or proved symmetry orbits
  -> aggregate consumer of the unchanged cap-nine leaf.
```

The detailed contract is
`docs/specs/p97-exact17-cap9-lean-to-sat-route-v1.md`. The source-clean finite
normal form and checked encoder are now complete. The exact-cover arm produces
`BlockerVExactSeventeenSourceNormalForm.SourceRealization`, including the
images of `SelectedClass`, the deleted source, the four old rows, the actual
`centerAt` next-row center, and the carrier convexity needed by the admitted
metric consumers.

Checked-root checkpoint (2026-08-11):
`BlockerVExactSeventeenSourceCnfCdefg.lean` defines the complete candidate
production root. It contains the 209,692-clause Boolean base plus 1,980,160
source-authenticated C--G clauses. The clause families cover both source-forced
named orders, both cyclic directions, every cut, and every increasing six- or
seven-point offset choice. Thus the old Python claim of 56 cells is no longer
the coverage contract; coverage is generated and proved directly over the
Lean finite types.

The Lean exporter wrote
`scratch/exact17-lean-to-sat/extended-cdefg.cnf` with header
`p cnf 308 2189852`, 104,887,967 bytes, and SHA-256
`763bb4774a4d148ca35a4d33ecce06c158a8f941c3e5fb272f534cb2b9637527`.
The independent fixture
`scripts/validate_exact17_lean_cdefg_export.py` verified the byte-identical
base prefix and independently regenerated all ten family/order blocks; its
report is
`scratch/exact17-lean-to-sat/extended-cdefg-validation.json`.

`SourceRealization.extendedCnf_sat` is the realization-to-formula bridge, and
`false_of_sourceRealization_of_extendedCnf_unsat` is the explicit terminal
landing contract. Their transitive axiom closure has no `sorryAx`; it currently
includes `Lean.trustCompiler` because the finite coverage regressions use the
project-accepted scoped `native_decide` boundary.

The remaining route is now narrow. Provision exactly the checked root above
under immutable PIQD custody; if it is `SAT`, return the decoded survivor to
the theorem-discovery loop and admit any successor clause in Lean before
regenerating a child root. If it is `UNSAT`, preserve and independently replay
the terminal certificate, bank a Lean theorem `extendedCnf_unsat`, and compose
it with `false_of_sourceRealization_of_extendedCnf_unsat` and the exact-cover
extractor in the unchanged cap-nine leaf. Follow that landing with a targeted
build, fresh proof-blueprint spine audit, and transitive axiom audit. It closes
only the exact-17 cap-nine leaf, not the `card_ge_eighteen` sibling or full
P97. The frozen Wave63 Python root remains diagnostic evidence and must not be
resumed as the production source of truth.

Production refinement checkpoint (2026-08-11): the checked C--G root and six
successive Lean-owned children have returned `SAT`.  The admitted children add,
in order, complete guarded `EqualK4`, two-circle shared-pair, five-point
three-row Kalmanson, H--K, interleaved three-row Kalmanson, and equality-chain
families.  The sixth child has 4,212,444 clauses and SHA-256
`d5c09fd5e139f88df5966907485a2f80b208a3917431dbd07d189ae505f16b9e`.
Its recursive independent export and fail-closed PIQD ingress validations pass,
and immutable PIQD job `7fcbf4c4-8cea-4179-8d56-16ddc3337494` returned `SAT`.
The total assignment independently replays every clause.  The mandatory
theorem-bank gate found six exact canonical records bound to that replayed
analysis.

The production route is therefore the Lean-owned successor chain rooted at
the checked C--G formula, not a claim that the original C--G formula itself is
UNSAT.  Every `SAT` successor must undergo total-model replay and a mandatory
general-theorem scan; every new clause family must be source-proved in Lean
before child regeneration.  The historical theorem-bank minimizer was found
to replay only a family name and orientation, so its H--K report is rejected;
the replacement binds the decoded-model hash and preserves the exact canonical
core record.  No terminal certificate or production-leaf closure exists yet.

The first genuinely new record in the sixth model has now been generalized as
`PerpBisectorEqualityChainSchemas`.  Two direct equal-radius witnesses and one
equality chain force three distinct carrier points onto one perpendicular
bisector, contradicting convex independence.  Its source-clean theorem and
realization bridge pass a targeted Lean build with axiom closure
`[propext, Classical.choice, Quot.sound]`.  Lean generated the complete
544,544-clause cyclic orbit as a seventh child with 4,756,988 clauses and
SHA-256
`38db47b94b1f259feeb427a48850a94c58adf300deea0b37302a39435676e76a`.
Recursive export and fail-closed ingress validation pass, and only these exact
bytes were provisioned under immutable PIQD job
`925a0469-313e-4cbe-bdf5-3046b9786df1`.  That job returned `SAT` after 345
seconds; exact replay checked all 4,756,988 clauses and the mandatory scan
retained five exact records.  At that checkpoint the next child was authorized
only after one of those records was admitted as a source-clean Lean theorem and
complete orbit.  That admission is now complete for the first genuinely new
record:
`TwoKalmansonEqualityChainSchemas` derives a contradiction by cancelling two
strict Kalmanson inequalities after eleven selected-row incidences propagate
the required equalities on seven cyclically ordered points.  Lean generated
the complete 544,544-clause orbit as the eighth child.  The recursively checked
formula has 5,301,532 clauses and SHA-256
`ae29c7b97602f2e6ff6c746badb13ee8abad13afec3b005da0e6c632d5e1f7fd`.
Independent validation regenerated every appended clause, checked the
byte-identical parent prefix, and confirmed the motivating model cut.  Only
those bytes were provisioned under immutable PIQD job
`66c24b72-2b13-45d0-b00c-ef44115a1c88`.  It returned `SAT`; exact replay of
all 5,301,532 clauses and the mandatory five-record theorem scan both passed.
The newly exposed record required only the cyclic order of six of its seven
roles, leaving the auxiliary center `D` unordered.  That generalization is now
banked source-clean in `TwoKalmansonEqualityChainUnorderedDSchemas`, and Lean
generated its complete 544,544-clause orbit as a ninth child.  The child has
5,846,076 clauses, 291,567,840 bytes, and SHA-256
`759507d020a02253e85b59ce12e344451bbe66889dce221884f1b2a6aa3fac28`;
recursive export and fail-closed ingress validation pass.

The infrastructural gate is now passed.  PIQD maintainer
build `0cfc9577656fa3aef143a9fe7e5577d938dba9fd39f3b7118ed91735c97fc360`
raises the shared raw-CNF envelope from 256 MiB to 384 MiB, covering prepare,
blob ingress, and session seeding together.  It is live and `piqc version`
reports that exact identity.  Its ingress manifest was rebound and recursively
revalidated.  Immutable PIQD job
`090c5be4-e747-40a3-ad96-baba17d9aace` returned `SAT`, and its complete model
was replayed against all 5,846,076 clauses.  Its 291,567,840 bytes fit the
new envelope with 111,085,344 bytes, about 106 MiB, of headroom.  Its 308
variables are also exactly matched by the canary and remain far below the
unchanged `max_var = 1,000,000`; no variable-limit change is required.
The resumable production controller preserved the immutable Lean-owned bytes,
rechecked the live daemon identity, reread PIQD custody, and rehashed a seeded
session export before confirmation.  The rebuilt daemon has been qualified with
the exact-scale throwaway artifact across validation, storage, reread hashing,
session custody, and solver handoff.  Do not return to the
frozen Python Wave63 route or use a locally
authored successor as a workaround.  If a later authenticated successor
is `UNSAT`, replay the terminal proof, bank
`extendedCnf_unsat`, compose the exact-cover branch, and run the targeted
build, fresh spine, and transitive axiom audits.  This active goal closes only
the exact-17 cap-nine leaf.

The throwaway preflight is now materialized at
`scratch/exact17-lean-to-sat/piqd-large-cnf-capacity-preflight.cnf`.  It matches
the ninth root exactly at 308 variables, 5,846,076 clauses, and 291,567,840
bytes, has SHA-256
`b795edd93a4a222232e2b8128f6e2596eb153b9fd182788b93e0ef7a4f97e5a5`,
and is trivially satisfied by setting variable 1 to true.  A separate streaming
validator checked the header, every clause template, all counts, the byte size,
and the hash; local CaDiCaL parsed it and returned `SAT` in 2.07 seconds.
Immutable PIQD job `0e28e34e-385d-4b66-b2f9-9ae90c12b1fb` returned `SAT` in
2.216 seconds and the final report is valid: exact custody bytes and the full
308-variable model were rechecked.  A live RSS snapshot observed about 573 MiB
for the daemon and 855 MiB for CaDiCaL; it was not a peak measurement.  The
fail-closed runner is
`scripts/run_piqd_large_cnf_capacity_preflight.py`.  Its `start` phase pins the
expected daemon and worker hashes, submits the canary unconfirmed, rereads and
rehashes PIQD custody, exports and rehashes a session seed, solves it with the
pinned CaDiCaL worker, checks receipts, and only then confirms the raw job.  Its
separate `finalize` phase requires terminal `SAT`, rereads the stored bytes, and
validates the complete 308-variable model.  The two phases intentionally do not
poll.  Their report also records validation, storage/reread, session export,
solver handoff, and confirmation timings for the PIQD capacity audit.  It now
binds the accepted PIQD profile `sat`; session receipt fingerprints are checked
against the canonical headerless journal, while exported-session bytes are
checked separately against the full original DIMACS.

The ninth Lean-owned child is now terminal `SAT` under immutable PIQD job
`090c5be4-e747-40a3-ad96-baba17d9aace`.  The returned complete 308-variable
assignment was replayed against all 5,846,076 clauses of root
`759507d020a02253e85b59ce12e344451bbe66889dce221884f1b2a6aa3fac28`.
The mandatory post-wave general-theorem search found six exact replayed hits and
no unreplayed proposal.  Five are instances of already banked smaller
obstructions; the remaining record is an instance of the cardinality-generic,
source-clean two-Kalmanson cancellation theorem.  This is a theorem-discovery
checkpoint, not exact-17 or universal closure.  No tenth child is authorized
until Lean supplies the complete finite orbit for that exact cancellation
instance and a `SourceRealization` bridge from the cap-nine source packet.  The
active route is therefore that orbit and bridge, followed by one authenticated
PIQD successor only if the resulting Lean-owned child is still satisfiable.

### 13.28.1 Twentieth-root production checkpoint — 2026-08-11

The exact-17 cap-nine route has advanced through an authenticated nineteenth
`SAT` root. Complete model replay and the required theorem-bank scan produced
six nonredundant, source-clean motif families. Lean now banks their occurrence
bridges, a 24-clause suffix, the extended-CNF source evaluator, and a
conditional terminal adapter in
`BlockerVExactSeventeenNineteenthModelRefinements.lean`; the targeted build and
axiom audit show no `sorryAx` (with the accepted `native_decide` trust boundary).
The exporter and independent ingress validators passed.

The authorized twentieth root is SHA-256
`e719b8c17edf85e089d859fbc1ab8aaa43d8a6e9514f32eb4a76842a665dd3ce`,
with 308 variables and 5,846,188 clauses. Immutable PIQD job
`51cdf518-1150-47f5-ac2f-94a98159eb82` is running. This remains a finite
exact-17 cap-nine campaign, not full P97 closure. The next admissible step is
determined by the authenticated terminal result: replay and mine another
`SAT` model, or independently replay an `UNSAT` certificate and compose its
banked theorem into the exact-17 source leaf.

### 13.28.2 Twenty-eighth-root production checkpoint — 2026-08-12

Superseding the preceding running checkpoint, the production chain has now
advanced through authenticated child 27. Immutable job
`b0f49ec3-89ea-4c18-a86f-c9c6ad5dcf7f` returned `SAT`; its complete assignment
replayed all 5,846,284 clauses of root
`566d394436a30d1fee4c85240433f0217223c6f2ecf80e2945568ea37646194b`.
The mandatory complete theorem-bank scan found exactly one source-backed hit
and no unreplayed proposal: a new occurrence of the already general
two-Kalmanson cancellation consumer.

That occurrence is banked in Lean with independently checked forward and
reverse witnesses, its `SourceRealization` clause bridge, the complete
four-clause finite orbit, an extended-CNF evaluator, and the conditional
terminal adapter in
`BlockerVExactSeventeenTwentySeventhModelRefinements.lean`. A targeted build
and axiom audit pass with no `sorryAx`; the finite evaluator uses the accepted
`native_decide` trust boundary.

Lean exports child 28 with 308 variables and 5,846,288 clauses. Its SHA-256 is
`86bbb7f4a8f78372e9df8ff830a6737475e44defd42a013d41885fe1966ab02c`.
Independent validation regenerated all four appended clauses, checked the
5,846,284-clause parent prefix byte-for-byte, and confirmed that the new orbit
cuts the motivating child-27 model. The fail-closed ingress is pinned to PIQD
daemon SHA-256
`aa47e2ff3000890d11da79296721f0f51c3a228d4ef8446af3c3d2a73d969107`.

This checkpoint does not close exact 17 or a production `sorry`. The next
admissible step is one immutable PIQD run of these exact child-28 bytes. `SAT`
again requires total replay, the mandatory general-theorem scan, and Lean-first
banking before any successor; `UNSAT` requires independently replayed proof
evidence and composition through the existing exact-cover extractor and
terminal adapter.

### 13.28.3 Twenty-ninth-root production checkpoint — 2026-08-12

Immutable PIQD job `4fb8046d-594b-47ea-8778-fb10fb93fbba` returned
authenticated `SAT` for child 28.  Its complete model replayed all 5,846,288
clauses of root
`86bbb7f4a8f78372e9df8ff830a6737475e44defd42a013d41885fe1966ab02c`.
The mandatory theorem-bank scan found five source-backed hits and no
unreplayed proposal.  A complete two-Kalmanson cancellation scan then checked
183 candidate cancellations, deduplicated them to 104 support sets, and found
64 inclusion-minimal supports.  Both forward and reflected exact certificates
replay for every retained support.

Lean now banks all 64 occurrence records as one general source-valid family,
their `SourceRealization` bridge, the complete 256-clause suffix, the extended
CNF evaluator, and a conditional terminal adapter in
`BlockerVExactSeventeenTwentyEighthModelRefinements.lean`.  This deliberately
uses the complete minimal family rather than provisioning a first-hit-only
successor.  The targeted exporter build and axiom audit pass with no
`sorryAx`; the finite evaluator uses the accepted `native_decide` trust
boundary.

Lean exports child 29 with 308 variables and 5,846,544 clauses.  Its exact
SHA-256 is
`620ea5ad066edf6526d11eb51c4cff93284130f6fd27de46d8d0c2e5ff9c0c53`.
Independent validation replayed every serialized cancellation certificate,
regenerated all 256 suffix clauses from the 64 support records, checked the
5,846,288-clause parent prefix byte-for-byte, and confirmed that each retained
occurrence cuts the motivating child-28 model.  The fail-closed ingress passes
against manifest SHA-256
`29bfc11cfb30f807252e38aa0e0ea0cc4470fd1e6a805e552596a0b4b3573a4a`
and PIQD daemon SHA-256
`aa47e2ff3000890d11da79296721f0f51c3a228d4ef8446af3c3d2a73d969107`.

This checkpoint authorizes one immutable PIQD run of those child-29 bytes; it
does not itself close exact 17 or a production `sorry`.  A `SAT` result again
requires complete replay, exhaustive general-refinement mining, and Lean-first
banking before any child 30.  An `UNSAT` result requires certificate retrieval
and independent replay, a child-specific Lean UNSAT theorem, and composition
through `exists_exactSeventeenSourceRealization_of_exactCover` and the landing
contract before any closure claim.

### 13.28.4 Thirty-second-child publication and pre-submission checkpoint — 2026-08-12

This subsection supersedes older active-child status in this plan. Exact-17
children 29–31 terminated `SAT` with complete model replay. The child-31 wave
yielded 84 subset-minimal, source-backed occurrences. Lean now owns all six
resulting refinement families and their complete 336-clause orbit suffix; the
conditional terminal adapter is banked in the same chain.

The provisioned child-32 CNF has 308 variables, 5,847,240 clauses, and SHA-256
`c325d3eedda8fe81e3d1c1d70645024f5b9ea8c36c20ca5cd1896f0934296a7d`.
Its ingress manifest has SHA-256
`f5da5c5bb0c5cbb7f1f95dd3230aef848ae62623330e9fecb5c62d9b66cba82e`.
Strict publication, export, ingress, and runner validation pass; 71 focused
tests pass; and the targeted Lean exporter build is `sorryAx`-free under the
accepted `native_decide` boundary. Live SAT-model replay and synthetic compact-
LRAT retrieval/replay smoke tests both pass. The latter verifies custody and
checker plumbing, not exact-17 UNSAT.

The first production prepare created PIQD job
`2506986e-0445-465f-9b05-eff6bb9a5983`, which remains `prepared`. The runner
correctly stopped before confirmation, but for the wrong local reason: it
required a manifest hash that the prepare response does not contain. Live job
status and independently retrieved bytes bind the exact CNF and manifest. The
runner now validates those authoritative records and supports explicit recovery
by known job ID followed by direct confirmation. Thirty-five focused runner
tests and lint pass. Reconcile and confirm this existing job after checkpoint;
do not submit another. On `SAT`, replay every clause and mine only the new wave
before proving any child-33 source bridge. On `UNSAT`, independently replay the
retrieved certificate, bank the child-specific theorem, and compose it through
the exact-cover source realization and landing contract.

### 13.28.5 Child-33 adversarial prelaunch checkpoint — 2026-08-13

The child-32 core-one result is quarantined rather than promoted. A PIQD daemon
restart duplicated its solver process, and the old terminal attestation did not
account for the pre-restart process. Both processes were stopped; that job ended
`UNKNOWN`. It supplies neither a model nor an UNSAT certificate and closes no
part of exact 17.

The restart-custody defect has been repaired in PIQD. The fresh child-33 root is
Lean-owned, has 308 variables and 5,847,248 clauses, and has SHA-256
`775eb42db7bdac52eb7e5609a1cf33111c953d26f4cee9c8d95bde3b468563b9`.
Its provisioned ingress manifest has SHA-256
`1f802e69fc382ba262cb54a9b21bee3b62b4c53cf6cbfaff837181cd9444fcfd`.

An adversarial caller audit found and repaired two additional fail-closed
integration defects before launch. First, the SAT model-check validator omitted
PIQD's `clause_index` field, treated the `announcement` string as nullable, and
did not bind PIQD's model digest to the independently retrieved assignment.
Second, terminal log custody used the wrong response field and did not request
`GET /jobs/:id?log_digest=1`. The runner now validates the exact live schemas,
checks the independently recomputed model digest, requests the terminal log
digest explicitly, and compares it with the retrieved log bytes.

Ruff and 251 focused publication, export, ingress, runner, recovery, and
adversarial tests pass. The live static check also pins the child root, manifest,
transaction-generated daemon build receipt, daemon binary, solver binary, and
single-core profile. No child-33 production job has been prepared or confirmed.

After this source checkpoint, revalidate the committed bytes and submit exactly
one fresh job. A promotable terminal must report epoch one with no recovery or
replacement. `SAT` requires exact replay of every CNF clause against the
retrieved assignment plus PIQD's `SATISFIED` model check before mining the next
general refinement. `UNSAT` remains provisional until the kept CNF and
clause-map-bound LRAT certificate replay independently. This checkpoint itself
closes neither exact 17 nor a production `sorry`.

### 13.28.6 Child-34 Lean-first refinement checkpoint — 2026-08-13

The fresh child-33 job
`6304e936-8ef3-4b92-a153-062263a4aa01` is authenticated `SAT` at epoch one on
the 308-variable, 5,847,248-clause root with SHA-256
`775eb42db7bdac52eb7e5609a1cf33111c953d26f4cee9c8d95bde3b468563b9`.
Independent replay checked every clause against the retrieved total assignment.
This is an abstract source-normal-form survivor, not a P97 counterexample.

The mandatory new-wave mine found five candidate motif families. Only paired
Kalmanson and perpendicular-bisector currently have source-valid
`SourceRealization` bridges, so only those two were admitted. Their Lean bank
contains eight exact clauses, source-evaluation theorems, and a conditional
terminal adapter. The other three hits remain theorem candidates and contribute
no child clauses. Targeted axiom checks show no `sorryAx`; the finite evaluator
uses the accepted `native_decide` boundary.

The official Lean exporter produced child 34 with 308 variables, 5,847,256
clauses, 291,620,980 bytes, and SHA-256
`ea8311540af709cf991c932c38e52f9767227cf55781508f2791b1dc42c4a819`.
Its immutable receipt has SHA-256
`dfd27a4fcdaabba87270259988b4b39a5debcf8f0d1d56802a35b40a035c59fc`.
The child is the exact parent body plus the ordered eight-clause suffix; all
eight clauses are semantic-new. Ruff and 251 focused tests pass.

The export is provisioned, but PIQD ingress and the production runner are not.
All stale child-33 daemon and solver pins were cleared. A fresh post-`acefb4a`
daemon build receipt and live identity audit are mandatory before emitting the
child-34 ingress or launching a job. This is the next operational gate. On
`SAT`, replay the whole model and repeat wave-only theorem mining followed by a
Lean source bridge; on `UNSAT`, retrieve and independently replay the exact
certificate, bank the child-specific theorem, and compose it through
`exists_exactSeventeenSourceRealization_of_exactCover` and the landing contract.
Exact 17 and the production `sorry` remain open.

### 13.28.7 Child-36 canonical-position correction — 2026-08-13

Child 34 and child 35 both terminated authenticated `SAT`, with independent
full-CNF replay. Child 35 has 308 variables, 5,847,260 clauses, and SHA-256
`0ce510af7c5c653719cb2d1250c8577e9c48d244605182bfe8b91112c538787f`.
The post-wave audit found that its four new perpendicular-bisector clauses
used raw carrier labels where the theorem requires positions in a named cyclic
order. The clauses were consequently no-ops on the motivating model. This was
an ineffective refinement, not an incorrect SAT or UNSAT verdict.

The repaired Lean producer canonicalizes labels to cyclic positions before
applying the metric obstruction. Its `SourceRealization` bridge and exact
four-clause orbit are banked. The corrected Lean-owned child 36 is the exact
child-35 prefix plus those four clauses:

- 308 variables and 5,847,264 clauses;
- 291,621,334 bytes;
- SHA-256
  `e2236eaa12b10117c0540b2ea545f177e5070b6d96a0ac96668a733fe501eae5`.

The production validator replays all parent clauses against the authenticated
child-35 model and requires at least one new suffix clause to reject it;
corrected clause 3 does. It also pins the exact source and artifact bytes,
rejects semantic duplicates, and publishes the receipt last. Child 36 is
exported but not yet submitted. Next emit and validate one immutable PIQD
ingress, launch one job, and follow the existing SAT-refine / UNSAT-replay
contract. Exact 17 and the cap-nine production leaf remain open.

### 13.28.8 Child-37 six-hit cancellation checkpoint — 2026-08-13

Child 36 terminated authenticated `SAT` at epoch one as PIQD job
`acc2df0f-b219-46d7-9d3b-a926fc2465a3` after 591.435 seconds. Its exact root
had 308 variables, 5,847,264 clauses, and SHA-256
`e2236eaa12b10117c0540b2ea545f177e5070b6d96a0ac96668a733fe501eae5`;
the retrieved assignment passed independent full-CNF replay.

The wave-only mine was exhaustive and produced two records. The convex-five
record remains diagnostic because its signed forward/reverse source bridge is
not proved. The source-valid six-hit, two-Kalmanson cancellation is banked in
both cyclic orientations as a four-clause Lean-owned suffix, with source
evaluation and a conditional terminal adapter. Targeted Lean builds and axiom
checks pass without `sorryAx`; the accepted finite evaluator uses
`native_decide`. Suffix clause 3 rejects the authenticated Child36 model.

Child 37 is the exact Child36 prefix plus those four clauses. It has 308
variables, 5,847,268 clauses, 291,621,474 bytes, and SHA-256
`98f58d8cf71feb1201f30956e762f3a5b22acfe09f350070dfa7f83bed8640b3`.
Its immutable ingress manifest has SHA-256
`3d02b8e2a18ba75b08020e8275ca7e7aadb8e0556762a062dbca3ae546026f18`.
The publication tests, ingress validation, and live PIQD identity gate pass.
No Child37 job exists yet. Submit exactly one job after this checkpoint, then
apply the established SAT replay-and-mine or UNSAT certificate-and-compose
contract. Exact 17 and the cap-nine production leaf remain open.
### 13.28.9 Child-38 second cancellation checkpoint — 2026-08-13

Child 37 terminated authenticated `SAT` at epoch one as PIQD job
`ba0b8d07-328d-4e43-873e-b99d005b1578`; independent replay checked all
5,847,268 clauses. The wave-only mine found exactly two new source-valid
six-hit Kalmanson-cancellation occurrences. No other new occurrence had the
required source bridge. The resulting two-orientation Lean bank contributes
eight exact clauses, source and extended-CNF evaluators, and a conditional
terminal adapter. Targeted builds and transitive axiom checks pass without
`sorryAx`; finite evaluation remains under the accepted `native_decide`
boundary. Suffix clause 7 rejects the authenticated Child37 assignment.

The Lean exporter produced the exact Child38 successor with 308 variables,
5,847,276 clauses, 291,621,758 bytes, and SHA-256
`07b139089f2f9e11c03c8edfcdba58609a6f4c5be439e701888d975c182fe8d7`.
Its immutable ingress manifest has SHA-256
`6b74b75871940761fa346469b04c0ad17064a36b56766c5413c2ff6e048ad815`.
Publication is interruption-safe and ledger-last; exact parent-prefix,
ordered-suffix, motivating-model-cut, source-hash, receipt, ingress, and live
PIQD identity validation pass. The 263-test lifecycle suite, eight focused
Child38 tests, and Ruff pass.

No Child38 job exists at this checkpoint. Submit exactly one job through the
pinned runner. On `SAT`, replay the entire model and mine only the new wave
before admitting any source-proved successor clause. On `UNSAT`, retrieve and
independently replay the certificate, bank the child-specific theorem, and
compose through `exists_exactSeventeenSourceRealization_of_exactCover` and the
landing contract. Exact 17 and the cap-nine production leaf remain open.

### 13.28.10 Child-39 exhaustive six-hit cancellation bank — 2026-08-13

Child 38 terminated authenticated `SAT` at epoch one as PIQD job
`aeaefb24-0f57-4b1f-9c62-644208e65977` after 647.509 seconds. The exact root
had 308 variables, 5,847,276 clauses, and SHA-256
`07b139089f2f9e11c03c8edfcdba58609a6f4c5be439e701888d975c182fe8d7`.
Its retrieved assignment passed independent full-CNF replay; it is not a
Euclidean counterexample.

The required wave-only theorem mine exhaustively found 597 records in each
orientation, 317 distinct supports, 101 subset-minimal supports, and exactly 28
minimum six-hit supports. These are source-valid instances of the existing
cardinality-independent `CancellationOccurrence` family, so they generate a
112-clause Lean-owned suffix. The generator freezes the entire census funnel
and all output hashes. The four Lean shards and coordinator prove the clauses,
extended evaluation, source-realization bridge, and conditional terminal
adapter. Targeted checks report no `sorryAx`; finite evaluation uses the
accepted `native_decide` boundary.

Child 39 is the exact Child38 prefix plus those 112 clauses. It has 308
variables, 5,847,388 clauses, 291,625,610 bytes, and SHA-256
`989348e8a0d2288df6a80f36e56ed4e5771ef250dc10f4d4aeeb991a571a8a8a`.
The suffix, immutable export receipt, and recursive ingress manifest have
SHA-256 values `4cc66a1b3f4af46d60ed0a2c59f4fb6b0cb016f3ab1b111989ffe015f5b33925`,
`2dc3c78fb19ee4cef8b7fe45c9f49f0f0bd75201f9c0bed57891215bae565ecc`,
and `275a61b6febdc1ca5104ebe932919c24e2226f794e68b22caf02ffcbb076c83d`.
Ruff, nine focused adversarial tests, exact export/ingress replay, and the
runner static gate pass.

No Child39 PIQD job exists at this checkpoint. After publication, submit
exactly one job through the pinned runner and apply the established terminal
contract. Exact 17 and the cap-nine production leaf remain open.

### 13.28.11 Child-40 Lean-first prepublication checkpoint — 2026-08-13

Child39 subsequently terminated authenticated `SAT` at epoch one as PIQD job
`68cfcaf6-1a90-466e-8fc3-d1c3ffc8e377` after 674.811 seconds. Its retrieved
308-variable assignment independently replayed all 5,847,388 clauses of root
`989348e8a0d2288df6a80f36e56ed4e5771ef250dc10f4d4aeeb991a571a8a8a`.
This remains an abstract source-normal-form survivor, not a Euclidean
counterexample.

The mandatory wave-only mine found 49 new source-valid occurrences of the
existing two-Kalmanson `CancellationOccurrence` family. They expand to a
196-clause Lean-owned suffix; no new theorem family was required. Seven Lean
shards and their coordinator prove every source clause, the suffix and
extended-CNF evaluators, the `SourceRealization` bridge, and the conditional
terminal adapter. The targeted exporter build passes, and transitive axiom
checks contain no `sorryAx`; finite evaluation uses the accepted
`native_decide` boundary.

The strict Child40 publication chain pins the Child39 prefix, the 196-clause
suffix, the current Lean sources, and the exact 5,847,584-clause total. The
production Lean-rendered root was published with no-overwrite semantics and a
ledger-last receipt. It has 308 variables, 291,633,186 bytes, and SHA-256
`555d1d2facedc1cc3ea7a5bae31649b55e65fc2d14e8ad6e0742a023f9969034`.
Its recursively validated immutable ingress manifest has SHA-256
`df1c180056ee4c47e1d5ddc645ebda10a0129c9abcb6a41cace6749627469cd8`.
Ruff, all six focused adversarial publication tests, and the live PIQD daemon
identity check pass. Cleanup after a lost concurrent publication race is
ownership-specific and cannot remove the winning root. Exactly one Child40
PIQD job, `3d2779d0-4962-417d-b62a-a482b20e2772`, is confirmed and running at
epoch 1 against these pinned bytes.

This checkpoint does not close exact 17 or a production `sorry`. The next
authorized action is authenticated terminal handling. Terminal `SAT` repeats
exact replay and wave-only theorem mining; terminal `UNSAT` requires independent
certificate replay, Lean banking, and composition through the exact-17
source-realization and landing contracts.

### 13.28.12 Child-41 source-valid cancellation bank — 2026-08-13

Child40 terminated authenticated `SAT` at epoch one as PIQD job
`3d2779d0-4962-417d-b62a-a482b20e2772` after 592.423 seconds. Its retrieved
308-variable assignment independently replayed all 5,847,584 clauses of root
`555d1d2facedc1cc3ea7a5bae31649b55e65fc2d14e8ad6e0742a023f9969034`.
It remains an abstract source-normal-form survivor, not a Euclidean
counterexample.

The mandatory wave-only mine exhaustively found 586 records in each cyclic
orientation, 210 distinct supports, and 84 subset-minimal supports. Every
selected support is an instance of the already proved, cardinality-independent
`CancellationOccurrence` family. The 84 occurrences therefore produce a
336-clause Lean-owned suffix, split across twelve shards. The coordinator proves
the complete suffix evaluator, the 5,847,920-clause extended evaluator, the
`SourceRealization` bridge, and the conditional terminal adapter.

Child41 is the byte-identical Child40 prefix followed by those 336 clauses. It
has 308 variables, 5,847,920 clauses, 291,654,272 bytes, and SHA-256
`fc19386fdd9703f5313e1bf49b164d87c5905c56c727cfea6408dc7d01e78d24`.
The ordered suffix, immutable export receipt, and recursive ingress manifest
have SHA-256 values
`7699ee0e5dc4a3d9627b69c5246ec6ec0041450e00a562d60147dca607fc3bfa`,
`f6895b0856c04532e251ab357da610825263c7baa805d708fcc2cf5dc6d4bb9a`,
and `a82887fa8029dd3241eff659d8419f904dba724abcad8b45902dba9a4817ca7d`.
The publication and recursive ingress validators pass and the motivating
Child40 model is rejected by every selected occurrence's designated clause.

Before submitting Child41, the shared PIQD runner was hardened so an `UNSAT`
terminal result must retrieve the submitted-session clause map and proof,
reconstruct the exact kept CNF, and independently replay the compacted LRAT.
The certificate proves only the authenticated augmented CNF; the separately
proved source evaluators justify every learned clause. Ruff, 284 focused
adversarial tests, the live Child41 PIQD static gate, the targeted exporter
build, and the axiom audit all pass. No Child41 job may be submitted until this
checkpoint is published. Exact 17 and the cap-nine production `sorry` remain
open.

### 13.28.13 Child-41 terminal and Child-42 pre-submit checkpoint — 2026-08-13

Child41 terminated authenticated `SAT` as the single confirmed epoch-one PIQD
job `038ded12-0e98-4c93-b666-2ca2ac06da5e`. The retrieved total assignment,
whose custody SHA-256 is
`cf1cb831223700ebc376a50048260fc280a32aed7c91723c262b8a1274b5896a`,
independently satisfies every clause of the exact 5,847,920-clause root
`fc19386fdd9703f5313e1bf49b164d87c5905c56c727cfea6408dc7d01e78d24`.
This is another abstract source-normal-form survivor, not a Euclidean P97
counterexample.

The mandatory Child41-only mine examined 1,282 producer records, yielding 433
distinct supports and 133 subset-minimal supports. Every admitted support is an
instance of the existing cardinality-independent two-Kalmanson theorem family;
the eleven other diagnostic motif families still lack a valid
`SourceRealization` bridge. A separate normalized Child33--40 meta-analysis
reduced 133 historical supports to 130 classes and found no cross-wave
recurrence beyond the same already-banked family. This validates keeping the
mandatory wave-local mine while reserving cross-wave synthesis for periodic or
candidate-triggered audits; the newest CNF contains old clauses, but not the
historical models and rejected theorem candidates needed for that audit.

The 133 source-valid occurrences are now banked as a Lean-owned 532-clause
suffix across nineteen shards. The coordinator proves the source evaluator,
the 5,848,452-clause extended evaluator, the `SourceRealization` bridge, and the
conditional terminal adapter. The targeted exporter build passes, and the
public declarations have no `sorryAx`; finite evaluation remains inside the
accepted `native_decide` trust boundary.

The immutable Child42 root has 308 variables, 5,848,452 clauses, 291,688,780
bytes, and SHA-256
`375b7bc42381175119545627ab55c6bacb285fa35e4486f0b11193300620921f`.
Its export receipt and recursive ingress manifest have SHA-256 values
`4f4d5500a61a71bc14e1ff7c7b57e6d02cf7ff8d4131ebc0af1508663f5af6c5`
and
`8df92c533959f8717b2d897756d5c668e95f6adf9bb7bdca6eb5d8ee7ef758e4`.
Ruff, seven focused adversarial publication tests, recursive ingress
validation, and the live PIQD static gate pass. No Child42 job has been
submitted at this checkpoint. After publication, submit exactly one job: `SAT`
requires total-model replay and a new-wave-only theorem mine; `UNSAT` requires
submitted-session clause-map retrieval, independent certificate replay, Lean
banking, and composition through
`exists_exactSeventeenSourceRealization_of_exactCover`. Exact 17 and the
cap-nine production `sorry` remain open.

### 13.28.14 Child44 serial gate and bounded placement pivot — 2026-08-14

Child42 and Child43 also terminated authenticated `SAT`.  The complete
Child39--43 meta-mine contains 358 source-valid occurrences, all instances of
the already-banked two-Kalmanson cancellation family.  The Child44 successor
adds 228 Lean-owned clauses, 110 of which are already parent-subsumed.  It has
been submitted exactly once as PIQD job
`f717c352-2456-412a-ae45-d910f47d3e94` against root
`17f1c9c48e25aa887cbf80d9de31e0d9b0de089c7eca1b3968dbbe1e35494af9`.
It terminated `SAT` at epoch one after 1,687.851 seconds.  Child44 is the final
serial model-blocking probe; this result does not authorize an automatic
Child45.  Canonical finalization and independent replay pass for all 5,848,820
clauses.  The decoded model selects next center `15` and named order `1`.
The Child44-only mine found 99 paired source-checked occurrences, representing
396 clauses, all in the existing two-Kalmanson family; ten diagnostic records
were excluded for lack of a `SourceRealization` bridge.  No new theorem family
was found, so the serial route is retired.

The post-Child44 route is a source-total split by `SourceModel.nextCenter`.
There are thirteen legal next-center values after excluding the four old row
centers.  Child41--43 all used named order `1` and next center `0`, so the
serial loop repeatedly refined one of the 26 order/center cells.  The next
campaign solves the thirteen next-center cells in parallel.  Every `SAT` model
is independently replayed and passed through the existing complete strict-
Kalmanson oracle; linearly infeasible models yield exact positive weighted
certificates admitted in one batch.  A Kalmanson-feasible cell transfers to
Euclidean/EDM/Ptolemy analysis instead of receiving another pair-cancellation
suffix.  A cell closes only after proof-producing `UNSAT` replay against its
exact unit-augmented root.  A source-total Lean case split over `nextCenter`
composes the thirteen cell theorems.

The source-total ingress candidate has been LSP-elaborated as the explicit
duplicate-free `legalNextCenterLabels` table together with
`SourceModel.nextCenter_mem_legalNextCenterLabels`; its checked length is
thirteen.  These declarations have ordinary core axiom closure and will feed
the eventual per-cell terminal coordinator.  They are an ingress theorem, not
a closure claim.  After canonical Child44 finalization, the source hunk was
banked; its targeted module build passed, and the direct coverage theorem's
literal axiom closure is `propext`, `Classical.choice`, and `Quot.sound`.

This replaces two rejected successors.  The generic cancellation enumerator
is complete only for one supplied row system, not for every `SourceModel`, so
there is no presently executable finite global orbit.  A monolithic mixed
Boolean-plus-LRA formulation has also timed out even though its metric-only
subproblem is fast.  The production frontier measure is now the number of open
next-center cells and, secondarily, the number of Kalmanson-feasible cells.

The first stateful-session canary fixed next center `0` and named order `0`.
It returned `UNKNOWN` at its 1,200,000 ms timeout and produced neither a model
nor a proof.  The session journal also canonicalized the raw DIMACS bytes, so a
production adapter must bind both identities and use static handoff for proof-
producing `UNSAT`.  The next canary should use parallel sessions with
deterministic conflict budgets; a serial short-timeout sweep is not a credible
coverage test.

### 13.28.15 Child45 source-total terminal and FortySixth promotion — 2026-08-14

The generic `ASSUMPTION_CNF` campaign against the immutable Child45 root is
terminal.  One PIQD session visited all thirteen legal next-center assumptions
in the reviewed order `0`--`7`, `12`--`16`.  All thirteen cells returned `SAT`
in the Boolean abstraction.  Every returned assignment reconstructs to the
canonical dense 308-literal source assignment, satisfies the complete
5,848,824-clause Child45 root, and yields an exact two-term Kalmanson
infeasibility certificate.  There is no Kalmanson-feasible survivor and no
Euclidean counterexample candidate in this wave.

Promotion no longer relies on the shallow structural output validator.  The
shared CLI now has a distinct `validate-replay` gate.  It reconstructs the
canonical assignment solely from the serialized source model, recomputes the
PIQD request and result digests, streams the immutable Child44 source parent
and Child45 root, verifies every clause under the assignment, and regenerates
the complete source and exact Kalmanson result byte-for-byte.  Assignment
ingress rejects reordered total models, and the replay rejects symlink,
hardlink, or ancestor rebinding.  A persistent nonblocking operation lock
prevents duplicate long replays.  Focused adversarial validation passes with
152 tests and one intentional skip.

The production replay completed in 706.18 seconds with classification
`SAT_SEMANTIC_REPLAYED`.  It cross-binds envelope SHA-256
`bc388ef9ccc39508f4be786131f04a0139a9bdd3c494933a7d886ad97e6cc85f`;
the compact replay receipt has SHA-256
`4aad001c679627fa2797cbe4f207c3ff574dfa363f00cab223a5e73bee7f6160`.
This result authorizes theorem banking, not a closure claim.

The wave-only mine contains eleven distinct full certificate records but only
nine distinct guarded hit supports.  The support groups represented by cells
`06` and `13` each cover three cells; the remaining representatives are
`00`, `01`, `02`, `03`, `04`, `05`, and `16`.  None of the nine supports is
equal to, contained in, or contains any support inherited through
FortyFifth.  The FortySixth bank therefore adds exactly nine checked weighted
occurrences and 36 source-valid clauses while retaining all eleven full
certificates and all thirteen cell mappings in its authenticated ledger.

After the FortySixth Lean evaluator, exporter, and publication checks pass,
submit exactly one immutable successor.  `SAT` returns to wave-only theorem
mining; `UNSAT` must be retrieved and independently replayed, then composed
through `exists_exactSeventeenSourceRealization_of_exactCover`.  Exact 17 and
the cap-nine production `sorry` remain open until that terminal composition is
kernel-checked.

The FortySixth checkpoint is now ready for that one successor.  The Lean-owned
Child46 root has 308 variables, 5,848,864 clauses, 291,706,884 bytes, and
SHA-256
`106a8f682212cb76281b01fb834f6244e6013767a1edad207c77179a187e75b2`.
Its exclusive publication receipt has SHA-256
`64cc2822aa751f066f9177abd417e538be50524dd820ea250048f64a37de9ae3`.
The registered `exact17-child46` semantic profile binds the exact parent and
child DIMACS bytes, strict thirteen-cell replay receipt, terminal envelope,
nine-support occurrence ledger, Lean source bridge, and publication receipt.
The generic CLI `plan` and `validate-ingress` gates pass against all eight
retained artifacts.  The wave manifest also binds its immediate parent root,
and the control permits enough polling time to outlive the one-hour solver
timeout.  The shared static-output validator now also binds verdict,
classification, and return code to the immutable runner receipt; requires a
total SAT assignment; binds that assignment to the archived raw PIQD model
response; and independently replays it against the authenticated CNF bytes.
Standalone engine inspection is structural-only and cannot accept a result:
the old standalone validation entry point now fails closed, while registered
execution and `validate-output` rebind the control, package, semantic profile,
and retained artifacts before reporting acceptance.
No Child46 PIQD job has yet been submitted at this checkpoint.

### 13.28.16 Child46 terminal and uniform three-row-cycle bank — 2026-08-14

Child46 was subsequently submitted exactly once as PIQD job
`6f031597-70aa-4c22-bb3b-b222dbb7871f` and terminated `SAT`.  Independent
source replay verifies the complete 5,848,864-clause root under the returned
308-literal assignment.  The reconstructed named order is
`[0,6,8,11,10,12,9,7,2,15,16,3,4,5,1,13,14]`; the complete strict-Kalmanson
system is exactly infeasible with a two-term rational certificate.  This is a
Boolean-abstraction survivor, not a Euclidean counterexample.

The required post-Wave-43 synthesis compared Child39--43, Child45, and
Child46.  It found 433 normalized source-valid supports with no exact
cross-wave recurrence or proper-subset relation.  The recurring object is
instead a three-row, six-incidence cycle family.  Three cardinality-independent
Kalmanson theorems now rule out its direct six-distinct-point order types:
adjacent/adjacent and the two adjacent/inner-outer orientations.  Each theorem
has increasing and decreasing cyclic-order consumers and has axiom closure
exactly `propext`, `Classical.choice`, and `Quot.sound`.

The exact-17 `SourceRealization` adapter enumerates those three theorems over
both named orders, both cyclic directions, all seventeen cuts, and all 4,368
increasing five-offset choices.  It contributes 891,072 source-valid clauses
to Child46.  The complete Lean-owned successor has 308 variables, 6,739,936
clauses, 322,685,712 bytes, and SHA-256
`2870fa87246292872ef0668471b2dab8a708a7c1815e2223a385c2ecb8a8f869`.
An independent renderer audit proves that its clause body is the exact
authenticated Child46 body followed by the independently regenerated suffix;
the suffix rejects the authenticated Child46 source model in twenty clause
placements.  The source evaluator and terminal conditional-UNSAT adapter have
no `sorryAx`; they inherit the already accepted `native_decide` trust boundary
from the exact-17 bank.

This bank is deliberately not claimed to subsume every Child46 certificate.
Among the 25 minimal six-hit producer supports, five reuse a point as center
and endpoint, while some disjoint records use auxiliary Kalmanson vertices
outside their six hit endpoints.  Those remain outside the direct theorem's
scope.  The next authorized action is immutable publication and exactly one
PIQD successor after the replay-lock hardening gate.  `SAT` returns to a
wave-only mine; `UNSAT` must be independently replayed and composed through
the existing exact-cover and `SourceRealization` bridges before exact 17 or
the production `sorry` is declared closed.
