# Exact-five `bv_decide` encoding profile

Date: 2026-07-21

## Final verified replay checkpoint

The fallback recommended below has now been completed in a smaller form using
Lean's verified `BVLogicalExpr` pipeline directly, without importing Z3's
opaque Tseitin variables.

`VerifiedPass5Direct.lean` rebuilds the exact 1,899-assertion pass-five source
core.  Its generated CNF has 33,612 variables and 98,162 clauses.  CaDiCaL was
run with factorization disabled so that the LRAT certificate refers only to
the variables in Lean's emitted CNF:

```bash
cadical --factor=false --lrat --no-binary \
  verified-pass5-direct.cnf verified-pass5-direct-cadical.lrat
```

Lean proves `directExpr_unsat` from that certificate in about five seconds.
`VerifiedPass5DirectIngress.lean` constructs the exact 191-entry packed source
assignment, proves 30 chunkwise evaluation bridges, and exports
`false_of_directSource_flat`.  The full wrapper compiles with warnings as
errors in about 125 seconds.  Both public endpoints have exactly the expected
native checker trust boundary:

```text
propext, Classical.choice, Lean.ofReduceBool, Lean.trustCompiler, Quot.sound
```

There is no `sorryAx`.  The geometric/source composition is now completed in
`../exact5-card13-cnf-ingress-audit/DirectSourceExactFiveCoordinator.lean` for
both asymmetric spoke orientations.  This closes the card-13, same-radius,
asymmetric exact-five leaf in scratch; it does not close the distinct-radius,
`allRowsOneHit`, or card-at-least-14 siblings.  The profiling discussion below
is retained as the audit trail explaining why the original monolithic
`bv_decide` proof shape was abandoned.

The reproducible proof payload is pinned by these SHA-256 digests:

```text
verified-pass5-direct.cnf
  03029e0f27e1a4632954a16809de6cd5c8b2ef543964b5a9de59419294dcecd0
verified-pass5-direct-cadical.lrat
  2560291b033bf198152325b237fd89883ed069c801d5fdffe4f55f003116c01b
direct.source-core.pass5.json
  c16051c37a9a8e5dd169a7662328b8992219c998a2f16cc225dc2e1b1e3506d6
```

## Result

The pseudo-Boolean translation is **not the current aggregate replay
bottleneck**.

The current minimized direct source core
`direct.source-core.pass5.json` has 1,899 assertions:

- 1,662 guarded rank/Kalmanson relations;
- 67 direct bit-vector order constraints;
- 23 unit-weight pseudo-Boolean constraints:
  - 11 exact-cardinality constraints;
  - 10 at-most constraints;
  - 2 at-least constraints.

Thus pseudo-Boolean constraints are 1.21% of the current source core, while the
guarded rank/Kalmanson family alone is 87.52%.

More decisively, the current aggregate Lean replay ran for more than eight
minutes without emitting the first `trace.Meta.Tactic.bv` line.  The trace line
is emitted when `bv_decide` starts preprocessing.  The aggregate therefore
spends its time before bitblasting, CNF conversion, and CaDiCaL.  Its explicit

```lean
unfold directCoreAntecedent
unfold direct000 ... direct029
```

is the immediate bottleneck.

## Pseudo-Boolean replacement

`profile_pb_translation.py` implements the standard unary sequential threshold
circuit

```text
ge(i,j) = ge(i-1,j) OR (x_i AND ge(i-1,j-1))
```

and emits:

- `atLeast k` as `ge(n,k)`;
- `atMost k` as `NOT ge(n,k+1)`;
- `exactly k` as `ge(n,k) AND NOT ge(n,k+1)`.

The circuit has `O(nk)` Boolean gates and does not route cardinality through a
chain of four-bit additions.

### Semantic validation

The Python checker exhaustively compared all three relations with ordinary
Boolean counting for every assignment through arity 10 and every bound through
`n + 1`: 67,584 relation instances passed.

