#!/usr/bin/env python3
"""Independent replay of the direct-schema coverage checkpoint."""

from __future__ import annotations

import hashlib
import importlib.util
import json
import sys
from pathlib import Path
from typing import Any


HERE = Path(__file__).resolve().parent
ROOT = HERE.parents[2]
DRIVER = HERE / "direct_schema_coverage.py"
CHECKPOINT = HERE / "direct_schema_coverage_checkpoint.json"
EXPECTED_CHECKPOINT_SHA256 = (
    "f3d36762c63be39b77aaaae2d2de34199eeffca4cbc5cdad8e919e8f444d182a"
)
EXPECTED_ROW_SHA256 = (
    "946943a5b4f16f2649ed5802dbc48419c3a3a19c81d77576719c981198dc445e"
)
EXPECTED_BLOCKER_SHA256 = (
    "b210bdbe92a5e3eddd89ed552507d8b15f78461b55856b903384940fe59beafe"
)

if str(ROOT) not in sys.path:
    sys.path.insert(0, str(ROOT))


def load_module(path: Path, name: str) -> Any:
    spec = importlib.util.spec_from_file_location(name, path)
    if spec is None or spec.loader is None:
        raise RuntimeError(f"cannot import {path}")
    module = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(module)
    return module


driver = load_module(DRIVER, "p97_direct_kalmanson_artifact_verifier")


def canonical_sha256(value: object) -> str:
    return hashlib.sha256(
        json.dumps(value, sort_keys=True, separators=(",", ":")).encode()
    ).hexdigest()


def main() -> int:
    checkpoint_bytes = CHECKPOINT.read_bytes()
    checkpoint_sha256 = hashlib.sha256(checkpoint_bytes).hexdigest()
    if checkpoint_sha256 != EXPECTED_CHECKPOINT_SHA256:
        raise SystemExit("direct-schema checkpoint hash drift")
    state = json.loads(checkpoint_bytes)
    if state.get("source_sha256") != driver.source_hashes():
        raise SystemExit("direct-schema source hash drift")
    if state.get("status") != "SAT_DIRECT_SCHEMA_AVOIDING_CORRECTED_SHADOW":
        raise SystemExit("direct-schema terminal status drift")
    if len(state["direct_schema_cuts"]) != 51:
        raise SystemExit("direct-schema cut count drift")
    if len(state["verified_witnesses"]) != 52:
        raise SystemExit("direct-schema witness count drift")

    surface = driver.bank.robust.Surface()
    matched = 0
    avoided = 0
    for ordinal, witness in enumerate(state["verified_witnesses"], start=1):
        blockers = {
            surface.by_name[source]: surface.by_name[center]
            for source, center in witness["blockers"].items()
        }
        exact_centers = frozenset(blockers.values())
        rows = []
        for named in witness["rows"]:
            center = surface.by_name[named["center"]]
            support = frozenset(
                surface.by_name[label] for label in named["support"]
            )
            index = int(named["candidate_index"])
            if support != surface.candidates[center][index]:
                raise SystemExit("stored witness candidate/support drift")
            rows.append(
                driver.bank.shadow.ClassRow(
                    f"verify:{center}",
                    center,
                    support,
                    exact=center in exact_centers,
                )
            )
        rows_tuple = tuple(rows)
        ok, reason = surface.verify_model(rows_tuple, blockers)
        if not ok:
            raise SystemExit(f"stored witness failed structural verifier: {reason}")
        matches = driver.direct_matches(surface, rows_tuple)
        if list(matches) != witness["direct_matches"]:
            raise SystemExit("stored witness direct-schema scan drift")
        if matches:
            matched += 1
        else:
            avoided += 1
            if ordinal != 52:
                raise SystemExit("nonterminal witness unexpectedly avoids schema")

    terminal = state["last_event"]
    if canonical_sha256(terminal["rows"]) != EXPECTED_ROW_SHA256:
        raise SystemExit("terminal row hash drift")
    if canonical_sha256(terminal["blockers"]) != EXPECTED_BLOCKER_SHA256:
        raise SystemExit("terminal blocker hash drift")
    print(
        json.dumps(
            {
                "checkpoint_sha256": checkpoint_sha256,
                "cuts": len(state["direct_schema_cuts"]),
                "matched_witnesses": matched,
                "schema_avoiding_witnesses": avoided,
                "structural_verifier_replays": matched + avoided,
                "status": state["status"],
            },
            sort_keys=True,
        )
    )
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
