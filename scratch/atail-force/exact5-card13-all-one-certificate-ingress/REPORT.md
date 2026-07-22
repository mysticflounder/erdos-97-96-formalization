# Exact-five card-13 all-one certificate ingress

Date: 2026-07-22

Status: **CERTIFICATE INGRESS COMPLETE IN ALL THREE ORBITS. A 7,256-ASSERTION
SOURCE CORE HAS BEEN REBUILT IN EACH ORBIT; ALL THREE LEAN-EMITTED CNFS HAVE
KERNEL-CHECKED MULTIPART LRAT ENDPOINTS; ALL 348 SPLIT CORE MODULES AND THREE
AXIOM AUDITS PASS; AND A COMBINED THREE-ORBIT IMPORT PASSES. SOURCE COMPOSITION
AND FINAL DISPATCH ARE A SEPARATE LAYER, SO THIS CHECKPOINT ALONE DOES NOT CLOSE
A PRODUCTION SORRY.**

## Result

This directory supplies the source-format and Lean-generation layers needed
to replay a compact all-one source core through Lean's verified
`BVLogicalExpr -> AIG -> CNF` compiler and LRAT checker.

The generator keeps the original card-thirteen cyclic boundary frame.  It
does not use the optional `1 <-> 3` physical-role reflection.

| short orbit | source orbit | Lean CNF orbit | hub | `g0` spoke | `g1` spoke |
| --- | --- | --- | ---: | ---: | ---: |
| `left` | `allOneHitHubLeft` | `hubLeft` | 1 | 2 | 3 |
| `middle` | `allOneHitHubMiddle` | `hubMiddle` | 2 | 1 | 3 |
| `right` | `allOneHitHubRight` | `hubRight` | 3 | 1 | 2 |

`all_one_source_terms.py` checks this table against the actual encoder's
`Outer.roles` every time it rebuilds an orbit.  A mismatch is fatal.

The source contract recorded in every generated map is:

- `m` is the common selected-row table in the original boundary frame; at a
  fixed-`H` blocker-image center, the semantic producer must identify it with
  that center's actual fixed-`H` critical support;
- `g0` and `g1` are independently selected cover rows for the displayed hub
  and spoke.  They are not identified or shared;
- `blocker_i` is the actual fixed-`H` blocker index of source `i`;
- `shell` is the complete exact-five second-apex radius class;
- `frontier_q` and `frontier_w` are the actual frontier indices.  The loader
  rejects a source core marked `canonical_qw`;
- `b1` is the retained double-deletion first-apex row; and
- all 78 distance ranks use the untouched lexicographic boundary-pair order.

This matches the certificate-facing three-way packet
`CanonicalAllOneThreeWayCnfPacket` and the role-independent semantic table
`CanonicalAllOneSemanticRowTable`.  It deliberately does not consume
`CanonicalAllOneHubOrbitPacket`, whose optional role reflection is not a
cyclic-order symmetry.

## Files

- `all_one_source_terms.py`
  - rebuilds the exact source stream;
  - validates orbit and source-expression identity for every saved core row;
  - rejects duplicate/out-of-range indices and `canonical_qw` cores;
  - translates the supported Z3 source AST to packed Lean Booleans; and
  - records the source-to-Lean field contract.
- `generate_all_one_bvexpr.py`
  - translates a saved core directly to `BVLogicalExpr`;
  - lowers unit pseudo-Boolean constraints through a definitional threshold
    expression, not Z3's Tseitin variables;
  - emits the exact CNF produced by Lean's verified compiler;
  - optionally embeds a supplied LRAT certificate; and
  - writes a dense variable map with hashes and the orbit contract.
- `generate_all_one_ingress.py`
  - constructs the exact packed `BVExpr.Assignment`;
  - emits bounded itemwise chunk bridges from flat source assertions;
  - emits a machine-readable obligations file for the semantic producer; and
  - when the map contains an LRAT endpoint, emits the final
    `false_of_source_flat` theorem.
