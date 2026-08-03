#!/usr/bin/env python3
"""Bounded tests for the crossed-arm v9 deterministic CNF exporter."""

from __future__ import annotations

import itertools
import json
import math
import tempfile
import unittest
from collections import Counter
from dataclasses import replace
from pathlib import Path
from unittest import mock

from scripts import crossed_arm_cegar_v9_encoding as encoding
from scripts import materialize_crossed_arm_cegar_v9 as cli


def checkpoint_payload(
    *,
    arm: str = "source-at-common",
    connectivity: list[list[int]] | None = None,
    structural: list[list[object]] | None = None,
    theorem: list[list[object]] | None = None,
    result_critical_no_k4_representation: str | None = None,
    learned_critical_no_k4_representation: str | None = None,
) -> dict[str, object]:
    connectivity = [] if connectivity is None else connectivity
    structural = [] if structural is None else structural
    theorem = [] if theorem is None else theorem
    learned_cuts: dict[str, object] = {
        "schema": encoding.CUT_SCHEMA,
        "structural_families": list(encoding.STRUCTURAL_FAMILIES),
        "theorem_families": list(encoding.FULL_BANK_FAMILIES),
        "connectivity": connectivity,
        "structural": structural,
        "theorem": theorem,
    }
    if learned_critical_no_k4_representation is not None:
        learned_cuts["critical_no_K4_representation"] = (
            learned_critical_no_k4_representation
        )
    result: dict[str, object] = {
        "schema": encoding.RESULT_SCHEMA,
        "n": encoding.N,
        "closed_cap_profile": list(encoding.PROFILE),
        "arm": arm,
        "forced_shared_fourth": True,
        "status": "UNKNOWN_FAIL_CLOSED",
        "connectivity_cut_count": len(connectivity),
        "structural_cut_count": len(structural),
        "theorem_cut_count": len(theorem),
        "structural_cut_counts": {
            family: sum(row[0] == family for row in structural)
            for family in encoding.STRUCTURAL_FAMILIES
        },
        "theorem_cut_counts": {
            family: sum(row[1] == family for row in theorem)
            for family in encoding.FULL_BANK_FAMILIES
        },
        "learned_cuts": learned_cuts,
    }
    if result_critical_no_k4_representation is not None:
        result["critical_no_K4_representation"] = (
            result_critical_no_k4_representation
        )
    return result


def write_checkpoint(path: Path, payload: dict[str, object]) -> None:
    path.write_bytes(encoding.canonical_json_bytes(payload))


def write_canonical_json(path: Path, payload: dict[str, object]) -> bytes:
    raw = encoding.canonical_json_bytes(payload)
    path.write_bytes(raw)
    return raw


def refresh_manifest_artifact(
    package: Path,
    filename: str,
    *,
    schema: str | None = None,
) -> None:
    artifact_path = package / filename
    raw = artifact_path.read_bytes()
    manifest_path = package / "manifest.json"
    manifest = json.loads(manifest_path.read_text())
    entry: dict[str, object] = {
        "filename": filename,
        "sha256": encoding.sha256_bytes(raw),
        "bytes": len(raw),
    }
    if schema is not None:
        entry["schema"] = schema
    manifest["artifacts"][filename] = entry
    write_canonical_json(manifest_path, manifest)


def tiny_base(arm: str, force_shared_fourth: bool) -> encoding.Encoding:
    result = encoding.Encoding(arm=arm, force_shared_fourth=force_shared_fourth)
    encoding._register_variables(result)
    probe = result.variables.get("M", 0, 1)
    phases = [
        "base.global_edge_equality_closure",
        "base.cyclic_position_block_permutation",
        "base.between_definition",
        "base.fresh_outside_conjunction_definition",
    ]
    if force_shared_fourth:
        phases.append("base.shared_fourth_shell_definition")
    phases.extend((
        "base.global_K4",
        "base.critical_blocker_total",
        "base.critical_blocker_nonself",
        "base.critical_support_exact",
        "base.critical_no_K4_after_source_deletion",
        "base.blocker_collisions_and_freshness",
        "base.first_apex_classes",
        "base.exact_shell_intersections",
        "base.five_center_deletion",
        "base.euclidean_incidence",
        "base.crossed_arm",
    ))
    for index, phase in enumerate(phases):
        with result.phase(phase):
            if index == 0:
                result.ledger.add("base.probe", (probe,))
                result.ledger.add("base.probe.alias", (probe,))
    result.base_complete = True
    return result


