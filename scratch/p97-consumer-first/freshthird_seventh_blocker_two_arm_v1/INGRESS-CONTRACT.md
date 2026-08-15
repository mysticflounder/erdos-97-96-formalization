# Ingress contract

## Namespace and universe

The fresh schema namespace is `freshthird_seventh_blocker_two_arm_v1`.  Every
query uses the fixed exact-17 carrier `P = {0,…,16}` and rows represented by
Boolean membership variables. `exact4(R)` means `Σᵢ ite(Rᵢ,1,0) = 4`.

## Source-mapped fields

| schema field | source declaration / field | encoded obligation |
|---|---|---|
| `E7` | `FirstFiberCrossedSeventhBlockerBoundary.escape` and `escapeRow` | exact selected row, with escape point `e ∈ E7` |
| `AB7` | `escapePoint_mem_actualBlockerClass` | exact canonical actual-blocker row, with `e ∈ AB7` |
| `centerE7 = centerAB7` | `escapeRow_support_eq_actualBlockerRow_of_center_eq` hypothesis | equal-center branch |
| `z,w ∈ E7`, `z ≠ w` | `exists_mutualCrossDeletionRows_of_escapeCenter_eq_oppApex1` | two distinct first-apex row points |
| `Kz`, `Kw` | the two existential `SelectedFourClass` witnesses in the same theorem | exact-four rows |
| `w ∉ Kz`, `z ∉ Kw` | same theorem's opposite-deletion clauses | cross omission |
| `centerZ ≠ centerW` | same theorem's final center inequality | distinct actual blocker centers |
| `escapeCenter = oppApex1` | theorem hypothesis `hcenter` | first-apex branch |

The equal-center query sets `e = 0`; the first-apex query sets `z = 0` and
`w = 1` only as a bounded witness choice, while retaining the theorem's
existential shape through satisfiable row predicates.

## Deliberate omissions

The schema omits all metric coordinates/distances/radii, carrier geometry,
source-role labels, the six installed centers, actual `H.selectedAt` shell
identity beyond the two named existential rows, deletion-fan universal
quantifiers, and the lift from this finite packet to all exact-17 assignments.
It also omits any fixed survivor or imported certificate.  These omissions
make SAT a diagnostic only and prevent a solver result from being promoted to
the Lean proof spine.

## Malformed controls

`equal_center_support_mismatch` retains equal centers and exact rows but forces
`p0 ∈ E7` and `p0 ∉ AB7`; it must be UNSAT by support equality.
`first_apex_center_collapse` retains the first-apex packet but forces
`centerZ = centerW`; it must be UNSAT by the theorem's distinct-center field.
