# Exact-17 FortyNinth V49 wave-only weighted mine

Status: **PASS**. This is a read-only replay/mine; no solver, PIQD, Lean edit, or successor CNF was run or created.

Authenticated inputs:

- SAT assignment artifact: `scratch/runs/exact17-forty-ninth-piqd-20260816/successor-v1/artifacts/piqd-attempts/attempt-00000000-5b95f49958ec25f6/attempt.jsonl.artifacts/e93e3f0580c8eefacd28a6d7d51eec579b195a2918060fe80387182e76e5dc71`
- Assignment SHA-256: `e93e3f0580c8eefacd28a6d7d51eec579b195a2918060fe80387182e76e5dc71`; result `SAT`, backend `cadical`, job `7a947ba2-e669-4de6-b86d-e6f5f9ab049d`
- Current root: `5b95f49958ec25f6d893bc27af748d93e93073256763b81842c7d16f23d7a4c5`, 7,198,668 clauses
- Decoded source digest `40eb9a4df9c40d916f343ddbccdfaf15f6c9c5fd68c8b5051446cf4ec6425315`; named order 1, next center 3
- Full rows, selected order, system hashes, and every resulting support are retained in [analysis.json](analysis.json).

Scan and source validation:

- Enumerated all zero/opposite-sign cancellation proposals in each orientation: 4 zero atoms + 196 opposite pairs = 200 candidates per orientation.
- All 200 forward and all 200 reflected-reverse candidates passed deterministic replay `_verify_kalmanson_proposal_against_system` and `certify_weighted_kalmanson_cancellation` through the existing producer bank.
- Forward and reflected-reverse each had 141 distinct position-coordinate supports; their intersection had 120 paired supports.
- Raw inclusion-minimal paired supports: **107**. Size histogram: 8:9, 10:15, 11:2, 12:18, 13:5, 14:9, 15:1, 16:17, 17:4, 18:11, 20:10, 21:2, 22:3, 23:1.

Comparison with the authenticated 62-support bank:

- Exact overlap: **0**.
- Strict-subset overlap in either direction: **0**.
- Therefore all **107** minimal paired supports are genuinely new against the existing 62-support bank. Their histogram is 8:9, 10:15, 11:2, 12:18, 13:5, 14:9, 15:1, 16:17, 17:4, 18:11, 20:10, 21:2, 22:3, 23:1.
- The complete normalized position-coordinate support list is the `new_minimal_supports` field in [analysis.json](analysis.json).

Reusable family and recommendation:

- Every new record uses the existing positive weighted Kalmanson cancellation/equality-closure row/flip-path family and the existing consumer `Problem97.ATailFrontierLiveClosure.GenericRowNogoodCertificate.false_of_weightedKalmansonCancellationData_of_check`.
- No new cardinality-independent source schema was found; recurring edge motifs are descriptive only.
- If promoted, these 107 occurrences would contribute 428 guarded clauses. This report does **not** create a successor CNF; parent review is required before any banking/promotion.
