# Second-apex equilateral terminal audit

Date: 2026-07-16

Status: **SOURCE-CLEAN STRONGEST REDUCTION KERNEL CHECKED; THE
`equalSource_atSecondApex` ARM IS STILL OPEN, INCLUDING THE SUBFAMILY WITH AT
LEAST ONE Q-DELETED GENERATED ROW.**

Superseding checkpoint: `../second-apex-constructor-split/` now exhausts the
four exact generated-constructor pairs. The q-deleted/q-deleted and
q-critical/q-critical pairs close; only the two mixed complementary-`{s,t}`
packets survive without a source-faithful outside-middle reroute. The
coherent-source incidence identified below is therefore no longer the whole
branch target.

This lane owns only:

```text
scratch/atail-force/r-f2-directed-original-q-row/
  second-apex-equilateral-terminal/
```

No production source, closure document, proof-blueprint state, or sibling
scratch lane was changed.

## Exact input surface

The remaining constructor of
`OriginalQGeneratedSuccessorPair.SourceSplit` stores

```lean
source_eq : Q.at_x.source = Q.at_y.source
equilateral : Q.generated.toTwoContinuationRows.EquilateralResidual
source_eq_secondApex : Q.at_x.source = S.oppApex2
```

The equilateral residual says that the two generated centers `x,y` and the
physical second apex form an equilateral triangle, and that the full
generated row at each center contains the other center and the second apex.
The physical row centered at the second apex is

```lean
(alignedSharedRowPacket X hcenter).B₂ = {x, y, s, t}.
```

The live-center ordered-cap terminal cannot be reused: the retained second
apex is not in `S.oppCap2`.

## Mandatory bank preflight

Before proving a new incidence kernel, the audit searched all four required
registries:

- `docs/general-n-certificate-bank-mining-2026-07-09.md`;
- `certificates/p97_rvol_general_n_mining.{md,json}`;
- `certificates/erdos97_legacy_general_n_mining.{md,json}`; and
- `certificates/erdos_general_theorem_p97_mining.{md,json}`.

Focused nthdegree Lean-index queries covered:

```text
q-deleted exact four class equilateral opposite point mutual row contradiction
same source second apex two generated rows equilateral residual
physical second-apex q-deleted row dangerous triple mutual incidence
*equilateral*incompatibility
```

The closest import-reachable families were the U5 equilateral opposite,
bisector, circumcenter, and outer-point kernels, the q-critical equilateral
bridge, and the selected-class tetrahedron adapter.  None consumes only the
bare three-center equilateral triangle carried by this constructor.  The
equilateral triangle itself is realizable, so treating it as a contradiction
would be unsound.

## Kernel-checked tetrahedron exclusion

`SecondApexEquilateralTerminal.lean` proves

```lean
false_of_equilateralResidual_of_common_raw_middle_point
```

If one point `c` belongs to both raw generated supports and to the physical
middle row, then the three selected classes centered at `x`, `y`, and the
second apex realize the banked planar-tetrahedron obstruction:

```text
row at x:       y, c
row at y:       x, c, secondApex
row at apex:    x, y, c
```

This gives the exact unconditional exclusion

```lean
(Gx.support ∩ Gy.support) ∩ B₂ = ∅
```

and, in particular, neither `s` nor `t` can occur in both generated raw
supports.

This is an intersection exclusion, not a complete branch terminal.  It also
shows that

```lean
∃ c ∈ {s,t}, c ∈ Gx.support ∧ c ∈ Gy.support
```

must **not** be mined as a realizable producer.  It is already a direct
closing antecedent, and the current hypotheses prove its negation.

## What q-deleted cardinality really adds

The generic checked lemma

```lean
ExactQDeletedAt.exists_support_ne_secondCenter_not_mem_middle
```

says: if a q-deleted four-row is centered at a point of the physical middle
row and contains the physical row's center, then it contains another point
outside the physical row, distinct from that center.

Applied to either generated side of the equilateral residual, this gives:

```lean
∃ z,
  z ∈ G.support ∧
  z ≠ S.oppApex2 ∧
  z ∉ B₂.
```

This genuinely uses the fourth raw-support slot.  It is unavailable for a
q-critical raw triple.

The live-role refinement is also checked.  Such an extra point satisfies

```lean
z = R.sourcePair.x ∨ z ∉ {q,t1,t2,t3}.
```

Indeed, a q-deleted support omits `q`, while `x,y` are in `B₂`; the retained
coherent source is the only live-row role left outside `B₂`.

Thus q-deleted cardinality narrows the residual to exactly two possibilities:

1. a genuinely off-live, non-apex point outside the physical row, which can
   be promoted to a second outside-middle successor; or
2. the retained coherent source belongs to the q-deleted generated support.

Neither possibility is currently a `False` theorem.  The first reroutes the
choice away from the equal-source-at-apex constructor and into the existing
distinct-source frontier.  The second is a new sharply named incidence
residual.

## Exact first missing producer

For the shortest checked q-deleted route, the first missing fact is one of
the following equivalent forms on the relevant q-deleted side:

```lean
R.sourcePair.x ∉ G.support
```

or a direct eliminator for

```lean
R.sourcePair.x ∈ G.support.
```

The exclusion form forces the checked extra point to be off-live, hence
produces a non-apex outside-middle successor.  A proof must use additional
global critical-map, cap/order, or minimality information: exact-row
cardinality and the local equilateral triangle do not decide this incidence.

This fact alone reroutes to the distinct-source frontier; a complete terminal
still needs the existing distinct-source closer.  Consequently this lane
does not claim closure of a production `sorry`.

## Relation to the proposed global deductions

The proposed obtuse-chain/monotone-distance lemma points in the same
direction as the ordered-cap injectivity already used by the live-center
terminal.  It does not place the second apex in the cap.  The strong
connectivity lemma is genuinely global and may constrain the newly exposed
extra q-deleted point, but it requires a selected witness row at every vertex;
it is not a consequence of these three local incoming rows alone.  The
equal-pair capacity bound likewise does not eliminate balanced cap sizes.

## Focused validation

The selected-class tetrahedron adapter was checked first, then the lane file
was checked from `lean/` against the current scratch olean set.  The main
single-file command was:

```bash
env LEAN_PATH="/private/tmp/p97-second-apex-equilateral-terminal-oleans:\
/private/tmp/p97-r-f2-equal-source-metric-terminal-oleans:\
$(find /private/tmp -maxdepth 2 -type f -name '*.olean' \
  -exec dirname {} \; | sort -u | paste -sd: -):\
./.lake/build/lib/lean" \
  lake env lean -R .. -M 16384 \
  -o /private/tmp/p97-second-apex-equilateral-terminal-oleans/\
SecondApexEquilateralTerminal.olean \
  ../scratch/atail-force/r-f2-directed-original-q-row/\
second-apex-equilateral-terminal/SecondApexEquilateralTerminal.lean
```

Exit status: `0`.

Every printed theorem closure is exactly:

```text
propext
Classical.choice
Quot.sound
```

The source contains no `sorry`, `admit`, declared axiom, `native_decide`,
`unsafe`, heartbeat override, or lint suppression.  No full build was run.
