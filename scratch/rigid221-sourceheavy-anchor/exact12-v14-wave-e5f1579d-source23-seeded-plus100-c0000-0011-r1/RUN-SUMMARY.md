# Exact-12 v14 source23 seeded plus-100 wave

This bounded twelve-cell continuation replayed the authenticated 10,070-record
source23 seed set and permitted exactly 100 additional refinements per cell.
The detector source was isolated at commit
`e5f1579d0344e1c523b4bb90dfd460a5cbf92da7`; its complete nine-file contract
manifest is
`4e7e20ea36f9bba8b5f7557a9542483bbbdbf3c8fcfb3c882423e4952441cb61`.
The source23 migration receipt is committed at `92e1f025`.

All twelve cells reached `ITERATION_LIMIT`. The wave retained 11,270 journal
records, adding exactly 1,200 records to the seed set. Every discovery verdict
was `SAT`; every terminal verdict was null; every
`terminal_proof_verified` field was false.

| Cell | Binding `(arm,d,v,j,p)` | Seed | Final | New | Status | Terminal record SHA-256 |
| ---: | --- | ---: | ---: | ---: | --- | --- |
| 0 | `(u_q,0,2,0,0)` | 723 | 823 | 100 | `ITERATION_LIMIT` | `ba0925c8d0ec42fdd65de98c537d6305178fffaf882f83716ab66a2361bf18a1` |
| 1 | `(u_q,2,2,0,0)` | 1,151 | 1,251 | 100 | `ITERATION_LIMIT` | `d990972557567e0fb4d14660f66405f040e6bf4b9d97b0b847f40d52e4e8cee0` |
| 2 | `(u_q,3,2,0,0)` | 723 | 823 | 100 | `ITERATION_LIMIT` | `90f321513ca29ef408f9a9b5d90cf0384043b2fe43f101c2ca4fccda9600cae4` |
| 3 | `(u_q,4,2,0,0)` | 784 | 884 | 100 | `ITERATION_LIMIT` | `23a6d9cb669b39688580a86fcf82923415753f4e7d7983a96b57336be0df7915` |
| 4 | `(u_q,5,2,0,0)` | 1,104 | 1,204 | 100 | `ITERATION_LIMIT` | `d5ad51a3b1732e6968836435730fb5620a943b9141d53d2da2732feabb395653` |
| 5 | `(u_q,6,2,0,0)` | 780 | 880 | 100 | `ITERATION_LIMIT` | `6b3e9e5854834d0c402b701716f030879c442543c70f8a4346d2cd65f63dff85` |
| 6 | `(u_q,9,2,0,0)` | 800 | 900 | 100 | `ITERATION_LIMIT` | `f8dff1b0d41399994e73182fe899ee889e252047120cb29e38e703966b28bcb6` |
| 7 | `(u_q,10,2,0,0)` | 800 | 900 | 100 | `ITERATION_LIMIT` | `ae90bf34e5d53ec7b588d9b1224124d7b2ff0c2555c00733461b812e93a6b641` |
| 8 | `(u_q,11,2,0,0)` | 771 | 871 | 100 | `ITERATION_LIMIT` | `a164293cba4546ae8b844ee8a840153846cb83367a868f41753ae38507ce93da` |
| 9 | `(u_w,0,2,0,0)` | 742 | 842 | 100 | `ITERATION_LIMIT` | `a1bb6af4f0d7033bd097a05736233ffb498ad7f0fdc04534d9083b093293e894` |
| 10 | `(u_w,2,2,0,0)` | 1,019 | 1,119 | 100 | `ITERATION_LIMIT` | `cf7b8da64acf1155ea037e419e8bdf7d58f91fe21fb6285ec8546fab2210ebd0` |
| 11 | `(u_w,3,2,0,0)` | 673 | 773 | 100 | `ITERATION_LIMIT` | `88d9a183b6ced36ae27de5d83c43dcf72220ff2f8d02c901958011266a361874` |

## New-record classification

The 1,200 new records comprise:

- 1,195 `structural_metric_core` records;
- 5 `source_order_positive_coverage` records.

The structural stages were 1,149 duplicate-center, 4 equal-K4, 17
equilateral-bisector-collision, 17 perpendicular-bisector-convex, and 8
three-triad-collision records.

The five source-order records reused already authenticated bank entries:

