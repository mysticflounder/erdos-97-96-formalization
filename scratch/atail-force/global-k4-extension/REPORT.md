# Global K4 extension of the cap-local ATAIL model

Date: 2026-07-14

Status: **ROW-INCIDENCE EXTENSION SAT; ONE METRIC COMPLETION EXACT-CAS
INFEASIBLE; BLOCKER-ALIGNMENT CONSEQUENCE KERNEL-CHECKED; LIVE PRODUCER
OPEN.**

## Verdict

The exact 14-point cap-local carrier cannot itself be promoted unchanged to
the live global hypotheses:

- K4 fails at ten of its fourteen centers; and
- exact deletion blockers do not exist for sources `J` and `t1`.

This coordinate-specific failure is not the reusable obstruction.  At the
row-incidence/cyclic-cap level, the same fourteen labels admit one compatible
selected four-row at every center and an abstract deletion-critical blocker
for every source.  The completion retains the two relevant arrows

```text
E -> D
D -> t1
```

and the reciprocal cross nonmemberships from the cap-local packet.  It passes
the current finite-shadow row verifier.  Thus all-center K4 plus total
criticality does **not** close the packet as a consequence of the currently
encoded incidence and cap-order constraints alone.

The first obstruction observed after adding metric realizability is stronger.
For this concrete row completion, the 43 squared-distance equalities generate
the unit ideal over `QQ` after the safe normalization `O=(0,0)`, `A=(1,0)`.
A retained five-row subsystem, at centers

```text
O, D, E, I, F
```

with 16 equalities also generates the unit ideal.  Singular and msolve agree,
and msolve agrees in forward and reverse variable orders.  This is an exact
CAS nonrealizability result for **one** completion, not an exhaustive theorem
about every global row choice and not a replayed Lean certificate.

The reusable live target is therefore not another bare global-K4 or
total-criticality lemma.  It is a prescribed deletion-criticality / row
extension theorem that couples one source to one off-frontier center.

## Uniform producer target from the current 23 survivors

The pinned current U1 role audit has the preferred split

| cases | missing equality | selected-row form |
|---:|---|---|
| 5 | `h4 : dist d c = dist d f` | row at `d` contains `c` and omits `f` |
| 12 | `h5 : dist f a = dist f d` | row at `f` contains `a` and omits `d` |
| 6 | nominally `h5+h7` | the same `h5` row extension is available |

The separately pinned `current-marco-cores` replay shows that adding only the
displayed `h4` or `h5` equality reaches an already formalized EqualityCore in
all 23 shadows.  In particular, `h5` alone closes the six nominal `h5+h7`
shadows; no uniform `h7` producer is needed.

The precise choice-invariant geometric statements that add those edges are:

```text
h4 branch:
  ¬ HasNEquidistantPointsAt 4 (A.erase f) d
  -> dist d c = dist d f

h5 branch:
  ¬ HasNEquidistantPointsAt 4 (A.erase d) f
  -> dist f a = dist f d
```

Global K4 then supplies a selected row at the prescribed center, and deletion
criticality forces the deleted source into that row.  Equivalently, for a
chosen critical-shell system these are the alignments

```text
h4 branch: centerAt(f) = d
h5 branch: centerAt(d) = f.
```

The deletion-critical formulation is preferable: it is independent of the
arbitrary selector and permits an adaptive `CriticalShellSystem.overrideAt`.

## Kernel-checked coupling semantics

`BlockerAlignment.lean` checks both the selector-dependent alignment bridge and
the strictly weaker choice-invariant adapter.  For any critical-shell system
`H`, source, center, and independently selected global row `K` at that center:

```text
H.centerAt(source) = center
  => K.support = H's critical support for source
  => source is in K.support.
```

If `anchor` is already in `K.support`, it follows that

```text
dist center anchor = dist center source.
```

More directly,
`source_mem_selected_support_of_prescribed_deletion_criticality` proves that

```text
¬ HasNEquidistantPointsAt 4 (A.erase source) center
```

forces `source ∈ K.support`: otherwise the four members of `K` survive the
deletion.  The wrappers
`h4_of_prescribed_deletion_criticality` and
`h5_of_prescribed_deletion_criticality` are the two formulas displayed in the
previous section.  They mention no `CriticalShellSystem`, so arbitrary
selector provenance disappears completely.

