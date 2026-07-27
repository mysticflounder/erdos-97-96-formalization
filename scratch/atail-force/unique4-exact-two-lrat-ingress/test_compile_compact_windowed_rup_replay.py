# Copyright (c) 2026 Adam McKenna. All rights reserved.
# Released under Apache 2.0 license as described in the file LICENSE.
# Author: Adam McKenna <adam@mysticflounder.ai>

from __future__ import annotations

import hashlib
import json
import os
from pathlib import Path
import subprocess
import tempfile
import unittest

import compile_compact_windowed_rup_replay as subject


def sha256_bytes(payload: bytes) -> str:
    return hashlib.sha256(payload).hexdigest()


class CompileCompactWindowedRupReplayTest(unittest.TestCase):
    def write_package(self, root: Path, sources: list[tuple[str, str]]) -> Path:
        package = root / "package"
        records: list[dict[str, object]] = []
        for relative, text in sources:
            path = package / relative
            path.parent.mkdir(parents=True, exist_ok=True)
            encoded = text.encode("utf-8")
            path.write_bytes(encoded)
            records.append(
                {
                    "path": relative,
                    "byte_count": len(encoded),
                    "sha256": sha256_bytes(encoded),
                }
            )
        manifest: dict[str, object] = {
            "schema": subject.EXPECTED_PACKAGE_SCHEMA,
            "epistemic_status": "STRUCTURAL INPUT ONLY",
            "counts": {"lean_sources": len(records)},
            "lean_sources": records,
        }
        manifest["compact_replay_package_sha256"] = subject._package_digest(manifest)
        (package / subject.PACKAGE_MANIFEST_NAME).write_text(
            json.dumps(manifest, sort_keys=True), encoding="utf-8"
        )
        return package

    def write_lean_root(self, root: Path) -> Path:
        lean_root = root / "lean"
        (lean_root / ".lake").mkdir(parents=True)
        (lean_root / "lean-toolchain").write_text(
            "leanprover/lean4:v4.27.0\n", encoding="utf-8"
        )
        (lean_root / "lakefile.toml").write_text("name = \"fixture\"\n", encoding="utf-8")
        (lean_root / "lake-manifest.json").write_text("{}\n", encoding="utf-8")
        return lean_root

    @staticmethod
    def fake_runner(calls: list[list[str]]) -> subject.Runner:
        def runner(
            command: list[str] | tuple[str, ...], cwd: Path, env: dict[str, str]
        ) -> subprocess.CompletedProcess[str]:
            command_list = list(command)
            calls.append(command_list)
            if command_list[-1] == "--version":
                if command_list[-2:] == ["lean", "--version"]:
                    return subprocess.CompletedProcess(command_list, 0, "Lean (version 4.27.0)\n", "")
                return subprocess.CompletedProcess(command_list, 0, "Lake version 5.0.0\n", "")
            olean = Path(command_list[command_list.index("-o") + 1])
            ilean = Path(command_list[command_list.index("-i") + 1])
            source = Path(command_list[-1])
            olean.write_bytes(f"olean:{source.name}\n".encode("ascii"))
            ilean.write_bytes(f"ilean:{source.name}\n".encode("ascii"))
            return subprocess.CompletedProcess(command_list, 0, "", "")

        return runner

    def test_rehashes_sources_and_rejects_non_topological_order(self) -> None:
        with tempfile.TemporaryDirectory() as raw_root:
            root = Path(raw_root)
            package = self.write_package(
                root,
                [
                    ("Fixture/Base.lean", "namespace Fixture\ntheorem base : True := True.intro\nend Fixture\n"),
                    ("Fixture/Top.lean", "import Fixture.Base\nnamespace Fixture\ntheorem top : True := base\nend Fixture\n"),
                ],
            )
            spec = subject.read_package_spec(package)
            self.assertEqual([item.path_text for item in spec.sources], ["Fixture/Base.lean", "Fixture/Top.lean"])

            manifest_path = package / subject.PACKAGE_MANIFEST_NAME
            manifest = json.loads(manifest_path.read_text(encoding="utf-8"))
            manifest["lean_sources"] = list(reversed(manifest["lean_sources"]))
            manifest["compact_replay_package_sha256"] = subject._package_digest(manifest)
            manifest_path.write_text(json.dumps(manifest), encoding="utf-8")
            with self.assertRaisesRegex(subject.CompactReplayCompileError, "dependency order"):
                subject.read_package_spec(package)

    def test_rejects_traversal_even_with_a_matching_manifest_digest(self) -> None:
        with tempfile.TemporaryDirectory() as raw_root:
            root = Path(raw_root)
            package = self.write_package(root, [("Fixture/Base.lean", "theorem base : True := True.intro\n")])
            manifest_path = package / subject.PACKAGE_MANIFEST_NAME
            manifest = json.loads(manifest_path.read_text(encoding="utf-8"))
            manifest["lean_sources"][0]["path"] = "../outside.lean"
            manifest["compact_replay_package_sha256"] = subject._package_digest(manifest)
            manifest_path.write_text(json.dumps(manifest), encoding="utf-8")
            with self.assertRaisesRegex(subject.CompactReplayCompileError, "unsafe manifest Lean source path"):
                subject.read_package_spec(package)

    def test_pid_lock_rejects_live_owner_and_recovers_stale_owner(self) -> None:
        with tempfile.TemporaryDirectory() as raw_root:
            lock_path = Path(raw_root) / "lake-build.lock"
            lock_path.write_text(f"{os.getpid()}\n", encoding="ascii")
            with self.assertRaisesRegex(subject.CompactReplayCompileError, "already running"):
                subject.PidLock(lock_path).acquire()
            lock_path.write_text("999999999\n", encoding="ascii")
            lock = subject.PidLock(lock_path)
            lock.acquire()
            self.assertEqual(lock_path.read_text(encoding="ascii"), f"{os.getpid()}\n")
            lock.release()
            self.assertFalse(lock_path.exists())

    def test_compile_resume_and_verify_are_provenance_only(self) -> None:
        with tempfile.TemporaryDirectory() as raw_root:
            root = Path(raw_root)
            package = self.write_package(
                root,
                [
                    ("Fixture/Base.lean", "namespace Fixture\ntheorem base : True := True.intro\nend Fixture\n"),
                    ("Fixture/Top.lean", "import Fixture.Base\nnamespace Fixture\ntheorem top : True := base\nend Fixture\n"),
                ],
            )
            spec = subject.read_package_spec(package)
            lean_root = self.write_lean_root(root)
            calls: list[list[str]] = []
            result = subject.compile_package(
                spec,
                olean_output_dir=root / "oleans",
                lean_root=lean_root,
                memory_mb=512,
                resume=False,
                runner=self.fake_runner(calls),
            )
            self.assertEqual(result["status"], "COMPILED")
            compile_calls = [call for call in calls if "-o" in call]
            self.assertEqual([Path(call[-1]).name for call in compile_calls], ["Base.lean", "Top.lean"])
            verification = subject.verify_output(spec, root / "oleans")
            self.assertEqual(verification["status"], "OLEAN_ARTIFACTS_REHASHED")
            self.assertIn("DOES NOT ESTABLISH", verification["epistemic_status"])

            with self.assertRaisesRegex(subject.CompactReplayCompileError, "existing olean output"):
                subject.compile_package(
                    spec,
                    olean_output_dir=root / "oleans",
                    lean_root=lean_root,
                    memory_mb=512,
                    resume=False,
                    runner=self.fake_runner([]),
                )

            top_olean = root / "oleans" / "Fixture" / "Top.olean"
            top_olean.write_bytes(b"tampered\n")
            resumed_calls: list[list[str]] = []
            resumed = subject.compile_package(
                spec,
                olean_output_dir=root / "oleans",
                lean_root=lean_root,
                memory_mb=512,
                resume=True,
                runner=self.fake_runner(resumed_calls),
            )
            self.assertEqual(resumed["status"], "COMPILED")
            resumed_compile = [call for call in resumed_calls if "-o" in call]
            self.assertEqual([Path(call[-1]).name for call in resumed_compile], ["Top.lean"])
            self.assertEqual(subject.verify_output(spec, root / "oleans")["modules"], 2)


if __name__ == "__main__":
    unittest.main()
