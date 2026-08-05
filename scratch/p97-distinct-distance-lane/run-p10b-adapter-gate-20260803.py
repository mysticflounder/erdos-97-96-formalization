"""Direct gate for the P10B authenticated v3-corpus adapter."""

from __future__ import annotations

import copy
import json
import sys
from pathlib import Path


ROOT = Path(__file__).resolve().parents[2]
sys.path.insert(0, str(ROOT))

from census.p97_search import phase3_portfolio as portfolio  # noqa: E402
from census.p97_search import phase3_portfolio_adapter as adapter  # noqa: E402


SOURCE = ROOT / "scratch" / "p10a-gate-dgyw11zg" / "observed"


def main() -> int:
    report = adapter.adapt_corpus(
        learned_path=SOURCE / "learned-certificates.jsonl",
        productivity_path=SOURCE / "productivity.jsonl",
        survivors_path=SOURCE / "survivors.jsonl",
    )
    scenarios = report["scenarios"]
    if report["schema"] != adapter.ADAPTER_SCHEMA or len(scenarios) != 1:
        raise AssertionError("adapter did not emit the authenticated sample corpus")
    portfolio.validate_feature_chain(
        [scenario["feature_record"] for scenario in scenarios]
    )
    for scenario in scenarios:
        portfolio.validate_scenario(scenario)
    baseline = portfolio.run_schedule(
        scenarios[0], portfolio.fixed_cascade_order({})
    )
    if baseline["status"] != "MATCH":
        raise AssertionError(f"baseline trace did not match: {baseline}")
    if baseline["terminal_detector"] != "shared-pair":
        raise AssertionError("adapter changed the authenticated terminal detector")
    tampered = copy.deepcopy(scenarios[0])
    tampered["feature_record"]["features"]["row_count"] += 1
    unsigned = dict(tampered)
    unsigned.pop("scenario_sha256")
    tampered["scenario_sha256"] = portfolio.productivity.sha256_value(unsigned)
    try:
        portfolio.validate_scenario(tampered)
    except portfolio.PortfolioError:
        pass
    else:
        raise AssertionError("feature tamper was not rejected")
    print(
        json.dumps(
            {
                "adapter": "P10B",
                "baseline_terminal_detector": baseline["terminal_detector"],
                "report_sha256": report["report_sha256"],
                "scenario_count": report["scenario_count"],
                "status": "PASS",
            },
            sort_keys=True,
        )
    )
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
