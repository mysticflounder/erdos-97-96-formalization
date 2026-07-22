#!/usr/bin/env python3
"""Independent semantic replay for a SAT outer with planar bank cuts."""

from __future__ import annotations

import argparse
import hashlib
import importlib.util
import itertools
import json
from pathlib import Path


HERE = Path(__file__).resolve().parent
BASE_PATH = HERE.parent / "generic-biapex-kalmanson-cnf" / "verify_outer_result.py"
SPEC = importlib.util.spec_from_file_location("whole_carrier_outer_verifier", BASE_PATH)
if SPEC is None or SPEC.loader is None:
    raise RuntimeError("cannot load independent structural verifier")
BASE = importlib.util.module_from_spec(SPEC)
SPEC.loader.exec_module(BASE)


def sha256(path: Path) -> str:
    return hashlib.sha256(path.read_bytes()).hexdigest()


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("result", type=Path)
    parser.add_argument("kalmanson_bank", type=Path)
    parser.add_argument("planar_bank", type=Path)
    parser.add_argument("--output", required=True, type=Path)
    args = parser.parse_args()

    result = json.loads(args.result.read_text(encoding="utf-8"))
    kalmanson_bank = json.loads(args.kalmanson_bank.read_text(encoding="utf-8"))
    planar_bank = json.loads(args.planar_bank.read_text(encoding="utf-8"))
    if result.get("encoding_schema") != (
        "p97-biapex-structural-outer-direct-cnf-plus-planar-bank-v1"
    ):
        raise RuntimeError("unexpected augmented outer encoding")
    if result.get("planar_bank_sha256") != sha256(args.planar_bank):
        raise RuntimeError("planar bank digest mismatch")

    base_result = dict(result)
    base_result["encoding_schema"] = "p97-biapex-structural-outer-direct-cnf-v1"
    base_replay = BASE.verify(base_result, kalmanson_bank)
    if base_replay.get("status") != "VERIFIED_SAT":
        raise RuntimeError("base structural replay failed")

    expected_schema = "p97-whole-carrier-planar-membership-schema-bank-v1"
    if planar_bank.get("schema") != expected_schema:
        raise RuntimeError("unexpected planar bank schema")
    schemas = planar_bank.get("schemas")
    if not isinstance(schemas, list) or int(planar_bank.get("schema_count", -1)) != len(schemas):
        raise RuntimeError("planar bank schema count mismatch")
    n = int(result["n"])
    rows = {
        int(center): set(map(int, support))
        for center, support in result["rows"].items()
    }
    checked_injections = 0
    checked_schemas = 0
    skipped_schemas = 0
    for index, schema in enumerate(schemas):
        k = int(schema["active_role_count"])
        memberships = tuple(
            sorted(tuple(map(int, membership)) for membership in schema["memberships"])
        )
        if schema.get("transport") != "all_injective_role_maps":
            raise RuntimeError(f"schema {index} has the wrong transport mode")
        if len(set(memberships)) != len(memberships):
            raise RuntimeError(f"schema {index} has duplicate memberships")
        if any(center == point or not (0 <= center < k and 0 <= point < k)
               for center, point in memberships):
            raise RuntimeError(f"schema {index} is malformed")
        if set(range(k)) != {role for pair in memberships for role in pair}:
            raise RuntimeError(f"schema {index} declares an unused role")
        if k > n:
            skipped_schemas += 1
            continue
        checked_schemas += 1
        for targets in itertools.permutations(range(n), k):
            checked_injections += 1
            if all(targets[point] in rows[targets[center]] for center, point in memberships):
                raise RuntimeError(
                    f"SAT model violates planar schema {index} at role map {targets}"
                )

    if int(result["planar_raw_injection_count"]) != checked_injections:
        raise RuntimeError("encoder and verifier disagree on raw planar injections")
    output = {
        **base_replay,
        "schema": "p97-biapex-outer-plus-planar-bank-semantic-replay-v1",
        "status": "VERIFIED_SAT_WITH_PLANAR_BANK",
        "source_result": str(args.result),
        "source_result_sha256": sha256(args.result),
        "kalmanson_bank": str(args.kalmanson_bank),
        "kalmanson_bank_sha256": sha256(args.kalmanson_bank),
        "checked_planar_schema_count": checked_schemas,
        "skipped_planar_schema_count": skipped_schemas,
        "checked_planar_injection_count": checked_injections,
        "all_planar_schema_cuts_satisfied": True,
        "planar_bank_sha256": sha256(args.planar_bank),
    }
    args.output.parent.mkdir(parents=True, exist_ok=True)
    args.output.write_text(json.dumps(output, indent=2, sort_keys=True) + "\n", encoding="utf-8")
    print(json.dumps(output, indent=2, sort_keys=True))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
