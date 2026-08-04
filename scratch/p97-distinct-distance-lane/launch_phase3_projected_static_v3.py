"""Prepare or execute a provenance-pinned projected-static-v3 shard wave.

This is the first migration adapter for the fixed-shard Phase-3 lanes.  It
does not consume a projected-static-v2 learned stream: v2 and v3 have
different CNF and learned-record schemas.  The authenticated three-rhombus
prefix bank is therefore the explicit bridge into the v3 bootstrap surface.

The default is a dry run.  ``--execute`` is required to start solver
processes, so producing a launch record cannot accidentally create a new
computational lane.
"""

from __future__ import annotations

import argparse
import hashlib
import json
import subprocess
import sys
from datetime import UTC, datetime
from pathlib import Path

ROOT = Path(__file__).resolve().parents[2]
DRIVER = ROOT / "census/p97_search/phase3_structural_cegar_projected_static_v3.py"
ENCODER = ROOT / "census/p97_search/sat_generate.py"
PREFIX_PRODUCER = ROOT / "census/p97_search/phase3_three_rhombus_prefix_bank.py"
PREFIX_BANK = (
    ROOT
    / "scratch/p97-distinct-distance-lane/p7-canary-20260803/"
    "prefix-bank-current"
)
PREFIX_CACHE = (
    ROOT
    / "scratch/p97-distinct-distance-lane/"
    "p0-p5-prefix-bank-cache-current-20260803/prefix-cache.json"
)

SCHEMA = "p97-phase3-projected-static-v3-launch-v1"
EXPECTED_SOURCES = {
    DRIVER: "a57d2c9b2f45617a068d231cf300c49c36b623908836c05e1f9dffcc7f616e08",
    ENCODER: "5a32d21476ca47945cf5be41cbf07fe4fe831fd91a88be7326bb3138df38d817",
    PREFIX_PRODUCER: "6626aaad7b03bc7ac2336fbe313b0578bd248a3d8a25475330b44496359320f9",
}
PREFIX_BANK_ROOT_SHA256 = (
    "645a4092854d445134c1ca691f94add287da0a69886d5cac69ef5c32afbcdd01"
)
PREFIX_SOURCE_SHA256 = (
    "7f31d598bcf42083a99f0af20abb9b461c015e32acab8ff58984c139544c8ab9"
)


def _sha256_file(path: Path) -> str:
    digest = hashlib.sha256()
    with path.open("rb") as handle:
        for chunk in iter(lambda: handle.read(1024 * 1024), b""):
            digest.update(chunk)
    return digest.hexdigest()


def _relative(path: Path) -> str:
    return str(path.resolve().relative_to(ROOT))


def _check_provenance(*, use_prefix_cache: bool) -> dict[str, object]:
    source_hashes: dict[str, str] = {}
    for path, expected in EXPECTED_SOURCES.items():
        if not path.is_file():
            raise SystemExit(f"required source is missing: {path}")
        observed = _sha256_file(path)
        if observed != expected:
            raise SystemExit(
                f"source hash mismatch for {_relative(path)}: "
                f"{observed} != {expected}"
            )
        source_hashes[_relative(path)] = observed

    sums_path = PREFIX_BANK / "SHA256SUMS"
    if not PREFIX_BANK.is_dir() or not sums_path.is_file():
        raise SystemExit(f"authenticated prefix bank is missing: {PREFIX_BANK}")
    observed_root = _sha256_file(sums_path)
    if observed_root != PREFIX_BANK_ROOT_SHA256:
        raise SystemExit(
            f"prefix-bank root hash mismatch: {observed_root} != "
            f"{PREFIX_BANK_ROOT_SHA256}"
        )
    if use_prefix_cache and not PREFIX_CACHE.is_file():
        raise SystemExit(f"requested prefix cache is missing: {PREFIX_CACHE}")

    prefix = {
        "bank": {
            "path": _relative(PREFIX_BANK),
            "sha256s_root_sha256": observed_root,
            "source_prefix_sha256": PREFIX_SOURCE_SHA256,
        },
        "cache": (
            {
                "mode": "authenticated-opt-in",
                "path": _relative(PREFIX_CACHE),
                "sha256": _sha256_file(PREFIX_CACHE),
            }
            if use_prefix_cache
            else {"mode": "source-replay"}
        ),
    }
    return {"sources": source_hashes, "prefix": prefix}


