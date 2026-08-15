#!/usr/bin/env bash
# Copyright (c) 2026 Adam McKenna. All rights reserved.
# Released under Apache 2.0 license as described in the file LICENSE.
# Author: Adam McKenna <adam@mysticflounder.ai>
set -euo pipefail
cd "$(dirname "$0")"
uv run python wave.py --prepare
uv run python wave.py --run
uv run python validate_full_clauses.py
uv run python validate_model.py
uv run python validate_clauses.py
uv run python source_validate.py
