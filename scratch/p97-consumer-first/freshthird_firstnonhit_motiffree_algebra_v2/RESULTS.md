# Results

## Source-fidelity amendment

The `common_sameblocker` terminal packet is **SOURCE-MALFORMED** and its raw
NONUNIT calculation is not admissible as source-faithful P97 evidence.  Its
readback assigns five distinct actual carrier-source labels
`q0,q1,q2,first,second` one blocker value, contradicting
`actualBlockerFiber_card_le_four`.  It also assigns six distinct carrier-point
labels `q0,q1,q2,q3,first,second` to one exact selected shell, contradicting
`CriticalFourShell.support_card = 4`.

The missing constraints were an at-most-four actual-blocker-fiber cut, an
at-most-four exact-support cut, and the source-proved `first ≠ second` fact.
The minimal corrected structural query is SAT in both Z3 and cvc5, but only by
aliasing `first` and `second` with Q-support roles and moving `q2`'s blocker off
the common fiber.  This corrected structural SAT is not an algebraic or
Euclidean witness.  Exact inputs, controls, logs, and hashes are under
`source_fidelity_audit/`.

One bounded algebra wave completed. Both algebra controls passed.

## Packet classifications

| packet | rows | row equations | consensus | exact meaning |
|---|---:|---:|---|---|
| `common` | 6 | 10 | `NONUNIT` | complex nonempty only; not a real/Euclidean witness |
| `common_sameblocker` | 10 | 33 | `SOURCE-MALFORMED` | raw CAS NONUNIT only; invalid as source-faithful evidence |
| `retained` | 8 | 14 | `UNKNOWN` | fail-closed engine/order uncertainty |

## Claim boundary

For a source-faithful packet, the gauge is sound for real Euclidean configurations because the terminal source makes `q0` and `q1` distinct. UNIT would therefore eliminate the fixed positive table. NONUNIT says only that the gauge equality ideal has a complex point; it is not a real/Euclidean witness and does not validate any omitted P97 hypothesis. The raw `common_sameblocker` packet fails the antecedent of this interpretation because its equality-class readback violates proved source cardinality constraints.

No boundary order, inequality, support-exhaustion, or full metric constraint was encoded. Exact source/label mappings and all omissions are in `SOURCE-MAP.md`.

## Wave-data theorem mine

Candidate: **co-centered selected-row contraction**. The new packets exhibit duplicate row groups at the same center. The candidate is useful preprocessing but is not materially new: it is direct extensionality and the pinned source already names `selectedSupports_eq_of_actualBlockers_eq`. No Lean-corpus or external search was run.

Recorded solver wall: 94.066715s for algebra plus 0.203833s for the corrective
structural audit, totaling 94.270549s of 290.0s; maximum live solver allocation:
4 cores.