def _command(
    *,
    shard: Path,
    timeout: int,
    learned_core_limit: int,
    survivor_limit: int,
    shard_depth: int,
    shard_index: int,
    use_prefix_cache: bool,
    max_new_raw: int | None,
) -> list[str]:
    command = [
        sys.executable,
        str(DRIVER),
        "--out",
        str(shard),
        "--projected-static-v3",
        "--no-bootstrap",
        "--timeout",
        str(timeout),
        "--learned-core-limit",
        str(learned_core_limit),
        "--survivor-limit",
        str(survivor_limit),
        "--workers",
        "1",
        "--parallel-mode",
        "sequential",
        "--shard-depth",
        str(shard_depth),
        "--shard-index",
        str(shard_index),
        "--three-rhombus-prefix-bank",
        str(PREFIX_BANK),
        "--three-rhombus-prefix-root-sha256",
        PREFIX_BANK_ROOT_SHA256,
        "--three-rhombus-prefix-source-sha256",
        PREFIX_SOURCE_SHA256,
    ]
    if use_prefix_cache:
        command.extend(("--three-rhombus-prefix-cache", str(PREFIX_CACHE)))
    if max_new_raw is not None:
        command.extend(("--max-new-raw", str(max_new_raw)))
    return command


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("output_root", type=Path)
    parser.add_argument("indices", type=int, nargs="+")
    parser.add_argument("--shard-depth", type=int, default=5)
    parser.add_argument("--timeout", type=int, default=86400)
    parser.add_argument("--learned-core-limit", type=int, default=100000)
    parser.add_argument("--survivor-limit", type=int, default=1000)
    parser.add_argument("--max-new-raw", type=int)
    parser.add_argument(
        "--use-prefix-cache",
        action="store_true",
        help="use the authenticated warm prefix cache; source replay remains authoritative",
    )
    parser.add_argument(
        "--execute",
        action="store_true",
        help="actually start the v3 solver processes; default is a dry run",
    )
    args = parser.parse_args()

    if not 1 <= args.shard_depth <= 12:
        parser.error("--shard-depth must be in 1..12")
    if not args.indices or len(args.indices) != len(set(args.indices)):
        parser.error("indices must be a nonempty duplicate-free list")
    if any(index < 0 or index >= 1 << args.shard_depth for index in args.indices):
        parser.error(f"indices must be in [0, {1 << args.shard_depth})")
    if len(args.indices) > 20:
        parser.error("one launch wave may use at most 20 solver workers")
    if args.timeout <= 0 or args.learned_core_limit < 1000 or args.survivor_limit <= 0:
        parser.error("timeout, limits, and survivor limit must be positive")
    if args.max_new_raw is not None and args.max_new_raw <= 0:
        parser.error("--max-new-raw must be positive")

    output_root = args.output_root.resolve()
    if output_root.exists():
        raise SystemExit(f"refusing to reuse output root: {output_root}")
    provenance = _check_provenance(use_prefix_cache=args.use_prefix_cache)
    width = max(2, len(str((1 << args.shard_depth) - 1)))
    commands = []
    for index in args.indices:
        shard = output_root / f"shard-{index:0{width}d}"
        commands.append(
            {
                "shard_index": index,
                "output": _relative(shard),
                "command": _command(
                    shard=shard,
                    timeout=args.timeout,
                    learned_core_limit=args.learned_core_limit,
                    survivor_limit=args.survivor_limit,
                    shard_depth=args.shard_depth,
                    shard_index=index,
                    use_prefix_cache=args.use_prefix_cache,
                    max_new_raw=args.max_new_raw,
                ),
            }
        )

    manifest: dict[str, object] = {
        "schema": SCHEMA,
        "created_at": datetime.now(UTC).isoformat(),
        "executed": args.execute,
        "driver_mode": "projected-static-v3-fixed-shard",
        "compatibility": (
            "v2 learned streams are not accepted; the authenticated v2 "
            "three-rhombus prefix bank is translated at the v3 boundary"
        ),
        "provenance": provenance,
        "shard_depth": args.shard_depth,
        "commands": commands,
    }

    if args.execute:
        output_root.mkdir(parents=True)
        launched = []
        for item in commands:
            command = item["command"]
            assert isinstance(command, list)
            shard = output_root / f"shard-{item['shard_index']:0{width}d}"
            log_path = output_root / f"shard-{item['shard_index']:0{width}d}.driver.log"
            with log_path.open("wb") as log_handle:
                process = subprocess.Popen(
                    command,
                    cwd=ROOT,
                    stdin=subprocess.DEVNULL,
                    stdout=log_handle,
                    stderr=subprocess.STDOUT,
                    start_new_session=True,
                )
            launched.append(
                {
                    "shard_index": item["shard_index"],
                    "pid": process.pid,
                    "pgid": process.pid,
                    "output": _relative(shard),
                    "log": _relative(log_path),
                }
            )
        manifest["launched"] = launched
        (output_root / "launch-manifest.json").write_text(
            json.dumps(manifest, indent=2, sort_keys=True) + "\n"
        )

    print(json.dumps(manifest, indent=2, sort_keys=True))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
