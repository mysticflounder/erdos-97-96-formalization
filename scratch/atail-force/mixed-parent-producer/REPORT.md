# Reverse-mixed choice-free parent producer

Date: 2026-07-14

Status: **CHOICE-FREE PRODUCER AND EXACT THREE-SHAPE RESIDUAL KERNEL-CHECKED;
FULL PARENT ELIMINATION OPEN.**

## Quantifier correction

The former target constrained
`H.selectedAt S.oppApex2` for the arbitrary `CriticalShellSystem` retained by
the outer parent.  That is stronger than the terminal needs and unstable under
`CriticalShellSystem.overrideAt`.

`MixedParentProducer.lean` replaces it with

```text
ApexCriticalShellHitCapResidual
```

which directly chooses a critical shell sourced at `S.oppApex2` after the
reverse-mixed labels are known.  The theorem

```text
false_of_reverseMixed_of_apexCriticalShellHitCapResidual
```

turns either shell hit plus its cap-dependent same-side separation into the
already checked third-bisector contradiction.  It does not use or modify the
parent's selected shell at that source.

The certified version retains the actual deletion failure.  The theorem

```text
exists_retainedSystem_shellHit_of_certified
```

proves that any certified choice-free witness can be installed into any
existing system by pointwise override.  Thus the old retained-system target
is valid as an **existence of a favorable system**, not as a property required
of every arbitrary retained system.

## Exact remaining shapes

For every critical shell `C` sourced at the common apex, the theorem

```text
apexCriticalShell_capNormalForm_of_reverseMixed
```

proves exactly one of the following non-exclusive disjuncts:

1. `C` omits both continuation centers `x,y`;
2. `C` omits `x`, hits `y`, and its center is the cap-side aligned center
   `x` or `u`;
3. `C` omits `y`, hits `x`, and its center is the cap-side aligned center
   `y` or `v`.

The supporting theorem

```text
apexCriticalShell_omits_x_or_y_of_reverseMixed
```

is choice-free: no apex critical shell can contain both `x` and `y`.  If its
center is not `u`, it is a third center on the `{y,apex}` bisector; if it is
`u`, it is a third center on the other mixed bisector.

Finally,

```text
nonempty_apexCriticalShellResidualPacket_of_reverseMixed
```

visibly consumes global `D.K4` and `hnoRem` to choose a certified apex shell
carrying this normal form.  The remaining content theorem must eliminate the
three displayed shapes using the concrete frontier and the still-unused
MEC/cap/no-`IsM44` parent data.  More arbitrary-`H` shell-hit mining is aimed
at the wrong quantifier.

## Search and regression boundary

The required current, sibling, legacy, and older-general theorem-bank
registries were searched, together with focused `nthdegree docs search
--lean` queries.  The closest reusable declarations were
`selectedFourClass_support_eq_shell`,
`selectedFourClass_support_eq_criticalShell_of_source_mem`, and the existing
q-critical U5 adapters; none eliminates all three shapes above from the full
parent hypotheses.

The current 23 fixed card-12 exact-row representatives were also enumerated
for the complete reverse-mixed row profile.  None reaches that terminal, so
they are not evidence for or against this producer and no new SAT claim is
made here.  The earlier exact `Q(sqrt(3))` regression remains the relevant
local warning that the reverse-mixed geometry and aligned blocker cases are
realizable within their stated partial abstraction.

## Epistemic status

- **PROVEN / kernel checked:** the choice-free critical-shell terminal, the
  override/existential-system adapter, omission of `x` or `y` for every apex
  critical shell, the cap-refined three-shape normal form, and existence of a
  certified normal-form shell from global K4 plus no-removability.
- **OPEN:** eliminating the both-omitted and two aligned one-hit shapes from
  the complete parent hypotheses.
- **NOT CLAIMED:** a Euclidean counterexample, a fixed-card shadow
  counterexample to the full parent, or closure of the production sorry.

Every printed endpoint has axiom closure exactly within
`propext`, `Classical.choice`, and `Quot.sound`; there is no `sorryAx`.

## Validation

From `lean/`, using the already isolated scratch dependency chain:

```bash
LEAN_PATH=/tmp/p97-mixed-parent-coupling lake env lean \
  -R .. -M 16384 \
  -o /tmp/p97-mixed-parent-coupling/MixedParentProducer.olean \
  ../scratch/atail-force/mixed-parent-producer/MixedParentProducer.lean
```

The command exits zero.  No full Lake build was run, and this lane changes no
production Lean, shared closure docs, `SurplusM44`, or unique-row files.