| Cells | Bank index | Learned clause | Role in this wave |
| --- | ---: | --- | --- |
| 0 | 20 | `(-396, -612, -1262, -2343, -2747)` | source23 cell-0 cut fired at the first new record |
| 3 | 21 | `(-299, -611, -2918)` | source23 cell-3 cut fired at the first new record |
| 7, 10 | 13 | `(-40, -160, -230)` | pre-existing shared bank cut |
| 11 | 22 | `(-55, -223, -609, -1920, -2918)` | source23 cell-11 cut fired at the first new record |

Thus the source23 cuts are active and removed the three source20 diagnostic
survivors, but they did not terminalize their cells. This wave found no new
source-order predicate outside the existing proof-backed bank.

## Independent audit

A separate read-only replay checked all 12 summaries and jobs, the complete
nine-file source manifest, exact byte-for-byte migrated-seed prefixes, journal
line counts, and canonical record hashes and parent chains. It validated all
21,340 seed-plus-wave records. All candidate, added-constraint, exact-CNF, and
journal replay gates are true. All 12 discovery CNFs are present and hash-bound.
No terminal CNF, proof, survivor, or proof-verification artifact is present.

## Static equality accelerator and missing predicate audit

A follow-up finite experiment compiled the five currently replayable equality
families—duplicate-center, equal-K4, equilateral-bisector, three-triad, and
perpendicular-bisector obstructions—into one static CNF layer. Replaying each
cell's complete authenticated source23 journal before adding that layer left
all twelve cells `SAT`. Every resulting cube was outside both the structural
detector and the then-current proof-backed source-order bank.

This is detector saturation, not a terminal result. The generic
source-entitled ordered-coverage detector nevertheless found a valid
48-boundary-order positive-incidence certificate for every one of the twelve
residual cubes. Therefore the immediate finite refinement gap is not missing
survivor data: it is the absence of exact Lean `SourceOrderPositiveNogood`
declarations and authenticated cube bindings for those certificates.

The smallest first promotion is the cell-9 residual. Its certificate uses only
the rows centered at `1`, `4`, and `6` and the convex-five-point core
`(a,x,b,c,y) = (2,1,0,6,4)`. The Lean cut
`mixedV6Cell9PositiveNogood` directly elaborates, and its exact cube has been
added as source-order bank entry 23 (the twenty-fourth entry). A focused replay
is still required to determine the next cell-9 survivor or terminal verdict.

The static CNF pilot is a finite discovery accelerator only. It supplies no
terminal proof ingress, all-cell exact-12 coverage, universal-cardinality lift,
or live theorem closure.

## Source24/source25 residual promotion checkpoint

The first cell-9 residual was replayed under the 24-entry bank and retained an
authenticated 842-record journal.  The first cell-6 residual was then replayed
under the 25-entry bank and retained an authenticated 900-record journal.  A
source25 static-equality pass over the other ten cells remained `SAT` in every
cell, with no structural detector or then-admitted source-order cut firing.
The retained journal counts were 823, 1,251, 823, 884, 1,204, 880, 900, 871,
1,119, and 773 for cells 0, 1, 2, 3, 4, 5, 7, 8, 10, and 11 respectively.

The generic source-order detector again covered all 48 frozen boundary orders
for each inspected survivor.  Eight exact detector-minimized certificates are
now formalized as source-clean `SourceOrderPositiveNogood` declarations and
appended, without reordering prior bank indices:

