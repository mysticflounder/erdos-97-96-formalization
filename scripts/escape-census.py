#!/usr/bin/env python3
"""Compatibility entrypoint for the promoted incidence census."""
import os
import sys

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
sys.path.insert(0, ROOT)

from census.incidence.escape_census import main


if __name__ == "__main__":
    main()
