"""Invoke the frozen V8 wave miner through its inherited runner surface.

The V8 miner intentionally reuses the V5 implementation, but the frozen V8
runner does not export eight private symbols that implementation reads from its
runner module.  This bridge exposes exactly those already-frozen objects from
the runner's inherited base module.  It changes no scanner, receipt, model, or
acceptance semantics and never contacts PIQD or a solver.
"""

from __future__ import annotations

import sys
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
SCRIPTS = ROOT / "scripts"
for search_path in (ROOT, SCRIPTS):
    if str(search_path) not in sys.path:
        sys.path.insert(0, str(search_path))

import mine_exact17_canary_perp_bisector_survivor_four_point_two_circle_v8_two_kalmanson_refinements_sat_model as miner
import run_piqd_exact17_canary_perp_bisector_survivor_four_point_two_circle_v8_two_kalmanson_refinements_sat_portfolio as runner

INHERITED_RUNNER_SYMBOLS = (
    "PortfolioRunnerError",
    "STRUCTURAL_SAT",
    "_TERMINAL_RESULT_KEYS",
    "_artifact_bytes",
    "_candidate_id",
    "_load_cell_inputs",
    "_terminal_cell",
    "_validate_candidate_records",
)
PATH_FLAGS = ("--run-root", "--output-dir")


class V8WaveMinerBridgeError(RuntimeError):
    """The frozen V8 miner/runner bridge contract drifted."""


def bind_inherited_runner_surface() -> tuple[str, ...]:
    """Expose exactly the missing inherited symbols required by the miner."""

    for name in INHERITED_RUNNER_SYMBOLS:
        if name in vars(runner):
            raise V8WaveMinerBridgeError(
                f"V8 runner now exports {name}; retire or refreeze the bridge"
            )
        try:
            value = getattr(runner._BASE, name)
        except AttributeError as exc:
            raise V8WaveMinerBridgeError(
                f"inherited V8 runner symbol is unavailable: {name}"
            ) from exc
        setattr(runner, name, value)
    return INHERITED_RUNNER_SYMBOLS


def normalize_operator_paths(
    argv: list[str],
    *,
    root: Path = ROOT,
    expected_run_root: Path = runner.OUTPUT_ROOT,
) -> list[str]:
    """Resolve and pin the two inherited CLI paths before miner dispatch."""

    normalized = list(argv)
    seen: set[str] = set()
    expected = {
        "--run-root": expected_run_root.resolve(strict=True),
        "--output-dir": (expected_run_root / "artifacts").resolve(strict=True),
    }
    for index, token in enumerate(normalized):
        if token not in PATH_FLAGS:
            continue
        if token in seen or index + 1 >= len(normalized):
            raise V8WaveMinerBridgeError(f"invalid or duplicated path flag: {token}")
        seen.add(token)
        candidate = Path(normalized[index + 1])
        if not candidate.is_absolute():
            candidate = root / candidate
        try:
            resolved = candidate.resolve(strict=True)
        except OSError as exc:
            raise V8WaveMinerBridgeError(f"path cannot be resolved: {token}") from exc
        if resolved != expected[token]:
            raise V8WaveMinerBridgeError(f"path route drifted: {token}")
        normalized[index + 1] = str(resolved)
    if seen != set(PATH_FLAGS):
        raise V8WaveMinerBridgeError("both --run-root and --output-dir are required")
    return normalized


def main(argv: list[str] | None = None) -> int:
    operator_args = sys.argv[1:] if argv is None else argv
    if "-h" in operator_args or "--help" in operator_args:
        return miner.main(operator_args)
    miner.validate_committed_dependencies()
    miner.preparer.require_production_pins()
    normalized = normalize_operator_paths(operator_args)
    bind_inherited_runner_surface()
    return miner.main(normalized)


if __name__ == "__main__":
    raise SystemExit(main())
