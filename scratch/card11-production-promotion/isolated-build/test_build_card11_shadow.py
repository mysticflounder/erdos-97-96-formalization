#!/usr/bin/env python3
"""Focused tests for the Card 11 shadow artifact planner and DAG scheduler."""

from __future__ import annotations

import os
from pathlib import Path
import tempfile
import threading
import time
import unittest
from unittest import mock

import build_card11_shadow as builder


def write_at(path: Path, mtime_ns: int, text: str = "") -> None:
    path.parent.mkdir(parents=True, exist_ok=True)
    path.write_text(text)
    os.utime(path, ns=(mtime_ns, mtime_ns))


def artifact_pair(root: Path, module: str, mtime_ns: int) -> None:
    write_at(builder.artifact_path(root, module, ".olean"), mtime_ns)
    write_at(builder.artifact_path(root, module, ".ilean"), mtime_ns)


class BuildPlanTests(unittest.TestCase):
    def test_import_parser_ignores_nested_comment_prose(self) -> None:
        with tempfile.TemporaryDirectory() as temporary:
            lean_root = Path(temporary)
            write_at(
                builder.source_path("Target", lean_root),
                10,
                """/-!
import prose.that.is.not.code
/- import Nested.Comment -/
-/
import Real.Dependency -- import Also.Not.Code
""",
            )

            self.assertEqual(builder.imports("Target", lean_root), ["Real.Dependency"])

    def test_quoted_module_component_maps_to_unquoted_artifact_filename(self) -> None:
        root = Path("/artifacts")
        self.assertEqual(
            builder.artifact_path(
                root,
                "FormalConjectures.ErdosProblems.«97»",
                ".olean",
            ),
            root / "FormalConjectures/ErdosProblems/97.olean",
        )
        self.assertEqual(
            builder.artifact_path(root, "Example.«name.with.dots»", ".olean"),
            root / "Example/name.with.dots.olean",
        )

    def test_valid_shadow_artifact_takes_precedence_over_stale_canonical(self) -> None:
        with tempfile.TemporaryDirectory() as temporary:
            root = Path(temporary)
            lean_root = root / "lean"
            canonical = root / "canonical"
            shadow = root / "shadow"
            write_at(builder.source_path("A", lean_root), 30)
            artifact_pair(canonical, "A", 20)
            artifact_pair(shadow, "A", 40)

            plan = builder.make_build_plan(
                ("A",),
                {"A": ()},
                lean_root=lean_root,
                canonical_root=canonical,
                shadow_root=shadow,
            )

            self.assertEqual(plan.todo, ())
            self.assertTrue(plan.states["A"].valid)
            self.assertEqual(plan.states["A"].origin, "shadow")

    def test_stale_dependency_propagates_to_all_transitive_consumers(self) -> None:
        with tempfile.TemporaryDirectory() as temporary:
            root = Path(temporary)
            lean_root = root / "lean"
            canonical = root / "canonical"
            shadow = root / "shadow"
            for module in ("A", "B", "C"):
                write_at(builder.source_path(module, lean_root), 10)
            artifact_pair(canonical, "A", 30)
            artifact_pair(canonical, "B", 20)
            artifact_pair(canonical, "C", 40)

            plan = builder.make_build_plan(
                ("A", "B", "C"),
                {"A": (), "B": ("A",), "C": ("B",)},
                lean_root=lean_root,
                canonical_root=canonical,
                shadow_root=shadow,
            )

            self.assertEqual(plan.todo, ("B", "C"))
            self.assertEqual(plan.ready, ("B",))
            self.assertIn("dependency-newer:A", plan.states["B"].reasons)
            self.assertIn("dependency-needs-rebuild:B", plan.states["C"].reasons)

    def test_newer_parallel_sibling_does_not_stale_an_unrelated_module(self) -> None:
        with tempfile.TemporaryDirectory() as temporary:
            root = Path(temporary)
            lean_root = root / "lean"
            canonical = root / "canonical"
            shadow = root / "shadow"
            for module in ("A", "B", "Sibling"):
                write_at(builder.source_path(module, lean_root), 10)
            artifact_pair(canonical, "A", 20)
            artifact_pair(canonical, "B", 30)
            artifact_pair(canonical, "Sibling", 100)

            plan = builder.make_build_plan(
                ("A", "B", "Sibling"),
                {"A": (), "B": ("A",), "Sibling": ()},
                lean_root=lean_root,
                canonical_root=canonical,
                shadow_root=shadow,
            )

            self.assertEqual(plan.todo, ())
            self.assertTrue(plan.states["B"].valid)

    def test_new_source_rebuilds_module_and_consumer_even_if_consumer_is_newer(self) -> None:
        with tempfile.TemporaryDirectory() as temporary:
            root = Path(temporary)
            lean_root = root / "lean"
            canonical = root / "canonical"
            shadow = root / "shadow"
            write_at(builder.source_path("A", lean_root), 50)
            write_at(builder.source_path("B", lean_root), 10)
            artifact_pair(canonical, "A", 30)
            artifact_pair(canonical, "B", 60)

            plan = builder.make_build_plan(
                ("A", "B"),
                {"A": (), "B": ("A",)},
                lean_root=lean_root,
                canonical_root=canonical,
                shadow_root=shadow,
            )

            self.assertEqual(plan.todo, ("A", "B"))
            self.assertEqual(plan.ready, ("A",))
            self.assertIn("source-newer-than-olean", plan.states["A"].reasons)
            self.assertIn("dependency-needs-rebuild:A", plan.states["B"].reasons)

    def test_mixed_shadow_and_canonical_link_pair_is_never_reused(self) -> None:
        with tempfile.TemporaryDirectory() as temporary:
            root = Path(temporary)
            lean_root = root / "lean"
            canonical = root / "canonical"
            shadow = root / "shadow"
            write_at(builder.source_path("A", lean_root), 10)
            artifact_pair(canonical, "A", 20)
            write_at(builder.artifact_path(shadow, "A", ".olean"), 30)
            shadow_ilean = builder.artifact_path(shadow, "A", ".ilean")
            shadow_ilean.parent.mkdir(parents=True, exist_ok=True)
            shadow_ilean.symlink_to(
                builder.artifact_path(canonical, "A", ".ilean").resolve()
            )

            plan = builder.make_build_plan(
                ("A",),
                {"A": ()},
                lean_root=lean_root,
                canonical_root=canonical,
                shadow_root=shadow,
            )

            self.assertEqual(plan.todo, ("A",))
            self.assertEqual(plan.states["A"].origin, "shadow-mixed")
            self.assertIn("mixed-shadow-pair", plan.states["A"].reasons)