class CheckpointValidationTests(unittest.TestCase):
    def test_accepts_exact_frozen_schema(self) -> None:
        with tempfile.TemporaryDirectory() as directory:
            path = Path(directory) / "checkpoint.json"
            write_checkpoint(path, checkpoint_payload())
            frozen = encoding.load_checkpoint(path)
            self.assertEqual(frozen.arm, "source-at-common")
            self.assertEqual(frozen.status, "UNKNOWN_FAIL_CLOSED")
            self.assertEqual(frozen.source_name, "checkpoint.json")
            self.assertEqual(
                frozen.critical_no_k4_representation,
                encoding.CRITICAL_NO_K4_TRIPLE_CLAUSES,
            )
            self.assertEqual(
                frozen.critical_no_k4_representation_records, ()
            )

    def test_reconciles_top_level_and_nested_representations(self) -> None:
        with tempfile.TemporaryDirectory() as directory:
            cases = (
                ("triple-clauses", None, ("result",)),
                (None, "compact-pb", ("learned_cuts",)),
                ("triple-clauses", "triple-clauses", (
                    "result", "learned_cuts"
                )),
                ("compact-pb", "compact-pb", (
                    "result", "learned_cuts"
                )),
            )
            for index, (result_rep, learned_rep, records) in enumerate(cases):
                path = Path(directory) / f"checkpoint-{index}.json"
                write_checkpoint(path, checkpoint_payload(
                    result_critical_no_k4_representation=result_rep,
                    learned_critical_no_k4_representation=learned_rep,
                ))
                frozen = encoding.load_checkpoint(path)
                with self.subTest(index=index):
                    self.assertEqual(
                        frozen.critical_no_k4_representation,
                        result_rep or learned_rep,
                    )
                    self.assertEqual(
                        frozen.critical_no_k4_representation_records,
                        records,
                    )

    def test_rejects_mismatched_unsupported_or_extra_representation(self) -> None:
        mismatch = checkpoint_payload(
            result_critical_no_k4_representation="triple-clauses",
            learned_critical_no_k4_representation="compact-pb",
        )
        unsupported = checkpoint_payload(
            learned_critical_no_k4_representation="future-format"
        )
        explicit_null = checkpoint_payload()
        explicit_null["critical_no_K4_representation"] = None
        extra = checkpoint_payload()
        extra["learned_cuts"]["unexpected"] = True
        with tempfile.TemporaryDirectory() as directory:
            for index, payload in enumerate((
                mismatch, unsupported, explicit_null, extra
            )):
                path = Path(directory) / f"checkpoint-{index}.json"
                write_checkpoint(path, payload)
                with self.subTest(index=index), self.assertRaises(
                    encoding.EncodingError
                ):
                    encoding.load_checkpoint(path)

    def test_compact_tail_expansion_equals_negative_four_subsets(self) -> None:
        remaining = tuple(range(15))
        triple_clauses = encoding._critical_no_k4_negative_triples(remaining)
        compact_expansion = (
            encoding._critical_no_k4_compact_tail_expansion(remaining)
        )
        self.assertEqual(compact_expansion, triple_clauses)
        self.assertEqual(len(triple_clauses), math.comb(15, 4))
        self.assertEqual(17 * 16 * len(triple_clauses), 371_280)
        for index in range(len(remaining) - 3):
            tail_size = len(remaining[index + 1:])
            negative_triples = tuple(itertools.combinations(
                range(tail_size), 3
            ))
            for mask in range(1 << tail_size):
                pb_le_two = mask.bit_count() <= 2
                expanded_cnf = all(
                    not all(mask & (1 << point) for point in triple)
                    for triple in negative_triples
                )
                self.assertEqual(expanded_cnf, pb_le_two)

    def test_production_critical_shell_wires_canonical_expansion(self) -> None:
        result = encoding.Encoding(
            arm=encoding.ARMS[0], force_shared_fourth=True
        )
        encoding._register_variables(result)
        seen_remaining: list[tuple[int, ...]] = []

        def one_expansion(
            remaining: tuple[int, ...],
        ) -> tuple[tuple[int, int, int, int], ...]:
            seen_remaining.append(remaining)
            return (tuple(remaining[:4]),)

        with mock.patch.object(
            encoding,
            "_critical_no_k4_negative_triples",
            side_effect=one_expansion,
        ):
            encoding._emit_critical_shells(result)
        self.assertEqual(len(seen_remaining), encoding.N * (encoding.N - 1))
        self.assertTrue(all(len(remaining) == 15 for remaining in seen_remaining))
        no_k4_phase = next(
            row for row in result.phase_ranges
            if row["phase"] == "base.critical_no_K4_after_source_deletion"
        )
        self.assertEqual(no_k4_phase["count"], encoding.N * (encoding.N - 1))

    def test_rejects_schema_drift(self) -> None:
        with tempfile.TemporaryDirectory() as directory:
            path = Path(directory) / "checkpoint.json"
            payload = checkpoint_payload()
            payload["schema"] = "v10-is-not-v9"
            write_checkpoint(path, payload)
            with self.assertRaises(encoding.EncodingError):
                encoding.load_checkpoint(path)

    def test_rejects_noncanonical_and_duplicate_cuts(self) -> None:
        cases = (
            checkpoint_payload(connectivity=[[2, 1]]),
            checkpoint_payload(connectivity=[[1, 2], [1, 2]]),
            checkpoint_payload(
                structural=[
                    ["mutual_bisector_transport", 0, 3, 2]
                ]
            ),
        )
        with tempfile.TemporaryDirectory() as directory:
            for index, payload in enumerate(cases):
                path = Path(directory) / f"checkpoint-{index}.json"
                write_checkpoint(path, payload)
                with self.subTest(index=index), self.assertRaises(
                    encoding.EncodingError
                ):
                    encoding.load_checkpoint(path)

    def test_rejects_duplicate_json_keys(self) -> None:
        with tempfile.TemporaryDirectory() as directory:
            path = Path(directory) / "checkpoint.json"
            canonical = encoding.compact_json_bytes(checkpoint_payload())
            path.write_bytes(b'{"schema":"duplicate",' + canonical[1:])
            with self.assertRaises(encoding.EncodingError):
                encoding.load_checkpoint(path)

    def test_rejects_missing_or_drifting_declared_counts(self) -> None:
        with tempfile.TemporaryDirectory() as directory:
            for index, payload in enumerate((
                checkpoint_payload(), checkpoint_payload(),
            )):
                if index == 0:
                    del payload["theorem_cut_count"]
                else:
                    payload["structural_cut_count"] = 1
                path = Path(directory) / f"checkpoint-{index}.json"
                write_checkpoint(path, payload)
                with self.subTest(index=index), self.assertRaises(
                    encoding.EncodingError
                ):
                    encoding.load_checkpoint(path)