`PBTranslationSmoke.lean` separately proves, for every `x : BitVec 13`, that
the old four-bit-adder exact-four predicate equals the unary predicate.  It also
checks an exact-four/five-fixed-input contradiction through both encodings.
The file compiles in about four seconds including imports.  Axiom closure is:

```text
adder_eq_unary:
  propext, Classical.choice, Lean.ofReduceBool, Lean.trustCompiler, Quot.sound
adder_fixedFive_false:
  propext, Classical.choice, Lean.ofReduceBool, Lean.trustCompiler, Quot.sound
unary_fixedFive_false:
  propext, Quot.sound
```

The last theorem is discharged during preprocessing, so it does not inherit the
native SAT/compiler boundary.

With tracing enabled during the A/B run:

- adder-versus-unary equivalence: 574 AIG nodes;
- adder exact-four plus five fixed true bits: 311 AIG nodes;
- unary exact-four plus five fixed true bits: solved during preprocessing, no
  AIG or SAT call.

This is a useful local encoding improvement, but replacing 23 constraints
cannot repair a phase that has not yet entered `bv_decide`.

## Proof-shape experiments

`generate_staged_coordinator.py` produces a coordinator with one chunk equality
per hypothesis and unfolds each hypothesis separately.  A one-chunk control
reached `bv_decide` in 4.2 seconds and produced a 4,511-node AIG.  The full
30-chunk coordinator still failed to reach the first trace line within several
minutes and was stopped.  Moving the same 1,899 source assertions into 1,899
flat theorem hypotheses also failed to reach the first trace line within the
test budget.  Merely moving the expansion from one tactic invocation into many
proof-producing elaboration steps therefore does not solve the problem.

## Recommended replay architecture

The next replay experiment should avoid proof-producing source expansion:

1. emit the generated Boolean fragments as transparent `abbrev`s, or emit the
   normalized Boolean expression directly in the theorem so `bv_decide` sees it
   by definitional reduction rather than an `unfold` proof;
2. retain the 23-constraint unary PB translation as an optional local
   simplification, but profile the 1,662 guarded rank constraints first;
3. if source-level elaboration still dominates, replay the already-checked raw
   CNF/LRAT through Lean's generic `Std.Tactic.BVDecide.LRAT` checker and prove a
   separate, explicit source-to-CNF soundness bridge.

The last option is not automatically closed by the existing DRAT certificate:
the certificate proves the external CNF UNSAT, while the missing formal layer is
the correspondence between the exact-five source assertions and that CNF.

## Reproduction

```bash
UV_CACHE_DIR=/tmp/uv-cache uv run --no-project python \
  scratch/atail-force/exact5-bv-encoding-profile/profile_pb_translation.py \
  --core scratch/atail-force/exact5-card13-same-radius-terminal/direct.source-core.pass5.json \
  --max-smoke-arity 10

cd lean
lake env lean -Dprofiler=true \
  ../scratch/atail-force/exact5-bv-encoding-profile/PBTranslationSmoke.lean
```

The direct single-file Lean command is a profiling-only exception; it does not
replace the project build gate.

## Raw LRAT fallback

`raw-lrat/RawLRATSmoke.lean` now checks the complete raw-certificate shape on
the direct CNF

```text
p cnf 1 2
1 0
-1 0
```

with the single LRAT step `3 0 1 2 0`.  `drat-trim` reports `s VERIFIED`, and
Lean parses the included LRAT text and
`Std.Tactic.BVDecide.Reflect.verifyCert_correct` proves the explicitly defined
mathematical CNF unsatisfiable.  The tiny replay theorem has the expected native checker trust
boundary:

```text
tinyCnf_unsat:
  propext, Classical.choice, Lean.ofReduceBool, Lean.trustCompiler, Quot.sound
```

The semantic transfer theorem itself is source-clean:

