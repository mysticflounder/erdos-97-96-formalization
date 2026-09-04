# B1 all-interior card-six QF_NRA prelaunch audit

Lane: `b1-all-interior-card6-qfnra-prelaunch-20260903`  
Base head: `29614dfc71e902523fbdbac5191c964a187282b7`  
Run root: `scratch/runs/b1-all-interior-card6-qfnra-prelaunch-20260903/run-0001`

## Verdict

**PRELAUNCH BLOCKED; NOT CERTIFIED.** A fixed structural card-six profile and
an exact fixed-order SMT-LIB2 candidate were prepared. No PIQD session was
created, no piqc confirmation was attempted, and no solver was executed.

## Fixed profile

The profile is the authenticated Wave 6 orbit
`rgs=0123456789897978`, local type `4840`, orbit size 8, with ten quotient
classes.  Its fixed class order is
`[0,1,7,2,3,8,4,5,9,6]`, and its physical roles are
`d1,d2,u0,u1,v0,v1`.  The selected local words are
`AxByLR`, `ALxByR`, and `ALRxBy`.

The custody record is
`scratch/runs/b1-all-interior-card6-qfnra-prelaunch-20260903/run-0001/PROFILE.json`.
It authenticates the structural orbit, fixed order, and copied formula bytes;
it does not assert that a Lean B1 source packet realizes those aliases.

## Formula ledger

The candidate
`scratch/runs/b1-all-interior-card6-qfnra-prelaunch-20260903/run-0001/SMT2-JOURNAL.smt2`
has 242 QF_NRA assertions:

| block | count | source status |
|---|---:|---|
| gauge pins | 4 | numeric source bridge absent |
| quotient-class distinctness | 45 | only partial local-role source support |
| strict convex boundary order | 120 | fixed role-to-index bridge absent |
| common unit-circle support | 10 | coordinate bridge absent |
| endpoint-bisector support | 30 | coordinate bridge absent |
| exact-four row-circle support | 33 | coordinate bridge absent |

The full mapping is in `SOURCE-MAP.json`.  The copied journal retains the
candidate `(check-sat)` line, but that line was not sent anywhere.

## B1 source mapping and blockers

Current Lean source facts are present for the card-six two-point-slice
decomposition (`b1_live_slices_card_eq_two_disjoint_of_physicalClass_card_six`),
the local role packet (`nonempty_b1CardSixLocalRolePacket`), the escape and
survival packet (`B1EscapeWitness`, `nonempty_b1EscapeWitness`,
`B1EscapeRowProvenanceStar`, `b1_escapeRow_crossOmission`), and the three-arm
`B1GlobalGapOrClosedTerminal` consumer.

The all-interior branch still lacks the source bridge needed by this QF_NRA
candidate.  Card six gives a disjunction in which one of the three relevant
pairs is wholly strict-interior; it does not prove that both live slices, or
all four live endpoints, are strict-interior.  The source predicates for
strict-cap membership, provenance, survival, no-third joint-deletion exclusion,
role alias/decomposition, same-boundary-arc negation, and all-terminal-arm
negation have no finite QF_NRA lowering in the current encoder.

The smallest missing capability is a fixed-branch source-faithful adapter that
emits those predicates and finite guards, binds all source bytes, and replays a
SAT model back through the Lean source ledger.  The existing piqd SMT transport
does not remove that source bridge requirement.

## Custody and verification

The run manifest is
`scratch/runs/b1-all-interior-card6-qfnra-prelaunch-20260903/run-0001/run_manifest.json`.
The retained run files are listed in the lane checkpoint.  This audit and its
run files contain no solver result, no model, no PIQD receipt, and no promotion
claim.
