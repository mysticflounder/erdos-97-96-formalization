#!/usr/bin/env python3
"""Submit and finalize the twenty-first Lean-owned exact-17 PIQD root.

The twentieth-root runner is a historical custody artifact. Load its audited
bytes, specialize root-local labels in memory, and bind the child rooted at
the twentieth model refinements so no earlier job state or artifact can be
overwritten.

The Lean exporter and ingress validators have not produced the child21
artifacts yet. Their dimensions and hashes therefore remain explicit
fail-closed placeholders below; replace them only after those artifacts have
been independently exported and validated.
"""

from __future__ import annotations

import hashlib
from pathlib import Path
from typing import Any

ROOT = Path(__file__).resolve().parents[1]
BASE_RUNNER = ROOT / "scripts" / "run_piqd_exact17_twentieth_root.py"
BASE_RUNNER_SHA256 = "cbd0022c419249e3e2ce1d0730014106f01cc9dd451afd0ce798ffa9e3e9355c"

UNPOPULATED = "REPLACE_AFTER_CHILD21_EXPORT_AND_INGRESS_VALIDATION"


def load_runner() -> dict[str, Any]:
    source_bytes = BASE_RUNNER.read_bytes()
    actual_hash = hashlib.sha256(source_bytes).hexdigest()
    if actual_hash != BASE_RUNNER_SHA256:
        raise RuntimeError(
            "historical twentieth-root runner changed: "
            f"expected {BASE_RUNNER_SHA256}, got {actual_hash}"
        )
    source = source_bytes.decode("utf-8")
    if source.count("twentieth") != 4:
        raise RuntimeError("unexpected twentieth-root specialization surface")
    source = source.replace("twentieth", "twenty-first")
    namespace: dict[str, Any] = {
        "__file__": str(BASE_RUNNER),
        "__name__": "_piqd_exact17_twenty_first_root_base",
    }
    # The executed bytes are pinned above; this is specialization, not input evaluation.
    exec(compile(source, str(BASE_RUNNER), "exec"), namespace)  # noqa: S102
    inherited = namespace["load_runner"]()
    if not isinstance(inherited, dict):
        raise TypeError("twentieth-root runner did not return a namespace")
    return inherited


def require_export_constants(runner: dict[str, Any]) -> None:
    missing = [
        name
        for name in ("CLAUSES", "BYTES", "CNF_SHA256", "MANIFEST_SHA256")
        if runner.get(name) in (None, UNPOPULATED)
    ]
    if missing:
        raise SystemExit(
            "child21 exporter/validator values are not populated: "
            + ", ".join(missing)
        )


def main() -> None:
    runner = load_runner()
    scratch = runner["SCRATCH"]
    runner.update(
        {
            "CNF": scratch
            / "exact17-twenty-first-root-twentieth-model-refinements.cnf",
            "INGRESS_MANIFEST": scratch
            / "piqd-ingress-manifest-twentieth-model-refinements.json",
            "INGRESS_REPORT": scratch
            / "piqd-ingress-twentieth-model-refinements-validation.json",
            "VARIABLES": 308,
            "CLAUSES": 5_846_200,
            "BYTES": 291_573_600,
            "CNF_SHA256": "bc42cd2756d6b3d84c5eb265762bc346a893dbdbc01bbe8ac5dbcb2f53f89720",
            "MANIFEST_SHA256": "6ffd148a57458b23929dc933eeb2b35607f860c790b8cda347090311105cbe22",
            "DAEMON_SHA256": "fa66c08a9f341bb03ce1c39d32737f6b5bb91efe31d6a55f86f903caf207383c",
            "SOLVER_NAME": "piqd-satworker-cadical-3.0.0",
            "SOLVER_SHA256": "0ee355934249f1b3f14a20928877391a87a0dd51326cf8c6135f75cba0b6b965",
        }
    )
    require_export_constants(runner)
    runner["main"]()


if __name__ == "__main__":
    main()
