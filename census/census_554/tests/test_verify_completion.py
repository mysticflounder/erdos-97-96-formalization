from __future__ import annotations

import json
import tempfile
import unittest
from pathlib import Path

from census.census_554.verify_completion import (
    CompletionVerificationError,
    verify_completion,
)


class CompletionVerificationTests(unittest.TestCase):
    def test_legacy_marker_is_rejected_before_any_solver_call(self):
        with tempfile.TemporaryDirectory() as root_string:
            root = Path(root_string)
            (root / "COVERAGE_COMPLETE.json").write_text(
                json.dumps({"verdict": "UNSAT", "drat": {"resolve_unsat": True}}),
                encoding="utf-8",
            )

            def must_not_run(*_args, **_kwargs):
                raise AssertionError("checker should not run for legacy marker")

            with self.assertRaisesRegex(
                CompletionVerificationError, "legacy or unknown"
            ):
                verify_completion(root, command_runner=must_not_run)


if __name__ == "__main__":
    unittest.main()
