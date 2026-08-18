"""Cross-cell theorem mine for FreshThird carrier-query wave v1.

The miner authenticates the query manifest, freshly replays every SAT model,
and reports only finite-signature regularities.  A regularity across one model
per boundary cell is a conjecture generator, never a proved invariant.
"""

from __future__ import annotations

import argparse
import json
import os
from collections.abc import Sequence
from pathlib import Path
from typing import Any

from census.p97_search.freshthird_qfiber_three_carrier_query_v1 import (
    Q_SOURCES,
    RESULT_SCHEMA,
    ROLES,
    ROWS,
    _canonical_json,
    replay_sat_result,
    source_manifest,
)

MINE_SCHEMA = "p97-freshthird-qfiber-three-carrier-mine/v1"


def _atomic_json(path: Path, value: object) -> None:
    path.parent.mkdir(parents=True, exist_ok=True)
    tmp = path.with_name(f".{path.name}.{os.getpid()}.tmp")
    with tmp.open("wb") as stream:
        stream.write(_canonical_json(value))
        stream.flush()
        os.fsync(stream.fileno())
    os.replace(tmp, path)


def _load_json(path: Path) -> dict[str, Any]:
    value = json.loads(path.read_text())
    if type(value) is not dict:
        raise ValueError(f"expected JSON object: {path}")
    return value


def _load_wave_manifest(wave_root: Path) -> dict[str, Any]:
    candidates = ["manifest.json", "wave_manifest.json", "run_manifest.json"]
    for filename in candidates:
        path = wave_root / filename
        if path.exists():
            return _load_json(path)
    raise FileNotFoundError(f"no manifest found under {wave_root}")


def _as_wave_root(wave_dir: Path) -> Path:
    wave_root = wave_dir
    if (wave_root / "manifest.json").exists():
        return wave_root
    if (wave_root / "artifacts").exists() and (wave_root / "artifacts").is_dir():
        wave_root = wave_root / "artifacts"
    if (
        not (wave_root / "wave_manifest.json").exists()
        and not (wave_root / "manifest.json").exists()
        and not (wave_root / "run_manifest.json").exists()
    ):
        raise FileNotFoundError(f"no wave manifest found in {wave_root}")
    _load_wave_manifest(wave_root)
    return wave_root


def _classes(signature: dict[str, Any]) -> dict[str, int]:
    classes = signature.get("point_classes")
    if type(classes) is not dict or set(classes) != set(ROLES):
        raise ValueError("incomplete point-class signature")
    if not all(type(value) is int for value in classes.values()):
        raise ValueError("non-integer point class")
    return classes


def _incident(classes: dict[str, int], role: str, row: str) -> bool:
    return classes[role] in {classes[slot] for slot in ROWS[row][1]}


def _overlap(classes: dict[str, int], left: str, right: str) -> int:
    return sum(_incident(classes, role, right) for role in ROWS[left][1])


def _has_four(signature: dict[str, Any], deleted: str, center: str) -> bool:
    values = signature["has_four_after_deleting"][center]
    return values[ROLES.index(deleted)]