class ScratchBuildLockTests(unittest.TestCase):
    def test_stale_corrupt_lock_is_recovered_and_candidate_is_cleaned(self) -> None:
        with tempfile.TemporaryDirectory() as temporary:
            root = Path(temporary)
            lock_path = root / "build.lock"
            write_at(
                lock_path,
                time.time_ns()
                - int((builder.LOCK_INITIALIZATION_GRACE_S + 1) * 1_000_000_000),
            )

            with builder.ScratchBuildLock(lock_path) as lock:
                self.assertTrue(lock.acquired)
                self.assertEqual(lock_path.read_text().strip(), lock.token)
                self.assertEqual(list(root.glob(".build.lock.*.candidate")), [])

            self.assertFalse(lock_path.exists())


class CompileInputStabilityTests(unittest.TestCase):
    def compile_with_mutation(self, mutate: str) -> builder.CompileResult:
        temporary = tempfile.TemporaryDirectory()
        self.addCleanup(temporary.cleanup)
        root = Path(temporary.name)
        lean_root = root / "lean"
        shadow = root / "shadow"
        module_logs = root / "module-logs"
        work_root = root / "work"
        source = builder.source_path("A", lean_root)
        dependency = builder.artifact_path(shadow, "B", ".olean")
        write_at(source, 10, "import B\n")
        write_at(dependency, 10, "dependency")

        def fake_run(command: list[str], **_kwargs: object) -> object:
            write_at(Path(command[command.index("-o") + 1]), 20, "olean")
            write_at(Path(command[command.index("-i") + 1]), 20, "ilean")
            changed = source if mutate == "source" else dependency
            write_at(changed, 30, "changed")
            return mock.Mock(returncode=0)

        with (
            mock.patch.object(builder, "LEAN_ROOT", lean_root),
            mock.patch.object(builder, "SHADOW", shadow),
            mock.patch.object(builder, "MODULE_LOG_ROOT", module_logs),
            mock.patch.object(builder, "WORK_ROOT", work_root),
            mock.patch.object(builder, "source_path", return_value=source),
            mock.patch.object(builder.subprocess, "run", side_effect=fake_run),
        ):
            result = builder._compile_module("A", ("B",), {})

        self.assertFalse(builder.artifact_path(shadow, "A", ".olean").exists())
        self.assertFalse(builder.artifact_path(shadow, "A", ".ilean").exists())
        return result

    def test_source_mutation_during_compile_prevents_publication(self) -> None:
        result = self.compile_with_mutation("source")
        self.assertEqual(result.returncode, 75, result.detail)
        self.assertIn("inputs changed", result.detail)

    def test_dependency_mutation_during_compile_prevents_publication(self) -> None:
        result = self.compile_with_mutation("dependency")
        self.assertEqual(result.returncode, 75, result.detail)
        self.assertIn("inputs changed", result.detail)


