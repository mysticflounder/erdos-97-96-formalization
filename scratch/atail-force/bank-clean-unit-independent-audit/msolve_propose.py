#!/usr/bin/env python3
"""Use two-order msolve only to propose small equality cores.

No proposal is accepted as a certificate; Singular must arbitrate it.
"""

from __future__ import annotations

import json
from concurrent.futures import ThreadPoolExecutor, as_completed
from pathlib import Path
from typing import Any

import minimize_core as core


HERE = Path(__file__).resolve().parent


def minimize(
    name: str,
    variables: list[Any],
    initial: list[dict[str, Any]],
    order: list[dict[str, Any]],
) -> dict[str, Any]:
    retained = list(initial)
    trace: list[dict[str, Any]] = []
    for index, generator in enumerate(order):
        if generator not in retained:
            continue
        trial = [g for g in retained if g["id"] != generator["id"]]
        result = core.msolve_pair(variables, trial)
        verdicts = core.verdict_pair(result)
        removed = verdicts == ("UNIT", "UNIT")
        trace.append(
            {
                "id": generator["id"],
                "removed": removed,
                "verdicts": list(verdicts),
                "seconds": [
                    result["forward"]["seconds"],
                    result["reverse"]["seconds"],
                ],
            }
        )
        if removed:
            retained = trial
        print(
            name,
            index + 1,
            "/",
            len(order),
            generator["id"],
            verdicts,
            "remove" if removed else "keep",
            "retained",
            len(retained),
            flush=True,
        )
    final = core.msolve_pair(variables, retained)
    return {
        "name": name,
        "initial_count": len(initial),
        "final_count": len(retained),
        "final_generator_sha256": core.generator_hash(retained),
        "final_polynomial_sha256": core.polynomial_hash(retained),
        "final_generators": [
            {
                "id": str(g["id"]),
                "atom": str(g["atom"]),
                "center": str(g["center"]),
                "left": str(g["left"]),
                "right": str(g["right"]),
                "polynomial": str(g["polynomial"]),
            }
            for g in retained
        ],
        "final_msolve": final,
        "trace": trace,
    }


def main() -> None:
    variables, full = core.build()
    candidate = [
        g
        for g in full
        if g["atom"] == "ambient_O" or g["center"] in core.CANDIDATE_ROWS
    ]
    strategies = [
        ("full_forward", full, list(full)),
        ("full_reverse", full, list(reversed(full))),
        ("candidate_reverse", candidate, list(reversed(candidate))),
    ]
    results: list[dict[str, Any]] = []
    with ThreadPoolExecutor(max_workers=len(strategies)) as pool:
        futures = {
            pool.submit(minimize, name, variables, initial, order): name
            for name, initial, order in strategies
        }
        for future in as_completed(futures):
            result = future.result()
            results.append(result)
            print(
                "DONE",
                result["name"],
                result["final_count"],
                result["final_polynomial_sha256"],
                flush=True,
            )
    results.sort(key=lambda item: (item["final_count"], item["name"]))
    report = {
        "schema": "p97-bank-clean-msolve-two-order-proposals-v1",
        "warning": "msolve proposals only; Singular characteristic-zero confirmation required",
        "checkpoint_row_sha256": core.audit.EXPECTED_ROW_HASH,
        "gauge": {"O": [0, 0], "A": [1, 0]},
        "full_polynomial_sha256": core.polynomial_hash(full),
        "strategies": results,
    }
    (HERE / "msolve_proposals.json").write_text(
        json.dumps(report, indent=2, sort_keys=True) + "\n"
    )
    print(
        json.dumps(
            [
                {
                    "name": item["name"],
                    "count": item["final_count"],
                    "sha256": item["final_polynomial_sha256"],
                }
                for item in results
            ],
            sort_keys=True,
        ),
        flush=True,
    )


if __name__ == "__main__":
    main()
