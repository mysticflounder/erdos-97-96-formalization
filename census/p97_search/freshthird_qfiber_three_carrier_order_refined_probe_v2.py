"""Bounded four-cell canary for the FreshThird order-refined v2 CNF."""

from __future__ import annotations

import argparse
import hashlib
import subprocess
from pathlib import Path

from census.p97_search.freshthird_qfiber_three_carrier_batched_alternation_probe_v1 import (
    _parse_model,
    no_alternating_cap_clauses,
)
from census.p97_search.freshthird_qfiber_three_carrier_cnf_v1 import _canonical_json
from census.p97_search.freshthird_qfiber_three_carrier_order_refined_cnf_v2 import (
    CNF_SCHEMA,
    FreshThirdCarrierOrderRefinedCnfEncoding,
    fresh_row_ordered_holds,
)
from census.p97_search.freshthird_qfiber_three_carrier_source_family_diagnostic_v1 import (
    diagnose_signature,
)

SCHEMA = "p97-freshthird-qfiber-three-carrier-order-refined-probe/v2"


def _run_cell(
    boundary_index: int, out_dir: Path, cadical: str, timeout_seconds: int
) -> dict[str, object]:
    encoding = FreshThirdCarrierOrderRefinedCnfEncoding(boundary_index)
    extra = no_alternating_cap_clauses(encoding)
    cnf = encoding.cnf_bytes(extra)
    out_dir.mkdir(parents=True, exist_ok=True)
    cnf_path = out_dir / "query.cnf"
    cnf_path.write_bytes(cnf)
    completed = subprocess.run(
        [cadical, "-q", "-t", str(timeout_seconds), str(cnf_path)],
        stdout=subprocess.PIPE,
        stderr=subprocess.STDOUT,
        timeout=timeout_seconds + 5,
        check=False,
    )
    result: dict[str, object] = {
        "boundary_index": boundary_index,
        "cnf_schema": CNF_SCHEMA,
        "cnf_sha256": hashlib.sha256(cnf).hexdigest(),
        "extra_clause_count": len(extra),
        "cadical_returncode": completed.returncode,
    }
    if completed.returncode != 10:
        result["status"] = "UNSAT" if completed.returncode == 20 else "UNKNOWN"
        return result
    assignment = _parse_model(completed.stdout, encoding.num_vars)
    encoding.validate(assignment)
    signature = encoding.model_signature(assignment)
    source_order_holds = fresh_row_ordered_holds(signature)
    replay = encoding.semantic_replay(assignment, timeout_ms=timeout_seconds * 1_000)
    source_family = None
    if not replay.accepted:
        diagnosis = diagnose_signature(
            boundary_index,
            signature,
            timeout_ms=timeout_seconds * 1_000,
        )
        source_family = {
            "split_core": list(diagnosis.split_core),
            "minimized_core": list(diagnosis.minimized_core),
            "canonical_atom_minimized": list(diagnosis.canonical_atom_minimized),
        }
    result.update(
        {
            "status": "SAT_ABSTRACTION",
            "model_signature_sha256": hashlib.sha256(_canonical_json(signature)).hexdigest(),
            "fresh_row_ordered": source_order_holds,
            "semantic_replay": {"accepted": replay.accepted, "detail": replay.detail},
            "source_family": source_family,
        }
    )
    return result


def run(out_dir: Path, cadical: str = "cadical", timeout_seconds: int = 30) -> dict[str, object]:
    if timeout_seconds <= 0:
        raise ValueError("timeout_seconds must be positive")
    results = [
        _run_cell(index, out_dir / f"cell-{index}", cadical, timeout_seconds)
        for index in range(4)
    ]
    report = {
        "schema": SCHEMA,
        "purpose": "bounded source-order canary; no proof or cut admission",
        "results": results,
    }
    (out_dir / "summary.json").write_bytes(_canonical_json(report))
    return report


def main() -> int:
    parser = argparse.ArgumentParser()
    parser.add_argument("--out-dir", type=Path, required=True)
    parser.add_argument("--cadical", default="cadical")
    parser.add_argument("--timeout-seconds", type=int, default=30)
    args = parser.parse_args()
    run(args.out_dir, args.cadical, args.timeout_seconds)
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
