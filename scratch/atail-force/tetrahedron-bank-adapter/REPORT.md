# Tetrahedron bank adapter

Date: 2026-07-14

Status: **kernel-checked conditional consumer; not a K-A-PAIR producer or
closure.**

The required theorem-bank preflight found the sibling `p97-rvol` declaration

```text
Problem97.U5QDeletedK4Class
  .three_exact_classes_tetrahedron_incompatibility
```

in `certificates/p97_rvol_general_n_mining.json`.  Its displayed incidence
pattern makes four planar points pairwise equidistant.  The common deleted
source in the sibling interface is not used by the metric contradiction, so
`TetrahedronBankAdapter.lean` records the weaker local interface

```lean
false_of_three_selected_classes_tetrahedron
```

for three ordinary `SelectedFourClass` values.

For the equilateral continuation, set

```text
x = z1, y = z2, a = oppApex2.
```

The two existing continuation rows supply

```text
y,a in row(x)
x,a,b in row(y)
```

after choosing `b` as either remaining support point of `row(y)`.  The exact
missing producer is then a selected class centered at `b` containing all of

```text
x, y, a.
```

If that three-hit row is produced, the adapter closes immediately through the
existing planar no-four-equidistant-points kernel.  Global K4 supplies a row at
`b`, but does not by itself choose those three support incidences; the
second-generation continuation must force them or close the complementary
branches elsewhere.

Validation from `lean/`:

```text
lake env lean -M 16384 \
  ../scratch/atail-force/tetrahedron-bank-adapter/TetrahedronBankAdapter.lean
```

The command exits successfully.  `#print axioms` reports only
`propext`, `Classical.choice`, and `Quot.sound`.