class CrossedArmPolarityTests(unittest.TestCase):
    @staticmethod
    def clause_holds(clause: tuple[int, ...], assignment: dict[int, bool]) -> bool:
        return any(
            assignment[abs(literal)] == (literal > 0) for literal in clause
        )

    def test_arm_role_mapping_and_all_four_active_literals(self) -> None:
        self.assertEqual(
            encoding.crossed_arm_roles("source-at-common", "source", "other"),
            ("source", "other"),
        )
        self.assertEqual(
            encoding.crossed_arm_roles("other-at-common", "source", "other"),
            ("other", "source"),
        )
        clauses = encoding.crossed_arm_polarity_clauses(1, 2, 3, 4, 5, 6, 7)
        correct = {1: True, 2: True, 3: True, 4: True, 5: False, 6: False, 7: True}
        self.assertTrue(all(self.clause_holds(clause, correct) for clause in clauses))
        for variable in (4, 5, 6, 7):
            wrong = dict(correct)
            wrong[variable] = not wrong[variable]
            self.assertFalse(all(
                self.clause_holds(clause, wrong) for clause in clauses
            ))

    def test_guard_false_leaves_memberships_unconstrained(self) -> None:
        clauses = encoding.crossed_arm_polarity_clauses(1, 2, 3, 4, 5, 6, 7)
        for mask in range(16):
            assignment = {1: False, 2: True, 3: True}
            assignment.update({
                variable: bool(mask & (1 << offset))
                for offset, variable in enumerate((4, 5, 6, 7))
            })
            self.assertTrue(all(
                self.clause_holds(clause, assignment) for clause in clauses
            ))


