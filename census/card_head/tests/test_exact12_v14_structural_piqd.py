from __future__ import annotations

import json
from collections.abc import Callable
from pathlib import Path
from tempfile import TemporaryDirectory
from types import SimpleNamespace
from unittest import TestCase, mock

from census.card_head import exact12_v14_structural_cegar as cegar
from census.card_head.exact12_v14_structural_piqd import (
    PIQD_PROJECT,
    Exact12V14StructuralPiqdDiscoveryFactory,
    Exact12V14StructuralPiqdError,
)
from census.p97_search.phase3_cegar_wave import (
    canonical_json_bytes,
    sha256_bytes,
    sha256_json,
)
from census.p97_search.phase3_piqd_driver import SEAL_SCHEMA
from census.p97_search.phase3_piqd_oracle import raw_dimacs_identity
from census.p97_search.phase3_piqd_static_solver_runner import (
    CERTIFICATE_BLOCKER,
    CUSTODY_SEAL_SCHEMA,
    RECEIPT_SCHEMA,
    StaticSolverResult,
)


class TinyInstance:
    def __init__(self) -> None:
        self.cnf = SimpleNamespace(n_variables=1, clauses=((1,),))

    def dimacs(self) -> str:
        return "p cnf 1 1\n1 0\n"

    def clauses_with(self):
        return self.cnf.clauses

    def decode_model(self, positive):
        if positive != frozenset({1}):
            raise ValueError("unexpected model")
        return {0: [1]}


def _job() -> dict[str, object]:
    return {
        "schema": "p97-exact12-v14-bound-job/v1",
        "job_id": "fake-exact12-v14-cell-0",
        "cell_index": 0,
        "compiler_manifest": {"compiler": "fake"},
    }


