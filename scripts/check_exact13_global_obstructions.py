# Copyright (c) 2026 Adam McKenna. All rights reserved.
# Released under GPL-3.0-or-later as described in the file LICENSE.
# Author: Adam McKenna <adam@mysticflounder.ai>

"""Bounded exact one/two-form obstruction census for fixed five-row groups.

This is a finite integer replay.  It never invokes a solver: each candidate
global row is added to the five pinned base equalities, and every projected
Kalmanson form is checked for a zero form or a positive two-form cancellation.
"""

from __future__ import annotations

import argparse
import hashlib
import itertools
import json
import math
import time
from collections import Counter
from pathlib import Path

import solve_exact13_global_completion as completion

cone = completion.cone
base = completion.base
require = completion.require

SCHEMA = "exact13-global-obstructions/v1"
INPUT = cone.INPUT
INPUT_SHA256 = cone.INPUT_SHA256
CONE_INPUT = completion.CONE_INPUT
CONE_SHA256 = completion.CONE_SHA256
ROOT = Path("scratch/runs/exact13-quotient-classification-20260905/global-0001")
DEFAULT_OUTPUT = ROOT / "artifacts" / "global-obstructions.json"
SUPPORTS = 495
FORM_COUNT = 1430


def _sha256(path: Path) -> str:
    return hashlib.sha256(path.read_bytes()).hexdigest()


def source_pins() -> dict[str, str]:
    return {
        "scripts/check_exact13_global_obstructions.py": _sha256(Path(__file__)),
        "scripts/cardge13_exact13_global_source_cell_csp_piqd.py": _sha256(
            Path(base.__file__)
        ),
        "scripts/solve_exact13_quotient_cones.py": _sha256(Path(cone.__file__)),
        "scripts/solve_exact13_global_completion.py": _sha256(
            Path(completion.__file__)
        ),
    }


def supports(center: int) -> tuple[tuple[int, ...], ...]:
    require(0 <= center < 13, "invalid center")
    return tuple(itertools.combinations((p for p in range(13) if p != center), 4))


def _raw_vectors() -> tuple[dict[tuple[int, int], int], ...]:
    vectors = []
    for form in base.kalmanson_forms(base.DIRECT_ORDER):
        vector: Counter[tuple[int, int]] = Counter(form["positive"])
        vector.subtract(form["negative"])
        vectors.append({edge: coefficient for edge, coefficient in vector.items() if coefficient})
    require(len(vectors) == FORM_COUNT, "unexpected form count")
    return tuple(vectors)


RAW_VECTORS = _raw_vectors()


