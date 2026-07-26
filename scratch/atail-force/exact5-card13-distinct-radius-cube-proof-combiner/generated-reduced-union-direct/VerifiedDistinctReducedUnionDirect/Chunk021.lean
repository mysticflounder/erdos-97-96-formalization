import VerifiedDistinctReducedUnionDirect.Base

namespace Problem97.ATailExactFiveDistinctReducedUnionVerifiedDirect

open Std.Tactic.BVDecide

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

def reducedUnionChunk021Assertions : List BVLogicalExpr :=
  [ bnot (bvar 84),
    exactly [bvar 80, bvar 81, bvar 82, bvar 83, bvar 84, bvar 85, bvar 86, bvar 87, bvar 88, bvar 89, bvar 90, bvar 91, bvar 92] 4,
    bnot (bvar 98),
    exactly [bvar 93, bvar 94, bvar 95, bvar 96, bvar 97, bvar 98, bvar 99, bvar 100, bvar 101, bvar 102, bvar 103, bvar 104, bvar 105] 4,
    bnot (bvar 112),
    exactly [bvar 106, bvar 107, bvar 108, bvar 109, bvar 110, bvar 111, bvar 112, bvar 113, bvar 114, bvar 115, bvar 116, bvar 117, bvar 118] 4,
    bnot (bvar 126),
    exactly [bvar 119, bvar 120, bvar 121, bvar 122, bvar 123, bvar 124, bvar 125, bvar 126, bvar 127, bvar 128, bvar 129, bvar 130, bvar 131] 4,
    bnot (bvar 140),
    exactly [bvar 132, bvar 133, bvar 134, bvar 135, bvar 136, bvar 137, bvar 138, bvar 139, bvar 140, bvar 141, bvar 142, bvar 143, bvar 144] 4,
    bnot (bvar 154),
    exactly [bvar 145, bvar 146, bvar 147, bvar 148, bvar 149, bvar 150, bvar 151, bvar 152, bvar 153, bvar 154, bvar 155, bvar 156, bvar 157] 4,
    bnot (bvar 168),
    exactly [bvar 158, bvar 159, bvar 160, bvar 161, bvar 162, bvar 163, bvar 164, bvar 165, bvar 166, bvar 167, bvar 168, bvar 169, bvar 170] 4,
    bnot (bvar 182),
    exactly [bvar 171, bvar 172, bvar 173, bvar 174, bvar 175, bvar 176, bvar 177, bvar 178, bvar 179, bvar 180, bvar 181, bvar 182, bvar 183] 4,
    bnot (bvar 196),
    exactly [bvar 184, bvar 185, bvar 186, bvar 187, bvar 188, bvar 189, bvar 190, bvar 191, bvar 192, bvar 193, bvar 194, bvar 195, bvar 196] 4,
    atMost [bands [bvar 119, bvar 145], bands [bvar 120, bvar 146], bands [bvar 121, bvar 147], bands [bvar 122, bvar 148], bands [bvar 123, bvar 149], bands [bvar 124, bvar 150], bands [bvar 125, bvar 151], bands [bvar 126, bvar 152], bands [bvar 127, bvar 153], bands [bvar 128, bvar 154], bands [bvar 129, bvar 155], bands [bvar 130, bvar 156], bands [bvar 131, bvar 157]] 2,
    atMost [bands [bvar 145, bvar 171], bands [bvar 146, bvar 172], bands [bvar 147, bvar 173], bands [bvar 148, bvar 174], bands [bvar 149, bvar 175], bands [bvar 150, bvar 176], bands [bvar 151, bvar 177], bands [bvar 152, bvar 178], bands [bvar 153, bvar 179], bands [bvar 154, bvar 180], bands [bvar 155, bvar 181], bands [bvar 156, bvar 182], bands [bvar 157, bvar 183]] 2,
    atMost [bands [bvar 158, bvar 184], bands [bvar 159, bvar 185], bands [bvar 160, bvar 186], bands [bvar 161, bvar 187], bands [bvar 162, bvar 188], bands [bvar 163, bvar 189], bands [bvar 164, bvar 190], bands [bvar 165, bvar 191], bands [bvar 166, bvar 192], bands [bvar 167, bvar 193], bands [bvar 168, bvar 194], bands [bvar 169, bvar 195], bands [bvar 170, bvar 196]] 2,
    atMost [bands [bvar 29, bvar 34], bands [bvar 42, bvar 47], bands [bvar 55, bvar 60], bands [bvar 68, bvar 73], bands [bvar 81, bvar 86], bands [bvar 94, bvar 99], bands [bvar 107, bvar 112], bands [bvar 120, bvar 125], bands [bvar 133, bvar 138], bands [bvar 146, bvar 151], bands [bvar 159, bvar 164], bands [bvar 172, bvar 177], bands [bvar 185, bvar 190]] 2,
    atMost [bands [bvar 29, bvar 35], bands [bvar 42, bvar 48], bands [bvar 55, bvar 61], bands [bvar 68, bvar 74], bands [bvar 81, bvar 87], bands [bvar 94, bvar 100], bands [bvar 107, bvar 113], bands [bvar 120, bvar 126], bands [bvar 133, bvar 139], bands [bvar 146, bvar 152], bands [bvar 159, bvar 165], bands [bvar 172, bvar 178], bands [bvar 185, bvar 191]] 2,
    atMost [bands [bvar 29, bvar 37], bands [bvar 42, bvar 50], bands [bvar 55, bvar 63], bands [bvar 68, bvar 76], bands [bvar 81, bvar 89], bands [bvar 94, bvar 102], bands [bvar 107, bvar 115], bands [bvar 120, bvar 128], bands [bvar 133, bvar 141], bands [bvar 146, bvar 154], bands [bvar 159, bvar 167], bands [bvar 172, bvar 180], bands [bvar 185, bvar 193]] 2,
    atMost [bands [bvar 29, bvar 38], bands [bvar 42, bvar 51], bands [bvar 55, bvar 64], bands [bvar 68, bvar 77], bands [bvar 81, bvar 90], bands [bvar 94, bvar 103], bands [bvar 107, bvar 116], bands [bvar 120, bvar 129], bands [bvar 133, bvar 142], bands [bvar 146, bvar 155], bands [bvar 159, bvar 168], bands [bvar 172, bvar 181], bands [bvar 185, bvar 194]] 2,
    atMost [bands [bvar 31, bvar 35], bands [bvar 44, bvar 48], bands [bvar 57, bvar 61], bands [bvar 70, bvar 74], bands [bvar 83, bvar 87], bands [bvar 96, bvar 100], bands [bvar 109, bvar 113], bands [bvar 122, bvar 126], bands [bvar 135, bvar 139], bands [bvar 148, bvar 152], bands [bvar 161, bvar 165], bands [bvar 174, bvar 178], bands [bvar 187, bvar 191]] 2,
    atMost [bands [bvar 31, bvar 38], bands [bvar 44, bvar 51], bands [bvar 57, bvar 64], bands [bvar 70, bvar 77], bands [bvar 83, bvar 90], bands [bvar 96, bvar 103], bands [bvar 109, bvar 116], bands [bvar 122, bvar 129], bands [bvar 135, bvar 142], bands [bvar 148, bvar 155], bands [bvar 161, bvar 168], bands [bvar 174, bvar 181], bands [bvar 187, bvar 194]] 2,
    atMost [bands [bvar 32, bvar 34], bands [bvar 45, bvar 47], bands [bvar 58, bvar 60], bands [bvar 71, bvar 73], bands [bvar 84, bvar 86], bands [bvar 97, bvar 99], bands [bvar 110, bvar 112], bands [bvar 123, bvar 125], bands [bvar 136, bvar 138], bands [bvar 149, bvar 151], bands [bvar 162, bvar 164], bands [bvar 175, bvar 177], bands [bvar 188, bvar 190]] 2,
    atMost [bands [bvar 32, bvar 36], bands [bvar 45, bvar 49], bands [bvar 58, bvar 62], bands [bvar 71, bvar 75], bands [bvar 84, bvar 88], bands [bvar 97, bvar 101], bands [bvar 110, bvar 114], bands [bvar 123, bvar 127], bands [bvar 136, bvar 140], bands [bvar 149, bvar 153], bands [bvar 162, bvar 166], bands [bvar 175, bvar 179], bands [bvar 188, bvar 192]] 2,
    atMost [bands [bvar 33, bvar 38], bands [bvar 46, bvar 51], bands [bvar 59, bvar 64], bands [bvar 72, bvar 77], bands [bvar 85, bvar 90], bands [bvar 98, bvar 103], bands [bvar 111, bvar 116], bands [bvar 124, bvar 129], bands [bvar 137, bvar 142], bands [bvar 150, bvar 155], bands [bvar 163, bvar 168], bands [bvar 176, bvar 181], bands [bvar 189, bvar 194]] 2,
    atMost [bands [bvar 35, bvar 38], bands [bvar 48, bvar 51], bands [bvar 61, bvar 64], bands [bvar 74, bvar 77], bands [bvar 87, bvar 90], bands [bvar 100, bvar 103], bands [bvar 113, bvar 116], bands [bvar 126, bvar 129], bands [bvar 139, bvar 142], bands [bvar 152, bvar 155], bands [bvar 165, bvar 168], bands [bvar 178, bvar 181], bands [bvar 191, bvar 194]] 2,
    atMost [bands [bvar 35, bvar 39], bands [bvar 48, bvar 52], bands [bvar 61, bvar 65], bands [bvar 74, bvar 78], bands [bvar 87, bvar 91], bands [bvar 100, bvar 104], bands [bvar 113, bvar 117], bands [bvar 126, bvar 130], bands [bvar 139, bvar 143], bands [bvar 152, bvar 156], bands [bvar 165, bvar 169], bands [bvar 178, bvar 182], bands [bvar 191, bvar 195]] 2,
    bnot (bands [bvar 30, bvar 34, bvar 43, bvar 47]),
    bnot (bands [bvar 30, bvar 38, bvar 43, bvar 51]),
    bnot (bands [bvar 30, bvar 39, bvar 43, bvar 52]),
    bnot (bands [bvar 32, bvar 33, bvar 45, bvar 46]),
    bnot (bands [bvar 32, bvar 34, bvar 45, bvar 47]),
    bnot (bands [bvar 33, bvar 34, bvar 46, bvar 47]),
    bnot (bands [bvar 34, bvar 35, bvar 47, bvar 48]),
    bnot (bands [bvar 34, bvar 36, bvar 47, bvar 49]),
    bnot (bands [bvar 34, bvar 38, bvar 47, bvar 51]),
    bnot (bands [bvar 34, bvar 39, bvar 47, bvar 52]),
    bnot (bands [bvar 34, bvar 40, bvar 47, bvar 53]),
    bnot (bands [bvar 35, bvar 36, bvar 48, bvar 49]),
    bnot (bands [bvar 35, bvar 38, bvar 48, bvar 51]),
    bnot (bands [bvar 35, bvar 39, bvar 48, bvar 52]),
    bnot (bands [bvar 31, bvar 33, bvar 57, bvar 59]),
    bnot (bands [bvar 31, bvar 34, bvar 57, bvar 60]),
    bnot (bands [bvar 31, bvar 35, bvar 57, bvar 61]),
    bnot (bands [bvar 31, bvar 36, bvar 57, bvar 62]),
    bnot (bands [bvar 31, bvar 37, bvar 57, bvar 63]),
    bnot (bands [bvar 31, bvar 38, bvar 57, bvar 64]),
    bnot (bands [bvar 31, bvar 39, bvar 57, bvar 65]),
    bnot (bands [bvar 31, bvar 40, bvar 57, bvar 66]),
    bnot (bands [bvar 34, bvar 36, bvar 60, bvar 62]),
    bnot (bands [bvar 34, bvar 37, bvar 60, bvar 63]),
    bnot (bands [bvar 34, bvar 39, bvar 60, bvar 65]),
    bnot (bands [bvar 34, bvar 40, bvar 60, bvar 66]),
    bnot (bands [bvar 35, bvar 36, bvar 61, bvar 62]),
    bnot (bands [bvar 35, bvar 37, bvar 61, bvar 63]),
    bnot (bands [bvar 35, bvar 38, bvar 61, bvar 64]),
    bnot (bands [bvar 35, bvar 39, bvar 61, bvar 65]),
    bnot (bands [bvar 35, bvar 40, bvar 61, bvar 66]),
    bnot (bands [bvar 36, bvar 37, bvar 62, bvar 63]) ]

def reducedUnionChunk021 : BVLogicalExpr :=
  bands reducedUnionChunk021Assertions

end Problem97.ATailExactFiveDistinctReducedUnionVerifiedDirect
