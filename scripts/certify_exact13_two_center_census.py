# Copyright (c) 2026 Adam McKenna. All rights reserved.
# Released under GPL-3.0-or-later as described in the file LICENSE.

"""Exact two/three-center census for the G2-uncertified quotient groups."""

from __future__ import annotations

import argparse
import hashlib
import json
import os
from collections import Counter
from concurrent.futures import ProcessPoolExecutor
from pathlib import Path

import check_exact13_global_obstructions as obstruction
import solve_exact13_quotient_cones as cone

SCHEMA = "exact13-two-center-census/v2"
LANE_ID = "exact13-two-center-census-20260906"
ROOT = Path("scratch/runs/exact13-two-center-census-20260906/run-0001")
OUTPUT = ROOT / "exact13-two-center-census.json"
RUN_MANIFEST = ROOT / "run_manifest.json"
G2_REPORT = Path("docs/audits/2026-09-06-exact13-global-obstructions.json")
G2_SHA256 = "c893a56f52439557f4e5ed567686359d6eea9aac1f2141d42ef7771d5975ec5b"
G2_INPUT_SHA256 = "4e2c1ff2ce9ec35a51c83f8609d73ce122ffd3b16ce9d4f9787a32557723436c"
PRIORITY = (2, 7, 6, 3, 4, 5, 9, 10, 11, 12)
SUPPORTS = 495
FORM_COUNT = 1430
RAW_VECTORS = obstruction.RAW_VECTORS


def require(condition: bool, message: str) -> None:
    if not condition:
        raise ValueError(message)


def digest(value: object) -> str:
    return hashlib.sha256(
        json.dumps(value, sort_keys=True, separators=(",", ":")).encode()
    ).hexdigest()


def sha256_path(path: Path) -> str:
    return hashlib.sha256(path.read_bytes()).hexdigest()


def source_pins() -> dict[str, str]:
    repo_root = Path(__file__).resolve().parents[1]
    paths = (
        Path(__file__),
        Path(obstruction.__file__),
        Path(cone.__file__),
        Path(obstruction.base.__file__),
    )
    return {
        str(path.resolve().relative_to(repo_root)): sha256_path(path)
        for path in sorted(set(paths))
    }


def check_run_manifest() -> dict[str, object]:
    require(RUN_MANIFEST.is_file(), "missing governed run manifest")
    manifest = json.loads(RUN_MANIFEST.read_text())
    require(manifest.get("schema") == "worktree-run-manifest/v1", "manifest schema")
    require(manifest.get("lane_id") == LANE_ID, "manifest lane")
    require(manifest.get("root") == str(ROOT), "manifest root")
    claimed = manifest.get("manifest_sha256")
    unsigned = {key: value for key, value in manifest.items() if key != "manifest_sha256"}
    require(claimed == digest(unsigned), "run manifest self hash")
    for path, expected in manifest.get("source_digests", {}).items():
        require(sha256_path(Path(path)) == expected, f"source drift: {path}")
    for path, expected in manifest.get("input_digests", {}).items():
        require(sha256_path(Path(path)) == expected, f"input drift: {path}")
    return manifest


def records_and_groups() -> tuple[list[dict[str, object]], list[list[int]]]:
    raw = cone.INPUT.read_bytes()
    require(sha256_path(cone.INPUT) == cone.INPUT_SHA256, "baseline input changed")
    require(sha256_path(G2_REPORT) == G2_SHA256, "G2 report changed")
    report = json.loads(G2_REPORT.read_text())
    require(report.get("input_sha256") == G2_INPUT_SHA256, "G2 baseline pin")
    require(report.get("cone_sha256") == obstruction.CONE_SHA256, "G2 cone pin")
    require(report.get("schema") == obstruction.SCHEMA, "G2 schema")
    records = json.loads(raw)["survivors"]
    groups = cone_completion_groups(records)
    exhausted = {
        entry["record_index"]
        for entry in report.get("entries", [])
        if entry.get("status") == "EXHAUSTED"
    }
    remaining = [group for group in groups if group[0] not in exhausted]
    require(len(groups) == 234 and len(remaining) == 197, "G2-uncertified universe changed")
    return records, remaining


def cone_completion_groups(records: list[dict[str, object]]) -> list[list[int]]:
    full_cone_input = obstruction.CONE_INPUT
    raw = full_cone_input.read_bytes()
    require(sha256_path(full_cone_input) == obstruction.CONE_SHA256, "full-cone input changed")
    groups: dict[object, list[int]] = {}
    for entry in json.loads(raw)["entries"]:
        certificate = entry.get("certificate")
        if not isinstance(certificate, dict) or certificate.get("kind") != "distance":
            continue
        for index in entry["indices"]:
            record = records[index]
            roots = obstruction.base.edge_roots_for_rows(cone.rows_of(record))
            active = obstruction.completion.active_centers(record)
            key = (tuple(sorted(roots.items())), active)
            groups.setdefault(key, []).append(index)
    return list(groups.values())


