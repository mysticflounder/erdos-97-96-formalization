import json
from pathlib import Path

from census.p97_search.phase3_cegar_wave import sha256_bytes
from census.p97_search.phase3_piqd_oracle import PreparedJob
from census.p97_search.phase3_piqd_replay import (
    LeanLratReplayer,
    LratReplayResult,
    validate_replay_result,
)

root = Path(__file__).resolve().parents[3]
out = Path(__file__).resolve().parent
cnf = (out / "job.cnf").read_bytes()
proof = (out / "job.proof").read_bytes()
job = PreparedJob(
    "ab289b3f-a306-4de7-a52f-619ea4dbe049", "cadical", "sat",
    sha256_bytes(cnf),
    "6d463b09e28eadaaab30cf5ec0337221e1cf27f0075a6db9a82d1a9f627c8060",
    1, 2, True,
)
wave = {
    "schema": "p97-cegar-wave/v1",
    "wave_id": "exact17-child32-live-known-result-smoke",
    "iteration": 1,
    "parent_checkpoint_sha256": "0" * 64,
    "source": {
        "live_leaf": "exact17-child32-live-known-result-smoke",
        "ingress_hypotheses_sha256": "1" * 64,
        "finite_schema": "exact17-child32-smoke/v1",
        "cardinality_scope": "n = 1",
        "source_theorem": "known-unsat-smoke",
    },
    "encoding": {
        "cnf_sha256": sha256_bytes(cnf),
        "variable_map_sha256": "2" * 64,
        "producer_manifest_sha256": sha256_bytes(
            (out / "producer-manifest.blob").read_bytes()
        ),
        "num_variables": 1,
        "num_clauses": 2,
        "query_polarity": "UNSAT_MEANS_OBSTRUCTION",
    },
    "execution": {
        "backend": "cadical",
        "solver_profile": "sat",
        "shard_id": 0,
        "shard_count": 1,
        "order_sha256": "4" * 64,
        "seed": 97,
    },
    "promotion": {
        "evidence_classification": "UNIFORM_PRODUCER",
        "producer_theorem": "known-unsat-smoke",
        "lift_theorem": None,
        "consumer_theorem": "exact17-child32",
    },
}
replayer = LeanLratReplayer(
    lean_root=root / "lean", work_dir=out / "lean-replay", timeout_s=60
)
result = replayer.replay(
    job=job,
    wave_manifest=wave,
    cnf=cnf,
    proof=proof,
    proof_sha256=sha256_bytes(proof),
)
(out / "lean-replay.receipt.json").write_bytes(result.receipt)
validate_replay_result(
    result=result,
    job=job,
    wave_manifest=wave,
    cnf=cnf,
    proof=proof,
    proof_sha256=sha256_bytes(proof),
)
receipt = json.loads(result.receipt)
print(json.dumps({
    "verified": result.verified,
    "returncode": receipt["execution"]["returncode"],
    "checker_source_sha256": receipt["checker_source_sha256"],
    "receipt_sha256": sha256_bytes(result.receipt),
    "wave_manifest_sha256": receipt["wave_manifest_sha256"],
    "validation": "PASS",
}, separators=(",", ":")))
