#!/usr/bin/env python3
"""Lightweight tests for the G3 ingress adapter and layered scheduler."""

from __future__ import annotations

import importlib.util
from pathlib import Path, PurePosixPath
from types import SimpleNamespace
import sys
import tempfile
import unittest


HERE = Path(__file__).resolve().parent


def load(name: str, filename: str):
    spec = importlib.util.spec_from_file_location(name, HERE / filename)
    assert spec is not None and spec.loader is not None
    module = importlib.util.module_from_spec(spec)
    sys.modules[spec.name] = module
    spec.loader.exec_module(module)
    return module


adapter = load("g3_adapter_under_test", "prepare_g3_windowed_replay.py")
compiler = load("g3_compiler_under_test", "compile_layered_compact_replay.py")
finalizer = load("g3_finalizer_under_test", "finalize_pure_rup_ingress.py")


class G3AdapterTests(unittest.TestCase):
    def test_current_rat_ingress_remains_blocked(self) -> None:
        provenance = {"counts": {"rat_lemmas": 74866}}
        plan = adapter.build_plan(
            provenance, None, max_actions=4000, max_lrat_bytes=4 * 1024 * 1024
        )
        self.assertEqual(plan["status"], "BLOCKED_CURRENT_INGRESS_HAS_RAT")
        self.assertFalse(plan["compatibility"]["materialization_ready"])

    def test_pure_rup_plan_uses_dense_midpoint_split(self) -> None:
        provenance = {"counts": {"rat_lemmas": 74866}}
        pure = {"additions": 421331}
        plan = adapter.build_plan(
            provenance, pure, max_actions=4000, max_lrat_bytes=4 * 1024 * 1024
        )
        self.assertEqual(plan["status"], "READY")
        self.assertEqual(plan["second_shard_first_addition"], 483684)
        self.assertEqual(plan["padding"]["variable"], 96418)

    def test_padding_writer_separates_missing_final_newline(self) -> None:
        with tempfile.TemporaryDirectory() as raw:
            root = Path(raw)
            source = root / "core.cnf"
            target = root / "padded.cnf"
            source.write_bytes(b"p cnf 49360 273017\n1 0")
            adapter.write_padded_core(source, target)
            self.assertEqual(
                target.read_text(encoding="ascii"),
                "p cnf 96418 273018\n1 0\n96418 0\n",
            )

    def test_verification_log_requires_zero_rat(self) -> None:
        good = (
            "c parsing input formula with 49360 variables and 273017 clauses\n"
            "c 0 RAT lemmas in core; 1 redundant literals in core lemmas\n"
            "s VERIFIED\n"
        )
        finalizer.exact_verification(good)
        with self.assertRaisesRegex(finalizer.FinalizeError, "required line"):
            finalizer.exact_verification(good.replace("c 0 RAT", "c 1 RAT"))


class LayeredCompilerTests(unittest.TestCase):
    def make_package(self, root: Path):
        definitions = [
            ("CompactWindowedRupReplay/Common.lean", ""),
            (
                "CompactWindowedRupReplay/Checkpoint/C0000.lean",
                "import CompactWindowedRupReplay.Common\n",
            ),
            (
                "CompactWindowedRupReplay/Checkpoint/C0001.lean",
                "import CompactWindowedRupReplay.Common\n",
            ),
            (
                "CompactWindowedRupReplay/Shard1/W0000.lean",
                "import CompactWindowedRupReplay.Checkpoint.C0000\n",
            ),
            (
                "CompactWindowedRupReplay/Shard2/W0000.lean",
                "import CompactWindowedRupReplay.Checkpoint.C0001\n",
            ),
            (
                "CompactWindowedRupReplay/Shard1.lean",
                "import CompactWindowedRupReplay.Shard1.W0000\n",
            ),
            (
                "CompactWindowedRupReplay/Shard2.lean",
                "import CompactWindowedRupReplay.Shard2.W0000\n",
            ),
            (
                "CompactWindowedRupReplay/Compose.lean",
                "import CompactWindowedRupReplay.Shard1\n"
                "import CompactWindowedRupReplay.Shard2\n",
            ),
        ]
        sources = []
        for relative_text, text in definitions:
            relative = PurePosixPath(relative_text)
            path = root.joinpath(*relative.parts)
            path.parent.mkdir(parents=True, exist_ok=True)
            path.write_text(text, encoding="utf-8")
            sources.append(
                SimpleNamespace(
                    relative=relative,
                    path_text=relative.as_posix(),
                    module_name=relative.with_suffix("").as_posix().replace("/", "."),
                )
            )
        return SimpleNamespace(
            package_dir=root,
            package_sha256="fixture-package-sha256",
            sources=sources,
        )

    def test_exact_dependency_layers(self) -> None:
        with tempfile.TemporaryDirectory() as raw:
            package = self.make_package(Path(raw))
            layers = compiler.dependency_layers(package)
            self.assertEqual([len(layer) for layer in layers], [1, 2, 2, 2, 1])
            self.assertEqual(compiler.dry_run(package, 4)["jobs"], 4)
            with self.assertRaisesRegex(compiler.CompileError, "positive"):
                compiler.dry_run(package, 0)

    def test_resume_validity_is_dependency_closed(self) -> None:
        with tempfile.TemporaryDirectory() as raw:
            package = self.make_package(Path(raw))
            all_paths = {source.path_text for source in package.sources}
            missing = "CompactWindowedRupReplay/Shard1/W0000.lean"
            closed = compiler.dependency_closed_valid_paths(
                package, all_paths - {missing}
            )
            self.assertNotIn("CompactWindowedRupReplay/Shard1.lean", closed)
            self.assertNotIn("CompactWindowedRupReplay/Compose.lean", closed)
            self.assertIn("CompactWindowedRupReplay/Shard2.lean", closed)
            self.assertIn(
                "CompactWindowedRupReplay/Checkpoint/C0000.lean", closed
            )


if __name__ == "__main__":
    unittest.main()
