# Second-apex constructor split

Date: 2026-07-16

Status: **SOURCE-CLEAN EXHAUSTIVE CONSTRUCTOR REDUCTION KERNEL CHECKED. THE
HOMOGENEOUS CONSTRUCTOR PAIRS CLOSE; THE ONLY NON-REROUTED RESIDUALS ARE THE
TWO MIXED COMPLEMENTARY-`{s,t}` PACKETS.**

This lane owns only:

```text
scratch/atail-force/r-f2-directed-original-q-row/
  second-apex-constructor-split/
```

No production Lean, shared closure document, proof-blueprint state, protected
file, or sibling scratch lane was changed.

## Mandatory theorem-bank preflight

Before adding the constructor reduction, the audit checked the required
registries:

- `docs/general-n-certificate-bank-mining-2026-07-09.md`;
- `certificates/p97_rvol_general_n_mining.{md,json}`;
- `certificates/erdos97_legacy_general_n_mining.{md,json}`; and
- `certificates/erdos_general_theorem_p97_mining.{md,json}`.

Focused Lean-index queries included:

```text
two selected four-point equidistance rows centered in strict opposite cap
  sharing two support points outside the cap
generated successor q deleted q critical coherent source support false
false_of_*outside*pair*: strict opposite cap shared outside pair selected rows
three selected four classes centers x y apex supports ... contradiction
```

The load-bearing existing results are:

- `false_of_two_strictOppCap2_rows_common_outside_pair`;
- `false_of_qCritical_coherentSource_mem_support`;
- `false_of_qCritical_qCritical_equalSource_off_oppCap2`;
- `false_of_equilateralResidual_of_common_raw_middle_point`; and
- the q-deleted extra-point lemmas in
  `SecondApexEquilateralTerminal.lean`.

No additional finite metric contradiction was derived.

## Exact input

The theorem

```lean
secondApexConstructorReduction
```

consumes exactly the data stored by the remaining reduced-source constructor:

```lean
Q.at_x.source = Q.at_y.source
Q.generated.toTwoContinuationRows.EquilateralResidual
Q.at_x.source = S.oppApex2
```

The companion theorem

```lean
secondApexConstructorReduction_of_reducedSourceSplit
```

records the direct handoff from an actual
`ReducedSourceSplit.equalSource_atSecondApex` constructor.

## Exact exhaustive output

`SecondApexConstructorReduction Q` has four constructors:

1. `rerouteAtX`: the raw row at `x` contains a point which is off the live
   four-set, outside the physical middle row, and different from
   `S.oppApex2`;
2. `rerouteAtY`: the symmetric reroute;
3. `qDeleted_qCritical`: the `x`-row is q-deleted, the `y`-row is q-critical,
   and their two non-apex support-only points form exactly `{s,t}`; or
4. `qCritical_qDeleted`: the symmetric mixed packet.

Each reroute structure contains exactly the hypotheses of
`nonempty_outsideMiddleSuccessor`, so it immediately constructs a new
source-faithful common-deletion successor whose source differs from the
equal-source apex. It is not merely a support witness.

Each mixed packet additionally retains:

- the exact q-deleted and q-critical rows and their constructor equalities;
- coherent-source membership in the q-deleted support;
- coherent-source omission from the q-critical support;
- raw membership of both support-only points;
- both points off the live four-set and different from the second apex; and
- equality of their unordered pair with `{s,t}`.

This is the exact surviving local residual. A later consumer may choose an
orientation (`s` on the q-deleted side and `t` on the q-critical side, or the
reverse), but it must not re-mine a common support-only point: that antecedent
is already contradictory.

## Why the homogeneous constructor pairs close

### q-deleted / q-deleted

Every exact row has two off-live raw support points. Therefore each side
either produces a non-apex outside-middle reroute or has a non-apex off-live
point in `{s,t}`.

The q-deleted fourth-slot theorem supplies a second non-apex point outside the
physical middle row. If there is no reroute, the live-role classifier forces
that point to be the retained coherent source. Thus, with no reroute on either
side, both q-deleted selected four-classes contain

```text
S.oppApex2 and R.sourcePair.x.
```

Both points are outside `oppCap2`, they are distinct because the apex is off
the live four-set while the coherent source is in it, and both row centers are
distinct strict-`oppCap2` points. The checked ordered-cap outside-pair theorem
gives `False`.

### q-critical / q-critical

The two completed q-critical selected four-classes share the original deleted
point `q` and the equal successor source `S.oppApex2`. Both are outside
`oppCap2`. The existing
`false_of_qCritical_qCritical_equalSource_off_oppCap2` theorem closes this
constructor pair directly.

## Why the mixed residual is complementary

Assume neither side reroutes. The two-off-live bound gives one non-apex
off-live raw support point on each side. Since it is not outside the physical
middle row, the exact middle-row decomposition places it in `{s,t}`.

If the two points agree, they are a common raw generated-support point in the
physical second-apex row. The banked selected-class tetrahedron adapter gives
`False`. Hence the points are distinct members of a two-element set, so their
unordered pair is exactly `{s,t}`.

On the q-deleted side, absence of a reroute also forces coherent-source
membership by the fourth-slot lemma. On the q-critical side that incidence is
impossible by `false_of_qCritical_coherentSource_mem_support`. No current
checked theorem consumes the resulting complementary orientation, so the
mixed packets are retained rather than presented as closed.

## Proof impact

This reduction removes two of the four exact generated-constructor
combinations from `equalSource_atSecondApex` and turns the other two into one
symmetric mathematical residual:

```text
q-deleted row:  coherent source + one of {s,t}
q-critical row: coherent source omitted + the other of {s,t}
both rows:      common second apex, opposite-center equilateral incidences
```

It does **not** close a production `sorry`. The next load-bearing theorem for
this lane is a direct eliminator for that mixed complementary-support packet,
or a parent-level result which rules it out before this constructor split.

## Focused validation

Validated from `lean/` with the current scratch olean set:

```bash
env LEAN_PATH="/private/tmp/p97-second-apex-constructor-split-oleans:\
$(find /private/tmp -maxdepth 2 -type f -name '*.olean' \
  -exec dirname {} \; | sort -u | paste -sd: -):\
./.lake/build/lib/lean" \
  lake env lean -R .. -M 16384 \
  -o /private/tmp/p97-second-apex-constructor-split-oleans/\
SecondApexConstructorSplit.olean \
  ../scratch/atail-force/r-f2-directed-original-q-row/\
second-apex-constructor-split/SecondApexConstructorSplit.lean
```

Exit status: `0`.

Both printed theorem closures are exactly:

```text
propext
Classical.choice
Quot.sound
```

The Lean source contains no `sorry`, `admit`, declared axiom,
`native_decide`, `unsafe`, heartbeat override, or lint suppression. No full
Lake build was run.
