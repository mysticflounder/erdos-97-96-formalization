"""Cross-wave diagnostic sweep of exact-12 Rigid221 next-row arm SAT witnesses.

EMPIRICAL / diagnostic only.  Re-derives order-independent common-five cores
from every preserved SAT witness of the arm CEGAR lane, quotients them by role
relabeling (x<->y), and tests the resulting membership patterns against the 19
banked membership families materialized in the v23 live workdir.

Reuses the production detector machinery from
census.card_head.exact12_v14_ordered_coverage, mirroring
scratch/rigid221-sourceheavy-anchor/mine_exact12_static_canary_all_orders_v23.py
lines 386-424 for cube decoding and all-order core confirmation.  Does NOT run
any workdir validator, solver, or Lean build.
"""

from __future__ import annotations

import hashlib
import json
import sys
from collections import Counter, defaultdict
from collections.abc import Mapping
from pathlib import Path
from typing import Any

REPO = Path("/Users/adam/projects/math-projects/erdos-97-96-formalization")
sys.path.insert(0, str(REPO))

from census.card_head.exact12_v14_ordered_coverage import (  # noqa: E402
    SOURCE_ORDERS,
    _closure_memberships,
    _common_five_orientation,
    _common_five_point_cores,
    _metric_rows,
)
from census.global_confinement import (  # noqa: E402
    cap_selected_nogood_certificate_probe as certificates,
)

ANCHOR = REPO / "scratch" / "rigid221-sourceheavy-anchor"
OUT = ANCHOR / "cross-wave-audit-20260814"
WAVE = ANCHOR / "exact12-next-row-arm-direct-wave-20260811-v2"
LIVE_V22 = REPO / "scratch" / "arm-static-cell6-v22-live-f4f68481-20260812"
LIVE_V23 = REPO / "scratch" / "arm-static-cell6-v23-live-fc0b0f5d-20260814"

N = 12
CORE_KEYS = ("a", "x", "b", "c", "y")

V23_DOMINANT_CORE = {"a": 1, "b": 7, "c": 6, "x": 9, "y": 11}


def _sha256_file(path: Path) -> str:
    return hashlib.sha256(path.read_bytes()).hexdigest()


def _rel(path: Path) -> str:
    return str(path.relative_to(REPO))


# ---------------------------------------------------------------------------
# Corpus enumeration
# ---------------------------------------------------------------------------


def enumerate_corpus() -> tuple[list[dict[str, Any]], list[dict[str, Any]]]:
    """Return (witness_files, skips).  Every corpus entry lands in one list."""

    witnesses: list[dict[str, Any]] = []
    skips: list[dict[str, Any]] = []

    canary_dirs = sorted(
        d for d in ANCHOR.glob("exact12-next-row-arm-static-canary-*") if d.is_dir()
    )
    for d in canary_dirs:
        f = d / "survivor.json"
        if f.is_file():
            witnesses.append({"group": "canary", "dir": d.name, "path": f})
        else:
            contents = sorted(p.name for p in d.iterdir())
            skips.append(
                {
                    "group": "canary",
                    "dir": d.name,
                    "path": _rel(d),
                    "reason": (
                        "no survivor.json; directory contents: "
                        + (", ".join(contents) if contents else "(empty)")
                    ),
                }
            )

    for d in (LIVE_V22, LIVE_V23):
        f = d / "survivor.json"
        if f.is_file():
            witnesses.append({"group": "live", "dir": d.name, "path": f})
        else:
            skips.append(
                {
                    "group": "live",
                    "dir": d.name,
                    "path": _rel(d),
                    "reason": "no survivor.json",
                }
            )

    wave_cells = sorted(d for d in WAVE.glob("cell-*") if d.is_dir())
    for d in wave_cells:
        f = d / "model.json"
        if f.is_file():
            witnesses.append({"group": "wave", "dir": f"{WAVE.name}/{d.name}", "path": f})
        else:
            reason = "no model.json"
            summary = d / "summary.json"
            if summary.is_file():
                try:
                    s = json.loads(summary.read_text(encoding="utf-8"))
                    reason = (
                        "no model.json; summary status="
                        f"{s.get('status')} discovery_verdict={s.get('discovery_verdict')}"
                    )
                except (OSError, json.JSONDecodeError):
                    reason = "no model.json; summary.json unreadable"
            skips.append(
                {
                    "group": "wave",
                    "dir": f"{WAVE.name}/{d.name}",
                    "path": _rel(d),
                    "reason": reason,
                }
            )
    return witnesses, skips


