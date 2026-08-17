import json, hashlib, datetime, subprocess, pathlib
LANE="firstnonhit-commonradius-recheck-v1"
owned=[
 ".codex/worktree-checkpoints/firstnonhit-commonradius-recheck-v1.json",
 "census/p97_search/freshthird_firstnonhit_commonradius_recheck_v1.py",
 "census/p97_search/tests/test_freshthird_firstnonhit_commonradius_recheck_v1.py",
 "docs/solve-prompts/2026-08-16-freshthird-firstnonhit-recheck-D-design.md",
]
gen=["scratch/runs/firstnonhit-commonradius-recheck-v1"]
base_head=subprocess.run(["git","rev-parse","HEAD"],capture_output=True,text=True).stdout.strip()
created=datetime.datetime.now(datetime.timezone.utc).replace(microsecond=0).isoformat().replace("+00:00","Z")
def canon(v): return json.dumps(v,ensure_ascii=True,sort_keys=True,separators=(",",":")).encode()
unsigned={
 "schema":"worktree-lane-checkpoint/v1","lane_id":LANE,"owner":LANE,
 "base_head":base_head,"owned_paths":sorted(owned),"generated_roots":sorted(gen),
 "durable_paths":[],"created_utc":created,
}
unsigned["manifest_sha256"]=hashlib.sha256(canon(unsigned)).hexdigest()
out=pathlib.Path("scratch/runs/firstnonhit-commonradius-recheck-v1/checkpoint.json")
out.write_text(json.dumps(unsigned,indent=1)+"\n")
# verify self-hash round-trips
reloaded=json.loads(out.read_text())
check={k:v for k,v in reloaded.items() if k!="manifest_sha256"}
assert hashlib.sha256(canon(check)).hexdigest()==reloaded["manifest_sha256"], "self-hash mismatch"
print("OK self-hash", reloaded["manifest_sha256"])
print("base_head", base_head)
