/-
Generated packed-source bridge for verified middle chunk 030.
-/
import AllOneMiddleVerifiedAssignment

namespace Problem97.ATailExactFiveCard13AllOneCertificate.Middle

open Std.Tactic.BVDecide

set_option maxRecDepth 1000000
set_option maxHeartbeats 0
set_option linter.unusedVariables false
set_option linter.unusedSimpArgs false

theorem sourceChunk030_each_of_flat
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits)
    (h1920 : (!(firstRowBit b1 4)) = true)
    (h1921 : ((!((q == 0#4)) || (!(firstRowBit b1 0)))) = true)
    (h1922 : ((!((w == 0#4)) || (!(firstRowBit b1 0)))) = true)
    (h1923 : ((!((q == 1#4)) || (!(firstRowBit b1 1)))) = true)
    (h1924 : ((!((w == 1#4)) || (!(firstRowBit b1 1)))) = true)
    (h1925 : ((!((q == 2#4)) || (!(firstRowBit b1 2)))) = true)
    (h1926 : ((!((w == 2#4)) || (!(firstRowBit b1 2)))) = true)
    (h1927 : ((!((q == 3#4)) || (!(firstRowBit b1 3)))) = true)
    (h1928 : ((!((w == 3#4)) || (!(firstRowBit b1 3)))) = true)
    (h1929 : ((!((q == 5#4)) || (!(firstRowBit b1 5)))) = true)
    (h1930 : ((!((w == 5#4)) || (!(firstRowBit b1 5)))) = true)
    (h1931 : ((!((q == 6#4)) || (!(firstRowBit b1 6)))) = true)
    (h1932 : ((!((w == 6#4)) || (!(firstRowBit b1 6)))) = true)
    (h1933 : ((!((q == 7#4)) || (!(firstRowBit b1 7)))) = true)
    (h1934 : ((!((w == 7#4)) || (!(firstRowBit b1 7)))) = true)
    (h1935 : ((!((q == 8#4)) || (!(firstRowBit b1 8)))) = true)
    (h1936 : ((!((w == 8#4)) || (!(firstRowBit b1 8)))) = true)
    (h1937 : ((!((q == 9#4)) || (!(firstRowBit b1 9)))) = true)
    (h1938 : ((!((w == 9#4)) || (!(firstRowBit b1 9)))) = true)
    (h1939 : ((!((q == 10#4)) || (!(firstRowBit b1 10)))) = true)
    (h1940 : ((!((w == 10#4)) || (!(firstRowBit b1 10)))) = true)
    (h1941 : ((!((q == 11#4)) || (!(firstRowBit b1 11)))) = true)
    (h1942 : ((!((w == 11#4)) || (!(firstRowBit b1 11)))) = true)
    (h1943 : ((!((q == 12#4)) || (!(firstRowBit b1 12)))) = true)
    (h1944 : ((!((w == 12#4)) || (!(firstRowBit b1 12)))) = true)
    (h1945 : ((((bif firstRowBit b1 4 then 1#4 else 0#4) + (bif firstRowBit b1 5 then 1#4 else 0#4) + (bif firstRowBit b1 6 then 1#4 else 0#4) + (bif firstRowBit b1 7 then 1#4 else 0#4) + (bif firstRowBit b1 8 then 1#4 else 0#4))).ule 1#4) = true)
    (h1946 : ((((bif firstRowBit b1 0 then 1#4 else 0#4) + (bif firstRowBit b1 1 then 1#4 else 0#4) + (bif firstRowBit b1 2 then 1#4 else 0#4) + (bif firstRowBit b1 3 then 1#4 else 0#4) + (bif firstRowBit b1 4 then 1#4 else 0#4))).ule 1#4) = true)
    (h1947 : (!((rowBit rows 1 8 2 && rowBit rows 1 8 1))) = true)
    (h1948 : (!((rowBit rows 2 8 2 && rowBit rows 2 8 3))) = true)
    (h1949 : (!((rowBit rows 2 9 2 && rowBit rows 2 9 3))) = true)
    (h1950 : (!((((blockerAt blockers 3 == 0#4) && rowBit rows 0 0 1) || ((blockerAt blockers 3 == 1#4) && rowBit rows 0 1 1) || ((blockerAt blockers 3 == 2#4) && rowBit rows 0 2 1) || ((blockerAt blockers 3 == 3#4) && rowBit rows 0 3 1) || ((blockerAt blockers 3 == 4#4) && rowBit rows 0 4 1) || ((blockerAt blockers 3 == 5#4) && rowBit rows 0 5 1) || ((blockerAt blockers 3 == 6#4) && rowBit rows 0 6 1) || ((blockerAt blockers 3 == 7#4) && rowBit rows 0 7 1) || ((blockerAt blockers 3 == 8#4) && rowBit rows 0 8 1) || ((blockerAt blockers 3 == 9#4) && rowBit rows 0 9 1) || ((blockerAt blockers 3 == 10#4) && rowBit rows 0 10 1) || ((blockerAt blockers 3 == 11#4) && rowBit rows 0 11 1) || ((blockerAt blockers 3 == 12#4) && rowBit rows 0 12 1)))) = true)
    (h1951 : (!((((blockerAt blockers 3 == 0#4) && rowBit rows 0 0 2) || ((blockerAt blockers 3 == 1#4) && rowBit rows 0 1 2) || ((blockerAt blockers 3 == 2#4) && rowBit rows 0 2 2) || ((blockerAt blockers 3 == 3#4) && rowBit rows 0 3 2) || ((blockerAt blockers 3 == 4#4) && rowBit rows 0 4 2) || ((blockerAt blockers 3 == 5#4) && rowBit rows 0 5 2) || ((blockerAt blockers 3 == 6#4) && rowBit rows 0 6 2) || ((blockerAt blockers 3 == 7#4) && rowBit rows 0 7 2) || ((blockerAt blockers 3 == 8#4) && rowBit rows 0 8 2) || ((blockerAt blockers 3 == 9#4) && rowBit rows 0 9 2) || ((blockerAt blockers 3 == 10#4) && rowBit rows 0 10 2) || ((blockerAt blockers 3 == 11#4) && rowBit rows 0 11 2) || ((blockerAt blockers 3 == 12#4) && rowBit rows 0 12 2)))) = true)
    (h1952 : ((rankAtom ranks 0).ult (78#7)) = true)
    (h1953 : ((rankAtom ranks 1).ult (78#7)) = true)
    (h1954 : ((rankAtom ranks 2).ult (78#7)) = true)
    (h1955 : ((rankAtom ranks 3).ult (78#7)) = true)
    (h1956 : ((rankAtom ranks 4).ult (78#7)) = true)
    (h1957 : ((rankAtom ranks 5).ult (78#7)) = true)
    (h1958 : ((rankAtom ranks 6).ult (78#7)) = true)
    (h1959 : ((rankAtom ranks 7).ult (78#7)) = true)
    (h1960 : ((rankAtom ranks 8).ult (78#7)) = true)
    (h1961 : ((rankAtom ranks 9).ult (78#7)) = true)
    (h1962 : ((rankAtom ranks 10).ult (78#7)) = true)
    (h1963 : ((rankAtom ranks 11).ult (78#7)) = true)
    (h1964 : ((rankAtom ranks 12).ult (78#7)) = true)
    (h1965 : ((rankAtom ranks 13).ult (78#7)) = true)
    (h1966 : ((rankAtom ranks 14).ult (78#7)) = true)
    (h1967 : ((rankAtom ranks 15).ult (78#7)) = true)
    (h1968 : ((rankAtom ranks 16).ult (78#7)) = true)
    (h1969 : ((rankAtom ranks 17).ult (78#7)) = true)
    (h1970 : ((rankAtom ranks 18).ult (78#7)) = true)
    (h1971 : ((rankAtom ranks 19).ult (78#7)) = true)
    (h1972 : ((rankAtom ranks 20).ult (78#7)) = true)
    (h1973 : ((rankAtom ranks 21).ult (78#7)) = true)
    (h1974 : ((rankAtom ranks 22).ult (78#7)) = true)
    (h1975 : ((rankAtom ranks 23).ult (78#7)) = true)
    (h1976 : ((rankAtom ranks 24).ult (78#7)) = true)
    (h1977 : ((rankAtom ranks 25).ult (78#7)) = true)
    (h1978 : ((rankAtom ranks 26).ult (78#7)) = true)
    (h1979 : ((rankAtom ranks 27).ult (78#7)) = true)
    (h1980 : ((rankAtom ranks 29).ult (78#7)) = true)
    (h1981 : ((rankAtom ranks 30).ult (78#7)) = true)
    (h1982 : ((rankAtom ranks 31).ult (78#7)) = true)
    (h1983 : ((rankAtom ranks 32).ult (78#7)) = true) :
    ∀ item ∈ sourceChunk030Assertions,
      item.eval (sourceAssignment rows blockers shell q w b1 ranks) = true := by
  intro item hitem
  simp only [sourceChunk030Assertions, List.mem_cons,
    List.not_mem_nil, or_false] at hitem
  rcases hitem with (rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl)
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1920
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1921
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1922
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1923
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1924
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1925
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1926
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1927
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1928
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1929
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1930
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1931
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1932
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1933
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1934
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1935
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1936
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1937
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1938
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1939
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1940
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1941
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1942
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1943
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1944
  · simp [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] at h1945 ⊢
    bv_decide
  · simp [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] at h1946 ⊢
    bv_decide
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1947
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1948
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1949
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1950
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1951
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1952
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1953
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1954
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1955
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1956
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1957
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1958
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1959
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1960
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1961
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1962
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1963
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1964
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1965
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1966
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1967
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1968
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1969
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1970
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1971
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1972
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1973
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1974
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1975
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1976
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1977
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1978
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1979
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1980
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1981
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1982
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1983

end Problem97.ATailExactFiveCard13AllOneCertificate.Middle
