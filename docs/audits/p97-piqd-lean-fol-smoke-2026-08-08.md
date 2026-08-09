# P97 PIQD Lean-FOL live smoke

Date: 2026-08-08

Status: live integration smoke; no P97 theorem-closure claim.

## Outcome

PIQD's `lean_fol` encoder and small SAT-model decoder work end to end on the
installed daemon. The first live UNSAT job also exposed one genuine PIQD bug:
the generated Lean certificate uses the Lean 4.29 `Std.Sat.CNF` constructor and
does not compile under this repository's pinned Lean 4.27 toolchain.

This is not yet Lean-source-to-SAT integration. The two Lean statements were
checked locally, but their matching `LeanSatIr` inputs were hand-authored.
PIQD's planned Phase-5 Lean exporter is absent, so the IR `source.module` and
`source.decl` fields are metadata rather than an authenticated translation.

The proof-blueprint anchor remained
`Problem97.ATailFrontierLiveClosure.false_of_criticalPairFrontier` throughout.

## Resource and trust boundary

Both jobs ran serially on the existing daemon. The UNSAT solve took 3 ms and
the SAT solve took 2 ms. No broad exact-12 translation or campaign was
launched.

The checked scratch statements and all live artifacts are preserved under
`scratch/p97-piqd-lean-fol-smoke-2026-08-08-v1/`. They are integration
fixtures, not production P97 declarations.

## UNSAT and exact raw-DIMACS replay

The locally checked statement says that every binary operation on `Fin 1` is
commutative. Its hand-authored `Prove` IR produced this alg7 job:

- lean-FOL job: `78032d33-8fd9-442a-8551-cf69109cf12c`;
- encoder: `piqd-encoder/0.1.0+alg7`;
- stored CNF: 3 variables, 6 clauses, 178 bytes;
- CNF SHA-256:
  `56c2c5d03574e86f173efff0897c63b8abddea0b2562741b78de49fc5633fcc5`;
- result: `UNSAT`, 3 ms;
- LRAT: 10 bytes, SHA-256
  `a5b81e42c8304a84b7b8b897301cac5db9feaed0b2a9b8a8e0dd354dbf45433e`.

The exact 178 stored bytes were then submitted through PIQD's raw-DIMACS lane
with a manifest that disclaims Lean-source authentication and P97 closure:

- raw job: `b8f3e3dd-0d4e-4c29-bc89-e0f987bc3de8`;
- result: `UNSAT`, 3 ms;
- retrieved CNF: byte-identical to the encoder output;
- retrieved LRAT: byte-identical to the lean-FOL job's LRAT.

This establishes encoder/raw-lane agreement for the tiny formula. It does not
authenticate the hand-written IR against the Lean statement.

## Lean certificate defect and bounded workaround

`piqc lean cert 78032d33-8fd9-442a-8551-cf69109cf12c` emitted a 1,235-byte
certificate with SHA-256
`d5792fb5cd0d949739249edd7e2ebd4c1fda09bf425d0f47133b6865159b25cf`.
Lean 4.27 rejects its generated `parseDimacs` result:

```text
invalid {...} notation, structure type expected
  List (CNF.Clause Nat)
```

The emitter unconditionally generates the Lean 4.29 structure form
`{ clauses := (body.map parseDimacsClause).toArray }`. Lean 4.27 and 4.28 use
`CNF` as a list alias. Replacing only that expression with
`body.map parseDimacsClause` makes the certificate compile in this repository.
The checked compatibility copy depends on
`propext`, `Classical.choice`, `Lean.ofReduceBool`, `Lean.trustCompiler`, and
`Quot.sound`, with no `sorryAx`; its `native_decide` proof therefore retains
the expected compiler-trust boundary.

This bug is tracked as `PIQD-LEAN-001` in
`docs/audits/piqd-integration-bugs-2026-08-07.md` and was reported in nthdegree
conversation messages 3756-3757. The durable fix is a toolchain-aware emitter
plus compile tests for every supported `Std.Sat.CNF` representation.

## SAT model-decoding companion

The locally checked companion statement exhibits a commutative binary
operation on `Fin 2`. Its hand-authored `FindModel` IR produced:

- job: `3de06d39-282f-4352-9d20-3f6c83b71af8`;
- stored CNF: 28 variables, 67 clauses, 741 bytes;
- CNF SHA-256:
  `b89c5de9bb80e16edd10a450fcc2df245b03a87218244d8611159a78e0c98769`;
- result: `SAT`, 2 ms;
- decoded-model SHA-256:
  `b22ddae3eed3bebf9fc012db9830a74502fc2ef3f4f268ad018d2492326ed849`.

An independent JSON check required exactly four distinct input pairs, values
in `Fin 2`, and equal outputs for `(0,1)` and `(1,0)`. It passed. This validates
the small-model decode path, not completeness for an exact-12-sized model; the
P97 adapter must continue to reject any incomplete assignment.

## Comparison with the live P97 exact-12 lane

The smallest source-bound baseline remains normalized-v14 cell 0:

- 42,710 variables and 369,355 clauses;
- 5,128,454-byte DIMACS with SHA-256
  `cfc268f2915ff31eaf24a66a036e41e81f93aca0967e88c1b4a4158eb67a379`;
- current classification: finite local `SAT_WITNESS_REPLAYED` evidence;
- variable provenance: 50 named blockers plus 42,660 opaque variables.

PIQD has no exact12/Rigid221 encoder input. The correct current path for those
exact bytes is the raw-DIMACS endpoint. Translating all 369,355 clauses into
hand-written Lean-FOL atoms would create a new encoding and variable map, not
an apples-to-apples validation of the existing producer.

## Remedy order

1. Fix `PIQD-LEAN-001` with a declared target Lean/Std version and compilation
   regressions, rather than silently rewriting certificates downstream.
2. Implement the Lean Phase-5 exporter so source, declaration, elaborated IR,
   and translation hash are machine-bound; add a Lean theorem relating the
   exported formula to the source proposition.
3. Keep current exact-12 jobs on raw DIMACS and preserve the existing source
   job, compiler manifest, variable map, and model-completeness checks.
4. Before using `lean-model` at exact-12 scale, test a large model and require
   complete variable/table coverage; the tiny smoke is not evidence for that
   scale.
5. Treat PIQD certificates as artifacts awaiting independent Lean compilation,
   never as theorem closure merely because the daemon returned `UNSAT` or a
   `.lean` file.
