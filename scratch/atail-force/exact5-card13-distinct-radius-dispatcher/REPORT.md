# Exact-five card-13 distinct-radius dispatcher

Date: 2026-07-22

Status: **CHECKED CONDITIONAL SOURCE DISPATCH; TWO CERTIFICATE ENDPOINTS OPEN.**

`ExactFiveCard13DistinctRadiusDispatcher.lean` proves that the exact-card-13,
distinct-first-apex-radius branch reduces to the two canonical asymmetric
source orbits represented by role triples

```text
(source, blocker, third) = (1,2,3)
(source, blocker, third) = (3,2,1).
```

For either two-hit spoke outcome, the dispatcher constructs:

- the source-valid canonical card-13 boundary frame;
- the complete semantic table containing the actual fixed blocker map,
  retained and double-deletion rows, exact-five shell, and three all-center
  selected-row families; and
- the two independently selected deletion-cover families, normalized into
  canonical left/right order.

It then dispatches only on `CanonicalAsymmetricRolePrepacket.source_role_orbits`.
The first-spoke and second-spoke cases do not create separate mathematical
certificate obligations. The all-one outcome is kept as a callback because
its source-clean certificate endpoint already exists in the sibling
same-radius dispatcher and is independent of the radius comparison.

The remaining fields of
`CanonicalDistinctRadiusCard13OrbitClosers` are exactly the direct and mirror
source-expression UNSAT endpoints. Each receives generic `P`, `star`, `T`,
and `C` objects plus the exact role conjunction, so a single theorem per
canonical source orientation can fill the callbacks without reselecting rows
or weakening the parent surface.

## Validation

From `lean/`, with the checked scratch dependencies already compiled:

```bash
LEAN_PATH=../scratch/atail-force/exact5-card13-distinct-radius-dispatcher:\
../scratch/atail-force/exact5-card13-cnf-ingress-audit:\
../scratch/atail-force/kalmanson-parent-order-adapter \
  lake env lean -R .. -DwarningAsError=true \
  ../scratch/atail-force/exact5-card13-distinct-radius-dispatcher/\
ExactFiveCard13DistinctRadiusDispatcher.lean
```

Both printed theorem closures contain only:

```text
propext, Classical.choice, Quot.sound
```

No production `sorry` is closed by this conditional dispatcher alone.
