# Copyright (c) 2026 Adam McKenna. All rights reserved.
# Released under Apache 2.0 license as described in the file LICENSE.
# Author: Adam McKenna <adam@mysticflounder.ai>

from __future__ import annotations

import unittest

from census.global_confinement.metric_core_dependencies import (
    _json_pointer_get,
    _minimize_groups,
    _row_groups,
)


class MetricCoreDependenciesTests(unittest.TestCase):
    def test_json_pointer_decodes_escaped_parts_and_list_indices(self) -> None:
        value = {"a/b": {"c~d": [{"answer": 42}]}}
        self.assertEqual(
            _json_pointer_get(value, "/a~1b/c~0d/0/answer"),
            42,
        )

    def test_row_groups_preserve_aliases_and_exact_provenance(self) -> None:
        assignment = {
            "global:0": {
                "center": 0,
                "support": [1, 2, 3, 4],
                "exact": False,
            },
            "shell:5": {
                "center": 0,
                "support": [4, 3, 2, 1],
                "exact": True,
            },
        }
        self.assertEqual(
            _row_groups(assignment, 6),
            [
                {
                    "center": 0,
                    "support": [1, 2, 3, 4],
                    "names": ["global:0", "shell:5"],
                    "exact_names": ["shell:5"],
                }
            ],
        )

    def test_minimization_preserves_decisive_obstruction(self) -> None:
        assignment = {
            "global:0": {"center": 0, "support": [2, 3, 4, 5]},
            "global:1": {"center": 1, "support": [2, 3, 4, 6]},
            "unused": {"center": 6, "support": [0, 1, 2, 3]},
        }
        groups = _row_groups(assignment, 7)
        kept, core = _minimize_groups(
            "equality-duplicate-center",
            groups,
            7,
            tuple(range(7)),
        )
        self.assertEqual(len(kept), 2)
        self.assertEqual(core, {"triple": [2, 3, 4], "centers": [0, 1]})


if __name__ == "__main__":
    unittest.main()