- `audit_source_surface.py`
  - translates every source assertion in all three orbits through both the
    verified-expression emitter and packed-source emitter.
- `make_smoke_cores.py`
  - makes small deterministic test cores covering every source AST operator.
- `source-surface-audit.json`
  - durable output of the full three-orbit translator audit.

Full candidate CNFs, DRAT/LRAT solver outputs, and smoke trees are
intentionally ignored.  The dependency-sliced LRAT chunks, their manifests,
and the three final verified modules under `certificates/` are durable replay
artifacts and are not ignored.

## Full source-surface audit

The audit passes on all three current source streams:

- 45,865 assertions per orbit;
- 626 source atoms per orbit;
- 1,139 packed source bits per orbit, exactly
  `507 + 52 + 13 + 4 + 4 + 13 + 546`; and
- no unsupported Z3 operator.

The operators exercised are:

```text
and, bool-eq, bv-distinct, bv-eq, bv-ule, bv-ult, implies, not,
or, pb-at-most-unit, pb-exact-unit
```

The all-one emitter therefore includes two cases absent from the first
asymmetric pass-5 emitter: binary `Distinct` and unsigned `<=`.  Since
`BVLogicalExpr` has only equality and unsigned `<` primitives, unsigned `<=`
is compiled definitionally as `not (right < left)`.

The audit fails closed if the assertion count, variable count, packed bit
count, encoder orbit roles, or any source expression changes.

## Lean smoke validation

`make_smoke_cores.py` selected seven assertions in each orbit whose combined
ASTs cover every operator above.  For each of left, middle, and right, the
following generated modules compile with warnings as errors:

1. the `BVLogicalExpr` source module; and
2. the packed-source assignment and itemwise chunk ingress module.

The generated source-expression lemma

```text
bands_sat_of_each
```

has axiom closure:

```text
[propext, Quot.sound]
```

The generated packed chunk bridge

```text
sourceChunk000_each_of_flat
```

has axiom closure:

```text
[propext, Classical.choice, Lean.ofReduceBool, Lean.trustCompiler, Quot.sound]
```

The last two entries are inherited from the bounded `bv_decide` used to
normalize pseudo-Boolean source clauses.  The project has explicitly allowed
this native-decision trust boundary.  There is no `sorryAx`, declaration-level
custom axiom, `sorry`, or `admit` in the generator or generated smoke modules.

## Compact three-orbit certificate checkpoint

The full middle-orbit guarded-source proof was independently checked by
`drat-trim`. Its clause core retains 7,256 of the original 45,865 named source
assertions. Rebuilding those source indices in each untouched boundary hub
orbit produces the following exact Lean `BVLogicalExpr` CNFs:

| Orbit | Variables | Clauses | SHA-256 |
| --- | ---: | ---: | --- |
| left | 69,042 | 202,760 | `4d3bf4389ad4569b10d6a8c2962965901e49e74a4d675e05343442c2f4c19464` |
| middle | 69,044 | 202,766 | `ccbcb7745cec6976d1fecf427123cbaf9e27ad6a11a4a134ecd41631a974cb7a` |
| right | 69,043 | 202,763 | `78ad638630f65011cbd32fecd7ef4328a5466e59f7b491074da32774f6384939` |

CaDiCaL was run with the same verified-pipeline restrictions used by the
completed asymmetric certificate:

```text
--factor=false --lrat --no-binary --unsat --seed=22
```

The resulting direct LRAT files are 330,461,614 bytes (left), 357,826,547
bytes (middle), and 353,287,580 bytes (right), with SHA-256 hashes
`2f3d591409a9eeb4974068095da571fd2e40b10b68a3f1c4e2f098ee7f4de5f6`,
`16e35deae23cd85246bb949f01c249f8b8ccf78fc6361e049d1101f765bea0d7`,
and `981ca7b41049ead0e9ce846076b15676c020aa13fb0ab37fed674dd4d44cde80`.

