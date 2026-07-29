#!/usr/bin/env python3
"""Run the established v13 six-subset structural ranker on the pinned v14 source.

This wrapper changes only the source ledger, class count, output directory, and
artifact labels.  The ordered-Euclidean encoding and structural priority score
come verbatim from ``v13-six-priority/rank_and_check_v13_six.py``.
"""

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
    spec = importlib.util.spec_from_file_location("v14_reused_six_ranker", RANKER)
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
    ranker.PROBE = HERE / "euclidean-survivor-probe-v14.json"
    ranker.POSITIVE_SMT2 = HERE / "euclidean-survivor-probe-v14.positive_rows.smt2"
    ranker.CEGAR_RESULT = LANE / "cegar-v14-local-critical-reuse-second.json"
    ranker.CHECKPOINT = LANE / "cegar-v14-local-critical-reuse-second.checkpoint.json"
    ranker.CEGAR_SCRIPT = LANE / "cegar.py"
    ranker.EXPECTED = {
        "probe": "c345a0a3dc537318bf127fc4e0d94d387e75e2b8ce2660e742d41983b40c756c",
        "positive_smt2": "3124381b418689d854da565d4946a4cd5a37c140189831197ecf598b09188424",
        "cegar_result": "178766b128eab24c2dc26117c696fcdbbf2dbcde428ed6519217cd0dec99fd10",
        "checkpoint": "c1560dfab02aa89ae0b7f28c252a23b498d72c38d2bd1edbbf822516f9162ef9",
        "recorded_cegar": "b09301016aabdb65a97eade8b3a38a043bca009feb69de31a235c739dfd0c7a7",
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
            expected_class_count=17,
            expected_equation_count=34,
        )

    def rank_all(equations: Sequence[Any], miner: Any) -> list[dict[str, Any]]:
        rows = []
        for subset in itertools.combinations(range(17), 6):
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
        payload["schema"] = "p97-v14-six-structural-priority-ranking-v1"
        payload["reused_ranker"] = str(RANKER)
        (HERE / "v14-six-structural-ranking.json").write_text(
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
        payload["schema"] = "p97-v14-six-structural-priority-search-v1"
        payload["reused_ranker"] = str(RANKER)
        result_new = HERE / f"v14-six-priority-search{tag}.json"
        result_new.write_text(json.dumps(payload, indent=2, sort_keys=True) + "\n")
        result_old.unlink()
    if report_old.exists():
        text = report_old.read_text().replace("v13 six-class", "v14 six-class")
        (HERE / f"v14-six-priority-search{tag}-report.md").write_text(text)
        report_old.unlink()
    return code


if __name__ == "__main__":
    raise SystemExit(main())
