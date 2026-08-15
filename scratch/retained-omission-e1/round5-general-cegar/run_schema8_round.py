#!/usr/bin/env python3
"""Historical serial runner for the sixteen Schema-8 FreshThird cases.

This wrapper is retained as an audit record, but it is disabled because the
Schema-8 probe has an existential-selector quantifier bug: its ``Not(shared)``
formula asks for one selector assignment with no shared pair rather than the
negation of an existential producer.  The old matrix must not be rerun.
"""

from __future__ import annotations

import argparse
import json
from pathlib import Path
import sys

HERE = Path(__file__).resolve().parent
sys.path.insert(0, str(HERE))
import freshthird_schema8_shared_late_pair_probe as probe  # noqa: E402


RUN_DISABLED_MESSAGE = (
    "Schema 8 serial replay is disabled: historical free selectors plus "
    "Not(shared) encode exists selectors, not shared, not the intended "
    "not (exists selectors, shared); arbitrary boundary permutations are "
    "also not source-entitled. No solver matrix may be rerun."
)


def main() -> int:
    parser = argparse.ArgumentParser()
    parser.add_argument("--timeout-ms", type=int, default=30000)
    parser.add_argument("--out-dir", type=Path, default=probe.OUT)
    args = parser.parse_args()
    parser.error(RUN_DISABLED_MESSAGE)

    # Historical matrix (intentionally unreachable; retained for provenance):
    # for mapping in ("q1-outside", "q2-outside"):
    #   for arm in (1, 2, 3, 4):
    #     for query in ("canonical-survives", "other-survives"):
    #       probe.run(...)
    args.out_dir.mkdir(parents=True, exist_ok=True)
    records = []
    for mapping in ("q1-outside", "q2-outside"):
        for arm in (1, 2, 3, 4):
            for query in ("canonical-survives", "other-survives"):
                cli = argparse.Namespace(
                    n=17,
                    arm="equalCrossRowCenters",
                    radius_mode="common",
                    slot=0,
                    surface_scope="live-equal-common-dual",
                    endpoint_mapping=mapping,
                    order_arm=arm,
                    query=query,
                    timeout_ms=args.timeout_ms,
                )
                record = probe.run(cli)
                record["artifact"] = (
                    f"schema-v8-{mapping}-arm{arm}-{query}.json"
                )
                path = args.out_dir / record["artifact"]
                path.write_text(json.dumps(record, indent=2, sort_keys=True) + "\n")
                records.append(record)
                print(json.dumps({
                    "artifact": record["artifact"],
                    "status": record["status"],
                    "elapsed_seconds": record["elapsed_seconds"],
                }, sort_keys=True), flush=True)
    summary = {
        "schema_version": probe.SCHEMA_VERSION,
        "n": 17,
        "case_count": len(records),
        "status_counts": {
            status: sum(r["status"] == status for r in records)
            for status in ("SAT", "UNSAT", "UNKNOWN")
        },
        "timeout_ms": args.timeout_ms,
        "artifacts": [r["artifact"] for r in records],
        "trust_boundary": (
            "Diagnostic bounded Z3 incidence/radius evidence only. The dynamic "
            "shared-late-pair producer is a negated hypothesis probe, not a "
            "source-entitled constraint; there is no Euclidean realizability, "
            "arbitrary-cardinality lift, or Lean closure."
        ),
    }
    (args.out_dir / "schema-v8-round-summary.json").write_text(
        json.dumps(summary, indent=2, sort_keys=True) + "\n"
    )
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