class PackageTests(unittest.TestCase):
    def test_rejects_prebuilt_checkpoint_object_for_authentication(self) -> None:
        with tempfile.TemporaryDirectory() as directory:
            root = Path(directory)
            checkpoint_path = root / "checkpoint.json"
            package = root / "package"
            write_checkpoint(checkpoint_path, checkpoint_payload())
            fabricated = replace(
                encoding.load_checkpoint(checkpoint_path),
                source_name="caller-fabricated.json",
            )
            with mock.patch.object(
                encoding, "build_base", side_effect=tiny_base
            ):
                encoding.materialize(checkpoint_path, package)
                with self.assertRaisesRegex(
                    encoding.EncodingError,
                    "external-checkpoint-authentication-requires-path",
                ):
                    encoding.verify_package(package, fabricated)  # type: ignore[arg-type]

    def test_cli_checkpoint_path_authenticates_source(self) -> None:
        with tempfile.TemporaryDirectory() as directory:
            root = Path(directory)
            checkpoint_path = root / "checkpoint.json"
            package = root / "package"
            write_checkpoint(checkpoint_path, checkpoint_payload())
            with mock.patch.object(
                encoding, "build_base", side_effect=tiny_base
            ):
                encoding.materialize(checkpoint_path, package)
                with mock.patch("builtins.print") as printed:
                    exit_code = cli.main([
                        "verify", str(package), "--checkpoint",
                        str(checkpoint_path),
                    ])
            self.assertEqual(exit_code, 0)
            printed.assert_called_once()
            result = json.loads(printed.call_args.args[0])
            self.assertEqual(
                result["status"],
                "PACKAGE_OK_AUTHENTICATED_SOURCE_INPUT_FORMULA_ONLY",
            )
            self.assertTrue(result["source_authenticated"])

    def test_deterministic_path_independent_regeneration_and_verification(self) -> None:
        with tempfile.TemporaryDirectory() as directory:
            root = Path(directory)
            first_checkpoint = root / "first-source.json"
            second_checkpoint = root / "renamed-source.json"
            write_checkpoint(first_checkpoint, checkpoint_payload())
            second_checkpoint.write_bytes(first_checkpoint.read_bytes())
            with mock.patch.object(
                encoding, "build_base", side_effect=tiny_base
            ):
                encoding.materialize(first_checkpoint, root / "first")
                encoding.materialize(second_checkpoint, root / "second")
                standalone = encoding.verify_package(root / "first")
                authenticated = encoding.verify_package(
                    root / "first", second_checkpoint
                )
            filenames = (
                "start.cnf", "variables.json", "clause-provenance.json",
                "learned-cuts.json", "manifest.json",
            )
            for filename in filenames:
                self.assertEqual(
                    (root / "first" / filename).read_bytes(),
                    (root / "second" / filename).read_bytes(),
                    filename,
                )
            self.assertEqual(
                standalone["status"],
                "PACKAGE_OK_SELF_CONSISTENT_UNAUTHENTICATED_SOURCE",
            )
            self.assertFalse(standalone["source_authenticated"])
            self.assertEqual(
                authenticated["status"],
                "PACKAGE_OK_AUTHENTICATED_SOURCE_INPUT_FORMULA_ONLY",
            )
            self.assertTrue(authenticated["source_authenticated"])
            self.assertFalse(authenticated["unsat_claim"])

    def test_compact_pb_source_exports_same_triple_clause_cnf(self) -> None:
        with tempfile.TemporaryDirectory() as directory:
            root = Path(directory)
            triple_checkpoint = root / "triple.json"
            compact_checkpoint = root / "compact.json"
            write_checkpoint(triple_checkpoint, checkpoint_payload())
            write_checkpoint(compact_checkpoint, checkpoint_payload(
                result_critical_no_k4_representation="compact-pb",
                learned_critical_no_k4_representation="compact-pb",
            ))
            with mock.patch.object(
                encoding, "build_base", side_effect=tiny_base
            ):
                encoding.materialize(triple_checkpoint, root / "triple")
                encoding.materialize(compact_checkpoint, root / "compact")
                verified = encoding.verify_package(
                    root / "compact", compact_checkpoint
                )
            self.assertEqual(
                (root / "triple" / "start.cnf").read_bytes(),
                (root / "compact" / "start.cnf").read_bytes(),
            )
            self.assertEqual(
                verified["source_critical_no_K4_representation"], "compact-pb"
            )
            self.assertEqual(
                verified["exported_critical_no_K4_representation"],
                "triple-clauses",
            )

    def test_verify_rejects_noncanonical_registry_json(self) -> None:
        with tempfile.TemporaryDirectory() as directory:
            root = Path(directory)
            checkpoint_path = root / "checkpoint.json"
            package = root / "package"
            write_checkpoint(checkpoint_path, checkpoint_payload())
            with mock.patch.object(
                encoding, "build_base", side_effect=tiny_base
            ):
                encoding.materialize(checkpoint_path, package)
            variables_path = package / "variables.json"
            payload = json.loads(variables_path.read_text())
            variables_path.write_bytes(encoding.compact_json_bytes(payload))
            with mock.patch.object(
                encoding, "build_base", side_effect=tiny_base
            ), self.assertRaises(encoding.EncodingError):
                encoding.verify_package(package)

    def test_verify_rejects_duplicate_alias_count_drift(self) -> None:
        with tempfile.TemporaryDirectory() as directory:
            root = Path(directory)
            checkpoint_path = root / "checkpoint.json"
            package = root / "package"
            write_checkpoint(checkpoint_path, checkpoint_payload())
            with mock.patch.object(
                encoding, "build_base", side_effect=tiny_base
            ):
                encoding.materialize(checkpoint_path, package)
            provenance_path = package / "clause-provenance.json"
            payload = json.loads(provenance_path.read_text())
            payload["duplicate_alias_count"] += 1
            provenance_path.write_bytes(encoding.canonical_json_bytes(payload))
            with mock.patch.object(
                encoding, "build_base", side_effect=tiny_base
            ), self.assertRaises(encoding.EncodingError):
                encoding.verify_package(package)

    def test_rejects_coordinated_variable_and_registry_digest_tamper(self) -> None:
        with tempfile.TemporaryDirectory() as directory:
            root = Path(directory)
            checkpoint_path = root / "checkpoint.json"
            package = root / "package"
            write_checkpoint(checkpoint_path, checkpoint_payload())
            with mock.patch.object(
                encoding, "build_base", side_effect=tiny_base
            ):
                encoding.materialize(checkpoint_path, package)
            variables_path = package / "variables.json"
            variables = json.loads(variables_path.read_text())
            variables["variables"][0]["name"] = "forged-variable-name"
            raw = write_canonical_json(variables_path, variables)
            refresh_manifest_artifact(
                package,
                "variables.json",
                schema=encoding.VARIABLE_SCHEMA,
            )
            manifest_path = package / "manifest.json"
            manifest = json.loads(manifest_path.read_text())
            manifest["registries"]["variables_sha256"] = (
                encoding.sha256_bytes(raw)
            )
            write_canonical_json(manifest_path, manifest)
            with mock.patch.object(
                encoding, "build_base", side_effect=tiny_base
            ), self.assertRaises(encoding.EncodingError):
                encoding.verify_package(package)

    def test_rejects_coordinated_cnf_and_manifest_digest_tamper(self) -> None:
        with tempfile.TemporaryDirectory() as directory:
            root = Path(directory)
            checkpoint_path = root / "checkpoint.json"
            package = root / "package"
            write_checkpoint(checkpoint_path, checkpoint_payload())
            with mock.patch.object(
                encoding, "build_base", side_effect=tiny_base
            ):
                encoding.materialize(checkpoint_path, package)
            cnf_path = package / "start.cnf"
            lines = cnf_path.read_bytes().splitlines(keepends=True)
            variables = json.loads((package / "variables.json").read_text())
            replacement = next(
                row["id"] for row in variables["variables"]
                if row["family"] == "M" and row["args"] == [0, 2]
            )
            lines[1] = f"{replacement} 0\n".encode("ascii")
            cnf_path.write_bytes(b"".join(lines))
            refresh_manifest_artifact(package, "start.cnf")
            with mock.patch.object(
                encoding, "build_base", side_effect=tiny_base
            ), self.assertRaises(encoding.EncodingError):
                encoding.verify_package(package)

    def test_rejects_coordinated_alias_and_digest_tamper(self) -> None:
        with tempfile.TemporaryDirectory() as directory:
            root = Path(directory)
            checkpoint_path = root / "checkpoint.json"
            package = root / "package"
            write_checkpoint(checkpoint_path, checkpoint_payload())
            with mock.patch.object(
                encoding, "build_base", side_effect=tiny_base
            ):
                encoding.materialize(checkpoint_path, package)
            provenance_path = package / "clause-provenance.json"
            provenance = json.loads(provenance_path.read_text())
            provenance["duplicate_aliases"][0]["origin"] = "forged.alias"
            aliases = provenance["duplicate_aliases"]
            provenance["duplicate_alias_sha256"] = encoding.sha256_bytes(
                encoding.compact_json_bytes(aliases)
            )
            provenance["duplicate_alias_counts_by_origin"] = dict(sorted(
                Counter(row["origin"] for row in aliases).items()
            ))
            write_canonical_json(provenance_path, provenance)
            refresh_manifest_artifact(
                package,
                "clause-provenance.json",
                schema=encoding.PROVENANCE_SCHEMA,
            )
            with mock.patch.object(
                encoding, "build_base", side_effect=tiny_base
            ), self.assertRaises(encoding.EncodingError):
                encoding.verify_package(package)

    def test_rejects_learned_key_tamper_with_refreshed_digests(self) -> None:
        with tempfile.TemporaryDirectory() as directory:
            root = Path(directory)
            checkpoint_path = root / "checkpoint.json"
            package = root / "package"
            write_checkpoint(checkpoint_path, checkpoint_payload())
            with mock.patch.object(
                encoding, "build_base", side_effect=tiny_base
            ):
                encoding.materialize(checkpoint_path, package)
            learned_path = package / "learned-cuts.json"
            learned = json.loads(learned_path.read_text())
            learned["cuts"]["connectivity"] = [[0, 1]]
            write_canonical_json(learned_path, learned)
            refresh_manifest_artifact(
                package,
                "learned-cuts.json",
                schema=encoding.LEARNED_CUTS_PACKAGE_SCHEMA,
            )
            manifest_path = package / "manifest.json"
            manifest = json.loads(manifest_path.read_text())
            manifest["source_checkpoint"][
                "canonical_learned_cuts_sha256"
            ] = encoding.sha256_bytes(
                encoding.compact_json_bytes(learned["cuts"])
            )
            write_canonical_json(manifest_path, manifest)
            with mock.patch.object(
                encoding, "build_base", side_effect=tiny_base
            ), self.assertRaises(encoding.EncodingError):
                encoding.verify_package(package)

    def test_forged_source_digest_is_explicitly_unauthenticated(self) -> None:
        with tempfile.TemporaryDirectory() as directory:
            root = Path(directory)
            checkpoint_path = root / "checkpoint.json"
            package = root / "package"
            write_checkpoint(checkpoint_path, checkpoint_payload())
            with mock.patch.object(
                encoding, "build_base", side_effect=tiny_base
            ):
                encoding.materialize(checkpoint_path, package)
            manifest_path = package / "manifest.json"
            manifest = json.loads(manifest_path.read_text())
            manifest["source_checkpoint"]["declared_raw_sha256"] = "0" * 64
            write_canonical_json(manifest_path, manifest)
            with mock.patch.object(
                encoding, "build_base", side_effect=tiny_base
            ):
                standalone = encoding.verify_package(package)
                with self.assertRaises(encoding.EncodingError):
                    encoding.verify_package(package, checkpoint_path)
            self.assertEqual(
                standalone["status"],
                "PACKAGE_OK_SELF_CONSISTENT_UNAUTHENTICATED_SOURCE",
            )
            self.assertFalse(standalone["source_authenticated"])


if __name__ == "__main__":
    unittest.main()
