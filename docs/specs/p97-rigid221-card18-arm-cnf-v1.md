# P97 Rigid221 card-18 arm CNF v1

**Status: C2 AND SAT POSITIVE-CONTROL EXTENSION COMPLETE; EXTERNAL GATES CLOSED.**

Date: 2026-08-27
Base revision: `9119f0c728dd65a2f6a335bee7a3ba7d2391029b`

## 1. Purpose

This C2 checkpoint assembles the already-checked C1 role, support, mask,
intersection, and cardinality gadgets into three arm-indexed formulas. It must
prove in Lean that formula models and valid abstract packets determine one
another in both directions.

This checkpoint does not emit DIMACS, enumerate assignments, run a solver,
generate a certificate, claim a SAT survivor, or claim that any arm is empty.

## 2. Owned implementation boundary

The new Lean module is:

```text
Erdos9796Proof.P97.ATail.FrontierLiveClosure.Rigid221Card18ArmCnf
```

It imports `Rigid221Card18ClauseGadgets`. Lower layers must not import it. The
off-spine aggregate may import the completed module, while the publication
spine remains unchanged.

## 3. Formula decomposition

Every formula begins with `roleOneHotCnf`. Its ordered-pair encoding has 307
clauses per role: one positive eighteen-literal clause and 306 ordered
negative binary clauses.

The common semantic block has 19,479 clauses and contains only:

1. the source and actual-center inequalities;
2. selected-XV-row exact cardinality four;
3. `xv` and `u` membership in that row;
4. source1 and source2 nonmembership in that row;
5. all physical-role inequalities;
6. the canonical physical-mask witness clauses;
7. deleted-center-row exact cardinality four;
8. deleted-center membership in that row;
9. five deleted-center-to-physical-role inequalities in
   `u`, `v`, `xu`, `xv`, `deleted` order;
10. the deleted-row/physical-mask intersection gadget; and
11. the at-most-one bound on that derived intersection.

This order fixes the placement of the helper-only physical-mask witness block
immediately after the physical-role inequalities. The mask is later consumed
by the deleted-row intersection block.

The BI semantic extension has 39,420 clauses and contains only:

1. exact cardinality four for `uB1`, `uB2`, `xvB1`, and `xvB2`;
2. the four named nonmemberships;
3. the `uB1`/`uB2` intersection gadget and its at-most-two bound;
4. the `xvB1`/`xvB2` intersection gadget and its at-most-two bound; and
5. the four blocker-center inequalities.

Each crossed semantic extension has 28,477 clauses and contains only:

1. exact cardinality four for `K1`, `K2`, and `BO`;
2. deleted-role nonmembership in all three supports;
3. retained-role membership in all three supports;
4. source1 membership in `K1` and source2 membership in `K2`;
5. the five retained incidence-signal gadgets in their frozen order; and
6. one five-negative-literal clause requiring at least one incidence false.

U uses `(deleted, retained) = (u, xv)`. XV uses
`(deleted, retained) = (xv, u)`. They may share helpers but remain separate
`SearchArm` values and separately reducible formulas.

## 4. Exact clause counts

| Component | BI | U | XV |
| --- | ---: | ---: | ---: |
| Role one-hot | 3,070 | 3,377 | 3,377 |
| Common semantics | 19,479 | 19,479 | 19,479 |
| Arm semantics | 39,420 | 28,477 | 28,477 |
| Total | **61,969** | **51,333** | **51,333** |

Lean proves these totals from the executable definitions. The counts alone are a structural
regression gate. The later `Rigid221Card18PositiveControls` module separately proves that every v1
arm formula has a satisfying assignment.

## 5. Required kernel correspondence

The completed module exposes the following proof boundary, with the
packet validity predicate tied to `PacketOfArm.toAbstractPacket`:

```lean
valid_extends_to_model
model_decodes_to_valid
armCnf_sat_iff
```

The first theorem chooses `encodeArm p` and retains base agreement. The second
uses `baseWellFormed`, `decodeBase`, and `encode_decode_on_base` to return a
valid decoded packet with base agreement. The public theorem retains an
explicit existential assignment because `Std.Sat.CNF.Sat` is
assignment-indexed in this Lean toolchain.

No one-way clause soundness theorem, count receipt, finite computation, or
external model check can replace these two kernel directions.

## 6. Trust and executability gate

The implementation must contain no `sorry`, custom axiom, `unsafe`, `partial`,
`implemented_by`, `native_decide`, executable choice, `Finset.toList`, external
implementation hook, DIMACS path, assignment enumerator, certificate reader,
or solver invocation.

Before publication it requires:

- focused `lake-build` checks and a normal aggregate build;
- exact formula-length proofs for all three arms;
- declaration-level `#print axioms` review of the public correspondence;
- generated-IR review of executable definitions;
- independent semantic review;
- refreshed proof-blueprint output; and
- exact-path staged hygiene with no foreign staged path.

### Verification evidence on 2026-08-27

- The governed runner passed Ruff and all seven focused suites: 348 tests in
  30.58 seconds. Its eleven-import aggregate replay completed 11,039 Lean jobs.
- A normal aggregate build completed 11,039 jobs and refreshed the generated
  live blueprint. The exact census delta is one additional off-spine file and
  110 indexed symbols; the off-spine sorry count remains three.
- The 2,518-file publication spine contains no `Rigid221Card18` path.
- Lean proves the common total of 19,479 clauses, BI semantic and complete
  totals of 58,899 and 61,969, and crossed semantic and complete totals of
  47,956 and 51,333 for both U and XV.
- The source scan found no forbidden mechanism and no line over 100 columns.
  Generated C IR for the new module contains no choice call, `Finset.toList`,
  native evaluation hook, DIMACS, enumerator, certificate, or solver symbol.
- Definition and theorem axiom diagnostics contain only `propext`,
  `Classical.choice`, and `Quot.sound`; the generated-IR review confirms that
  the inherited proof-level choice dependency is erased from executable code.
- Independent formula/count, API, semantic, import, and trust reviews returned
  GO with no required amendment.
- Exact-path staged hygiene passed with zero issues and no foreign staged path.
  The read-only lane report also has zero lane issues; its global block records
  only foreign shared-worktree state outside this checkpoint.
- SHA-256 values are:
  - `Rigid221Card18ArmCnf.lean`:
    `076abeb793c61aad760e92d4847911979326292962fa2307c69d9f20e2d97011`;
  - `Rigid221Card18Aggregate.lean`:
    `a42f831bb78855da36e265ab241df25ba9d31bb3651a93030b192d42f7c912db`;
  - `scripts/test-p97-rigid221-card18.sh`:
    `3c675ecbba7f2dd2e1fcf58c53c6d501c3c2df090efbc88cd3df12bf993b1881`.

## 7. Revised next gate

The explicit v1 positive controls prove that BI, U, and XV are all satisfiable under the published
finite surface. Freeze these formulas as diagnostic CEGAR seeds. Do not begin DIMACS or solver work
for unchanged v1. The next mathematical gate is a source-derived relation connecting the two
fixed-center deletion views in the live bi-survival rectangle. A v2 formula and serializer become
eligible only after that relation reaches a source-to-v2 theorem.
