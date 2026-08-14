#!/usr/bin/env python3
"""Normalize the authenticated Child33--Child40 exact-17 mine artifacts.

This is deliberately an artifact-only analysis.  It never opens DIMACS files,
starts a solver, imports Lean, or treats a missing wave mine as an empty mine.
"""

from __future__ import annotations

import hashlib
import json
from collections import Counter, defaultdict
from pathlib import Path
from typing import Any


ROOT = Path(__file__).resolve().parents[3]
SCRATCH = ROOT / "scratch" / "exact17-lean-to-sat"
OUT = Path(__file__).resolve().parent


def load(path: str) -> dict[str, Any]:
    with (ROOT / path).open() as stream:
        value = json.load(stream)
    if not isinstance(value, dict):
        raise TypeError(f"expected JSON object: {path}")
    return value


def sha256(path: Path) -> str:
    h = hashlib.sha256()
    with path.open("rb") as stream:
        for block in iter(lambda: stream.read(1 << 20), b""):
            h.update(block)
    return h.hexdigest()


def custody(wave: int) -> dict[str, Any]:
    model_path = SCRATCH / f"piqd-child{wave}-core1-custody-model.json"
    final_path = SCRATCH / f"piqd-child{wave}-core1-custody-final.json"
    final = json.loads(final_path.read_text())
    model_hash = sha256(model_path)
    expected = final.get("model_sha256")
    return {
        "model": str(model_path.relative_to(ROOT)),
        "final": str(final_path.relative_to(ROOT)),
        "model_sha256": model_hash,
        "model_hash_matches_final": model_hash == expected,
        "final_result": final.get("result"),
        "final_schema": final.get("schema"),
        "authenticated": model_hash == expected and final.get("result") == "SAT",
    }


def positions(order: list[int]) -> dict[int, int]:
    return {label: index for index, label in enumerate(order)}


def normalized_support(support: list[list[int]], order: list[int]) -> str:
    """Canonical dihedral representative of labelled (center, point) hits."""
    pos = positions(order)
    raw = [(pos[int(center)], pos[int(point)]) for center, point in support]
    n = len(order)
    variants = []
    for reverse in (False, True):
        for shift in range(n):
            if reverse:
                image = tuple(sorted(((shift - a) % n, (shift - b) % n) for a, b in raw))
            else:
                image = tuple(sorted(((a + shift) % n, (b + shift) % n) for a, b in raw))
            variants.append(image)
    return json.dumps(min(variants), separators=(",", ":"))


def order_from_record(record: dict[str, Any], fallback: list[int] | None = None) -> list[int] | None:
    value = record.get("order")
    if isinstance(value, list) and all(isinstance(x, int) for x in value):
        return value
    value = record.get("producer", {}).get("core", {}).get("boundary_labels")
    if isinstance(value, list) and all(isinstance(x, int) for x in value):
        return value
    return fallback


def compact_record(
    wave: int,
    kind: str,
    record: dict[str, Any],
    *,
    order: list[int] | None = None,
    support: list[list[int]] | None = None,
    support_status: str = "not_available",
    bank_relation: str | None = None,
) -> dict[str, Any]:
    core = record.get("core", {})
    stage = record.get("stage")
    if stage is None:
        stage = "diagnostic-only" if kind in {"diagnostic_only", "diagnostic_candidate"} else "unknown"
    result: dict[str, Any] = {
        "wave": wave,
        "kind": kind,
        "family": stage,
        "consumer": record.get("lean_consumer", record.get("consumer")),
        "orientation": record.get("orientation"),
        "cyclic_orientation": record.get("cyclic_orientation"),
        "source": record.get("source"),
        "support_status": support_status,
        "core_shape": sorted(core) if isinstance(core, dict) else [],
    }
    if bank_relation is not None:
        result["bank_relation"] = bank_relation
    if "already_in_parent" in record:
        result["already_in_parent"] = record["already_in_parent"]
    if support is not None and order is not None:
        result["support"] = sorted([[int(a), int(b)] for a, b in support])
        result["support_size"] = len(support)
        result["normalized_support"] = normalized_support(support, order)
        result["order_index"] = record.get("order_index")
    return result