def _publish_receipt(
    cnf_path: Path,
    kwargs: dict[str, object],
    verdict: str,
    *,
    mutate: Callable[[dict[str, object], Path], str | None] | None = None,
) -> str:
    """Publish a canonical offline attempt matching the static runner contract."""
    current = cnf_path.read_bytes()
    source = kwargs["source_manifest"]
    producer = kwargs["producer_manifest"]
    assert isinstance(source, bytes) and isinstance(producer, bytes)
    root = kwargs["journal_root"]
    assert isinstance(root, Path)
    root.mkdir(parents=True, exist_ok=True)
    root.chmod(0o700)
    root.parent.chmod(0o700)
    cnf_sha = sha256_bytes(current)
    attempt = root / f"attempt-00000000-{cnf_sha[:16]}"
    artifacts = attempt / "attempt.jsonl.artifacts"
    artifacts.mkdir(parents=True, mode=0o700)
    attempt.chmod(0o700)
    for payload in (current, source, producer):
        (artifacts / sha256_bytes(payload)).write_bytes(payload)
    journal = b'{"synthetic":"journal"}\n'
    (attempt / "attempt.jsonl").write_bytes(journal)
    (attempt / "attempt.jsonl.lock").write_bytes(b"")
    unsigned_driver = {
        "schema": SEAL_SCHEMA,
        "wave_manifest_sha256": "7" * 64,
        "record_count": 1,
        "terminal_attempt_sha256": "8" * 64,
        "journal_sha256": sha256_bytes(journal),
    }
    driver = {**unsigned_driver, "seal_sha256": sha256_json(unsigned_driver)}
    driver_raw = canonical_json_bytes(driver) + b"\n"
    (attempt / "attempt.jsonl.seal.json").write_bytes(driver_raw)
    job_id = "synthetic-piqd-job"
    returncode = {"SAT": 10, "UNSAT": 20, "UNKNOWN": 1}[verdict]
    receipt = {
        "schema": RECEIPT_SCHEMA,
        "attempt": 0,
        "attempt_directory": str(attempt),
        "journal": str(attempt / "attempt.jsonl"),
        "receipt_path": str(attempt / "solver-receipt.json"),
        "custody_seal_path": str(attempt / "custody-seal.json"),
        "job_id": job_id,
        "job_identity": {
            "job_id": job_id, "backend": "cadical", "solver_profile": "sat",
            "project": PIQD_PROJECT, "cnf_blob_hash": cnf_sha,
            "identity_hash": raw_dimacs_identity(
                backend="cadical", solver_profile="sat", cnf_sha256=cnf_sha,
                producer_manifest_sha256=sha256_bytes(producer), requested_core_limit=1,
            ),
            "num_vars": 1, "num_clauses": 1, "existing": False,
            "requested_core_limit": 1,
        },
        "prepare_freshness_claimed": False,
        "outcome": {"SAT": "STRUCTURAL_SAT", "UNSAT": "DISCOVERY_UNSAT", "UNKNOWN": "ERROR"}[verdict],
        "adapter_verdict": verdict, "adapter_returncode": returncode,
        "cnf_sha256": cnf_sha, "num_variables": 1, "num_clauses": 1,
        "source_manifest_sha256": sha256_bytes(source),
        "producer_manifest_sha256": sha256_bytes(producer),
        "terminal_record_sha256": "8" * 64, "journal_record_count": 1,
        "seal_sha256": driver["seal_sha256"], "status_classification": "SYNTHETIC_STATUS",
        "status_detail": "synthetic offline receipt", "terminal_status": None,
        "terminal_status_canonical_sha256": None, "terminal_status_raw_sha256": None,
        "terminal_status_raw_size": None, "terminal_status_raw_artifact_sha256": None,
        "terminal_status_identity_scope": "NO_PARSED_TERMINAL_STATUS",
        "terminal_status_exposed_identity_fields": [], "model_response_sha256": None,
        "endpoint_trace": [{"method": "POST", "target": "/jobs/prepare-cnf"}],
        "failure_detail": None, "custody_retry_policy": "REMOVE_UNSEALED_RESERVED_ATTEMPT",
        "legacy_drat_proof_path_written": False, "proof_endpoint_called": False,
        "certificate_blocker": CERTIFICATE_BLOCKER,
        "claims": {"source_entitlement": False, "theorem_coverage": False,
                   "universal_lift": False, "lean_closure": False,
                   "one_process": False, "one_core": False},
    }
    receipt["receipt_sha256"] = sha256_json(receipt)
    receipt_raw = canonical_json_bytes(receipt) + b"\n"
    receipt_path = attempt / "solver-receipt.json"
    receipt_path.write_bytes(receipt_raw)
    inventory = {
        "journal_sha256": sha256_bytes(journal), "journal_size": len(journal),
        "journal_device": (attempt / "attempt.jsonl").stat().st_dev,
        "journal_inode": (attempt / "attempt.jsonl").stat().st_ino,
        "lock_device": (attempt / "attempt.jsonl.lock").stat().st_dev,
        "lock_inode": (attempt / "attempt.jsonl.lock").stat().st_ino,
        "driver_seal_sha256": sha256_bytes(driver_raw), "artifacts": [],
    }
    for path in sorted(artifacts.iterdir()):
        metadata = path.stat()
        inventory["artifacts"].append({"sha256": path.name, "size": metadata.st_size,
                                       "device": metadata.st_dev, "inode": metadata.st_ino})
    unsigned_custody = {
        "schema": CUSTODY_SEAL_SCHEMA,
        "attempt_directory_device": attempt.stat().st_dev,
        "attempt_directory_inode": attempt.stat().st_ino,
        "receipt_sha256": receipt["receipt_sha256"], "receipt_file_sha256": sha256_bytes(receipt_raw),
        "receipt_file_size": len(receipt_raw), "receipt_device": receipt_path.stat().st_dev,
        "receipt_inode": receipt_path.stat().st_ino, "inventory": inventory,
        "retry_policy": "REMOVE_UNSEALED_RESERVED_ATTEMPT",
    }
    custody = {**unsigned_custody, "custody_seal_sha256": sha256_json(unsigned_custody)}
    (attempt / "custody-seal.json").write_bytes(canonical_json_bytes(custody) + b"\n")
    for path in attempt.iterdir():
        if path.is_file():
            path.chmod(0o600)
    for path in artifacts.iterdir():
        path.chmod(0o600)
    if mutate is not None:
        mutated_stdout = mutate(receipt, attempt)
        if mutated_stdout is not None:
            return mutated_stdout
    return receipt_raw.decode("utf-8")