class SchedulerTests(unittest.TestCase):
    def test_parallel_scheduler_never_starts_before_rebuilt_dependencies_finish(self) -> None:
        order = ("A", "B", "C", "D")
        dependencies = {
            "A": (),
            "B": ("A",),
            "C": (),
            "D": ("B", "C"),
        }
        finished: set[str] = set()
        active = 0
        peak_active = 0
        lock = threading.Lock()

        def compile_one(module: str) -> builder.CompileResult:
            nonlocal active, peak_active
            with lock:
                self.assertTrue(
                    all(dependency in finished for dependency in dependencies[module])
                )
                active += 1
                peak_active = max(peak_active, active)
            time.sleep(0.01)
            with lock:
                active -= 1
                finished.add(module)
            return builder.CompileResult(module, 0)

        outcome = builder.run_parallel_dag(
            order,
            dependencies,
            order,
            2,
            compile_one,
        )

        self.assertIsNone(outcome.first_failure)
        self.assertEqual(finished, set(order))
        self.assertEqual(outcome.unscheduled, ())
        self.assertEqual(peak_active, 2)

    def test_first_failure_stops_new_submissions(self) -> None:
        order = ("A", "B", "C")
        dependencies = {module: () for module in order}
        called: list[str] = []

        def compile_one(module: str) -> builder.CompileResult:
            called.append(module)
            return builder.CompileResult(module, 1 if module == "A" else 0)

        outcome = builder.run_parallel_dag(
            order,
            dependencies,
            order,
            1,
            compile_one,
        )

        self.assertEqual(called, ["A"])
        self.assertIsNotNone(outcome.first_failure)
        self.assertEqual(outcome.first_failure.module, "A")
        self.assertEqual(outcome.unscheduled, ("B", "C"))

    def test_lean_427_arguments_remain_exact(self) -> None:
        self.assertEqual(
            builder.LEAN_ARGS,
            [
                "-R",
                ".",
                "-M16384",
                "-s2097152",
                "-Dpp.unicode.fun=true",
                "-DrelaxedAutoImplicit=false",
                "-Dweak.linter.mathlibStandardSet=true",
            ],
        )


if __name__ == "__main__":
    unittest.main()
