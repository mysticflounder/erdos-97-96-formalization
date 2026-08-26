# EX12 complete blocker-map incidence shadow

**Classification:** EMPIRICALLY VERIFIED incidence-only SAT.
**Model ID:** `ex12-6f60cbc0da6a3b75`
**Artifact:** `scratch/pentagon-offclass-exact12-v2/model.json`
**Artifact SHA-256:** `5c609765921ffa48e26258c55fc99bb36acb30fb4185488edefa4e16761d7eca`

This is the richest retained EX12 assignment: all 12 row supports, the full
12-point blocker map, three cap sets, interiors, named roles, physical class,
and trace edges. CaDiCaL and Z3 independently checked the encoded assignment.

**Passes:** the finite incidence formula and recorded placement constraints.
**Fails:** cyclic order, Euclidean distances, strict convexity, MEC semantics,
minimality/global K4, complete `no_qfree`, and dependent deletion provenance.
It is a countermodel only to claims made from those weaker predicates.