def _boundary_fan_normalized_witnesses(
    signature: dict[str, Any], classes: dict[str, int]
) -> dict[str, object]:
    interiors = signature["in_cap_interior"]
    caps = signature["in_cap"]
    order = signature["order"]
    base_center = "boundaryBlockerCenter"
    center_indices = [
        i
        for i in range(4)
        if classes[f"boundaryFanBlockerCenter{i}"] == classes[base_center]
    ]
    repeated = []
    mutual = []
    for i in range(4):
        for j in range(i + 1, 4):
            ci = f"boundaryFanBlockerCenter{i}"
            cj = f"boundaryFanBlockerCenter{j}"
            si = f"boundaryRowSource{i}"
            sj = f"boundaryRowSource{j}"
            same_center = classes[ci] == classes[cj]
            survives_ji = _has_four(signature, sj, ci)
            survives_ij = _has_four(signature, si, cj)
            for cap in range(3):
                if (
                    interiors[ci][cap]
                    and interiors[cj][cap]
                    and (same_center or survives_ji or survives_ij)
                ):
                    repeated.append(
                        {
                            "i": i,
                            "j": j,
                            "cap": cap,
                            "same_center": same_center,
                            "j_survives_at_i": survives_ji,
                            "i_survives_at_j": survives_ij,
                            "source_caps": {
                                "i": caps[si],
                                "j": caps[sj],
                            },
                            "row_cap_counts": {
                                "i": [
                                    sum(caps[slot][candidate] for slot in ROWS[f"boundaryFanBlocker{i}"][1])
                                    for candidate in range(3)
                                ],
                                "j": [
                                    sum(caps[slot][candidate] for slot in ROWS[f"boundaryFanBlocker{j}"][1])
                                    for candidate in range(3)
                                ],
                            },
                            "boundary_order": {
                                "center_i": order[ci],
                                "center_j": order[cj],
                                "source_i": order[si],
                                "source_j": order[sj],
                            },
                        }
                    )
            if not same_center and survives_ji and survives_ij:
                mutual.append({"i": i, "j": j})
    return {
        "center_blocker_indices": center_indices,
        "repeated_cap_pairs": repeated,
        "mutual_cross_pairs": mutual,
    }


def focal_metrics(result: dict[str, Any]) -> dict[str, object]:
    signature = result["model_signature"]
    classes = _classes(signature)
    boundary_index = result["boundary_index"]
    boundary_source = Q_SOURCES[boundary_index]
    fiber_sources = tuple(
        source for i, source in enumerate(Q_SOURCES) if i != boundary_index
    )
    return {
        "pinned_q_overlap": _overlap(classes, "fan", "q"),
        "boundary_source_in_pinned_fan": _incident(classes, boundary_source, "fan"),
        "q_fiber_sources_in_pinned_fan": sum(
            _incident(classes, source, "fan") for source in fiber_sources
        ),
        "pinned_boundary_blocker_overlap": _overlap(
            classes, "fan", "boundaryBlocker"
        ),
        "q_boundary_blocker_overlap": _overlap(classes, "q", "boundaryBlocker"),
        "boundary_blocker_center_aliases_pinned": classes[
            "boundaryBlockerCenter"
        ]
        == classes["pinnedCenter"],
        "second_order_center_alias_count": sum(
            classes[f"boundaryFanBlockerCenter{i}"]
            == classes["boundaryBlockerCenter"]
            for i in range(4)
        ),
        "boundary_fan_normalized": _boundary_fan_normalized_witnesses(
            signature, classes
        ),
        "row_overlap_matrix": {
            f"{left}|{right}": _overlap(classes, left, right)
            for left in sorted(ROWS)
            for right in sorted(ROWS)
            if left < right
        },
    }


def _cell_model_record(raw: dict[str, Any], *, boundary_index: int) -> dict[str, Any]:
    """Extract the actual model record to replay/fingerprint from heterogeneous payloads."""
    raw_status = raw.get("status")
    raw_boundary = raw.get("boundary_index")
    if raw_boundary not in {boundary_index, str(boundary_index)}:
        raise ValueError(f"cell {boundary_index} index mismatch")

    if raw.get("schema") == RESULT_SCHEMA:
        if raw_status != "SAT_ABSTRACTION":
            raise ValueError(f"cell {boundary_index} has unexpected status")
        if raw.get("boundary_index") != boundary_index:
            raise ValueError(f"cell {boundary_index} index mismatch")
        return raw

    model = raw.get("model_result")
    if type(model) is not dict:
        raise ValueError(f"cell {boundary_index} result schema mismatch")
    if model.get("schema") != RESULT_SCHEMA:
        raise ValueError(f"cell {boundary_index} result schema mismatch")
    model_status = model.get("status")
    if model_status != "SAT_ABSTRACTION":
        raise ValueError(f"cell {boundary_index} has unexpected model status")
    model_boundary = model.get("boundary_index")
    if model_boundary != boundary_index:
        raise ValueError(f"cell {boundary_index} model boundary mismatch")
    return model


def _flatten(prefix: str, value: object, out: dict[str, object]) -> None:
    if type(value) is dict:
        for key in sorted(value):
            _flatten(f"{prefix}.{key}" if prefix else key, value[key], out)
    else:
        out[prefix] = value