# ---------------------------------------------------------------------------
# Core mining (mirrors mine_exact12_static_canary_all_orders_v23.py:386-424)
# ---------------------------------------------------------------------------


def normalize_core(core: Mapping[str, int]) -> tuple[int, int, int, int, int]:
    """Canonical concrete tuple (a, b, c, min(x,y), max(x,y))."""

    x, y = sorted((int(core["x"]), int(core["y"])))
    return (int(core["a"]), int(core["b"]), int(core["c"]), x, y)


def role_structure(
    core: Mapping[str, int], memberships: tuple[tuple[int, tuple[int, ...]], ...]
) -> tuple[tuple[str, tuple[str, ...]], ...]:
    """Abstract a membership pattern to roles, canonical under x<->y swap.

    Labels outside the five core roles get placeholders o1, o2, ... assigned in
    ascending concrete-label order (deterministic; ties among placeholders are
    broken by concrete label, which is noted in the report as a diagnostic
    approximation).
    """

    variants = []
    for cx, cy in (
        (int(core["x"]), int(core["y"])),
        (int(core["y"]), int(core["x"])),
    ):
        rmap = {
            int(core["a"]): "a",
            int(core["b"]): "b",
            int(core["c"]): "c",
            cx: "x",
            cy: "y",
        }
        noncore = sorted(
            {
                label
                for center, req in memberships
                for label in (center, *req)
                if label not in rmap
            }
        )
        for index, label in enumerate(noncore):
            rmap[label] = f"o{index + 1}"
        pattern = tuple(
            sorted(
                (rmap[center], tuple(sorted(rmap[point] for point in req)))
                for center, req in memberships
            )
        )
        variants.append(pattern)
    return min(variants)


def shape_of(
    structure: tuple[tuple[str, tuple[str, ...]], ...]
) -> tuple[tuple[str, int], ...]:
    return tuple(sorted((center_role, len(req)) for center_role, req in structure))