def active_pair(record: dict[str, object]) -> tuple[int, int]:
    active = obstruction.completion.active_centers(record)
    selected = tuple(center for center in PRIORITY if center in active)
    require(len(selected) >= 2, "fewer than two active centers")
    return selected[:2]


def third_center(record: dict[str, object], selected: tuple[int, int]) -> int:
    active = obstruction.completion.active_centers(record)
    choices = tuple(center for center in PRIORITY if center in active and center not in selected)
    require(choices, "no active third center")
    return choices[0]


def rows_of(record: dict[str, object]) -> tuple[tuple[str, int, tuple[int, ...]], ...]:
    return cone.rows_of(record)


def projected_vectors(roots: dict[tuple[int, int], tuple[int, int]]):
    projected = []
    for vector in RAW_VECTORS:
        total: Counter[tuple[int, int]] = Counter()
        for edge, coefficient in vector.items():
            total[roots[edge]] += coefficient
        projected.append(tuple(sorted((edge, coefficient) for edge, coefficient in total.items() if coefficient)))
    return tuple(projected)


def certificate(record: dict[str, object], rows: tuple[tuple[str, int, tuple[int, ...]], ...]):
    roots = obstruction.base.edge_roots_for_rows(rows)
    return obstruction._certificate(projected_vectors(roots))


def scan_center(record: dict[str, object], center: int) -> tuple[dict[str, object], tuple[tuple[int, ...], ...]]:
    entries = []
    survivors = []
    counts = Counter()
    base_rows = rows_of(record)
    for support in obstruction.supports(center):
        cert = certificate(record, (*base_rows, (f"G{center}", center, support)))
        if cert is None:
            survivors.append(support)
            entries.append({"support": list(support), "status": "SURVIVES"})
        else:
            kind = "one_form" if len(cert["forms"]) == 1 else "two_form"
            counts[kind] += 1
            entries.append({"support": list(support), "status": "REJECTED", "certificate": cert})
    require(len(entries) == SUPPORTS, f"center {center} coverage")
    table = {
        "supports": entries,
        "rejected": len(entries) - len(survivors),
        "survivors": [list(support) for support in survivors],
        "counts": {"one_form": counts["one_form"], "two_form": counts["two_form"], "survivors": len(survivors), "covered": SUPPORTS},
    }
    return table, tuple(survivors)


def pair_closure(
    record: dict[str, object], centers: tuple[int, int], left: tuple[tuple[int, ...], ...], right: tuple[tuple[int, ...], ...]
) -> tuple[list[dict[str, object]], list[dict[str, object]]]:
    cancellations = []
    unresolved = []
    for support_left in left:
        for support_right in right:
            rows = (*rows_of(record), (f"G{centers[0]}", centers[0], support_left), (f"G{centers[1]}", centers[1], support_right))
            cert = certificate(record, rows)
            pair = {"support_left": list(support_left), "support_right": list(support_right)}
            if cert is None:
                unresolved.append(pair)
            else:
                cancellations.append({**pair, "certificate": cert})
    return cancellations, unresolved


def scan_third_center(
    record: dict[str, object],
    centers: tuple[int, int],
    pair: dict[str, object],
    center: int,
) -> tuple[dict[str, object], tuple[tuple[int, ...], ...]]:
    support_left = tuple(pair["support_left"])
    support_right = tuple(pair["support_right"])
    fixed_rows = (
        *rows_of(record),
        (f"G{centers[0]}", centers[0], support_left),
        (f"G{centers[1]}", centers[1], support_right),
    )
    entries = []
    survivors = []
    counts = Counter()
    for support in obstruction.supports(center):
        cert = certificate(record, (*fixed_rows, (f"G{center}", center, support)))
        if cert is None:
            survivors.append(support)
            entries.append({"support": list(support), "status": "SURVIVES"})
        else:
            kind = "one_form" if len(cert["forms"]) == 1 else "two_form"
            counts[kind] += 1
            entries.append({"support": list(support), "status": "REJECTED", "certificate": cert})
    require(len(entries) == SUPPORTS, f"third center {center} coverage")
    table = {
        "center": center,
        "support_left": list(support_left),
        "support_right": list(support_right),
        "supports": entries,
        "rejected": len(entries) - len(survivors),
        "survivors": [list(support) for support in survivors],
        "counts": {"one_form": counts["one_form"], "two_form": counts["two_form"], "survivors": len(survivors), "covered": SUPPORTS},
    }
    return table, tuple(survivors)


