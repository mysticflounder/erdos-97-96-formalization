#!/usr/bin/env python3
"""Generate the immutable bank-specific perpendicular-core replacement cache."""

from __future__ import annotations

import argparse
from pathlib import Path

import frozen_separation_probe as base
import perp_subsumption_cache as cache


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--bank", type=Path, required=True)
    parser.add_argument("--output", type=Path, required=True)
    args = parser.parse_args()
    digest = cache.write_cache_artifact(
        base, args.bank.resolve(), args.output.resolve()
    )
    print(digest)
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