A fail-closed pure-RUP dependency slice removes unused additions and all
deletions, then densely renumbers the retained derived clauses and their
hints.  The resulting kernel-accepted certificates are:

| Orbit | Sliced bytes | SHA-256 |
| --- | ---: | --- |
| left | 77,424,971 | `630932bf22d73b81a20a0aafa3ef93d98b22b39a07bfe47552363e91a9cc1565` |
| middle | 75,096,168 | `e0b27040666abfce101fc5e11453d9e5a9c6a89baf8e72cd62ae8c01f9dbd2e2` |
| right | 77,204,554 | `af334daf1529acc07b2f30be044000b7643526391d321bcebd4cd1b59a25e1d4` |

Each sliced stream is persisted under `certificates/` as two newline-aligned
parts of at most 48 MiB.  `certificates/manifest.json` records every part hash
and the bytewise reassembly hash.  The final generated modules concatenate
their two `include_str` inputs with `String.join`; all three multipart modules
pass the authoritative Lean 4.27 warning-as-error check.  The original
330--358 MB proofs are not required for fresh-checkout replay.

Each generated `sourceExpr_unsat` theorem compiles with warnings as errors
under the authoritative `lean/` project toolchain (Lean 4.27). The printed
axiom closure is exactly:

```text
[propext, Classical.choice, Lean.ofReduceBool, Lean.trustCompiler, Quot.sound]
```

There is no `sorryAx`. These are genuine kernel-checked finite endpoints.
They do not yet close a source theorem because the generated packed assignment
still has to be proved to satisfy every selected source assertion. The
role-independent semantic ingress now supplies every required field, and the
Boolean adapter sweep is the only remaining gate for this exact-card-13
all-one arm.

## Import-safe split-ingress validation

The first generated certificate modules exposed a root declaration named
`main`.  Importing all three modules together therefore caused a declaration
collision even though each orbit compiled separately.  This was an engineering
import constraint, not a proof failure.  The generator now emits the three
orbit-qualified entrypoints

```text
Problem97.ATailExactFiveCard13AllOneCertificate.Left.verifierMain
Problem97.ATailExactFiveCard13AllOneCertificate.Middle.verifierMain
Problem97.ATailExactFiveCard13AllOneCertificate.Right.verifierMain
```

The persisted modules and certificate manifest were regenerated after that
change.  The sliced LRAT bytes and their whole-stream hashes did not change.
The three raw endpoint modules were then rebuilt under Lean 4.27 with warnings
as errors.  Their current olean hashes are:

| Orbit | Olean bytes | Olean SHA-256 |
| --- | ---: | --- |
| left | 118,979,960 | `c58b60c84f7b8de0dadb16a07c2511b6e55abceaea772b5661d463b6dc9d21e2` |
| middle | 116,653,832 | `a602d9ebcc9ec441fa3b487980f5613efadf342230ee2a75650986e8d5e1a3ac` |
| right | 118,762,912 | `b83a0ce39372dc98e52e3e2894586e5a599ae88d461183243c6ba1aad698d611` |

`validate_split_ingress.py` next compiled, with 24 workers:

- all three assignment modules;
- all 342 bridge modules, 114 per orbit;
- all three itemwise endpoint modules; and
- all three generated axiom-audit modules.

The 348 core modules completed in about 8 minutes 19 seconds of wall time.  The
sum of per-module times was 1,793.26 seconds for left, 1,551.27 seconds for
middle, and 1,457.38 seconds for right.  The longest module in each orbit was
bridge chunk 29, at 436.69, 425.98, and 420.68 seconds respectively.

Each orbit audit prints 115 declarations: 114 itemwise bridges and the final
`false_of_sourceChunks_each`.  Of those, 102 have axiom closure exactly

```text
[propext, Quot.sound]
```

and 13 have axiom closure exactly

```text
[propext, Classical.choice, Lean.ofReduceBool, Lean.trustCompiler, Quot.sound]
```

