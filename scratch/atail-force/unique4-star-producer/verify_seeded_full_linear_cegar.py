#!/usr/bin/env python3
"""Replay the static safety gates for the seeded full-linear CEGAR driver."""

from __future__ import annotations

import argparse
import hashlib
import importlib.util
import json
import sys
from pathlib import Path
from typing import Any


HERE = Path(__file__).resolve().parent
ROOT = HERE.parents[2]
DRIVER_PATH = HERE / "run_seeded_full_linear_cegar.py"


def load_module(name: str, path: Path) -> Any:
    spec = importlib.util.spec_from_file_location(name, path)
    if spec is None or spec.loader is None:
        raise RuntimeError(path)
    module = importlib.util.module_from_spec(spec)
    sys.modules[name] = module
    spec.loader.exec_module(module)
    return module


DRIVER = load_module("unique4_seeded_driver_validation", DRIVER_PATH)


def sha256(path: Path) -> str:
    return hashlib.sha256(path.read_bytes()).hexdigest()


def decoded_rows(path: Path) -> dict[int, set[int]]:
    payload = json.loads(path.read_text())
    rows_raw = payload.get("decoded", {}).get("rows")
    if not isinstance(rows_raw, dict):
        raise ValueError(f"{path}: missing decoded rows")
    return {
        int(center): {int(point) for point in members}
        for center, members in rows_raw.items()
    }


def source_occurrence(record: dict[str, Any]) -> dict[str, Any]:
    rows = decoded_rows(ROOT / record["source_artifact"])
    vertices = record["source_vertices_by_role"]
    checked: list[list[int]] = []
    for row in record["row_instances"]:
        center = vertices[row["center_role"]]
        for member_role in row["member_roles"]:
            member = vertices[member_role]
            if member not in rows[center]:
                raise AssertionError(
                    f"{record['id']}: source row {center} omits {member}"
                )
            checked.append([center, member])
    return {
        "id": record["id"],
        "profile": record["profile"],
        "checked_memberships": checked,
        "status": "VERIFIED_SOURCE_OCCURRENCE",
    }


def build_seed_summary(profile: int, records: list[dict[str, Any]]) -> dict[str, Any]:
    cnf, metadata = DRIVER.BASE.DIRECT.OUTER.encode(
        11,
        profile,
        DRIVER.BASE.DIRECT.PLANAR_BANK,
        DRIVER.BASE.DIRECT.KALMANSON_BANK,
        DRIVER.BASE.DIRECT.U5_BANK,
        strict_cap_minimality_overlay=True,
        pair_minimality_overlay=False,
        exact_two_strict_hit_overlay=True,
    )
    DRIVER.BASE.OWN_CAP.add_own_cap_bounds(cnf, metadata)
    DRIVER.BASE.DIRECT.add_direct_curvature_overlay(cnf, 11)
    clause_count_before = len(cnf.clauses)
    summary = DRIVER.add_seed_cuts(cnf, 11, records)
    if len(cnf.clauses) - clause_count_before != summary["total_unique_cut_count"]:
        raise AssertionError("seeded clause count disagrees with CNF growth")
    return {
        "profile": profile,
        "clause_count_before_seed": clause_count_before,
        "clause_count_after_seed": len(cnf.clauses),
        "seed_summary": summary,
    }


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--output", required=True, type=Path)
    parser.add_argument(
        "--seed-bank", type=Path, default=DRIVER.DEFAULT_SEED_BANK
    )
    parser.add_argument("--check", action="store_true")
    args = parser.parse_args()

    records, bank = DRIVER.load_seed_bank(args.seed_bank.resolve())
    raw_record = json.loads(args.seed_bank.read_text())["records"][0]
    raw_record["row_instances"][1]["center_role"] = raw_record["row_instances"][
        0
    ]["center_role"]
    try:
        DRIVER.validate_seed_record(raw_record)
    except ValueError as error:
        if "repeated center role" not in str(error):
            raise
        rejection = str(error)
    else:
        raise AssertionError("repeated-center seed was accepted")

    payload = {
        "schema": "p97-unique4-seeded-full-linear-cegar-validation-v1",
        "epistemic_status": "EXACT DRIVER REPLAY; NOT A LEAN PROOF",
        "driver_path": str(DRIVER_PATH.relative_to(ROOT)),
        "driver_sha256": sha256(DRIVER_PATH),
        "seed_bank": bank,
        "source_occurrences": [source_occurrence(record) for record in records],
        "repeated_center_fail_closed": {
            "status": "VERIFIED_REJECTED",
            "message": rejection,
        },
        "profiles": [build_seed_summary(profile, records) for profile in (4, 5)],
    }
    rendered = json.dumps(payload, indent=2, sort_keys=True) + "\n"
    if args.check:
        if not args.output.exists() or args.output.read_text() != rendered:
            raise SystemExit(f"stale or missing validation artifact: {args.output}")
    else:
        args.output.write_text(rendered)
    print(
        json.dumps(
            {
                "status": "VERIFIED",
                "seed_records": len(records),
                "unique_seed_cuts": payload["profiles"][0]["seed_summary"][
                    "total_unique_cut_count"
                ],
            },
            sort_keys=True,
        )
    )
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
