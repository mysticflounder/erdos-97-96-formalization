#!/usr/bin/env python3
"""Measure the source predicates missing from replayed metric certificates.

For each source-decoded CEGAR record, this script starts from only the row
memberships forced by the blocker interface.  It then extracts the row
equalities actually used by the metric certificate and greedily minimizes the
additional equality facts needed to recover an unordered formalized core.
The result is theorem-mining evidence, not a promoted refinement or proof.
"""

from __future__ import annotations

import json
import sys
from collections import Counter
from itertools import combinations
from pathlib import Path


HERE = Path(__file__).resolve().parent
ROOT = HERE.parents[1]
sys.path.insert(0, str(ROOT))

from census.global_confinement import metric_realizability_probe as metric  # noqa: E402
from analyze_source_forced_cores import CARDINALITY, forced_rows  # noqa: E402


EqualityFact = tuple[int, int, int]


def rows_with_equalities(
    blocker_facts: tuple[tuple[int, int], ...],
    equalities: tuple[EqualityFact, ...],
) -> tuple[metric.MetricRow, ...]:
    supports = {row.center: set(row.support) for row in forced_rows(blocker_facts)}
    for center, first, second in equalities:
        supports.setdefault(center, set()).update((first, second))
    return tuple(
        metric.MetricRow(center, tuple(sorted(support)), False)
        for center, support in sorted(supports.items())
        if len(support) >= 2
    )


def detect(
    blocker_facts: tuple[tuple[int, int], ...],
    equalities: tuple[EqualityFact, ...],
):
    return metric._formalized_metric_core(
        rows_with_equalities(blocker_facts, equalities),
        CARDINALITY,
        (),
        include_extended=True,
        include_ordered=False,
    )


def certificate_equalities(certificate: dict[str, object]) -> tuple[EqualityFact, ...]:
    facts = set()
    for path in certificate.get("closure_paths", []):
        for step in path["steps"]:
            if step["kind"] != "row":
                continue
            first, second = sorted((int(step["first"]), int(step["second"])))
            facts.add((int(step["center"]), first, second))
    return tuple(sorted(facts))


def minimum_gap(
    blocker_facts: tuple[tuple[int, int], ...],
    facts: tuple[EqualityFact, ...],
) -> tuple[tuple[EqualityFact, ...], dict[str, object] | None]:
    if detect(blocker_facts, facts) is None:
        return facts, None
    for size in range(len(facts) + 1):
        for retained in combinations(facts, size):
            detection = detect(blocker_facts, retained)
            if detection is not None:
                return retained, detection
    raise AssertionError("the complete equality set was already detected")


def main() -> None:
    journal = HERE / "cegar-d0-v2-source-v3" / "journal.jsonl"
    output = journal.parent / "interpolation-gap-analysis.json"
    gap_sizes: Counter[int] = Counter()
    gap_facts: Counter[EqualityFact] = Counter()
    gap_signatures: Counter[tuple[EqualityFact, ...]] = Counter()
    stage_counts: Counter[str] = Counter()
    records = []
    checked = 0
    replay_failures = 0
    for raw in journal.read_text().splitlines():
        record = json.loads(raw)
        source_model = record.get("source_model")
        certificate = record.get("certificate")
        if not source_model or not certificate:
            continue
        checked += 1
        blocker_facts = tuple(
            sorted(
                (int(source), int(center))
                for source, center in source_model["blockers"].items()
            )
        )
        facts = certificate_equalities(certificate)
        gap, detection = minimum_gap(blocker_facts, facts)
        if detection is None:
            replay_failures += 1
            continue
        gap_sizes[len(gap)] += 1
        gap_signatures[gap] += 1
        gap_facts.update(gap)
        stage_counts[str(detection["stage"])] += 1
        records.append(
            {
                "iteration": source_model["iteration"],
                "certificate_stage": record["stage"],
                "replayed_stage": detection["stage"],
                "gap_equalities": [list(fact) for fact in gap],
                "detection": detection,
            }
        )
    report = {
        "schema": "p97-pentagon-offclass-interpolation-gap-mining-v2",
        "scope": (
            "theorem-discovery only; exact minimum gaps are model-local and are "
            "not universal producers"
        ),
        "journal": str(journal),
        "records_checked": checked,
        "replay_failures": replay_failures,
        "minimum_gap_size_counts": {
            str(size): count for size, count in sorted(gap_sizes.items())
        },
        "replayed_stage_counts": dict(sorted(stage_counts.items())),
        "top_gap_equalities": [
            {"fact": list(fact), "count": count}
            for fact, count in gap_facts.most_common(30)
        ],
        "top_gap_signatures": [
            {
                "facts": [list(fact) for fact in signature],
                "count": count,
            }
            for signature, count in gap_signatures.most_common(20)
        ],
        "records": records,
    }
    output.write_text(json.dumps(report, indent=2, sort_keys=True) + "\n")
    print(
        json.dumps(
            {
                "records_checked": checked,
                "replay_failures": replay_failures,
                "minimum_gap_size_counts": report["minimum_gap_size_counts"],
                "replayed_stage_counts": report["replayed_stage_counts"],
                "top_gap_equalities": report["top_gap_equalities"][:10],
                "output": str(output),
            },
            sort_keys=True,
        )
    )


if __name__ == "__main__":
    main()
