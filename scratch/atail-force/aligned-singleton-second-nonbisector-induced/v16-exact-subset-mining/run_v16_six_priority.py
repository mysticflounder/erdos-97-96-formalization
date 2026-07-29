#!/usr/bin/env python3
"""Run the established structural six-subset ranker on the pinned v16 source."""

from __future__ import annotations

import importlib.util
import itertools
import json
import sys
from pathlib import Path
from typing import Any, Sequence


HERE = Path(__file__).resolve().parent
LANE = HERE.parent
RANKER = LANE / "v13-six-priority" / "rank_and_check_v13_six.py"
MINER = LANE / "exact_euclidean_subset_core_miner.py"


def load_ranker() -> Any:
    spec = importlib.util.spec_from_file_location("v16_reused_six_ranker", RANKER)
    if spec is None or spec.loader is None:
        raise RuntimeError(f"cannot load {RANKER}")
    module = importlib.util.module_from_spec(spec)
    sys.modules[spec.name] = module
    spec.loader.exec_module(module)
    return module


def main() -> int:
    ranker = load_ranker()
    ranker.HERE = HERE
    ranker.LANE = LANE
    ranker.MINER_PATH = MINER
    ranker.PROBE = HERE / "euclidean-survivor-probe-v16.json"
    ranker.POSITIVE_SMT2 = HERE / "euclidean-survivor-probe-v16.positive_rows.smt2"
    ranker.CEGAR_RESULT = LANE / "cegar-v16-local-critical-reuse-second.json"
    ranker.CHECKPOINT = LANE / "cegar-v16-local-critical-reuse-second.checkpoint.json"
    ranker.CEGAR_SCRIPT = LANE / "cegar.py"
    ranker.EXPECTED = {
        "probe": "90632f4c9b107a64458be1f6fb9f9ef3feb0ec81e4acde276a274c08eee60df0",
        "positive_smt2": "08fd9aaa292be6574be7788897e106e903b865682fe72b07eebe271a20fadd2e",
        "cegar_result": "4305fde6500059ef45b268fe09bd99edd3e3ea63386e162b6524ce27e0ef61a3",
        "checkpoint": "0fbe6cad9144ad555825ed09e7c37fc78c07c184250d4fbb8aff53c1f68a7a19",
        "recorded_cegar": "29db457d62c7ba10a096a07aa3600a34baf859bcf3019c4d20e04fc1455c57dc",
    }

    def source_config(miner: Any) -> Any:
        return miner.SourceConfig(
            probe_result=ranker.PROBE,
            positive_smt2=ranker.POSITIVE_SMT2,
            cegar_result=ranker.CEGAR_RESULT,
            checkpoint=ranker.CHECKPOINT,
            cegar_script=ranker.CEGAR_SCRIPT,
            expected_probe_sha256=ranker.EXPECTED["probe"],
            expected_positive_smt2_sha256=ranker.EXPECTED["positive_smt2"],
            expected_cegar_result_sha256=ranker.EXPECTED["cegar_result"],
            expected_checkpoint_sha256=ranker.EXPECTED["checkpoint"],
            expected_recorded_cegar_sha256=ranker.EXPECTED["recorded_cegar"],
            expected_class_count=19,
            expected_equation_count=38,
        )

    def rank_all(equations: Sequence[Any], miner: Any) -> list[dict[str, Any]]:
        rows = []
        for subset in itertools.combinations(range(19), 6):
            induced = miner.induced_equations(subset, equations)
            rows.append(ranker.structural_features(subset, induced))
        rows.sort(
            key=lambda row: (
                *(-value for value in row["priority_tuple"]),
                tuple(row["subset"]),
            )
        )
        for rank, row in enumerate(rows, start=1):
            row["rank"] = rank
        return rows

    ranker.source_config = source_config
    ranker.rank_all = rank_all
    code = ranker.main()

    ranking_old = HERE / "v13-six-structural-ranking.json"
    if ranking_old.exists():
        payload = json.loads(ranking_old.read_text())
        payload["schema"] = "p97-v16-six-structural-priority-ranking-v1"
        payload["reused_ranker"] = str(RANKER)
        (HERE / "v16-six-structural-ranking.json").write_text(
            json.dumps(payload, indent=2, sort_keys=True) + "\n"
        )
        ranking_old.unlink()

    tag = ""
    for index, arg in enumerate(sys.argv):
        if arg == "--run-tag" and index + 1 < len(sys.argv):
            tag = "-" + sys.argv[index + 1]
    result_old = HERE / f"v13-six-priority-search{tag}.json"
    report_old = HERE / f"v13-six-priority-search{tag}-report.md"
    if result_old.exists():
        payload = json.loads(result_old.read_text())
        payload["schema"] = "p97-v16-six-structural-priority-search-v1"
        payload["reused_ranker"] = str(RANKER)
        result_new = HERE / f"v16-six-priority-search{tag}.json"
        result_new.write_text(json.dumps(payload, indent=2, sort_keys=True) + "\n")
        result_old.unlink()
    if report_old.exists():
        text = report_old.read_text().replace("v13 six-class", "v16 six-class")
        (HERE / f"v16-six-priority-search{tag}-report.md").write_text(text)
        report_old.unlink()
    return code


if __name__ == "__main__":
    raise SystemExit(main())