No audited declaration reaches `sorryAx`.  The validator's three-orbit mode
also emits a combined smoke module that imports all three split audit modules,
checks all three qualified `verifierMain` declarations, and prints the axioms
of all three final itemwise endpoints.  Its latest warning-as-error run passed
in 2.70 seconds.  The combined smoke olean had
SHA-256
`a716c337f82430cf9408f95c44c77b6501a855b123d3cd2ae31d3e9c3c4c1499`.

The first full validator invocation attempted to place its generated audit
sources under `/tmp`; Lean's source-containment check rejected those three
audit jobs.  The 348 preceding core jobs had already passed.  The validator was
then corrected to place audit sources under this scratch directory, and the
three audits passed in a separate `--audit-only` run.  The three earlier
nonzero statuses are therefore retained as engineering-preflight history, not
classified as theorem failures.

## Exact dependencies

Python generation depends on:

- `z3-solver`, invoked through `uv run --no-project`;
- `../exact5-all-one-ordinal-rank/all_one_ordinal_rank.py`; and transitively
- `../exact5-global-cover-parent-gate/encode.py` and `verify.py`.

The generated certificate module imports only:

```lean
Std.Tactic.BVDecide.Reflect
```

The generated packed ingress additionally imports:

```lean
Lean.Data.RArray
```

The eventual source-level producer is expected to consume:

- `../exact5-card13-all-one-source-ingress/AllOneSourceIngress.lean`;
- `../exact5-card13-all-one-orbit-normalization/`
  `ExactFiveCard13AllOneOrbitNormalization.lean`;
- `../exact5-card13-cnf-ingress-audit/BooleanPacking.lean`; and
- `../exact5-card13-cnf-ingress-audit/FiniteDistanceRank.lean`.

Those modules construct and pack the actual geometric rows, fixed-`H`
blockers, exact-five shell, frontier roles, retained first-apex row, and
ordinal distance ranks.  This directory does not duplicate those proofs.

## Reproduction

Run the full translator audit:

```bash
UV_CACHE_DIR=/tmp/uv-cache uv run --no-project python \
  scratch/atail-force/exact5-card13-all-one-certificate-ingress/\
audit_source_surface.py \
  --output scratch/atail-force/exact5-card13-all-one-certificate-ingress/\
source-surface-audit.json
```

Once a compact source core and its LRAT for the Lean-emitted CNF are
available, generate one orbit as follows (shown for `middle`):

```bash
UV_CACHE_DIR=/tmp/uv-cache uv run --no-project python \
  scratch/atail-force/exact5-card13-all-one-certificate-ingress/\
generate_all_one_bvexpr.py \
  --orbit middle \
  --core /path/to/middle.source-core.json \
  --certificate /path/to/middle.lean-cnf.lrat \
  --output-lean /path/to/AllOneMiddleCertificate.lean \
  --output-map /path/to/middle.verified-map.json

UV_CACHE_DIR=/tmp/uv-cache uv run --no-project python \
  scratch/atail-force/exact5-card13-all-one-certificate-ingress/\
generate_all_one_ingress.py \
  --orbit middle \
  --core /path/to/middle.source-core.json \
  --map /path/to/middle.verified-map.json \
  --certificate-module AllOneMiddleCertificate \
  --output-lean /path/to/AllOneMiddleIngress.lean \
  --output-obligations /path/to/middle.obligations.json
```

The LRAT must certify the CNF emitted by the generated Lean source module.
An LRAT for Z3's externally exported DIMACS is not interchangeable with that
CNF.

## Next layer

The certificate-ingress gate is complete.  The generated packed-ingress
modules expose the exact source obligations for all three original-frame hub
orbits, and the three verified endpoint families can coexist in one import
graph.  The next layer is source composition of those obligations and dispatch
on the `hubLeft`, `hubMiddle`, and `hubRight` constructors.  That work is
separate from this finite-certificate checkpoint; no production `sorry` is
claimed closed here.