def _primitive(vector: tuple[tuple[tuple[int, int], int], ...]):
    if not vector:
        return (), 0
    scale = math.gcd(*(abs(coefficient) for _edge, coefficient in vector))
    return tuple((edge, coefficient // scale) for edge, coefficient in vector), scale


def _certificate(projected: tuple[tuple[tuple[tuple[int, int], int], ...], ...]):
    for index, vector in enumerate(projected):
        if not vector:
            return {"forms": [index]}
    opposite: dict[tuple[tuple[tuple[int, int], int], ...], tuple[int, int]] = {}
    for index, vector in enumerate(projected):
        primitive, scale = _primitive(vector)
        negated = tuple((edge, -coefficient) for edge, coefficient in primitive)
        if negated in opposite:
            prior, prior_scale = opposite[negated]
            divisor = math.gcd(scale, prior_scale)
            # vector = scale*p and prior = prior_scale*(-p).
            return {
                "forms": [[prior, scale // divisor], [index, prior_scale // divisor]]
            }
        opposite[primitive] = (index, scale)
    return None


def scan_center(record: dict[str, object], center: int) -> dict[str, object]:
    """Scan supports, stopping at the first uncancellable support."""
    rows = cone.rows_of(record)
    found = []
    one_form = 0
    two_form = 0
    for scanned, support in enumerate(supports(center), 1):
        roots = base.edge_roots_for_rows((*rows, (f"G{center}", center, support)))
        projected = tuple(
            base.projected_form_vector(form, roots)
            for form in base.kalmanson_forms(base.DIRECT_ORDER)
        )
        certificate = _certificate(projected)
        if certificate is None:
            return {
                "status": "SURVIVES",
                "scanned": scanned,
                "first_survivor": list(support),
            }
        if len(certificate["forms"]) == 1:
            one_form += 1
        else:
            two_form += 1
        found.append({"support": list(support), **certificate})
    require(len(found) == SUPPORTS, "incomplete support scan")
    return {
        "status": "EXHAUSTED",
        "scanned": SUPPORTS,
        "counts": {"one_form": one_form, "two_form": two_form, "covered": SUPPORTS},
        "certificates": found,
    }


def center_order(active: tuple[int, ...]) -> tuple[int, ...]:
    return tuple(dict.fromkeys(c for c in (2, 6, 7, *active) if c in active))


def _records_and_groups():
    raw = INPUT.read_bytes()
    require(_sha256(INPUT) == INPUT_SHA256, "baseline input changed")
    records = json.loads(raw)["survivors"]
    groups = completion.completion_groups(records)
    require(len(groups) == 234 and sum(map(len, groups)) == 468, "group universe changed")
    return records, groups


def classify_group(records, indices: list[int], started: float, wall_seconds: float):
    index = indices[0]
    record = records[index]
    active = completion.active_centers(record)
    entry = {
        "record_index": index,
        "indices": indices,
        "active_centers": list(active),
        "center_order": list(center_order(active)),
    }
    for center in center_order(active):
        if time.monotonic() - started >= wall_seconds:
            entry["status"] = "TIME_LIMIT"
            return entry
        result = scan_center(record, center)
        entry.setdefault("attempts", []).append({"center": center, **result})
        if result["status"] == "EXHAUSTED":
            entry.update({"status": "EXHAUSTED", "center": center, **result})
            entry.pop("attempts", None)
            return entry
    entry["status"] = "NO_EXHAUSTED_CENTER"
    return entry


def produce(output: Path = DEFAULT_OUTPUT, max_groups: int = 234, wall_seconds: int = 600):
    require(0 < max_groups <= 234 and 0 < wall_seconds <= 600, "invalid bound")
    records, groups = _records_and_groups()
    started = time.monotonic()
    entries = []
    for indices in groups[:max_groups]:
        if time.monotonic() - started >= wall_seconds:
            break
        entries.append(classify_group(records, indices, started, wall_seconds))
    report = {
        "schema": SCHEMA,
        "input_sha256": INPUT_SHA256,
        "cone_sha256": CONE_SHA256,
        "source_pins": source_pins(),
        "form_order": "DIRECT_ORDER",
        "form_count": FORM_COUNT,
        "support_count": SUPPORTS,
        "total_groups": len(groups),
        "target_groups": max_groups,
        "processed_groups": len(entries),
        "partial": len(entries) < min(max_groups, len(groups)),
        "wall_seconds": wall_seconds,
        "entries": entries,
    }
    output.parent.mkdir(parents=True, exist_ok=True)
    output.write_text(json.dumps(report, sort_keys=True, separators=(",", ":")) + "\n")
    return report


def _check_form_certificate(record, center, support, forms):
    require(isinstance(forms, list) and forms, "empty certificate")
    roots = base.edge_roots_for_rows((*cone.rows_of(record), (f"G{center}", center, tuple(support))))
    if len(forms) == 1:
        require(type(forms[0]) is int and 0 <= forms[0] < FORM_COUNT, "invalid one-form index")
        projected = Counter()
        for edge, coefficient in RAW_VECTORS[forms[0]].items():
            projected[roots[edge]] += coefficient
        require(not any(projected.values()), "one-form certificate does not vanish")
        return 1
    require(len(forms) == 2, "certificate must have one or two forms")
    total = Counter()
    prior = -1
    weights = []
    for item in forms:
        require(isinstance(item, list) and len(item) == 2, "invalid weighted form")
        index, weight = item
        require(type(index) is int and 0 <= index < FORM_COUNT and index > prior, "invalid form index")
        require(type(weight) is int and weight > 0, "invalid form weight")
        prior = index
        weights.append(weight)
        total.update({edge: weight * coefficient for edge, coefficient in
                      RAW_VECTORS[index].items()})
    require(math.gcd(*weights) == 1, "nonprimitive certificate weights")
    projected = Counter()
    for edge, coefficient in total.items():
        projected[roots[edge]] += coefficient
    require(not any(projected.values()), "two-form certificate does not cancel")
    return 2


def check_report(path: Path) -> dict[str, object]:
    report = json.loads(path.read_text())
    require(report.get("schema") == SCHEMA and report.get("input_sha256") == INPUT_SHA256
            and report.get("cone_sha256") == CONE_SHA256, "report pins changed")
    require(_sha256(INPUT) == INPUT_SHA256 and _sha256(CONE_INPUT) == CONE_SHA256,
            "pinned input changed")
    # The producer fingerprint is provenance, not a dependency of exact replay.
    # Replay may use a later checker; every external mathematical helper stays pinned.
    current_sources = source_pins()
    recorded_sources = report.get("source_pins", {})
    require(set(recorded_sources) == set(current_sources), "source pin set changed")
    checker_key = "scripts/check_exact13_global_obstructions.py"
    require(all(recorded_sources[k] == value for k, value in current_sources.items() if k != checker_key),
            "external source pins changed")
    producer_hash = recorded_sources[checker_key]
    require(isinstance(producer_hash, str) and len(producer_hash) == 64
            and all(c in "0123456789abcdef" for c in producer_hash), "invalid producer fingerprint")
    records, groups = _records_and_groups()
    require(report.get("total_groups") == len(groups) and report.get("form_count") == FORM_COUNT
            and report.get("support_count") == SUPPORTS and report.get("form_order") == "DIRECT_ORDER",
            "finite universe header changed")
    expected = {group[0]: group for group in groups}
    seen = set()
    exhausted = 0
    covered = 0
    for entry in report.get("entries", []):
        index = entry.get("record_index")
        require(type(index) is int and index in expected and index not in seen, "invalid group entry")
        seen.add(index)
        require(entry.get("indices") == expected[index], "group mapping changed")
        record = records[index]
        active = completion.active_centers(record)
        require(entry.get("active_centers") == list(active)
                and entry.get("center_order") == list(center_order(active)), "center map changed")
        if entry.get("status") != "EXHAUSTED":
            continue
        check_exhausted_entry(record, entry, active)
        exhausted += 1
        covered += SUPPORTS
    require(report.get("processed_groups") == len(report.get("entries", [])), "processed count changed")
    require(report.get("processed_groups", 0) <= report.get("target_groups", 0) <= len(groups), "target bound changed")
    require(len(seen) == report["processed_groups"], "duplicate group entry")
    require(bool(report.get("partial")) == (report["processed_groups"] < report["target_groups"]), "partial flag changed")
    return {"verified_entries": len(seen), "exhausted": exhausted, "certificates": covered,
            "partial": report["partial"]}


def check_exhausted_entry(record, entry, active=None):
    """Independently replay all 495 certificates in one exhausted entry."""
    active = completion.active_centers(record) if active is None else active
    center = entry.get("center")
    require(center in active and entry.get("scanned") == SUPPORTS, "invalid exhausted center")
    certificates = entry.get("certificates")
    require(isinstance(certificates, list) and len(certificates) == SUPPORTS,
            "incomplete exhausted coverage")
    counts = Counter()
    for item, support in zip(certificates, supports(center), strict=True):
        require(item.get("support") == list(support), "support coverage/order changed")
        count = _check_form_certificate(record, center, support, item.get("forms"))
        counts["one_form" if count == 1 else "two_form"] += 1
    expected = {"one_form": counts["one_form"], "two_form": counts["two_form"], "covered": SUPPORTS}
    require(entry.get("counts") == expected, "certificate counts changed")
    return counts


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--produce", action="store_true")
    parser.add_argument("--check", type=Path)
    parser.add_argument("--out", type=Path, default=DEFAULT_OUTPUT)
    parser.add_argument("--max-groups", type=int, default=234)
    parser.add_argument("--wall-seconds", type=int, default=600)
    parser.add_argument("--publish", action="store_true")
    args = parser.parse_args()
    require(args.produce != (args.check is not None), "choose exactly one mode")
    require(not args.publish or args.check is not None, "publication requires replay")
    if args.produce:
        report = produce(args.out, args.max_groups, args.wall_seconds)
        print(json.dumps({"processed_groups": report["processed_groups"],
                          "partial": report["partial"], "output": str(args.out)}))
    else:
        checked = check_report(args.check)
        if args.publish:
            with Path("docs/audits/2026-09-06-exact13-global-obstructions.json").open("x") as output:
                output.write(args.check.read_text())
        print(json.dumps(checked))


if __name__ == "__main__":
    main()
