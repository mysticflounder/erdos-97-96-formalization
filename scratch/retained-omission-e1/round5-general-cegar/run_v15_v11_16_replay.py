#!/usr/bin/env python3
"""Authenticate and replay the same 16 completed v11 cases through v15."""

from __future__ import annotations

import argparse
import hashlib
import json
from pathlib import Path

import round5_cegar_v8 as v8
import round5_cegar_v11 as v11
import round5_cegar_v15 as v15


SOURCE = Path("artifacts-v11/20260802T093313.097282Z-retry-pid99343")
MANIFEST = Path("artifacts-v15/v11-16-selection-20260802T093313.097282Z.json")
CASE_IDS = (
    "fresh_DDD_k0_d2_f1", "fresh_DDD_k0_d2_f3",
    "fresh_DDD_k0_d3_f1", "fresh_DDD_k0_d3_f2",
    "fresh_DDD_k1_d3_f0", "fresh_DDD_k1_d3_f2",
    "fresh_DDD_k2_d0_f1", "fresh_DDD_k2_d0_f3",
    "fresh_DDD_k3_d0_f1", "fresh_DDD_k3_d0_f2",
    "fresh_DDD_k3_d1_f0", "fresh_DDD_k3_d1_f2",
    "fresh_SDD_k0_d2_f1", "fresh_SDD_k0_d2_f3",
    "fresh_SDD_k0_d3_f1", "fresh_SDD_k0_d3_f2",
)


def sha256(data: bytes) -> str:
    return hashlib.sha256(data).hexdigest()


def main() -> int:
    invocation_bytes = (SOURCE / "invocation.json").read_bytes()
    invocation = json.loads(invocation_bytes)
    v11_provenance = v11.provenance()
    assert all(invocation.get(key) == value for key, value in v11_provenance.items())
    assert tuple(sorted(path.parent.name for path in SOURCE.glob("*/result.json"))) == CASE_IDS

    universe = {
        case.case_id: case
        for case in (*v8.all_cases(), *v8.all_secondcap_endpoint_cases())
    }
    selection: list[dict[str, object]] = []
    for seed, case_id in enumerate(CASE_IDS, 1):
        path = SOURCE / case_id / "result.json"
        raw = path.read_bytes()
        result = json.loads(raw)
        assert result["case_id"] == case_id
        assert result["status"] == "unknown"
        assert result["solver"]["seed"] == seed
        assert v8.Case(**result["case"]) == universe[case_id]
        assert all(result.get(key) == value for key, value in v11_provenance.items())
        assert result["resolved_budgets"] == invocation["resolved_budgets"]
        selection.append({
            "case_id": case_id, "case": result["case"], "seed": seed,
            "source_result": str(path), "source_result_sha256": sha256(raw),
        })

    script_bytes = Path(__file__).read_bytes()
    manifest = {
        "kind": "round5-v11-partial-result-selection/v1",
        "selection_builder_script_sha256": sha256(script_bytes),
        "source_run": str(SOURCE),
        "source_invocation_sha256": sha256(invocation_bytes),
        "source_provenance": v11_provenance,
        "destination_provenance": v15.provenance(),
        "cases": selection,
    }
    manifest_bytes = (json.dumps(manifest, indent=2, sort_keys=True) + "\n").encode()
    MANIFEST.parent.mkdir(parents=True, exist_ok=True)
    with MANIFEST.open("xb") as handle:
        handle.write(manifest_bytes)

    args = argparse.Namespace(
        workers=8, timeout_ms=600_000, bool_timeout_ms=30_000, seed=1,
        max_power_cuts=256, max_power_candidates=2_000_000,
        max_bool_power_cuts=256, max_bool_power_candidates=2_000_000,
        artifacts=Path("artifacts-v15"),
    )
    return v15.run_matrix(
        args, [universe[case_id] for case_id in CASE_IDS], "v11-16-replay",
        MANIFEST, sha256(manifest_bytes),
    )


if __name__ == "__main__":
    raise SystemExit(main())
