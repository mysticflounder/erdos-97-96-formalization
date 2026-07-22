/-
Generated packed-source bridge for verified middle chunk 004.
-/
import AllOneMiddleVerifiedAssignment

namespace Problem97.ATailExactFiveCard13AllOneCertificate.Middle

open Std.Tactic.BVDecide

set_option maxRecDepth 1000000
set_option maxHeartbeats 0
set_option linter.unusedVariables false
set_option linter.unusedSimpArgs false

theorem sourceChunk004_each_of_flat
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits)
    (h0256 : (!((rowBit rows 0 1 5 && rowBit rows 0 1 10 && rowBit rows 0 4 5 && rowBit rows 0 4 10))) = true)
    (h0257 : (!((rowBit rows 0 1 6 && rowBit rows 0 1 10 && rowBit rows 0 4 6 && rowBit rows 0 4 10))) = true)
    (h0258 : (!((rowBit rows 0 1 7 && rowBit rows 0 1 11 && rowBit rows 0 4 7 && rowBit rows 0 4 11))) = true)
    (h0259 : (!((rowBit rows 0 1 8 && rowBit rows 0 1 10 && rowBit rows 0 4 8 && rowBit rows 0 4 10))) = true)
    (h0260 : (!((rowBit rows 0 1 8 && rowBit rows 0 1 12 && rowBit rows 0 4 8 && rowBit rows 0 4 12))) = true)
    (h0261 : (!((rowBit rows 0 1 9 && rowBit rows 0 1 11 && rowBit rows 0 4 9 && rowBit rows 0 4 11))) = true)
    (h0262 : (!((rowBit rows 0 1 9 && rowBit rows 0 1 12 && rowBit rows 0 4 9 && rowBit rows 0 4 12))) = true)
    (h0263 : (!((rowBit rows 0 1 10 && rowBit rows 0 1 11 && rowBit rows 0 4 10 && rowBit rows 0 4 11))) = true)
    (h0264 : (!((rowBit rows 0 1 10 && rowBit rows 0 1 12 && rowBit rows 0 4 10 && rowBit rows 0 4 12))) = true)
    (h0265 : (!((rowBit rows 0 1 11 && rowBit rows 0 1 12 && rowBit rows 0 4 11 && rowBit rows 0 4 12))) = true)
    (h0266 : (!((rowBit rows 0 1 0 && rowBit rows 0 1 6 && rowBit rows 0 5 0 && rowBit rows 0 5 6))) = true)
    (h0267 : (!((rowBit rows 0 1 0 && rowBit rows 0 1 7 && rowBit rows 0 5 0 && rowBit rows 0 5 7))) = true)
    (h0268 : (!((rowBit rows 0 1 0 && rowBit rows 0 1 8 && rowBit rows 0 5 0 && rowBit rows 0 5 8))) = true)
    (h0269 : (!((rowBit rows 0 1 0 && rowBit rows 0 1 9 && rowBit rows 0 5 0 && rowBit rows 0 5 9))) = true)
    (h0270 : (!((rowBit rows 0 1 0 && rowBit rows 0 1 10 && rowBit rows 0 5 0 && rowBit rows 0 5 10))) = true)
    (h0271 : (!((rowBit rows 0 1 0 && rowBit rows 0 1 11 && rowBit rows 0 5 0 && rowBit rows 0 5 11))) = true)
    (h0272 : (!((rowBit rows 0 1 0 && rowBit rows 0 1 12 && rowBit rows 0 5 0 && rowBit rows 0 5 12))) = true)
    (h0273 : (!((rowBit rows 0 1 6 && rowBit rows 0 1 7 && rowBit rows 0 5 6 && rowBit rows 0 5 7))) = true)
    (h0274 : (!((rowBit rows 0 1 6 && rowBit rows 0 1 8 && rowBit rows 0 5 6 && rowBit rows 0 5 8))) = true)
    (h0275 : (!((rowBit rows 0 1 6 && rowBit rows 0 1 9 && rowBit rows 0 5 6 && rowBit rows 0 5 9))) = true)
    (h0276 : (!((rowBit rows 0 1 6 && rowBit rows 0 1 10 && rowBit rows 0 5 6 && rowBit rows 0 5 10))) = true)
    (h0277 : (!((rowBit rows 0 1 6 && rowBit rows 0 1 11 && rowBit rows 0 5 6 && rowBit rows 0 5 11))) = true)
    (h0278 : (!((rowBit rows 0 1 6 && rowBit rows 0 1 12 && rowBit rows 0 5 6 && rowBit rows 0 5 12))) = true)
    (h0279 : (!((rowBit rows 0 1 7 && rowBit rows 0 1 8 && rowBit rows 0 5 7 && rowBit rows 0 5 8))) = true)
    (h0280 : (!((rowBit rows 0 1 7 && rowBit rows 0 1 9 && rowBit rows 0 5 7 && rowBit rows 0 5 9))) = true)
    (h0281 : (!((rowBit rows 0 1 7 && rowBit rows 0 1 10 && rowBit rows 0 5 7 && rowBit rows 0 5 10))) = true)
    (h0282 : (!((rowBit rows 0 1 7 && rowBit rows 0 1 11 && rowBit rows 0 5 7 && rowBit rows 0 5 11))) = true)
    (h0283 : (!((rowBit rows 0 1 7 && rowBit rows 0 1 12 && rowBit rows 0 5 7 && rowBit rows 0 5 12))) = true)
    (h0284 : (!((rowBit rows 0 1 8 && rowBit rows 0 1 9 && rowBit rows 0 5 8 && rowBit rows 0 5 9))) = true)
    (h0285 : (!((rowBit rows 0 1 8 && rowBit rows 0 1 10 && rowBit rows 0 5 8 && rowBit rows 0 5 10))) = true)
    (h0286 : (!((rowBit rows 0 1 8 && rowBit rows 0 1 11 && rowBit rows 0 5 8 && rowBit rows 0 5 11))) = true)
    (h0287 : (!((rowBit rows 0 1 8 && rowBit rows 0 1 12 && rowBit rows 0 5 8 && rowBit rows 0 5 12))) = true)
    (h0288 : (!((rowBit rows 0 1 9 && rowBit rows 0 1 10 && rowBit rows 0 5 9 && rowBit rows 0 5 10))) = true)
    (h0289 : (!((rowBit rows 0 1 9 && rowBit rows 0 1 11 && rowBit rows 0 5 9 && rowBit rows 0 5 11))) = true)
    (h0290 : (!((rowBit rows 0 1 9 && rowBit rows 0 1 12 && rowBit rows 0 5 9 && rowBit rows 0 5 12))) = true)
    (h0291 : (!((rowBit rows 0 1 10 && rowBit rows 0 1 12 && rowBit rows 0 5 10 && rowBit rows 0 5 12))) = true)
    (h0292 : (!((rowBit rows 0 1 11 && rowBit rows 0 1 12 && rowBit rows 0 5 11 && rowBit rows 0 5 12))) = true)
    (h0293 : (!((rowBit rows 0 1 0 && rowBit rows 0 1 7 && rowBit rows 0 6 0 && rowBit rows 0 6 7))) = true)
    (h0294 : (!((rowBit rows 0 1 0 && rowBit rows 0 1 8 && rowBit rows 0 6 0 && rowBit rows 0 6 8))) = true)
    (h0295 : (!((rowBit rows 0 1 0 && rowBit rows 0 1 9 && rowBit rows 0 6 0 && rowBit rows 0 6 9))) = true)
    (h0296 : (!((rowBit rows 0 1 0 && rowBit rows 0 1 10 && rowBit rows 0 6 0 && rowBit rows 0 6 10))) = true)
    (h0297 : (!((rowBit rows 0 1 0 && rowBit rows 0 1 11 && rowBit rows 0 6 0 && rowBit rows 0 6 11))) = true)
    (h0298 : (!((rowBit rows 0 1 0 && rowBit rows 0 1 12 && rowBit rows 0 6 0 && rowBit rows 0 6 12))) = true)
    (h0299 : (!((rowBit rows 0 1 4 && rowBit rows 0 1 5 && rowBit rows 0 6 4 && rowBit rows 0 6 5))) = true)
    (h0300 : (!((rowBit rows 0 1 7 && rowBit rows 0 1 8 && rowBit rows 0 6 7 && rowBit rows 0 6 8))) = true)
    (h0301 : (!((rowBit rows 0 1 7 && rowBit rows 0 1 9 && rowBit rows 0 6 7 && rowBit rows 0 6 9))) = true)
    (h0302 : (!((rowBit rows 0 1 7 && rowBit rows 0 1 10 && rowBit rows 0 6 7 && rowBit rows 0 6 10))) = true)
    (h0303 : (!((rowBit rows 0 1 7 && rowBit rows 0 1 11 && rowBit rows 0 6 7 && rowBit rows 0 6 11))) = true)
    (h0304 : (!((rowBit rows 0 1 7 && rowBit rows 0 1 12 && rowBit rows 0 6 7 && rowBit rows 0 6 12))) = true)
    (h0305 : (!((rowBit rows 0 1 8 && rowBit rows 0 1 9 && rowBit rows 0 6 8 && rowBit rows 0 6 9))) = true)
    (h0306 : (!((rowBit rows 0 1 8 && rowBit rows 0 1 10 && rowBit rows 0 6 8 && rowBit rows 0 6 10))) = true)
    (h0307 : (!((rowBit rows 0 1 8 && rowBit rows 0 1 11 && rowBit rows 0 6 8 && rowBit rows 0 6 11))) = true)
    (h0308 : (!((rowBit rows 0 1 8 && rowBit rows 0 1 12 && rowBit rows 0 6 8 && rowBit rows 0 6 12))) = true)
    (h0309 : (!((rowBit rows 0 1 9 && rowBit rows 0 1 10 && rowBit rows 0 6 9 && rowBit rows 0 6 10))) = true)
    (h0310 : (!((rowBit rows 0 1 9 && rowBit rows 0 1 11 && rowBit rows 0 6 9 && rowBit rows 0 6 11))) = true)
    (h0311 : (!((rowBit rows 0 1 9 && rowBit rows 0 1 12 && rowBit rows 0 6 9 && rowBit rows 0 6 12))) = true)
    (h0312 : (!((rowBit rows 0 1 10 && rowBit rows 0 1 11 && rowBit rows 0 6 10 && rowBit rows 0 6 11))) = true)
    (h0313 : (!((rowBit rows 0 1 10 && rowBit rows 0 1 12 && rowBit rows 0 6 10 && rowBit rows 0 6 12))) = true)
    (h0314 : (!((rowBit rows 0 1 11 && rowBit rows 0 1 12 && rowBit rows 0 6 11 && rowBit rows 0 6 12))) = true)
    (h0315 : (!((rowBit rows 0 1 9 && rowBit rows 0 1 10 && rowBit rows 0 7 9 && rowBit rows 0 7 10))) = true)
    (h0316 : (!((rowBit rows 0 1 9 && rowBit rows 0 1 11 && rowBit rows 0 7 9 && rowBit rows 0 7 11))) = true)
    (h0317 : (!((rowBit rows 0 1 9 && rowBit rows 0 1 12 && rowBit rows 0 7 9 && rowBit rows 0 7 12))) = true)
    (h0318 : (!((rowBit rows 0 1 11 && rowBit rows 0 1 12 && rowBit rows 0 7 11 && rowBit rows 0 7 12))) = true)
    (h0319 : (!((rowBit rows 0 1 0 && rowBit rows 0 1 11 && rowBit rows 0 10 0 && rowBit rows 0 10 11))) = true) :
    ∀ item ∈ sourceChunk004Assertions,
      item.eval (sourceAssignment rows blockers shell q w b1 ranks) = true := by
  intro item hitem
  simp only [sourceChunk004Assertions, List.mem_cons,
    List.not_mem_nil, or_false] at hitem
  rcases hitem with (rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl)
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0256
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0257
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0258
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0259
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0260
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0261
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0262
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0263
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0264
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0265
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0266
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0267
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0268
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0269
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0270
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0271
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0272
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0273
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0274
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0275
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0276
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0277
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0278
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0279
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0280
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0281
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0282
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0283
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0284
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0285
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0286
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0287
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0288
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0289
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0290
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0291
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0292
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0293
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0294
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0295
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0296
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0297
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0298
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0299
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0300
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0301
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0302
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0303
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0304
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0305
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0306
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0307
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0308
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0309
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0310
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0311
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0312
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0313
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0314
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0315
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0316
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0317
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0318
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0319

end Problem97.ATailExactFiveCard13AllOneCertificate.Middle
