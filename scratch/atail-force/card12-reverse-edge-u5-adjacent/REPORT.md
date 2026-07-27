# Card-12 reverse-edge U5 adjacent producer audit

## Result

**BLOCKED at a genuine producer implication.**

The strongest checked all-reverse constructor currently available is
`ExactFiveCycleSecondApexNormalForm.allReverseCapacity`.  It supplies

```lean
capacity : FrontierCoupledReverseOutsidePairCapacity residual
straddles :
  ∀ i : Fin residual.exactFive.cycle.period,
    Nonempty (ReverseRowCapStraddle residual.exactFive.cycle i)
```

No theorem in the required P97 banks, the indexed Lean corpora, or the current
scratch tree constructs

```lean
Nonempty (ReverseEdgeU5AdjacentTerminal residual)
```

from those two inputs.

The precise still-unproved implication is therefore

```lean
∀ (R : FrontierCoupledExactFivePhysicalCycleParentResidual H F),
  FrontierCoupledReverseOutsidePairCapacity R →
  (∀ i : Fin R.exactFive.cycle.period,
    Nonempty (ReverseRowCapStraddle R.exactFive.cycle i)) →
  Nonempty (ReverseEdgeU5AdjacentTerminal R)
```

No `sorry` version of this implication was added.

## Exact interface mismatch

`FrontierCoupledReverseOutsidePairCapacity` supplies:

- all-reverse membership, hence the two canonical q-critical rows;
- period bounds;
- injectivity of reverse-row centers and reverse outside pairs;
- cardinality two for every reverse outside pair; and
- the outside-pair capacity inequality.

`ReverseRowCapStraddle` supplies only an ordered-cap packet in which the two
adjacent cycle sources lie on opposite sides of their reverse-row blocker.

The U5 terminal additionally requires, on one edge:

1. a dangerous q-triple containing both adjacent actual blockers;
2. its center in both canonical q-erased supports; and
3. adjacency of the two canonical blocker centers.

Neither input contains a cross-row support incidence that implies any of these
three requirements.  In particular, each of the two canonical q-critical rows
cannot itself supply the requested dangerous triple: its own blocker is the
center and therefore is not in that row's positive-radius support.

## Checked source-faithful decomposition

`Card12ReverseEdgeU5Adjacent.lean` adds no obligation.  It defines
`ReverseEdgeThirdCriticalReturn`, a concrete sufficient packet selecting a
third critical shell through q whose erased support contains both blockers,
whose blocker returns to both canonical erased rows, and whose two canonical
blockers satisfy the required adjacency.

It proves:

```lean
dangerousTriple_of_mem_criticalFourShell

nonempty_reverseEdgeU5AdjacentTerminal_of_thirdCriticalReturn
  (R) (P : ReverseEdgeThirdCriticalReturn R) :
  Nonempty (ReverseEdgeU5AdjacentTerminal R)

false_of_capacity_of_thirdCriticalReturn
  (R) (capacity : FrontierCoupledReverseOutsidePairCapacity R)
  (P : ReverseEdgeThirdCriticalReturn R) : False
```

The last theorem uses `capacity.all_reverseMembership`.  No
`ReverseRowCapStraddle` field is needed after the third return exists.  Thus
cap straddling is not the missing U5 bridge; the missing ingredient is global
critical-row return/incidence.

This third-return packet is a source-faithful sufficient decomposition, not a
claim that it follows from the current normal form and not a counterexample to
the full residual.

## Bank search

The required registries were checked:

- `docs/general-n-certificate-bank-mining-2026-07-09.md`;
- `certificates/p97_rvol_general_n_mining.{md,json}`;
- `certificates/erdos97_legacy_general_n_mining.{md,json}`; and
- `certificates/erdos_general_theorem_p97_mining.{md,json}`.

Indexed Lean searches for reverse-row straddles, adjacent blockers, dangerous
triples, erased supports, and critical returns found the existing sinks but no
producer.  The closest usable sink remains
`U5QCriticalTripleClass.two_triple_centers_adjacent_incompatibility`, already
consumed by `false_of_allReverse_of_reverseEdgeU5Adjacent`.

The fixed-anchor exact rational regression in
`scratch/atail-force/strict-oppcap-cross-classifier/directed-cycle-geometry/`
still shows that physical cycle, cap order, blocker chord-bisectors, and
straddling alone permit a period-three configuration.  It is not a
`CounterexampleData` model, so it refutes only a geometry/straddle-only proof
route, not the full residual.

## Validation

Lean toolchain: `v4.27.0`.

The focused scratch elaboration passed with warnings as errors.  Its axiom
queries report exactly:

```text
propext
Classical.choice
Quot.sound
```

The new Lean file contains no `sorry`, `admit`, declared axiom,
`native_decide`, or unsafe declaration.

The full production Lake build also passed:

```text
Build completed successfully (11639 jobs).
```

Logs:

- `build-upstream.log`: focused upstream scratch module compilation;
- `build.log`: focused new-file elaboration and axiom output;
- `lake-build.log`: global `lake-build` output.

The exact focused command from `lean/` was:

```bash
env LEAN_PATH=\
../scratch/atail-force/card12-reverse-edge-u5-adjacent/olean-427:\
../scratch/atail-force/exact-five-reverse-outside-pair-producer/olean-427:\
../scratch/atail-force/exact-five-reverse-membership-closure/olean-427:\
./.lake/build/lib/lean \
  lake env lean -R .. -M 16384 -DwarningAsError=true \
  ../scratch/atail-force/card12-reverse-edge-u5-adjacent/Card12ReverseEdgeU5Adjacent.lean
```

The global build was:

```bash
LAKE_BUILD_NO_REFRESH=1 lake-build
```

No production file was edited.