def main() -> None:
    reports: dict[int, dict[str, Any]] = {}
    records: list[dict[str, Any]] = []

    # Child33 is a replay-complete diagnostic inventory, not a source-valid bank.
    child33_path = "scratch/exact17-lean-to-sat/child33-postwave-inventory-candidates-v2-2026-08-13.json"
    child33 = load(child33_path)
    reports[33] = {
        "artifact": child33_path,
        "status": child33.get("status"),
        "classification": child33.get("classification"),
        "authenticated_custody": custody(33),
        "provenance_model_matches_custody": child33.get("source_analysis", {}).get("model_sha256") == custody(33)["model_sha256"],
        "record_count": len(child33.get("candidates", [])),
        "support_data": "absent; core-only diagnostic candidates",
    }
    for item in child33.get("candidates", []):
        records.append(compact_record(33, "diagnostic_candidate", item))

    # Child34 and Child35 preserve source records but not explicit cancellation supports.
    for wave in (34, 35):
        path = f"scratch/exact17-lean-to-sat/child{wave}-wave-mine/child{wave}-wave-mine.json"
        report = load(path)
        reports[wave] = {
            "artifact": path,
            "status": report.get("status"),
            "provenance": report.get("provenance"),
            "authenticated_custody": custody(wave),
            "provenance_model_matches_custody": report.get("provenance", {}).get("model_sha256") == custody(wave)["model_sha256"],
            "record_count": len(report.get("new_records", [])),
            "support_data": "absent; core-only wave records",
        }
        for item in report.get("new_records", []):
            rec = dict(item.get("record", {}))
            rec["already_in_parent"] = item.get("already_in_parent")
            records.append(
                compact_record(
                    wave,
                    "wave_record",
                    rec,
                    support_status="absent_core_only",
                )
            )

    # Child36 deliberately records both newly seen and lost records.
    path36 = "scratch/exact17-lean-to-sat/child36-wave-mine-summary.json"
    child36 = load(path36)
    reports[36] = {
        "artifact": path36,
        "status": child36.get("status"),
        "authenticated_custody": custody(36),
        "new_record_count": len(child36.get("new_records", [])),
        "lost_record_count": len(child36.get("lost_records", [])),
        "record_count": len(child36.get("new_records", [])) + len(child36.get("lost_records", [])),
        "support_data": "absent from summary; one Kalmanson core embeds row choices",
    }
    for item in child36.get("new_records", []):
        records.append(compact_record(36, "new_record", item, support_status="absent_core_only"))
    for item in child36.get("lost_records", []):
        records.append(compact_record(36, "lost_after_wave", item, support_status="absent_core_only"))

    # Child37 custody is authenticated, but no durable wave-mine report is present.
    reports[37] = {
        "artifact": None,
        "status": "MISSING_WAVE_MINE",
        "authenticated_custody": custody(37),
        "record_count": None,
        "support_data": "not mined; do not infer zero occurrences",
    }

    # Child38 has an authenticated bank ledger, but its entries contain hit indices,
    # not the raw selected-row support labels needed for cyclic normalization.
    path38 = "scratch/exact17-lean-to-sat/child38-wave-mine/child38-cancellation-bank-ledger.json"
    child38 = load(path38)
    reports[38] = {
        "artifact": path38,
        "analysis": "scratch/exact17-lean-to-sat/child38-wave-mine/child38-analysis.json",
        "status": child38.get("status"),
        "authenticated_custody": custody(38),
        "record_count": child38.get("record_count"),
        "clause_count": child38.get("clause_count"),
        "subset_minimal_support_count": child38.get("subset_minimal_support_count"),
        "support_data": "hit-index pairs only; raw selected-row supports unavailable",
    }
    for entry in child38.get("entries", []):
        records.append({
            "wave": 38,
            "kind": "bank_entry_summary",
            "family": "equality-convex-two-kalmanson-cancellation",
            "consumer": "GenericRowNogoodCertificate.false_of_twoKalmansonCancellationData_of_check",
            "orientation": "forward+reverse",
            "support_status": "hit_indices_only",
            "hit_count": len(entry.get("hits", [])),
            "reflected_hit_count": len(entry.get("reflected_hits", [])),
            "normalized_support": None,
        })

    # Child39 and Child40 analyses contain explicit support labels and source order.
    for wave in (39, 40):
        if wave == 39:
            path = "scratch/exact17-lean-to-sat/child39-wave-mine/child39-analysis.json"
        else:
            path = "scratch/exact17-lean-to-sat/child40-wave-mine/child40-analysis.json"
        report = load(path)
        reports[wave] = {
            "artifact": path,
            "status": report.get("status"),
            "provenance": report.get("provenance"),
            "authenticated_custody": custody(wave),
            "provenance_model_matches_custody": report.get("provenance", {}).get("model_sha256") == custody(wave)["model_sha256"],
            "replay": report.get("independent_replay"),
            "support_data": "explicit producer supports",
        }
        for occurrence in report.get("two_kalmanson_occurrences", []):
            order = occurrence.get("order")
            for candidate in occurrence.get("candidates", []):
                producer = candidate.get("producer", {})
                producer["order_index"] = occurrence.get("order_index")
                records.append(
                    compact_record(
                        wave,
                        "source_valid_occurrence",
                        producer,
                        order=order,
                        support=candidate.get("support"),
                        support_status="explicit",
                        bank_relation=candidate.get("bank_relation"),
                    )
                )
        if wave == 39:
            for item in report.get("diagnostic_only", []):
                records.append(compact_record(39, "diagnostic_only", item))
        for scan in report.get("formalized_core_scans", []):
            for item in scan.get("records", []):
                records.append(compact_record(wave, "formalized_scan", item))

    # The normalized recurrence table is intentionally restricted to explicit supports.
    explicit = [r for r in records if r.get("normalized_support") is not None]
    by_support: dict[str, list[dict[str, Any]]] = defaultdict(list)
    for item in explicit:
        by_support[item["normalized_support"]].append(item)
    recurrence = []
    for key, items in sorted(by_support.items()):
        waves = sorted({item["wave"] for item in items})
        recurrence.append({
            "normalized_support": key,
            "occurrence_count": len(items),
            "waves": waves,
            "first_wave": min(waves),
            "last_wave": max(waves),
            "orientation_counts": dict(Counter(item.get("orientation") for item in items)),
            "family_counts": dict(Counter(item.get("family") for item in items)),
            "observed_disappearance_after": max(waves) if max(waves) < 40 else None,
        })

    family_by_wave: dict[str, dict[str, int]] = defaultdict(lambda: defaultdict(int))
    for item in records:
        family_by_wave[item.get("family", "unknown")][str(item["wave"])] += 1
    families = []
    for family, counts in sorted(family_by_wave.items()):
        waves = sorted(int(wave) for wave in counts)
        families.append({
            "family": family,
            "counts_by_wave": dict(counts),
            "first_available_wave": min(waves),
            "last_available_wave": max(waves),
            "missing_waves_are_untrusted": True,
        })

    for wave, report in reports.items():
        if report.get("status") != "MISSING_WAVE_MINE":
            report["record_count"] = sum(item["wave"] == wave for item in records)

    summary = {
        "schema": "p97-exact17-cross-wave-meta-analysis/v1",
        "status": "PASS_WITH_EXPLICIT_GAPS",
        "scope": "authenticated Child33--Child40 durable artifacts only",
        "symmetry": "dihedral rotations and cyclic reversal on each recorded named order; center/point roles retained",
        "waves": reports,
        "record_counts": dict(Counter(str(item["wave"]) for item in records)),
        "explicit_support_record_count": len(explicit),
        "normalized_support_class_count": len(recurrence),
        "recurring_normalized_supports": [item for item in recurrence if len(item["waves"]) > 1],
        "normalized_supports": recurrence,
        "motif_families": families,
        "records": records,
        "limitations": [
            "Child33--Child36 reports are core-only for most records; no support is invented.",
            "Child37 has authenticated SAT custody but no durable wave-mine report; it is missing, not zero.",
            "Child38 ledger hit pairs are not raw selected-row support labels, so they are not normalized.",
            "Observed disappearance means absent from available reports after the last occurrence; it is not a proof of global disappearance.",
            "The analysis reports source-valid producer occurrences separately from diagnostic or lost records.",
        ],
    }
    (OUT / "cross-wave-meta.json").write_text(json.dumps(summary, indent=2, sort_keys=True) + "\n")
    print(json.dumps({
        "path": str(OUT / "cross-wave-meta.json"),
        "waves": {str(w): {"status": d["status"], "records": d.get("record_count")} for w, d in reports.items()},
        "records": len(records),
        "explicit_support_records": len(explicit),
        "normalized_support_classes": len(recurrence),
        "recurring_classes": sum(len(item["waves"]) > 1 for item in recurrence),
    }, sort_keys=True))


if __name__ == "__main__":
    main()
