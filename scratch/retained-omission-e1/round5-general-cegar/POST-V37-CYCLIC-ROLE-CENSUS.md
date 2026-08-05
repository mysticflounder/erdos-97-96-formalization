# Post-v37 cyclic-role census

## Scope and status

**EMPIRICALLY VERIFIED finite abstraction only.**  This is a six-class cyclic
role enumeration, not a Lean proof and not a CEGAR run.  It preserves the
roles `A = first apex`, `B = branch center`, `J` (inside the chosen adjacent
cap), and `X = x_out` (outside that cap).

The added exact mixed-pair packet is

```text
K_A.support ∩ K_B.support = {J, X},
J ∈ cap, X ∉ cap,
((K_A.support \ cap) ∩ (K_B.support \ cap)).card ≤ 1.
```

The last inequality is met with equality one, so it contributes no cyclic
order cut.  The exact pair supplies the two shared points needed for
`selectedFourClass_shared_pair_separated`; its conclusion instead requires
`J` and `X` to be on opposite open arcs between `A` and `B`.

## Census result

There are 24 written linear orders and 6 oriented cyclic orders after quotienting
by rotation (write `A` first):

| Cyclic order | Existing four-point terminal? | Survives shared-pair separation? |
|---|---:|---:|
| `A B J X` | both | no |
| `A B X J` | both | no |
| `A J B X` | neither | yes |
| `A J X B` | both | no |
| `A X B J` | neither | yes |
| `A X J B` | both | no |

Thus 4/6 raw cyclic orders have consecutive centers and can be rotated into
both existing Kalmanson signatures.  But the banked separation theorem removes
all four.  **0/2 admissible post-v37 orbits hit an existing consumer; both
alternating mixed placements remain.**  Stop here: no broad Boolean or metric
CEGAR run is justified.

The two terminal signatures are the same cyclic condition with different linear
starts: `center, center, shared, shared` for
`false_of_two_selected_rows_shared_late_pair`, and `shared, center, center,
shared` for `false_of_two_selected_middle_rows_shared_endpoint_pair`.  Their
use still needs a real CCW-boundary/index adapter; no such application was
found in the current Lean tree.

## Exact missing role/placement theorem

The next theorem must be a **new mixed-placement consumer/producer**, not a
cardinality cut:

```text
false_of_firstApex_branchCenter_exactMixedPair_alternating
  (K_A.support ∩ K_B.support = {J, x_out})
  (J ∈ adjacentCap) (x_out ∉ adjacentCap)
  (A, J, B, x_out occur in CCW cyclic order
   or A, x_out, B, J occur in CCW cyclic order) : False.
```

Here the theorem must include whatever endpoint/branch/first-apex hypotheses
actually distinguish this packet from two arbitrary selected rows.  With only
the displayed hypotheses it would contradict the proved shared-pair separation
theorem, which positively enforces these alternating orders.  Equivalently, a
role-sensitive producer would have to derive an additional structural fact
incompatible with both alternating placements; it cannot derive a
consecutive-center order.

## Authentication

Run the companion script to recompute all SHA-256 values and the table:

```bash
PYTHONDONTWRITEBYTECODE=1 uv run python \
  scratch/retained-omission-e1/round5-general-cegar/POST-V37-CYCLIC-ROLE-CENSUS.py
```

The script authenticates the v37 pilot and result against their recorded
digests and detects that the current v36 pilot source does **not** match the
historical v36 report's source digest.  The v36 pairwise result itself matches
its recorded digest.  Therefore v37's recorded SAT outcome is authenticated
as an artifact pair, while a fresh reproduction through the current v36 import
should not be claimed without resolving that v36 source drift.
