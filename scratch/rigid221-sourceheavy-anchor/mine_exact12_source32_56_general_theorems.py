"""Summarize theorem schemas used by exact-12 sources 32 through 56.

This is a wave-boundary mining report, not a new detector and not a proof of
universal coverage.  In particular, it performs no relabeling of the frozen
source roles beyond comparing literally equal labeled cores.
"""

from __future__ import annotations

import hashlib
import importlib
import json
import sys
from collections import Counter, defaultdict
from pathlib import Path

REPOSITORY_ROOT = Path(__file__).resolve().parents[2]
sys.path.insert(0, str(REPOSITORY_ROOT))

ORDERED_COVERAGE = importlib.import_module(
    "census.card_head.exact12_v14_ordered_coverage"
)
PROOF_BACKED_CUBE_BINDINGS = ORDERED_COVERAGE.PROOF_BACKED_CUBE_BINDINGS
detect_ordered_coverage = ORDERED_COVERAGE.detect_ordered_coverage


SOURCE_FIRST = 32
SOURCE_LAST = 56
OUTPUT = Path(__file__).with_name(
    "exact12-v14-source32-56-general-theorem-search-2026-08-09.json"
)


def canonical_json(value: object) -> bytes:
    return json.dumps(value, sort_keys=True, separators=(",", ":")).encode() + b"\n"


def main() -> None:
    per_source: list[dict[str, object]] = []
    exact_core_sources: dict[tuple[int, ...], list[int]] = defaultdict(list)
    selected_row_counts: Counter[int] = Counter()
    source_rule_profiles: Counter[str] = Counter()

    bindings = PROOF_BACKED_CUBE_BINDINGS[SOURCE_FIRST - 1 : SOURCE_LAST]
    if len(bindings) != SOURCE_LAST - SOURCE_FIRST + 1:
        raise AssertionError("source range is not completely proof-backed")

    for source, (cube, binding, _choices) in enumerate(bindings, start=SOURCE_FIRST):
        certificate = detect_ordered_coverage(cube)
        if certificate is None:
            raise AssertionError(f"source {source} lacks complete order coverage")
        coverage = certificate["coverage"]
        if len(coverage) != 48:
            raise AssertionError(f"source {source} covers {len(coverage)} orders, not 48")

        rule_counts = Counter(str(record["rule"]) for record in coverage)
        profile = "+".join(f"{rule}:{count}" for rule, count in sorted(rule_counts.items()))
        source_rule_profiles[profile] += 1

        cores = sorted(
            {
                tuple(int(record["core"][key]) for key in ("a", "x", "b", "c", "y"))
                for record in coverage
                if record["rule"] == "convex-five-point-common-orientation"
            }
        )
        for core in cores:
            exact_core_sources[core].append(source)

        selected = certificate["selected_memberships"]
        selected_row_counts[len(selected)] += 1
        per_source.append(
            {
                "source": source,
                "cube_sha256": binding["cube_sha256"],
                "certificate_sha256": certificate["certificate_sha256"],
                "selected_memberships": selected,
                "selected_row_count": len(selected),
                "coverage_count": len(coverage),
                "rule_counts": dict(sorted(rule_counts.items())),
                "literal_labeled_five_point_cores": [list(core) for core in cores],
                "nogood_declaration": binding["nogood_declaration"],
                "source_path": binding["source_path"],
                "source_sha256": binding["source_sha256"],
            }
        )

    repeated = [
        {"core": list(core), "sources": sources, "source_count": len(sources)}
        for core, sources in sorted(exact_core_sources.items())
        if len(sources) > 1
    ]
    body = {
        "schema": "p97-exact12-v14-wave-general-theorem-search-v1",
        "scope": {
            "source_first": SOURCE_FIRST,
            "source_last": SOURCE_LAST,
            "source_count": len(per_source),
            "comparison": "literal frozen labels only",
            "source_entitled_relabeling_used": False,
            "claim": "empirical proof-backed wave summary; not universal coverage or a live closure",
        },
        "aggregate": {
            "all_sources_cover_all_48_orders": all(
                source["coverage_count"] == 48 for source in per_source
            ),
            "source_rule_profiles": dict(sorted(source_rule_profiles.items())),
            "selected_row_count_distribution": {
                str(size): count for size, count in sorted(selected_row_counts.items())
            },
            "unique_literal_labeled_five_point_core_count": len(exact_core_sources),
            "repeated_literal_labeled_five_point_cores": repeated,
        },
        "sources": per_source,
    }
    payload = canonical_json(body)
    OUTPUT.write_bytes(payload)
    print(OUTPUT)
    print(f"bytes={len(payload)}")
    print(f"sha256={hashlib.sha256(payload).hexdigest()}")


if __name__ == "__main__":
    main()