def mine_wave(
    wave_dir: Path,
    *,
    replay_timeout_ms: int = 60_000,
    skip_replay: bool = False,
    skip_manifest_check: bool = False,
) -> dict[str, object]:
    wave_root = _as_wave_root(wave_dir)
    manifest = _load_wave_manifest(wave_root)
    if not skip_manifest_check and manifest != source_manifest():
        raise ValueError("wave manifest does not match current source")

    results = []
    for boundary_index in range(4):
        cell_file = wave_root / f"cell-{boundary_index}.json"
        if not cell_file.exists():
            cell_file = wave_root / f"cell-{boundary_index}" / "result.json"
        if not cell_file.exists():
            raise ValueError(f"missing result file for cell {boundary_index}")
        result = _load_json(cell_file)
        model = _cell_model_record(result, boundary_index=boundary_index)
        if result.get("status") == "SAT_ABSTRACTION":
            sat_status = model
        else:
            sat_status = None
        if result.get("status") == "SAT_ABSTRACTION" and not skip_replay:
            replay_sat_result(model, timeout_ms=replay_timeout_ms)
        results.append((result, sat_status))

    sat_results = [item[1] for item in results if item[1] is not None]
    metrics_by_cell = {
        str(item["boundary_index"]): focal_metrics(item) for item in sat_results
    }
    flattened: dict[str, dict[str, object]] = {}
    for cell, metrics in metrics_by_cell.items():
        flat: dict[str, object] = {}
        _flatten("", metrics, flat)
        flattened[cell] = flat

    common: dict[str, object] = {}
    varying: dict[str, dict[str, object]] = {}
    if flattened:
        keys = set.intersection(*(set(item) for item in flattened.values()))
        for key in sorted(keys):
            by_cell = {cell: flat[key] for cell, flat in flattened.items()}
            values = list(by_cell.values())
            if all(value == values[0] for value in values[1:]):
                common[key] = values[0]
            else:
                varying[key] = by_cell

    complete = len(sat_results) == 4
    candidate_status = (
        "HEURISTIC_ALL_BOUNDARY_MODEL_INVARIANT"
        if complete
        else "HEURISTIC_RESOLVED_CELL_REGULARITY"
    )
    focal_candidates = []
    for key in (
        "pinned_q_overlap",
        "boundary_source_in_pinned_fan",
        "q_fiber_sources_in_pinned_fan",
        "pinned_boundary_blocker_overlap",
        "q_boundary_blocker_overlap",
        "second_order_center_alias_count",
    ):
        if key in common:
            focal_candidates.append(
                {
                    "metric": key,
                    "observed_value": common[key],
                    "status": candidate_status,
                    "source_proved": False,
                    "lean_consumer_bound": False,
                }
            )

    return {
        "schema": MINE_SCHEMA,
        "wave": str(wave_root),
        "cell_statuses": {
            str(raw["boundary_index"]): raw["status"] for raw, _ in results
        },
        "sat_cells_replayed": sorted(metrics_by_cell),
        "all_boundary_cells_sat_replayed": complete,
        "metrics_by_cell": metrics_by_cell,
        "common_model_regularities": common,
        "varying_model_features": varying,
        "focal_candidates": focal_candidates,
        "promotion_ready": False,
        "next_gate": (
            "Enumerate a second disjoint signature in every SAT cell before "
            "treating any regularity as a source-theorem target."
        ),
    }


def main(argv: Sequence[str] | None = None) -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--wave-dir", type=Path, required=True)
    parser.add_argument("--out", type=Path)
    parser.add_argument("--replay-timeout-ms", type=int, default=60_000)
    parser.add_argument("--skip-replay", action="store_true")
    parser.add_argument("--skip-manifest-check", action="store_true")
    args = parser.parse_args(argv)
    report = mine_wave(
        args.wave_dir,
        replay_timeout_ms=args.replay_timeout_ms,
        skip_replay=args.skip_replay,
        skip_manifest_check=args.skip_manifest_check,
    )
    if args.out is not None:
        _atomic_json(args.out, report)
    print(json.dumps(report, sort_keys=True))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
