"""Freeze one source-mapped exact-17 same-blocker proposal.

This is deliberately a single finite incidence proposal, not an enumeration.
The four Q/C source points share one actual blocker and one exact selected row;
the retained P and P-rho pairs use different blocker images.
"""

from __future__ import annotations

import json
from pathlib import Path

HERE = Path(__file__).resolve().parent
PREDECESSOR = (
    HERE.parent.parent
    / "freshthird_aligned_mutual_crossed_metric_v1"
    / "post_rich_cut_v3"
    / "generated"
    / "post_rich_cut_v3_assignment.json"
)
OUT = HERE / "generated" / "sameblocker_assignment.json"
N = 17


def cyclic_support(center: int) -> list[int]:
    return [((center + k) % N) for k in range(1, 5)]


def main() -> None:
    old = json.loads(PREDECESSOR.read_text())
    roles = dict(old["roles"])
    # Q.source1/Q.source2 and the two canonical C sources form the exact
    # same-blocker row.  The center 7 is not one of these four points.
    shared = [roles["c_first"], roles["c_second"], roles["q_source"], roles["q_other"]]
    point_rows = [cyclic_support(center) for center in range(N)]
    point_rows[7] = shared
    point_rows[8] = [roles["p1"], roles["p2"], roles["q_source"], roles["q_other"]]
    point_rows[9] = [roles["r1"], roles["r2"], 10, 12]
    point_rows[10] = [8, 9, 11, 13]
    point_rows[12] = [10, 14, 15, 16]
    blockers = [7] * 4 + [9, 9, 8, 8] + [10, 10, 9, 10, 10, 10, 12, 12, 12]
    # Explicitly assign every point so row-locking is easy to audit.
    blockers = [7, 7, 7, 7, 9, 9, 8, 8, 10, 10, 12, 10, 9, 10, 12, 12, 12]
    selected_rows = [list(point_rows[b]) for b in blockers]
    result = dict(old)
    result.update(
        {
            "n": N,
            "packet": "same_blocker",
            "point_k4_rows": point_rows,
            "selected_rows": selected_rows,
            "blockers": blockers,
            "source_provenance": {
                "shared_row": shared,
                "same_blocker_sources": [
                    roles["q_source"],
                    roles["q_other"],
                    roles["c_first"],
                    roles["c_second"],
                ],
                "retained_p_pair": [roles["p1"], roles["p2"]],
                "retained_prho_pair": [roles["r1"], roles["r2"]],
            },
        }
    )
    OUT.parent.mkdir(parents=True, exist_ok=True)
    OUT.write_text(json.dumps(result, indent=2, sort_keys=True) + "\n")
    print(OUT)


if __name__ == "__main__":
    main()
