# n=17 FreshThird incidence round 1

Date: 2026-08-02

## Scope

`n17_freshthird_incidence_probe.py` is the first repaired concrete
`(6,8,6)` incidence model for the live FreshThird packet.  It keeps the
indexed cap at cardinality eight, forces the two canonical C sources to the
two remaining strict-interior points after the four collision endpoints are
excluded, and represents the Q source selectors, equal actual blocker,
mutual shell membership, exact selected support, deletion-survival
disjunctions, interaction tags, and normalized residual tags.

The cap label attached to a row is an abstract label for its geometric
center.  It is not identified with carrier-vertex cap membership; that
identification would overconstrain the Lean packet because `centerAt` is a
geometric point rather than a carrier vertex.

## Result

The fixed model is SAT in all three normalized residual modes with a 30-second
Z3 timeout:

| residual mode | result |
|---|---|
| `firstNonHit` | SAT |
| `secondNonHit` | SAT |
| `equalCrossRowCenters` | SAT |

The self-check passes and the ordinary run is SAT.  Example models select
different legal Q pairs across runs; this is expected because no objective or
canonical selector is imposed.

## Boundary

This is external incidence evidence only.  The model omits coordinates,
QF_NRA metric realization, cyclic-order/Kalmanson refinements, CEGAR cuts,
Lean ingress, and any universal-in-`n` quantification.  SAT therefore does not
refute the intended theorem, but it does show that the current incidence
abstraction cannot supply an UNSAT cut for the live normalized residual.

The corresponding global theorem-bank audit is
`LATEST-GLOBAL-BANK-AUDIT.md`; it found no source-clean producer or direct
bridge for the live `sorry`.
