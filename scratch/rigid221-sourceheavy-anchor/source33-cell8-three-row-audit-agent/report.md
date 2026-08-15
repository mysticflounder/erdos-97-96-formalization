# Source33 cell-8 V7 third-row audit

Status: **PASS as a finite proof-backed cut; not closure.** No tracked files were edited.

Audited:

- Lean producer: `lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/ExactTwelveRigid221MixedV7Cell8ThirdPositiveCut.lean`
- source34 binding: `census/card_head/exact12_v14_ordered_coverage.py`
- source33 cube: `scratch/rigid221-sourceheavy-anchor/exact12-v14-source33-static-cell8-r1/survivor-cube.json`

Findings:

- **All 48 `SOURCE_ORDERS` covered:** PASS. There are 24 direct and 24 mirror orders. Every order is covered by the common-five-point rule, with exactly the two preferred cores and no fallback rule: 24 orders through each core.
- **Supports match source33 cell-8 cube:** PASS. The three selected rows are centers `5`, `9`, `10` with supports respectively `[1,3,7,10]`, `[4,5,7,10]`, and `[0,1,7,8]`; each is an exact source33 cube row. The canonical source33 cube digest is `fc668b2264b9a9067f7b14b89b1b2b31fdfa73f0ca50a0e7866e800b3281d155`.
- **Equality witnesses are source-faithful:** PASS. Core A is `{a=1,x=10,b=7,c=9,y=5}` and uses source rows `(10,1,7)`, `(5,1,7)`, `(9,7,10)`, `(9,7,5)`. Core B is `{a=1,x=5,b=7,c=9,y=10}` and uses the corresponding source rows `(5,1,7)`, `(10,1,7)`, `(9,7,5)`, `(9,7,10)`. Replay verified all required support edges.
- **Source authentication:** PASS. The Lean source is exactly `5,415` bytes with SHA-256 `464162b69c8fd4adfcbd444d9cc77fa2cbf0bbe53554483d677d9e325dac1b6a`; the source34 binding records the same path, byte count, and digest.
- **Compiled clause:** PASS. Recompilation of the bound choices yields exactly `(-972,-2371,-2419)`.
- **Compilation/tests:** The requested Lean file compiles directly with the project Lake environment. Focused tests passed: source-bank `11/11` and ordered-coverage `7/7`. A broader `lake-build` invocation was not clean because an unrelated existing `ExactTwelveRigid221V14JobCnf` target hit Lean excessive-memory failure; this does not affect the direct compile above.

Classification: this is a finite, source-authenticated, proof-backed cut for one source33 exact-12 cell-8 cube. It is not terminal UNSAT, all-cell coverage, a universal lift, or closure of a live theorem.