class Exact12V14StructuralPiqdTest(TestCase):
    def test_discovery_uses_literal_none_and_exact_current_cnf(self) -> None:
        instance = TinyInstance()
        calls: list[Path | None] = []

        def runner_factory(**_kwargs):
            def runner(cnf_path: Path, _timeout: int, proof_path: Path | None):
                calls.append(proof_path)
                self.assertEqual(cnf_path.read_text(encoding="ascii"), instance.dimacs())
                return StaticSolverResult(
                    "SAT", {1: True}, 10,
                    stdout=_publish_receipt(cnf_path, _kwargs, "SAT"),
                )

            return runner

        with TemporaryDirectory(dir="/private/tmp") as temporary:
            factory = Exact12V14StructuralPiqdDiscoveryFactory(
                repo_root=Path(temporary),
                base_url="http://offline.invalid",
                journal_root=Path(temporary) / "journal",
                runner_factory=runner_factory,
            )
            discovery = factory(instance, _job())
            result = discovery(
                instance,
                Path(temporary) / "work" / "discovery.cnf",
                timeout_seconds=1,
                nice=10,
                proof_path=None,
            )

        self.assertEqual(result.verdict, "SAT")
        self.assertEqual(calls, [None])

    def test_pi_qd_unknown_is_fail_closed_without_local_fallback(self) -> None:
        instance = TinyInstance()
        calls = 0

        def runner_factory(**_kwargs):
            def runner(_cnf_path: Path, _timeout: int, proof_path: Path | None):
                nonlocal calls
                calls += 1
                self.assertIsNone(proof_path)
                return StaticSolverResult(
                    "UNKNOWN", {}, 1,
                    stdout=_publish_receipt(_cnf_path, _kwargs, "UNKNOWN"),
                )

            return runner

        with TemporaryDirectory(dir="/private/tmp") as temporary:
            factory = Exact12V14StructuralPiqdDiscoveryFactory(
                repo_root=Path(temporary),
                base_url="http://offline.invalid",
                journal_root=Path(temporary) / "journal",
                runner_factory=runner_factory,
            )
            result = factory(instance, _job())(
                instance,
                Path(temporary) / "discovery.cnf",
                timeout_seconds=1,
                nice=10,
                proof_path=None,
            )

        self.assertEqual(result.verdict, "UNKNOWN")
        self.assertEqual(calls, 1)

    def test_pi_qd_runner_error_is_fail_closed(self) -> None:
        instance = TinyInstance()

        def runner_factory(**_kwargs):
            def runner(_cnf_path: Path, _timeout: int, proof_path: Path | None):
                self.assertIsNone(proof_path)
                raise RuntimeError("offline transport failure")

            return runner

        with TemporaryDirectory(dir="/private/tmp") as temporary:
            discovery = Exact12V14StructuralPiqdDiscoveryFactory(
                repo_root=Path(temporary),
                base_url="http://offline.invalid",
                journal_root=Path(temporary) / "journal",
                runner_factory=runner_factory,
            )(instance, _job())
            result = discovery(
                instance,
                Path(temporary) / "discovery.cnf",
                timeout_seconds=1,
                nice=10,
                proof_path=None,
            )

        self.assertEqual(result.verdict, "UNKNOWN")

    def test_receipt_and_custody_tampering_is_rejected(self) -> None:
        instance = TinyInstance()

        def run_with_mutation(mutate):
            def runner_factory(**kwargs):
                def runner(cnf_path: Path, _timeout: int, _proof_path: Path | None):
                    return StaticSolverResult(
                        "UNSAT", {}, 20,
                        stdout=_publish_receipt(cnf_path, kwargs, "UNSAT", mutate=mutate),
                    )

                return runner

            with TemporaryDirectory(dir="/private/tmp") as temporary:
                discovery = Exact12V14StructuralPiqdDiscoveryFactory(
                    repo_root=Path(temporary), base_url="http://offline.invalid",
                    journal_root=Path(temporary) / "journal", runner_factory=runner_factory,
                )(instance, _job())
                with self.assertRaises(Exact12V14StructuralPiqdError):
                    discovery(
                        instance, Path(temporary) / "discovery.cnf",
                        timeout_seconds=1, nice=10, proof_path=None,
                    )

        def receipt_mutation(receipt, attempt):
            receipt_path = attempt / "solver-receipt.json"
            forged = dict(receipt)
            forged["job_identity"] = {**forged["job_identity"], "project": "crossed"}
            forged["receipt_sha256"] = sha256_json(forged)
            mutated = canonical_json_bytes(forged) + b"\n"
            receipt_path.write_bytes(mutated)
            return mutated.decode("utf-8")

        def canonical_mutation(receipt, attempt):
            receipt_path = attempt / "solver-receipt.json"
            mutated = json.dumps(receipt, indent=2) + "\n"
            receipt_path.write_text(mutated, encoding="utf-8")
            return mutated

        def hash_mutation(_receipt, attempt):
            receipt_path = attempt / "solver-receipt.json"
            forged = json.loads(receipt_path.read_text(encoding="utf-8"))
            forged["receipt_sha256"] = "0" * 64
            mutated = canonical_json_bytes(forged) + b"\n"
            receipt_path.write_bytes(mutated)
            return mutated.decode("utf-8")

        def key_mutation(receipt, attempt):
            receipt_path = attempt / "solver-receipt.json"
            forged = dict(receipt)
            forged.pop("failure_detail")
            forged["receipt_sha256"] = sha256_json(forged)
            mutated = canonical_json_bytes(forged) + b"\n"
            receipt_path.write_bytes(mutated)
            return mutated.decode("utf-8")

        def custody_mutation(_receipt, attempt):
            (attempt / "custody-seal.json").write_bytes(b"{}\n")

        def inventory_mutation(_receipt, attempt):
            path = attempt / "custody-seal.json"
            seal = json.loads(path.read_text(encoding="utf-8"))
            seal["inventory"] = {**seal["inventory"], "journal_size": 999}
            unsigned = dict(seal)
            unsigned.pop("custody_seal_sha256")
            seal["custody_seal_sha256"] = sha256_json(unsigned)
            path.write_bytes(canonical_json_bytes(seal) + b"\n")

        # Cover canonical, hash, key, and job-identity receipt changes through
        # the installed-file binding, then independent seal and inventory paths.
        for mutation in (
            canonical_mutation,
            hash_mutation,
            key_mutation,
            receipt_mutation,
            custody_mutation,
            inventory_mutation,
        ):
            with self.subTest(mutation=mutation.__name__):
                run_with_mutation(mutation)

    def test_descriptor_rewrite_and_replacement_are_rejected_after_runner(self) -> None:
        instance = TinyInstance()
        for replacement in (False, True):
            with self.subTest(replacement=replacement):
                def runner_factory(*, replacement=replacement, **kwargs):
                    def runner(cnf_path: Path, _timeout: int, _proof_path: Path | None):
                        stdout = _publish_receipt(cnf_path, kwargs, "UNKNOWN")
                        descriptor = next(
                            (kwargs["journal_root"].parent / "descriptors").glob("descriptor-*.json")
                        )
                        if replacement:
                            replacement_path = descriptor.with_suffix(".replacement")
                            replacement_path.write_bytes(b"replaced\n")
                            replacement_path.replace(descriptor)
                        else:
                            descriptor.write_bytes(b"rewritten\n")
                        return StaticSolverResult("UNKNOWN", {}, 1, stdout=stdout)

                    return runner

                with TemporaryDirectory(dir="/private/tmp") as temporary:
                    discovery = Exact12V14StructuralPiqdDiscoveryFactory(
                        repo_root=Path(temporary), base_url="http://offline.invalid",
                        journal_root=Path(temporary) / "journal", runner_factory=runner_factory,
                    )(instance, _job())
                    with self.assertRaisesRegex(Exact12V14StructuralPiqdError, "descriptor custody"):
                        discovery(
                            instance, Path(temporary) / "discovery.cnf",
                            timeout_seconds=1, nice=10, proof_path=None,
                        )

    def test_non_none_discovery_proof_path_is_rejected(self) -> None:
        instance = TinyInstance()

        def runner_factory(**_kwargs):
            return lambda *_args: StaticSolverResult("UNKNOWN", {}, 1)

        with TemporaryDirectory(dir="/private/tmp") as temporary:
            discovery = Exact12V14StructuralPiqdDiscoveryFactory(
                repo_root=Path(temporary),
                base_url="http://offline.invalid",
                journal_root=Path(temporary) / "journal",
                runner_factory=runner_factory,
            )(instance, _job())
            with self.assertRaisesRegex(Exact12V14StructuralPiqdError, "proof_path=None"):
                discovery(
                    instance,
                    Path(temporary) / "discovery.cnf",
                    timeout_seconds=1,
                    nice=10,
                    proof_path=Path(temporary) / "proof.drat",
                )

    def test_structural_coordinator_runs_one_fresh_terminal_rerun(self) -> None:
        instance = TinyInstance()
        terminal_calls: list[Path | None] = []
        compiled = SimpleNamespace()
        job = _job()

        def discovery_factory(_instance, _job):
            def discovery(_instance, cnf_path: Path, **kwargs):
                self.assertIsNone(kwargs["proof_path"])
                cnf_path.write_text(instance.dimacs(), encoding="ascii")
                return cegar.CadicalResult("UNSAT", None, 20, False, "observed")

            return discovery

        def terminal_solver(_instance, cnf_path: Path, **kwargs):
            terminal_calls.append(kwargs["proof_path"])
            cnf_path.write_text(instance.dimacs(), encoding="ascii")
            assert kwargs["proof_path"] is not None
            kwargs["proof_path"].write_text("proof\n", encoding="ascii")
            return cegar.CadicalResult("UNSAT", None, 20, True, "verified")

        with TemporaryDirectory(dir="/private/tmp") as temporary:
            root = Path(temporary)
            workdir = root / "work"
            patches = {
                "build_manifest": lambda _root: {},
                "build_bound_job": lambda _manifest, _root, _cell: job,
                "instantiate_validated_bound_job": lambda *_args: SimpleNamespace(
                    instance=instance, compiled=compiled
                ),
                "_detector_manifest": lambda _root: [],
                "build_source_order_bank": lambda _root, _instance: {},
                "snapshot_source_order_bank": lambda _instance, bank: bank,
                "replay_journal": lambda *_args, **_kwargs: (0, None, frozenset()),
            }
            with mock.patch.multiple(cegar, **patches):
                summary = cegar.run_structural_cegar(
                    root,
                    workdir,
                    0,
                    max_iterations=1,
                    discovery_solver_factory=discovery_factory,
                    terminal_solver=terminal_solver,
                )

        self.assertEqual(summary["status"], "UNSAT_DRAT_VERIFIED")
        self.assertEqual(len(terminal_calls), 1)
        self.assertEqual(
            summary["artifacts"]["discovery_cnf"]["sha256"],
            summary["artifacts"]["terminal_cnf"]["sha256"],
        )
