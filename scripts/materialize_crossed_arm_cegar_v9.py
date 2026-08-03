#!/usr/bin/env python3
"""Materialize or verify a deterministic crossed-arm CEGAR v9 CNF package."""

from __future__ import annotations

import argparse
import json
import sys
from pathlib import Path

if __package__:
    from .crossed_arm_cegar_v9_encoding import (
        EncodingError,
        materialize,
        verify_package,
    )
else:
    from crossed_arm_cegar_v9_encoding import (
        EncodingError,
        materialize,
        verify_package,
    )


def parser() -> argparse.ArgumentParser:
    command = argparse.ArgumentParser(description=__doc__)
    subcommands = command.add_subparsers(dest="command", required=True)

    build = subcommands.add_parser(
        "materialize", help="translate one frozen v9/v7 checkpoint"
    )
    build.add_argument("checkpoint", type=Path)
    build.add_argument("output_dir", type=Path)

    verify = subcommands.add_parser(
        "verify", help="regenerate a package and optionally authenticate its source"
    )
    verify.add_argument("package_dir", type=Path)
    verify.add_argument(
        "--checkpoint",
        type=Path,
        help="external original checkpoint to authenticate",
    )
    return command


def main(argv: list[str] | None = None) -> int:
    args = parser().parse_args(argv)
    try:
        if args.command == "materialize":
            materialize(args.checkpoint, args.output_dir)
            result = verify_package(args.output_dir, args.checkpoint)
        else:
            result = verify_package(args.package_dir, args.checkpoint)
    except EncodingError as exc:
        print(f"FAIL_CLOSED: {exc}", file=sys.stderr)
        return 2
    print(json.dumps(result, indent=2, sort_keys=True))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
