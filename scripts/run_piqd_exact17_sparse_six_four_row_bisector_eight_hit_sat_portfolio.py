# Copyright (c) 2026 Adam McKenna. All rights reserved.
# Released under Apache 2.0 license as described in the file LICENSE.
# ruff: noqa: F821
"""Run the governed true-EightHit six-cell SAT-profile portfolio.

This is the fresh identity surface for the hardened portfolio driver.  It
retains canary-then-rest ordering, fresh-only PIQD submission, descriptor and
nofollow custody, one core per cell, and full UNSAT replay.  The v5 production
campaign is finalized and authenticated; the portfolio runtime root remains
uninitialized until an explicit launch command is used.
"""

from __future__ import annotations

from pathlib import Path

_BASE = Path(__file__).with_name(
    "run_piqd_exact17_sparse_six_four_row_bisector_two_kalmanson_sat_portfolio.py"
)
_TEXT = _BASE.read_text(encoding="utf-8")
_REPLACEMENTS = (
    (
        "prepare_exact17_sparse_six_four_row_bisector_two_kalmanson_sat_portfolio",
        "prepare_exact17_sparse_six_four_row_bisector_eight_hit_sat_portfolio",
    ),
    (
        "exact17-sparse-six-four-row-bisector-two-kalmanson-sat-portfolio-20260820",
        "exact17-eight-hit-sat-portfolio-20260821",
    ),
    (
        "sat-profile-portfolio-v1",
        "eight-hit-sat-profile-portfolio-v1",
    ),
    (
        "sparse-six-four-row-bisector-two-kalmanson",
        "sparse-six-four-row-bisector-eight-hit-two-kalmanson",
    ),
    (
        "four-row-bisector-two-kalmanson-next",
        "four-row-bisector-eight-hit-two-kalmanson-next",
    ),
    (
        "scripts/prepare_exact17_sparse_six_four_row_bisector_two_kalmanson_sat_portfolio.py",
        "scripts/prepare_exact17_sparse_six_four_row_bisector_eight_hit_sat_portfolio.py",
    ),
    (
        "scripts/run_piqd_exact17_sparse_six_four_row_bisector_two_kalmanson_sat_portfolio.py",
        "scripts/run_piqd_exact17_sparse_six_four_row_bisector_eight_hit_sat_portfolio.py",
    ),
    (
        "scripts/test_prepare_exact17_sparse_six_four_row_bisector_two_kalmanson_sat_portfolio.py",
        "scripts/test_prepare_exact17_sparse_six_four_row_bisector_eight_hit_sat_portfolio.py",
    ),
    (
        "scripts/test_run_piqd_exact17_sparse_six_four_row_bisector_two_kalmanson_sat_portfolio.py",
        "scripts/test_run_piqd_exact17_sparse_six_four_row_bisector_eight_hit_sat_portfolio.py",
    ),
)
for _old, _new in _REPLACEMENTS:
    _TEXT = _TEXT.replace(_old, _new)
_MAIN_NAME = "__main__"
_MAIN_GUARD = f'\nif __name__ == "{_MAIN_NAME}":\n    raise SystemExit(main())\n'
if _TEXT.count(_MAIN_GUARD) != 1:
    raise RuntimeError("predecessor main guard drifted; refusing embedded execution")
_TEXT = _TEXT.replace(_MAIN_GUARD, "\n", 1)
exec(compile(_TEXT, str(_BASE), "exec"), globals(), globals())  # noqa: S102


__doc__ = """Run the finalized authenticated true-EightHit v5 six-cell SAT portfolio.

The portfolio runtime root remains uninitialized until an explicit command.
"""


def main(argv: list[str] | None = None) -> int:
    parser = argparse.ArgumentParser(
        description="Run the finalized authenticated EightHit v5 SAT-profile portfolio."
    )
    parser.add_argument(
        "command", choices=("static-check", "start-canary", "start-rest", "start")
    )
    parser.add_argument("--base-url", default="http://127.0.0.1:7272")
    args = parser.parse_args(argv)
    try:
        if args.command == "static-check":
            payload = static_check(root=ROOT, run_root=RUN_ROOT)
        elif args.command == "start-canary":
            payload = start_canary(base_url=args.base_url, root=ROOT, run_root=RUN_ROOT)
        elif args.command == "start-rest":
            payload = start_rest(base_url=args.base_url, root=ROOT, run_root=RUN_ROOT)
        else:
            payload = start(base_url=args.base_url, root=ROOT, run_root=RUN_ROOT)
    except (
        OSError,
        PortfolioRunnerError,
        preparation.PreparationError,
        PiqdDriverError,
        PiqdOracleError,
        LratReplayError,
    ) as exc:
        print(f"EightHit SAT-profile portfolio rejected: {exc}", file=sys.stderr)
        return 2
    print(json.dumps(payload, sort_keys=True))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
