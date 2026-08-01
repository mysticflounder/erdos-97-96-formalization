"""Strictly project legacy Phase-3 raw/survivor assignments from (s,b,f) to (s,f).

This is a migration/audit artifact, not a learned-bank adapter.  Records without
a complete semantic assignment (including certificate-only bootstrap records)
are refused.  The Phase-3 driver likewise refuses legacy learned banks in
projected-static-v2 mode.
"""

from __future__ import annotations

import argparse
import hashlib
import importlib
import json
import sys
from pathlib import Path
from typing import Any

ROOT = Path(__file__).resolve().parents[2]
SEARCH = ROOT / "census/p97_search"
for directory in (ROOT, SEARCH):
    if str(directory) not in sys.path:
        sys.path.insert(0, str(directory))

cegar = importlib.import_module("phase3_structural_cegar")


SCHEMA = "p97-phase3-projected-assignment-bank-v2"


def _canonical_bytes(value: Any) -> bytes:
    return json.dumps(
        value, sort_keys=True, separators=(",", ":"), allow_nan=False
    ).encode("utf-8")


def _sha256_bytes(value: bytes) -> str:
    return hashlib.sha256(value).hexdigest()


def materialize(source: Path) -> dict[str, Any]:
    legacy = cegar.sat.SatEncoding(cegar.CELL, blocker=True, cap=True)
    projected = cegar.sat.SatEncoding(
        cegar.CELL,
        blocker=True,
        cap=True,
        project_blockers=True,
        static_dual2=True,
        mincut_scope=cegar.sat.MINCUT_SCOPE_CARD_GE_TEN,
    )
    expected_legacy_names = {
        legacy.semantic_name(variable) for variable in legacy.semantic_vars
    }
    expected_projected_names = {
        projected.semantic_name(variable) for variable in projected.semantic_vars
    }
    grouped: dict[str, dict[str, Any]] = {}
    for index, raw in enumerate(source.read_bytes().splitlines()):
        if not raw.strip():
            raise ValueError(f"{source}:{index + 1}: blank line")
        record = json.loads(raw)
        semantic = record.get("semantic_assignment")
        if not isinstance(semantic, dict):
            raise TypeError(
                f"{source}:{index + 1}: certificate-only/partial learned record "
                "cannot be projected for reuse"
            )
        if set(semantic) != expected_legacy_names:
            raise ValueError(
                f"{source}:{index + 1}: legacy semantic variable set mismatch"
            )
        legacy_assignment = legacy.assignment_from_record(record)
        legacy.decode(legacy_assignment)
        projected_semantic = {
            name: value
            for name, value in semantic.items()
            if not name.startswith("b[")
        }
        if set(projected_semantic) != expected_projected_names:
            raise ValueError(
                f"{source}:{index + 1}: projected semantic variable set mismatch"
            )
        projected_assignment = projected.assignment_from_record(
            {"semantic_assignment": projected_semantic}
        )
        decoded = projected.decode(projected_assignment)
        assert decoded.blocker is not None
        digest = _sha256_bytes(_canonical_bytes(projected_semantic))
        entry = grouped.setdefault(
            digest,
            {
                "projected_assignment_sha256": digest,
                "semantic_assignment": projected_semantic,
                "canonical_blocker_c": list(decoded.blocker.c),
                "source_indices": [],
            },
        )
        entry["source_indices"].append(index)

    entries = []
    for digest in sorted(grouped):
        entry = grouped[digest]
        entries.append(
            {
                **entry,
                "source_multiplicity": len(entry["source_indices"]),
            }
        )
    return {
        "schema": SCHEMA,
        "source": str(source.resolve()),
        "source_sha256": _sha256_bytes(source.read_bytes()),
        "source_record_count": sum(
            1 for line in source.read_bytes().splitlines() if line.strip()
        ),
        "projected_record_count": len(entries),
        "multiplicities": sorted(
            (entry["source_multiplicity"] for entry in entries),
            reverse=True,
        ),
        "encoding_configuration": projected.configuration(),
        "reuse_policy": (
            "audit/materialization only; not a learned-certificate bank and not "
            "accepted by phase3_structural_cegar.py as bootstrap input"
        ),
        "entries": entries,
    }


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("source", type=Path)
    parser.add_argument("output", type=Path)
    args = parser.parse_args()
    if args.output.exists():
        raise SystemExit(f"refusing to overwrite {args.output}")
    result = materialize(args.source)
    args.output.parent.mkdir(parents=True, exist_ok=True)
    args.output.write_bytes(json.dumps(result, indent=2, sort_keys=True).encode() + b"\n")
    print(
        json.dumps(
            {
                "output": str(args.output),
                "source_record_count": result["source_record_count"],
                "projected_record_count": result["projected_record_count"],
                "multiplicities": result["multiplicities"],
            },
            sort_keys=True,
        )
    )
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
