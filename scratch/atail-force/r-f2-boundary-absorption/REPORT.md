# F2 q-critical boundary absorption

Date: 2026-07-16

Status: **PROVEN in Lean 4.27.0.** The q-critical no-escape residual is
impossible. The result is scratch-only and has not yet been wired into a
production consumer.

## Scope

This lane owns only:

- `scratch/atail-force/r-f2-boundary-absorption/F2BoundaryAbsorption.lean`;
- this report.

It starts from the exact generated-row split in
`F2GeneratedEscapePlacement` and preserves the actual deleted source, actual
critical blocker, named support-heavy witnesses, generated-row constructor,
and cap packet. It does not replace any of them with an anonymous row or infer
metric information from support omission.

## Theorem-bank preflight

Before proving a new contradiction, this lane checked the required registries:

- `docs/general-n-certificate-bank-mining-2026-07-09.md`;
- `certificates/p97_rvol_general_n_mining.md` and its JSON inventory;
- `certificates/erdos97_legacy_general_n_mining.md` and its JSON inventory;
- `certificates/erdos_general_theorem_p97_mining.md` and its JSON inventory.

It also ran `nthdegree docs search --lean` for q-critical generated supports,
unique dangerous-triple boundary points, actual blocker rows, and two-center
support-heavy incompatibilities.

The closest banked U5 consumers were:

- the single-row q-critical dangerous-triple intersection bounds;
- `two_triple_centers_third_common_incompatibility`;
- `two_triple_centers_adjacent_incompatibility`;
- `qcritical_exact_qcritical_chain_incompatibility`.

Those pair consumers require additional support incidences. They are not
needed here because the existing ordered-cap two-row theorem consumes the
completed generated row and the retained source's actual critical shell
directly.

## Exact no-escape normal form

Let

```text
T = (deletedCriticalSupport C).erase deleted.
```

For a q-critical generated support `K.support` centered at a named
support-heavy center, assume there is no generated point outside both `T` and
`oppCap2`. Then `nonempty_qCriticalNoEscapeBoundary` extracts a named point
`u` with all of the following source-faithful facts:

- `u ∈ K.support`;
- `u ∈ T`;
- `u ∉ oppCap2`;
- `u` is distinct from `deleted`, `N.s`, and `N.t`;
- `T \ oppCap2 = {u}`;
- `K.support \ oppCap2 = {u}`;
- `K.support ∩ T = {u}`;
- `T = {N.s, N.t, u}`;
- `deletedCriticalSupport C = {deleted, N.s, N.t, u}`;
- the two generated support points outside `T` both lie in `oppCap2`;
- `u` lies in `surplusCap` or `strictOppCap1Region`.

This is the exact boundary object that the prior split left unresolved. In
particular, the named point is not an arbitrary replacement for the retained
source's third dangerous point.

## Direct absorption

`false_of_qCritical_noEscape` completes the generated q-critical support to a
selected four-point row and compares it with the retained deleted source's
actual critical shell.

The two rows have:

- distinct centers, because the generated center belongs to the actual
  shell's support while a selected row's center is not in its own support;
- both centers in `strictSecondCap`;
- the common point `deleted`, outside `oppCap2`;
- the common point `u`, outside `oppCap2`;
- `deleted ≠ u`.

Therefore
`false_of_two_strictOppCap2_rows_common_outside_pair (rebasePacket D S)`
gives `False`. This consumes the ordered-cap/MEC packet already present in
`SurplusCapPacket`; no new raw MEC bridge or U5 pair-incidence hypothesis is
required.

Consequently:

- `qCritical_exists_genuineEscape` proves that every q-critical generated row
  at such a center contains an off-dangerous, off-`oppCap2` point;
- `ExactGeneratedAt.exists_genuineEscape` gives the same output uniformly for
  both `qDeleted` and `qCritical` constructors.

The anchored provenance/coupling layer is compatible with this result, but is
not needed for the contradiction: the theorem applies before specializing to
an anchored pair.

## Closure consequence

The q-critical boundary does not need more census mining or a new producer.
Both exact global-K4 constructors now supply a genuine cap escape:

```text
∃ y ∈ generated support,
  y ∉ deleted-source dangerous triple ∧
  y ∉ oppCap2 ∧
  (y ∈ surplusCap ∨ y ∈ strictOppCap1Region).
```

The remaining proof work is therefore downstream placement/coupling of these
genuine escape points—especially distinguishing the surplus and
strict-`oppCap1` cases and connecting them to the continuation DAG. It is not
another readjudication of the q-critical no-escape boundary.

No production `sorry` is closed merely by this scratch file; wiring the
constructor-uniform theorem into the production F2/A-TAIL consumer is the next
integration step.

## Validation

The file was checked with the repository-pinned Lean:

```text
Lean (version 4.27.0, arm64-apple-darwin24.6.0, commit
db93fe1608548721853390a10cd40580fe7d22ae, Release)
```

Validation used direct scratch imports and:

```bash
cd lean
env LEAN_PATH="<scratch dependency oleans>:$(lake env printenv LEAN_PATH)" \
  lake env lean -M 16384 -R .. \
  -o /private/tmp/p97-r-f2-boundary-absorption-oleans/F2BoundaryAbsorption.olean \
  ../scratch/atail-force/r-f2-boundary-absorption/F2BoundaryAbsorption.lean
```

The command exited successfully. All four printed declarations use only:

```text
[propext, Classical.choice, Quot.sound]
```

There is no `sorryAx`, `sorry`, `admit`, or new axiom in the Lean file.