def census_group(task: tuple[list[dict[str, object]], list[int]]) -> dict[str, object]:
    records, indices = task
    record = records[indices[0]]
    centers = active_pair(record)
    tables = {}
    survivors = {}
    for center in centers:
        tables[str(center)], survivors[center] = scan_center(record, center)
    cancellations, unresolved = pair_closure(record, centers, survivors[centers[0]], survivors[centers[1]])
    third = []
    if unresolved:
        center = third_center(record, centers)
        residual_pairs = unresolved
        for pair in residual_pairs:
            table, third_survivors = scan_third_center(record, centers, pair, center)
            third.append(table)
            pair["third_center"] = center
            pair["third_survivors"] = [list(support) for support in third_survivors]
        closed = all(not item["survivors"] for item in third)
        status = "THREE_CENTER_CLOSED" if closed else "UNRESOLVED"
        if closed:
            unresolved = []
    else:
        status = "TWO_CENTER_CLOSED"
    return {
        "record_index": indices[0],
        "indices": indices,
        "active_centers": list(obstruction.completion.active_centers(record)),
        "selected_centers": list(centers),
        "centers": tables,
        "pair_cancellations": cancellations if not unresolved else [],
        "unresolved_survivor_pairs": unresolved,
        "third_center_tables": third,
        "status": status,
    }


def manifest_source_inputs() -> tuple[dict[str, str], dict[str, str]]:
    return (
        source_pins(),
        {
            str(cone.INPUT): sha256_path(cone.INPUT),
            str(obstruction.CONE_INPUT): sha256_path(obstruction.CONE_INPUT),
            str(G2_REPORT): sha256_path(G2_REPORT),
        },
    )


def produce(workers: int) -> dict[str, object]:
    manifest = check_run_manifest()
    records, groups = records_and_groups()
    require(workers >= 1, "workers must be positive")
    tasks = [(records, indices) for indices in groups]
    if workers == 1:
        entries = [census_group(task) for task in tasks]
    else:
        with ProcessPoolExecutor(max_workers=workers) as pool:
            entries = list(pool.map(census_group, tasks))
    entries.sort(key=lambda entry: entry["record_index"])
    source_digests, input_digests = manifest_source_inputs()
    report: dict[str, object] = {
        "schema": SCHEMA,
        "lane_id": LANE_ID,
        "owner": "Kant",
        "base_head": manifest["base_head"],
        "scope": "197 G2-uncertified quotient groups; exact projected full-cone replay at two centers, then a third center for residual pairs",
        "input_digests": input_digests,
        "source_pins": source_digests,
        "record_count": len(entries),
        "form_count": FORM_COUNT,
        "support_count_per_center": SUPPORTS,
        "entries": entries,
    }
    report["self_sha256"] = digest(report)
    OUTPUT.parent.mkdir(parents=True, exist_ok=True)
    OUTPUT.write_text(json.dumps(report, sort_keys=True, indent=2) + "\n")
    return report


def verify(path: Path, workers: int) -> dict[str, object]:
    manifest = check_run_manifest()
    report = json.loads(path.read_text())
    claimed = report.pop("self_sha256", None)
    require(claimed == digest(report), "report self hash")
    require(report.get("schema") == SCHEMA and report.get("lane_id") == LANE_ID, "report header")
    require(report.get("owner") == "Kant" and report.get("record_count") == 197, "report scope")
    source_digests, input_digests = manifest_source_inputs()
    require(report.get("source_pins") == source_digests, "report source pins")
    require(report.get("input_digests") == input_digests, "report input pins")
    records, groups = records_and_groups()
    tasks = [(records, indices) for indices in groups]
    if workers == 1:
        expected = [census_group(task) for task in tasks]
    else:
        with ProcessPoolExecutor(max_workers=workers) as pool:
            expected = list(pool.map(census_group, tasks))
    expected.sort(key=lambda entry: entry["record_index"])
    require(report.get("entries") == expected, "report census mismatch")
    report["self_sha256"] = claimed
    require(manifest.get("base_head") == report.get("base_head"), "base head mismatch")
    return report


def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument("--verify", type=Path)
    parser.add_argument("--workers", type=int, default=min(8, os.cpu_count() or 1))
    args = parser.parse_args()
    report = verify(args.verify, args.workers) if args.verify else produce(args.workers)
    statuses = Counter(entry["status"] for entry in report["entries"])
    unresolved = sum(len(entry["unresolved_survivor_pairs"]) for entry in report["entries"])
    print(json.dumps({"verified": args.verify is not None, "groups": len(report["entries"]), "statuses": statuses, "unresolved_pairs": unresolved, "self_sha256": report["self_sha256"]}, sort_keys=True))


if __name__ == "__main__":
    main()
