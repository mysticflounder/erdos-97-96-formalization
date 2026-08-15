#!/usr/bin/env python3
"""Mine metric cores forced by source-to-blocker facts alone.

This is a theorem-discovery audit, not a certificate or Lean proof.  For every
decoded blocker map, it keeps only memberships forced by ``b_(source,center)``
and the five named physical trace equalities.  A core found in this weakened
row system is therefore a candidate source-level producer; the full selected
four-class supports are deliberately ignored.
"""

from __future__ import annotations

import json
import sys
from collections import Counter
from pathlib import Path


HERE = Path(__file__).resolve().parent
ROOT = HERE.parents[1]
sys.path.insert(0, str(ROOT))

from census.global_confinement import metric_realizability_probe as metric  # noqa: E402
from metric_order_mine import boundary_orders, shared_pair_violations  # noqa: E402
from probe import U, XV, XU  # noqa: E402


CARDINALITY = 12
D = 0
V = 2
TRACE_EDGES = {
    U: frozenset((U, XU)),
    XU: frozenset((XU, D)),
    D: frozenset((D, V)),
    V: frozenset((V, XV)),
    XV: frozenset((XV, U)),
}


def forced_rows(
    blocker_facts: tuple[tuple[int, int], ...],
) -> tuple[metric.MetricRow, ...]:
    supports: dict[int, set[int]] = {}
    for source, center in blocker_facts:
        support = supports.setdefault(center, set())
        support.add(source)
        support.update(TRACE_EDGES.get(source, ()))
    return tuple(
        metric.MetricRow(center, tuple(sorted(support)), False)
        for center, support in sorted(supports.items())
        if len(support) >= 2
    )


def detect(blocker_facts: tuple[tuple[int, int], ...]):
    rows = forced_rows(blocker_facts)
    return metric._formalized_metric_core(
        rows,
        CARDINALITY,
        (),
        include_extended=True,
        include_ordered=False,
    )


def greedy_core(
    blocker_facts: tuple[tuple[int, int], ...],
) -> tuple[tuple[tuple[int, int], ...], dict[str, object] | None]:
    current = list(blocker_facts)
    first = detect(tuple(current))
    if first is None:
        return tuple(current), None
    for fact in tuple(current):
        candidate = [item for item in current if item != fact]
        if detect(tuple(candidate)) is not None:
            current = candidate
    return tuple(current), detect(tuple(current))


def main() -> None:
    journal = HERE / "cegar-d0-v2-source-v3" / "journal.jsonl"
    output = journal.parent / "source-forced-core-analysis.json"
    stage_counts: Counter[str] = Counter()
    source_sets: Counter[tuple[int, ...]] = Counter()
    core_sizes: Counter[int] = Counter()
    order_coverage_counts: Counter[int] = Counter()
    ordered_stage_counts: Counter[str] = Counter()
    all_order_records = []
    records = []
    source_models = 0
    for raw in journal.read_text().splitlines():
        record = json.loads(raw)
        source_model = record.get("source_model")
        if not source_model:
            continue
        source_models += 1
        blocker_facts = tuple(
            sorted(
                (int(source), int(center))
                for source, center in source_model["blockers"].items()
            )
        )
        core, detection = greedy_core(blocker_facts)
        if detection is None:
            rows = forced_rows(blocker_facts)
            order_reasons = []
            for order in boundary_orders():
                violations = shared_pair_violations(rows, order)
                if violations:
                    reason = "shared-pair-cross-separation"
                else:
                    ordered_detection = metric._formalized_metric_core(
                        rows,
                        CARDINALITY,
                        order,
                        include_extended=True,
                        include_ordered=True,
                    )
                    reason = (
                        str(ordered_detection["stage"])
                        if ordered_detection is not None
                        else "UNCOVERED"
                    )
                order_reasons.append(reason)
                if reason != "UNCOVERED":
                    ordered_stage_counts[reason] += 1
            covered = sum(reason != "UNCOVERED" for reason in order_reasons)
            order_coverage_counts[covered] += 1
            if covered == len(boundary_orders()):
                all_order_records.append(
                    {
                        "iteration": source_model["iteration"],
                        "blocker_facts": [list(fact) for fact in blocker_facts],
                        "order_reasons": order_reasons,
                    }
                )
            continue
        stage = str(detection["stage"])
        sources = tuple(source for source, _center in core)
        stage_counts[stage] += 1
        source_sets[sources] += 1
        core_sizes[len(core)] += 1
        records.append(
            {
                "iteration": source_model["iteration"],
                "stage": stage,
                "blocker_facts": [list(fact) for fact in core],
                "forced_rows": [row.as_dict() for row in forced_rows(core)],
                "detection": detection,
            }
        )
    report = {
        "schema": "p97-pentagon-offclass-source-forced-core-mining-v1",
        "scope": "theorem-discovery only; no promoted clause and no Lean closure",
        "journal": str(journal),
        "source_models": source_models,
        "models_with_forced_core": len(records),
        "stage_counts": dict(sorted(stage_counts.items())),
        "greedy_core_size_counts": {
            str(size): count for size, count in sorted(core_sizes.items())
        },
        "greedy_core_source_sets": {
            ",".join(map(str, sources)): count
            for sources, count in source_sets.most_common()
        },
        "source_forced_order_coverage_counts": {
            str(count): models
            for count, models in sorted(order_coverage_counts.items())
        },
        "source_forced_order_stage_counts": dict(sorted(ordered_stage_counts.items())),
        "models_covering_all_orders": len(all_order_records),
        "all_order_records": all_order_records,
        "records": records,
    }
    output.write_text(json.dumps(report, indent=2, sort_keys=True) + "\n")
    print(
        json.dumps(
            {
                "source_models": source_models,
                "models_with_forced_core": len(records),
                "stage_counts": report["stage_counts"],
                "greedy_core_size_counts": report["greedy_core_size_counts"],
                "source_forced_order_coverage_counts":
                    report["source_forced_order_coverage_counts"],
                "models_covering_all_orders": len(all_order_records),
                "output": str(output),
            },
            sort_keys=True,
        )
    )


if __name__ == "__main__":
    main()