| Index | Declaration | Selected centers | Learned clause | Certificate SHA-256 |
| ---: | --- | --- | --- | --- |
| 23 | `mixedV6Cell9PositiveNogood` | `1,4,6` | `(-55,-552,-1152)` | `7eb9e32aac17451e4e6624ac237df65ba1f4f77e9f94f9a072adbf19fe78469c` |
| 24 | `mixedV6Cell6PositiveNogood` | `6,7,8,11` | `(-1208,-1630,-2065,-2761)` | `6eed9b26b651727db505c66c56a6c53f124c0bf8af0439d32cebdbfb5930aaa4` |
| 25 | `mixedV6Cell9SecondPositiveNogood` | `1,2,4,10` | `(-55,-155,-618,-2397)` | `73ac7e1935382b674e6f23ce6ad9e1f26754aef1ac40a009fa099c24d345f1be` |
| 26 | `mixedV6Cell2PositiveNogood` | `3,6,7` | `(-177,-1156,-1605)` | `798792f7b6902ee66ce0a82cf3dcd71289e2260a10150c0a5a7ed28c6ed6b799` |
| 27 | `mixedV6Cell8PositiveNogood` | `3,4,9` | `(-289,-618,-2083)` | `aa2f694666a8026a5a3456a41b14e1ee9bbcf145546e57405a4e54f96a5c44e9` |
| 28 | `mixedV6Cell0PositiveNogood` | `0,10,11` | `(-6,-2431,-2872)` | `a36acf13460320cb309f4db7ae1216f78050a7e3f7bb3411c638a296b2eff2ef` |
| 29 | `mixedV6Cell6SecondPositiveNogood` | `1,3,4,6,7,9` | `(-55,-409,-632,-1264,-1605,-2092)` | `862a4b15638f98f9085cf5f13913d84388e9fcd1075b961a2b1842a082534ccf` |
| 30 | `mixedV6Cell10PositiveNogood` | `1,5,11` | `(-55,-852,-2848)` | `8f86d920d149d77c122641a31d556e7fe55c557770c766beb4d6f380b3bdc40b` |

The resulting bank has 31 entries and a 33-file Lean source manifest.  Its
current authenticated bank hash is
`1ff1bd0c338af148395baf37a1aebd046e19ebe5f8d68d06337c0f563d1a2bbb`.
The fail-closed replay test forced two formal artifacts to be minimized further:
cell 2 now carries one core, and the second cell-6 cut carries two cores and six
rows, exactly matching the generated certificates.

The source25 cell-10 survivor is present as a plain untracked discovery cube
with SHA-256
`007089f88ae40136194aeafb983fd5c311f648999eab5d4e4b926156f971ae80`.
It is not itself an immutable journal record: the adjacent journal terminal
record contains a different cube.  The admitted cut is therefore pinned by its
Lean source, complete cube, generated certificate, and bank replay, but the
historical discovery-cube provenance must not be described as journal-bound.

This checkpoint expands the reusable finite obstruction bank.  It still does
not establish a terminal cell, terminal UNSAT, all-cell exact-12 coverage, a
general-cardinality lift, or closure of the live Lean leaf.

## Source31 authenticated replay checkpoint

The first attempted source31 static replay at
`exact12-v14-source31-static-all-cells-r1` failed closed before every solver
invocation because the source25/source24 journals still named the preceding
detector-contract hash.  The finite bound-job hashes had not changed.  That
attempt produced no SAT/UNSAT result and is retained only as a migration-gate
diagnostic.

The production journal migrator then authenticated and replayed all 11,270
records under the current 31-cut bank and detector contract.  Its twelve
receipts are under `exact12-v14-source31-migrated-journals-r1`; every receipt
reports `current_source_replayed = true`, and every migration error log is
empty.  Record counts were preserved exactly:

| Cell | Migrated records |
| ---: | ---: |
| 0 | 823 |
| 1 | 1,251 |
| 2 | 823 |
| 3 | 884 |
| 4 | 1,204 |
| 5 | 880 |
| 6 | 900 |
| 7 | 900 |
| 8 | 871 |
| 9 | 842 |
| 10 | 1,119 |
| 11 | 773 |

The corrected twelve-core replay at
`exact12-v14-source31-static-all-cells-r2` installed all 31 proof-backed cuts
in every cell.  Every solver returned `SAT`; every residual had
`detector_stage_on_sat_cube = null` and
`admitted_cut_stage_on_sat_cube = null`.  Thus none of the eight new cuts, nor
the compiled static equality predicates, terminalized a scheduled cell, and
the current detector knows no further proof-backed cut for these twelve new
residuals.

This is a negative finite discovery result, not a proof result.  It supplies
no terminal proof, all-cell exact-12 coverage, universal-cardinality lift, or
live Lean closure.  The next checkpoint is to compare the twelve residuals for
a recurring source-entitled predicate rather than rerun the unchanged
detector cascade.

This is an authenticated finite checkpoint for the twelve scheduled cells. It
does **not** establish terminal UNSAT, all-cell exact-12 coverage, a universal
lift, Lean closure of
`false_of_exactFourRigid221_sourceHeavy_secondOppositeLarge_pentagonOffClassBlocker`,
or a mathematical solution of P97/P96.