```lean
def SourceToCnfSound
    {Source : Type} (source : Source → Bool) (cnf : Std.Sat.CNF Nat) : Prop :=
  ∀ s, source s = true →
    ∃ assignment : Nat → Bool, cnf.eval assignment = true

theorem source_eq_false_of_cnf_unsat
    (hsound : SourceToCnfSound source cnf)
    (hunsat : cnf.Unsat) (s : Source) :
    source s = false
```

`source_eq_false_of_cnf_unsat` has no axioms.  Existential extension is the
minimal correct interface: a fixed assignment function is unnecessarily
strong because a Tseitin CNF contains auxiliary variables, and the reverse
CNF-to-source direction is not needed to derive a contradiction from CNF
UNSAT.

### Exact-five specialization

For the current packed source types, the bridge needed by a raw certificate is
exactly the following one-way statement (schematically):

```lean
∀ rows blockers shell q w b1 ranks,
  sourceAntecedent rows blockers shell q w b1 ranks = true →
  ∃ assignment : Nat → Bool,
    exactFiveCnf.eval assignment = true
```

No geometric fields belong in this theorem.  Geometry first constructs the
packed source values and proves `sourceAntecedent = true`; this bridge then
transfers that value to the CNF; `LRAT.check_sound` supplies `exactFiveCnf.Unsat`.

### Decisive artifact mismatch

The saved `direct.cnf` / `direct.core.cnf` / `direct.lrat` bundle is not yet a
formal implementation of that interface:

- `direct.cnf` is the Z3 tactic image of all 45,878 source assertions, while
  `directCoreAntecedent` is generated from the later 1,899-assertion pass-5
  source core.  The full-formula LRAT certificate therefore does not prove the
  minimized source predicate unsatisfiable.
- The Z3 pipeline is `simplify`, `propagate-values`, `elim-term-ite`,
  `solve-eqs`, `lia2card`, `card2bv`, `bit-blast`, `tseitin-cnf`.  Its DIMACS
  comments name all 53,279 variables, but 39,228 are opaque `k!` auxiliaries;
  the artifact does not record their defining subexpressions or a proof trace
  for the source-to-CNF transformation.
- `direct.core.cnf` is a 31,792-clause subset of that full bit-blast.  Any
  assignment satisfying the full bit-blast also satisfies the clause core,
  but the missing full bit-blast extension theorem is still required.

Thus raw LRAT replay is mechanically viable, but the saved Z3 certificate
cannot by itself close the Lean source theorem.  Calling the Z3 tactic export
"semantics preserving" remains an external-tool assertion, not the required
Lean theorem.

### Recommended construction

Regenerate the 1,899-assertion pass-5 core through a small deterministic,
verified Boolean-expression-to-CNF compiler rather than attempting to certify
Z3's multi-tactic pipeline.  The proof boundary should be:

1. a generated Boolean AST over the 1,139 packed source bits;
2. a structural theorem that evaluation of that AST agrees with the compact
   source predicate;
3. a proved Tseitin extension theorem supplying `SourceToCnfSound`;
4. a byte-stable emitted CNF, a fresh CaDiCaL DRAT, `drat-trim` LRAT, and a
   Lean `LRAT.check_sound` replay.

This isolates the large computation in data and the native LRAT checker.  It
also avoids the currently failing proof-producing unfold of 1,899 source
assertions.  Reusing the saved full-formula CNF is possible only by proving the
same extension theorem for all 45,878 assertions, which is strictly more work.

Raw-smoke reproduction:

```bash
drat-trim \
  scratch/atail-force/exact5-bv-encoding-profile/raw-lrat/tiny.cnf \
  scratch/atail-force/exact5-bv-encoding-profile/raw-lrat/tiny.drat \
  -L scratch/atail-force/exact5-bv-encoding-profile/raw-lrat/tiny.lrat

cd lean
lake env lean \
  ../scratch/atail-force/exact5-bv-encoding-profile/raw-lrat/RawLRATSmoke.lean
```