These are the exact h4/h5 edge-completion semantics.  All six printed scratch
theorems kernel-check with axiom closure exactly

```text
propext, Classical.choice, Quot.sound
```

and use no `sorry`, `admit`, named axiom, or `native_decide`.

There is one implementation interface caveat only for the selector-dependent
route.  If K-A wants to identify a fresh global row with a row already stored
in its `rows` argument, the current signature retains only
`Nonempty (CriticalShellSystem D.A)` and forgets that the outer wrapper built
`rows` from the same witness.  The choice-invariant h4/h5 wrappers avoid this
issue: they need only the prescribed no-q-free fact and the selected global
row.

## Why the present cap/MEC/history surface does not force alignment

The required theorem-bank registries and indexed Lean corpus were searched
before treating this as a new producer.  No existing theorem forces either
prescribed deletion-criticality statement.

The negative boundary is consistent across the current scratch results:

- adaptive blocker--Moser-apex alignment is available **after** deletion at
  that apex is known to destroy K4, but it does not prove that antecedent;
- blocker cap localization gives only “surplus apex or a cap interior,” and
  the cap-fiber bounds are below the card-12 forcing threshold;
- the preferred h4/h5 roles vary across caps, so there is no fixed cap-label
  producer in the 23-survivor bank;
- descent history proves that every alternate ambient K4 radius contains a
  whole erased history pair, but the current history and
  `CriticalShellSystem` interfaces do not place that pair in a second
  critical row; and
- the finite row completion in this directory explicitly realizes global
  rows and a total abstract blocker map while avoiding any claimed generic
selector alignment.

At the type/signature level this is decisive.  `PairedErasureHistory` stores
only an involutive erased-point mate and equality of the two radii about the
single descent center.  Its strongest theorem returns the pair in an ambient
selected class about that same center.  For the useful U1 matches the pair is
`{c,f}` on h4 or `{a,d}` on h5, while closure needs deletion failure at the
new center `d` or `f`, respectively.  No history field mentions
`HasNEquidistantPointsAt` after either deletion at that second center.  Thus
terminal/descent history, as currently represented, supplies neither
prescribed criticality adapter.

Therefore the first honest missing theorem is:

> For the preferred roles in every live K-A branch, one of the two prescribed
> deletions destroys K4 at the opposite role center (h4 or h5), or an
> equivalent realizability-sensitive theorem forces the same off-frontier row
> extension.

A history-based route would have to retain more than a co-radial erased pair:
it must record or derive that deletion of one endpoint killed K4 at the other
role center.  That is exactly the missing history-pair-to-off-frontier-row
field.

## Exact finite and metric audit

`analyze.py` pins and re-hashes:

- the exact cap-local model checker;
- its exact 14-point checkpoint; and
- the current 23-survivor U1 checkpoint.

It then independently reconstructs the fixed-carrier radius profiles,
verifies the 14-row incidence completion, validates the total abstract blocker
map, and recomputes the U1 preferred-role split.  Its semantic smoke gates
include both a known compatible row pair and a deliberately incompatible
same-center exact-row pair.

The metric stage also gates both CAS engines on a known unit ideal and a known
nonunit ideal before testing the completion.  The machine-readable result is
`checkpoint.json`.  Its epistemic ledger records the following omissions:

- no exhaustive enumeration of alternative global-row completions;
- no Euclidean realization claim for the finite-shadow witness;
- no ambient exactness/no-q-free claim for unencoded radius classes;
- no replayed Nullstellensatz certificate in Lean; and
- no live theorem selecting the retained five-row metric subsystem.

Accordingly, this audit does **not** close K-A-PAIR.  It rules out an
incidence-only closure claim, validates the alignment-to-equality bridge, and
localizes the remaining producer to prescribed deletion criticality or an
equivalent metric-realizability coupling.

## Validation

From the repository root:

```bash
UV_CACHE_DIR=/tmp/uv-cache-erdos9796 uv run python \
  scratch/atail-force/global-k4-extension/analyze.py --check
```

Result:

```text
PASS: exact local replay, shadow smokes, and dual-CAS checks match checkpoint
```

From `lean/`:

```bash
lake env lean -M 8192 \
  ../scratch/atail-force/global-k4-extension/BlockerAlignment.lean
```

The direct Lean check exits zero and prints only the three standard axioms
listed above for all six declarations.
