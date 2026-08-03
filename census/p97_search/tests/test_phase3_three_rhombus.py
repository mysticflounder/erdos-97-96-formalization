from __future__ import annotations

import copy
import unittest
from dataclasses import dataclass
from typing import Any

from census.p97_search import phase3_three_rhombus as three

LABELS = (0, 2, 4, 7, 5, 6, 8)
POSITIVES = frozenset(
    {
        (0, 2),
        (0, 5),
        (0, 7),
        (0, 8),
        (4, 2),
        (4, 6),
        (4, 7),
        (6, 4),
        (6, 5),
        (6, 8),
        (7, 0),
        (7, 4),
        (7, 5),
    }
)


def custom_var(center: int, point: int) -> int:
    return 1_000 + 10 * center + point


def rehash(certificate: dict[str, Any]) -> None:
    payload = dict(certificate)
    payload.pop("payload_sha256")
    certificate["payload_sha256"] = three.digest(payload)


@dataclass(frozen=True)
class Row:
    center: int
    support: tuple[int, ...]
    exact: bool


def semantic_assignment(*, legacy: bool) -> dict[str, bool]:
    semantic = {
        f"s[{center},{point}]": (center, point) in POSITIVES
        for center in range(three.N)
        for point in range(three.N)
        if center != point
    }
    semantic.update(
        {
            f"f[{point},{cap}]": False
            for point in range(3, three.N)
            for cap in range(3)
        }
    )
    if legacy:
        semantic.update(
            {
                f"b[{point},{center}]": False
                for point in range(three.N)
                for center in range(three.N)
                if point != center
            }
        )
    return semantic