def mine_witness(cube: Mapping[str, Any]) -> dict[str, Any]:
    """Return per-witness mining result: all-order cores with memberships."""

    rows = _metric_rows(cube)
    raw_cores = _common_five_point_cores(rows)
    anomalies: list[str] = []
    all_order: list[dict[str, Any]] = []
    for raw_core in raw_cores:
        orientations = [
            _common_five_orientation(order, raw_core)
            for _source_orientation, order in SOURCE_ORDERS
        ]
        if not all(orientations):
            continue
        first_orientation = orientations[0]
        stage = (
            "equality-convex-five-point"
            if first_orientation == "forward"
            else "equality-convex-five-point-reverse"
        )
        closure = certificates._certificate_for_detection(
            rows, N, {"stage": stage, "core": dict(raw_core)}
        )
        if certificates._validate_certificate(closure, n=N) is not True:
            anomalies.append(
                f"core {dict(raw_core)}: closure failed equality replay"
            )
            continue
        memberships = _closure_memberships(closure)
        all_order.append(
            {
                "core": {key: int(raw_core[key]) for key in CORE_KEYS},
                "orientation_counts": dict(sorted(Counter(orientations).items())),
                "memberships": [
                    {"center": center, "required": list(points)}
                    for center, points in memberships
                ],
                "_memberships_key": memberships,
            }
        )

    # Dedup by x<->y-normalized concrete core; check membership agreement.
    by_norm: dict[tuple[int, int, int, int, int], list[dict[str, Any]]] = defaultdict(
        list
    )
    for record in all_order:
        by_norm[normalize_core(record["core"])].append(record)
    unique: list[dict[str, Any]] = []
    for norm, records in sorted(by_norm.items()):
        membership_sets = {
            frozenset(
                (center, frozenset(points))
                for center, points in record["_memberships_key"]
            )
            for record in records
        }
        if len(membership_sets) != 1:
            anomalies.append(
                f"normalized core {norm}: x<->y variants disagree on memberships"
            )
        chosen = min(
            records,
            key=lambda record: (record["core"]["x"], record["core"]["y"]),
        )
        structure = role_structure(chosen["core"], chosen["_memberships_key"])
        unique.append(
            {
                "normalized_core": list(norm),
                "core": chosen["core"],
                "orientation_counts": chosen["orientation_counts"],
                "memberships": chosen["memberships"],
                "concrete_pattern": frozenset(
                    (center, frozenset(points))
                    for center, points in chosen["_memberships_key"]
                ),
                "role_structure": structure,
                "shape": shape_of(structure),
                "n_variants": len(records),
            }
        )
    return {
        "n_raw_cores": len(raw_cores),
        "n_all_order_records": len(all_order),
        "unique_cores": unique,
        "anomalies": anomalies,
    }


# ---------------------------------------------------------------------------
# Banked families
# ---------------------------------------------------------------------------


def load_banks() -> list[dict[str, Any]]:
    banks = []
    for path in sorted(LIVE_V23.glob("*_family_bank.json")):
        data = json.loads(path.read_text(encoding="utf-8"))
        patterns = []
        for pattern in data["patterns"]:
            patterns.append(
                frozenset(
                    (int(entry["center"]), frozenset(int(p) for p in entry["support"]))
                    for entry in pattern
                )
            )
        banks.append(
            {
                "file": path.name,
                "family_id": data.get("family_id"),
                "bank_sha256": data.get("bank_sha256"),
                "n_patterns": len(patterns),
                "patterns": patterns,
            }
        )
    return banks


def pattern_exact_match(
    candidate: frozenset, banks: list[dict[str, Any]]
) -> list[str]:
    hits = []
    for bank in banks:
        if any(candidate == q for q in bank["patterns"]):
            hits.append(bank["family_id"])
    return hits


def pattern_covered_match(
    candidate: frozenset, banks: list[dict[str, Any]]
) -> list[str]:
    """Banked pattern Q is implied by the candidate memberships: every entry of
    Q has a candidate entry at the same center whose required set contains it."""

    cand_by_center: dict[int, list[frozenset]] = defaultdict(list)
    for center, req in candidate:
        cand_by_center[center].append(req)
    hits = []
    for bank in banks:
        for q in bank["patterns"]:
            if all(
                any(qs <= r for r in cand_by_center.get(qc, ()))
                for qc, qs in q
            ):
                hits.append(bank["family_id"])
                break
    return hits


def witness_bank_matches(
    cube: Mapping[str, Any], banks: list[dict[str, Any]]
) -> list[str]:
    """Which banked families have a pattern fully realized by the witness cube
    (every pattern entry's support inside the center's selected support)."""

    supports = {int(center): set(points) for center, points in cube.items()}
    hits = []
    for bank in banks:
        for q in bank["patterns"]:
            if all(qs <= supports.get(qc, set()) for qc, qs in q):
                hits.append(bank["family_id"])
                break
    return hits


# ---------------------------------------------------------------------------
# Main sweep
# ---------------------------------------------------------------------------