class ThreeRhombusTests(unittest.TestCase):
    def test_known_thirteen_positive_hit_is_canonical(self) -> None:
        certificate = three.detect_three_rhombus(
            POSITIVES, var_lookup=custom_var
        )

        self.assertIsNotNone(certificate)
        assert certificate is not None
        self.assertEqual(list(LABELS), certificate["pattern_labels"])
        self.assertEqual([0, 2], certificate["root_edge"])
        self.assertEqual(
            [list(membership) for membership in sorted(POSITIVES)],
            certificate["used_positive_memberships"],
        )
        self.assertEqual(13, certificate["literal_count"])
        self.assertEqual(
            sorted(-custom_var(center, point) for center, point in POSITIVES),
            certificate["clause"],
        )
        self.assertIs(certificate["terminal_claim"], False)
        self.assertEqual(
            tuple(certificate["clause"]),
            three.replay_closure(
                certificate, POSITIVES, var_lookup=custom_var
            ),
        )

    def test_payload_and_generation_are_deterministic(self) -> None:
        first = three.generate_closure(POSITIVES)
        second = three.generate_closure(sorted(POSITIVES, reverse=True))

        self.assertEqual(
            three.canonical_bytes(first), three.canonical_bytes(second)
        )
        self.assertEqual(first["payload_sha256"], second["payload_sha256"])
        unsigned = dict(first)
        claimed = unsigned.pop("payload_sha256")
        self.assertEqual(three.digest(unsigned), claimed)

    def test_paths_are_directed_and_composable_edge_to_root(self) -> None:
        certificate = three.generate_closure(POSITIVES)
        path = next(
            path
            for path in certificate["equality_paths"]
            if path["edge"] == [0, 5]
        )

        self.assertEqual(
            [{"center": 0, "first": 5, "second": 2}], path["steps"]
        )
        self.assertEqual(
            POSITIVES, three.validate_equality_paths(certificate, POSITIVES)
        )

    def test_direction_tamper_fails_semantic_validation(self) -> None:
        certificate = three.generate_closure(POSITIVES)
        bad = copy.deepcopy(certificate)
        path = next(path for path in bad["equality_paths"] if path["steps"])
        step = path["steps"][0]
        step["first"], step["second"] = step["second"], step["first"]
        rehash(bad)

        with self.assertRaisesRegex(three.CertificateError, "does not start"):
            three.validate_equality_paths(bad, POSITIVES)
        with self.assertRaisesRegex(three.CertificateError, "does not start"):
            three.replay_closure(bad, POSITIVES)

    def test_replay_rejects_rehashed_canonical_tampering(self) -> None:
        certificate = three.generate_closure(POSITIVES)
        bad = copy.deepcopy(certificate)
        bad["pattern_labels"][1], bad["pattern_labels"][2] = (
            bad["pattern_labels"][2],
            bad["pattern_labels"][1],
        )
        rehash(bad)

        with self.assertRaises(three.CertificateError):
            three.replay_closure(bad, POSITIVES)

    def test_replay_rejects_rehashed_clause_tampering(self) -> None:
        certificate = three.generate_closure(POSITIVES)
        bad = copy.deepcopy(certificate)
        bad["clause"][0] -= 1
        bad["clause_sha256"] = three.digest(bad["clause"])
        rehash(bad)

        with self.assertRaisesRegex(three.CertificateError, "exact negation"):
            three.replay_closure(bad, POSITIVES)

    def test_replay_enforces_exact_top_level_fields(self) -> None:
        certificate = three.generate_closure(POSITIVES)
        bad = copy.deepcopy(certificate)
        bad["comment"] = "not in the schema"
        rehash(bad)

        with self.assertRaisesRegex(three.CertificateError, "fields mismatch"):
            three.replay_closure(bad, POSITIVES)

    def test_replay_enforces_exact_nested_fields(self) -> None:
        certificate = three.generate_closure(POSITIVES)
        bad = copy.deepcopy(certificate)
        path = next(path for path in bad["equality_paths"] if path["steps"])
        path["steps"][0]["comment"] = "not in the schema"
        rehash(bad)

        with self.assertRaisesRegex(three.CertificateError, "fields mismatch"):
            three.replay_closure(bad, POSITIVES)

    def test_payload_hash_tamper_fails_closed(self) -> None:
        certificate = three.generate_closure(POSITIVES)
        certificate["payload_sha256"] = "0" * 64

        with self.assertRaisesRegex(three.CertificateError, "payload_sha256"):
            three.replay_closure(certificate, POSITIVES)

    def test_exact_false_row_omissions_stay_unknown(self) -> None:
        rows = {
            "schema": three.ROWS_SCHEMA,
            "rows": [{"center": 0, "exact": False, "support": [2]}],
        }

        positives = three.parse_positive_rows(rows)
        self.assertEqual(frozenset({(0, 2)}), positives)
        self.assertNotIn((0, 3), positives)
        self.assertIsNone(three.detect_three_rhombus(rows))

    def test_strict_row_parser_rejects_extra_fields(self) -> None:
        rows = {
            "schema": three.ROWS_SCHEMA,
            "rows": [
                {
                    "center": 0,
                    "exact": False,
                    "support": [2],
                    "unknown": 1,
                }
            ],
        }

        with self.assertRaisesRegex(three.CertificateError, "fields mismatch"):
            three.parse_positive_rows(rows)

    def test_strict_row_parser_rejects_unsorted_support(self) -> None:
        rows = {
            "schema": three.ROWS_SCHEMA,
            "rows": [{"center": 0, "exact": True, "support": [3, 2]}],
        }

        with self.assertRaisesRegex(three.CertificateError, "must be sorted"):
            three.parse_positive_rows(rows)

    def test_generic_row_objects_use_only_explicit_support(self) -> None:
        rows = [
            Row(0, (2, 5, 7, 8), False),
            Row(4, (2, 6, 7), False),
            Row(6, (4, 5, 8), True),
            Row(7, (0, 4, 5), False),
        ]

        self.assertEqual(POSITIVES, three.extract_positive_memberships(rows))
        self.assertEqual(
            list(LABELS), three.generate_closure(rows)["pattern_labels"]
        )

    def test_strict_semantic_parsers_use_true_s_atoms_only(self) -> None:
        cases = (
            (three.SEMANTIC_SCHEMA_PROJECTED, False),
            (three.SEMANTIC_SCHEMA_LEGACY, True),
        )
        for schema, legacy in cases:
            with self.subTest(schema=schema):
                wrapped = {
                    "schema": schema,
                    "semantic_assignment": semantic_assignment(legacy=legacy),
                }
                self.assertEqual(
                    POSITIVES, three.parse_semantic_assignment(wrapped)
                )
                self.assertIsNotNone(three.detect_three_rhombus(wrapped))

    def test_semantic_parser_rejects_missing_atoms(self) -> None:
        semantic = semantic_assignment(legacy=False)
        semantic.pop("s[0,1]")

        with self.assertRaisesRegex(three.CertificateError, "field set"):
            three.parse_semantic_assignment(semantic)

    def test_semantic_parser_rejects_non_boolean_atoms(self) -> None:
        semantic: dict[str, Any] = semantic_assignment(legacy=False)
        semantic["s[0,1]"] = 1

        with self.assertRaisesRegex(three.CertificateError, "Boolean"):
            three.parse_semantic_assignment(semantic)

    def test_no_hit_does_not_call_variable_lookup(self) -> None:
        def forbidden_lookup(_center: int, _point: int) -> int:
            raise AssertionError("lookup must not run on a miss")

        self.assertIsNone(
            three.detect_three_rhombus(
                {(0, 1), (0, 2)}, var_lookup=forbidden_lookup
            )
        )
        with self.assertRaises(three.NoThreeRhombusError):
            three.generate_closure(set(), var_lookup=forbidden_lookup)

    def test_clause_callback_must_return_positive_integers(self) -> None:
        with self.assertRaisesRegex(three.CertificateError, "positive integer"):
            three.clause_for({(0, 1)}, var_lookup=lambda _p, _q: False)

    def test_clause_callback_must_be_injective(self) -> None:
        with self.assertRaisesRegex(three.CertificateError, "not injective"):
            three.clause_for(
                {(0, 1), (0, 2)}, var_lookup=lambda _p, _q: 17
            )


if __name__ == "__main__":
    unittest.main()