def main() -> None:
    witnesses, skips = enumerate_corpus()
    banks = load_banks()

    witness_records: list[dict[str, Any]] = []
    decode_skips: list[dict[str, Any]] = list(skips)
    groups: dict[Any, dict[str, Any]] = {}

    for entry in witnesses:
        path: Path = entry["path"]
        record: dict[str, Any] = {
            "group": entry["group"],
            "dir": entry["dir"],
            "path": _rel(path),
            "sha256": _sha256_file(path),
        }
        try:
            data = json.loads(path.read_text(encoding="utf-8"))
        except (OSError, json.JSONDecodeError) as exc:
            decode_skips.append(
                {**{k: record[k] for k in ("group", "dir", "path")},
                 "reason": f"JSON read failed: {exc}"}
            )
            continue
        record["arm_cell_index"] = data.get("arm_cell_index")
        if isinstance(data.get("cell"), dict):
            record["cell"] = data["cell"]
        record["classification"] = data.get("classification")
        cube = data.get("cube")
        if not isinstance(cube, dict) or set(cube) != {str(i) for i in range(N)}:
            decode_skips.append(
                {**{k: record[k] for k in ("group", "dir", "path")},
                 "reason": "witness has no decodable cube (missing or wrong keys)"}
            )
            continue
        try:
            mined = mine_witness(cube)
        except Exception as exc:  # diagnostic sweep: record, do not abort
            decode_skips.append(
                {**{k: record[k] for k in ("group", "dir", "path")},
                 "reason": f"core mining failed: {type(exc).__name__}: {exc}"}
            )
            continue

        record["n_raw_cores"] = mined["n_raw_cores"]
        record["n_all_order_records"] = mined["n_all_order_records"]
        record["n_unique_all_order_cores"] = len(mined["unique_cores"])
        record["anomalies"] = mined["anomalies"]
        record["bank_families_matching_witness_cube"] = witness_bank_matches(
            cube, banks
        )
        cores_out = []
        for core in mined["unique_cores"]:
            structure_key = json.dumps(core["role_structure"])
            group = groups.setdefault(
                structure_key,
                {
                    "role_structure": core["role_structure"],
                    "shape": core["shape"],
                    "witnesses": [],
                    "instances": [],
                    "concrete_patterns": set(),
                },
            )
            group["witnesses"].append(record["path"])
            group["instances"].append(
                {
                    "witness": record["path"],
                    "normalized_core": core["normalized_core"],
                    "memberships": core["memberships"],
                }
            )
            group["concrete_patterns"].add(core["concrete_pattern"])
            cores_out.append(
                {
                    "normalized_core": core["normalized_core"],
                    "core": core["core"],
                    "orientation_counts": core["orientation_counts"],
                    "memberships": core["memberships"],
                    "role_structure": core["role_structure"],
                    "shape": core["shape"],
                    "n_variants": core["n_variants"],
                    "pattern_exact_banked": pattern_exact_match(
                        core["concrete_pattern"], banks
                    ),
                    "pattern_covered_banked": pattern_covered_match(
                        core["concrete_pattern"], banks
                    ),
                }
            )
        record["all_order_cores"] = cores_out
        witness_records.append(record)
        print(
            f"[{record['group']}] {record['dir']}: raw={record['n_raw_cores']} "
            f"all-order-unique={record['n_unique_all_order_cores']}",
            flush=True,
        )

    # Group-level subsumption summary.
    group_rows = []
    for structure_key, group in groups.items():
        patterns = sorted(
            group["concrete_patterns"],
            key=lambda p: sorted((c, sorted(s)) for c, s in p),
        )
        exact_hits = {
            fam for p in patterns for fam in pattern_exact_match(p, banks)
        }
        covered_flags = [bool(pattern_covered_match(p, banks)) for p in patterns]
        covered_hits = {
            fam for p in patterns for fam in pattern_covered_match(p, banks)
        }
        n_covered = sum(covered_flags)
        if n_covered == len(patterns) and patterns:
            status = "SUBSUMED"
        elif n_covered == 0:
            status = "UNSUBSUMED"
        else:
            status = "PARTIAL"
        distinct_witnesses = sorted(set(group["witnesses"]))
        group_rows.append(
            {
                "role_structure": group["role_structure"],
                "shape": group["shape"],
                "n_witnesses": len(distinct_witnesses),
                "n_core_instances": len(group["instances"]),
                "n_distinct_concrete_patterns": len(patterns),
                "n_concrete_patterns_covered_by_banks": n_covered,
                "subsumption_status": status,
                "exact_bank_matches": sorted(exact_hits),
                "covered_bank_matches": sorted(covered_hits),
                "witnesses": distinct_witnesses,
            }
        )
    group_rows.sort(key=lambda row: (-row["n_witnesses"], json.dumps(row["role_structure"])))

    # v23 dominant core cross-wave recurrence.
    v23_path = _rel(LIVE_V23 / "survivor.json")
    dominant_structure = None
    for record in witness_records:
        if record["path"] == v23_path:
            for core in record["all_order_cores"]:
                if core["core"] == {
                    "a": V23_DOMINANT_CORE["a"],
                    "x": min(V23_DOMINANT_CORE["x"], V23_DOMINANT_CORE["y"]),
                    "b": V23_DOMINANT_CORE["b"],
                    "c": V23_DOMINANT_CORE["c"],
                    "y": max(V23_DOMINANT_CORE["x"], V23_DOMINANT_CORE["y"]),
                } or core["normalized_core"] == [
                    V23_DOMINANT_CORE["a"],
                    V23_DOMINANT_CORE["b"],
                    V23_DOMINANT_CORE["c"],
                    min(V23_DOMINANT_CORE["x"], V23_DOMINANT_CORE["y"]),
                    max(V23_DOMINANT_CORE["x"], V23_DOMINANT_CORE["y"]),
                ]:
                    dominant_structure = core["role_structure"]
                    break
    dominant_report: dict[str, Any] = {"core": V23_DOMINANT_CORE}
    if dominant_structure is None:
        dominant_report["error"] = (
            "dominant core not found among v23 survivor all-order cores"
        )
    else:
        dominant_key = json.dumps(dominant_structure)
        other = [
            record
            for record in witness_records
            if record["path"] != v23_path
            and any(
                json.dumps(core["role_structure"]) == dominant_key
                for core in record["all_order_cores"]
            )
        ]
        dominant_report.update(
            {
                "role_structure": dominant_structure,
                "n_other_witnesses_with_structure": len(other),
                "other_witnesses": [record["path"] for record in other],
                "by_group": dict(
                    sorted(Counter(record["group"] for record in other).items())
                ),
            }
        )

    result = {
        "schema": "p97_rigid221_exact12_arm_cross_wave_core_audit.v1",
        "status": "EMPIRICAL diagnostic sweep; no theorem claims",
        "corpus": {
            "n_witness_files_found": len(witnesses),
            "n_witnesses_decoded": len(witness_records),
            "n_skipped": len(decode_skips),
            "by_group_found": dict(
                sorted(Counter(entry["group"] for entry in witnesses).items())
            ),
            "by_group_decoded": dict(
                sorted(Counter(r["group"] for r in witness_records).items())
            ),
            "skips": decode_skips,
        },
        "banks": [
            {k: bank[k] for k in ("file", "family_id", "bank_sha256", "n_patterns")}
            for bank in banks
        ],
        "totals": {
            "n_unique_all_order_cores": sum(
                r["n_unique_all_order_cores"] for r in witness_records
            ),
            "n_role_structure_groups": len(group_rows),
        },
        "recurrence_groups": group_rows,
        "v23_dominant_core": dominant_report,
        "witnesses": witness_records,
    }
    out_path = OUT / "cores.json"
    out_path.write_text(
        json.dumps(result, indent=1, sort_keys=False) + "\n", encoding="utf-8"
    )
    print(f"wrote {out_path}")


if __name__ == "__main__":
    main()
