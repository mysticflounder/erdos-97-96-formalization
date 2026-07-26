import VerifiedDistinctReducedUnionMirror.Base

namespace Problem97.ATailExactFiveDistinctReducedUnionVerifiedMirror

open Std.Tactic.BVDecide

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

def reducedUnionChunk148Assertions : List BVLogicalExpr :=
  [ bbeq (bvar 1465) (bors [bvar 1452, bands [bvar 1445, bvar 1049], bands [bvar 1446, bvar 1062], bands [bvar 1447, bvar 1075], bands [bvar 1448, bvar 1088], bands [bvar 1449, bvar 1101], bands [bvar 1450, bvar 1114], bands [bvar 1451, bvar 1127], bands [bvar 1452, bvar 1140], bands [bvar 1453, bvar 1153], bands [bvar 1454, bvar 1166], bands [bvar 1455, bvar 1179], bands [bvar 1456, bvar 1192], bands [bvar 1457, bvar 1205]]),
    bbeq (bvar 1478) (bors [bvar 1465, bands [bvar 1458, bvar 1049], bands [bvar 1459, bvar 1062], bands [bvar 1460, bvar 1075], bands [bvar 1461, bvar 1088], bands [bvar 1462, bvar 1101], bands [bvar 1463, bvar 1114], bands [bvar 1464, bvar 1127], bands [bvar 1465, bvar 1140], bands [bvar 1466, bvar 1153], bands [bvar 1467, bvar 1166], bands [bvar 1468, bvar 1179], bands [bvar 1469, bvar 1192], bands [bvar 1470, bvar 1205]]),
    bbeq (bvar 1491) (bors [bvar 1478, bands [bvar 1471, bvar 1049], bands [bvar 1472, bvar 1062], bands [bvar 1473, bvar 1075], bands [bvar 1474, bvar 1088], bands [bvar 1475, bvar 1101], bands [bvar 1476, bvar 1114], bands [bvar 1477, bvar 1127], bands [bvar 1478, bvar 1140], bands [bvar 1479, bvar 1153], bands [bvar 1480, bvar 1166], bands [bvar 1481, bvar 1179], bands [bvar 1482, bvar 1192], bands [bvar 1483, bvar 1205]]),
    bbeq (bvar 1504) (bors [bvar 1491, bands [bvar 1484, bvar 1049], bands [bvar 1485, bvar 1062], bands [bvar 1486, bvar 1075], bands [bvar 1487, bvar 1088], bands [bvar 1488, bvar 1101], bands [bvar 1489, bvar 1114], bands [bvar 1490, bvar 1127], bands [bvar 1491, bvar 1140], bands [bvar 1492, bvar 1153], bands [bvar 1493, bvar 1166], bands [bvar 1494, bvar 1179], bands [bvar 1495, bvar 1192], bands [bvar 1496, bvar 1205]]),
    bbeq (bvar 1517) (bors [bvar 1504, bands [bvar 1497, bvar 1049], bands [bvar 1498, bvar 1062], bands [bvar 1499, bvar 1075], bands [bvar 1500, bvar 1088], bands [bvar 1501, bvar 1101], bands [bvar 1502, bvar 1114], bands [bvar 1503, bvar 1127], bands [bvar 1504, bvar 1140], bands [bvar 1505, bvar 1153], bands [bvar 1506, bvar 1166], bands [bvar 1507, bvar 1179], bands [bvar 1508, bvar 1192], bands [bvar 1509, bvar 1205]]),
    bbeq (bvar 1530) (bors [bvar 1517, bands [bvar 1510, bvar 1049], bands [bvar 1511, bvar 1062], bands [bvar 1512, bvar 1075], bands [bvar 1513, bvar 1088], bands [bvar 1514, bvar 1101], bands [bvar 1515, bvar 1114], bands [bvar 1516, bvar 1127], bands [bvar 1517, bvar 1140], bands [bvar 1518, bvar 1153], bands [bvar 1519, bvar 1166], bands [bvar 1520, bvar 1179], bands [bvar 1521, bvar 1192], bands [bvar 1522, bvar 1205]]),
    bbeq (bvar 366) ((.const true)),
    bbeq (bvar 379) (bors [bvar 366, bands [bvar 366, bvar 28], bands [bvar 367, bvar 41], bands [bvar 368, bvar 54], bands [bvar 369, bvar 67], bands [bvar 370, bvar 80], bands [bvar 371, bvar 93], bands [bvar 372, bvar 106], bands [bvar 373, bvar 119], bands [bvar 374, bvar 132], bands [bvar 375, bvar 145], bands [bvar 376, bvar 158], bands [bvar 377, bvar 171], bands [bvar 378, bvar 184]]),
    bbeq (bvar 381) (bors [bvar 368, bands [bvar 366, bvar 30], bands [bvar 367, bvar 43], bands [bvar 368, bvar 56], bands [bvar 369, bvar 69], bands [bvar 370, bvar 82], bands [bvar 371, bvar 95], bands [bvar 372, bvar 108], bands [bvar 373, bvar 121], bands [bvar 374, bvar 134], bands [bvar 375, bvar 147], bands [bvar 376, bvar 160], bands [bvar 377, bvar 173], bands [bvar 378, bvar 186]]),
    bbeq (bvar 873) ((.const true)),
    bbeq (bvar 886) (bors [bvar 873, bands [bvar 873, bvar 535], bands [bvar 874, bvar 548], bands [bvar 875, bvar 561], bands [bvar 876, bvar 574], bands [bvar 877, bvar 587], bands [bvar 878, bvar 600], bands [bvar 879, bvar 613], bands [bvar 880, bvar 626], bands [bvar 881, bvar 639], bands [bvar 882, bvar 652], bands [bvar 883, bvar 665], bands [bvar 884, bvar 678], bands [bvar 885, bvar 691]]),
    bbeq (bvar 888) (bors [bvar 875, bands [bvar 873, bvar 537], bands [bvar 874, bvar 550], bands [bvar 875, bvar 563], bands [bvar 876, bvar 576], bands [bvar 877, bvar 589], bands [bvar 878, bvar 602], bands [bvar 879, bvar 615], bands [bvar 880, bvar 628], bands [bvar 881, bvar 641], bands [bvar 882, bvar 654], bands [bvar 883, bvar 667], bands [bvar 884, bvar 680], bands [bvar 885, bvar 693]]),
    bvult ((.var 1549 : BVExpr 7)) ((.const 78#7)),
    bvult ((.var 1550 : BVExpr 7)) ((.const 78#7)),
    bvult ((.var 1551 : BVExpr 7)) ((.const 78#7)),
    bvult ((.var 1552 : BVExpr 7)) ((.const 78#7)),
    bvult ((.var 1553 : BVExpr 7)) ((.const 78#7)),
    bvult ((.var 1554 : BVExpr 7)) ((.const 78#7)),
    bvult ((.var 1555 : BVExpr 7)) ((.const 78#7)),
    bvult ((.var 1556 : BVExpr 7)) ((.const 78#7)),
    bvult ((.var 1557 : BVExpr 7)) ((.const 78#7)),
    bvult ((.var 1558 : BVExpr 7)) ((.const 78#7)),
    bvult ((.var 1559 : BVExpr 7)) ((.const 78#7)),
    bvult ((.var 1560 : BVExpr 7)) ((.const 78#7)),
    bvult ((.var 1561 : BVExpr 7)) ((.const 78#7)),
    bvult ((.var 1562 : BVExpr 7)) ((.const 78#7)),
    bvult ((.var 1563 : BVExpr 7)) ((.const 78#7)),
    bvult ((.var 1564 : BVExpr 7)) ((.const 78#7)),
    bvult ((.var 1565 : BVExpr 7)) ((.const 78#7)),
    bvult ((.var 1566 : BVExpr 7)) ((.const 78#7)),
    bvult ((.var 1567 : BVExpr 7)) ((.const 78#7)),
    bvult ((.var 1568 : BVExpr 7)) ((.const 78#7)),
    bvult ((.var 1569 : BVExpr 7)) ((.const 78#7)),
    bvult ((.var 1570 : BVExpr 7)) ((.const 78#7)),
    bvult ((.var 1571 : BVExpr 7)) ((.const 78#7)),
    bvult ((.var 1572 : BVExpr 7)) ((.const 78#7)),
    bvult ((.var 1573 : BVExpr 7)) ((.const 78#7)),
    bvult ((.var 1574 : BVExpr 7)) ((.const 78#7)),
    bvult ((.var 1575 : BVExpr 7)) ((.const 78#7)),
    bvult ((.var 1576 : BVExpr 7)) ((.const 78#7)),
    bvult ((.var 1577 : BVExpr 7)) ((.const 78#7)),
    bvult ((.var 1578 : BVExpr 7)) ((.const 78#7)),
    bvult ((.var 1579 : BVExpr 7)) ((.const 78#7)),
    bvult ((.var 1580 : BVExpr 7)) ((.const 78#7)),
    bvult ((.var 1581 : BVExpr 7)) ((.const 78#7)),
    bvult ((.var 1582 : BVExpr 7)) ((.const 78#7)),
    bvult ((.var 1583 : BVExpr 7)) ((.const 78#7)),
    bvult ((.var 1584 : BVExpr 7)) ((.const 78#7)),
    bvult ((.var 1585 : BVExpr 7)) ((.const 78#7)),
    bvult ((.var 1586 : BVExpr 7)) ((.const 78#7)),
    bvult ((.var 1587 : BVExpr 7)) ((.const 78#7)),
    bvult ((.var 1588 : BVExpr 7)) ((.const 78#7)),
    bvult ((.var 1589 : BVExpr 7)) ((.const 78#7)),
    bvult ((.var 1590 : BVExpr 7)) ((.const 78#7)),
    bvult ((.var 1591 : BVExpr 7)) ((.const 78#7)),
    bvult ((.var 1592 : BVExpr 7)) ((.const 78#7)),
    bvult ((.var 1593 : BVExpr 7)) ((.const 78#7)),
    bvult ((.var 1594 : BVExpr 7)) ((.const 78#7)),
    bvult ((.var 1595 : BVExpr 7)) ((.const 78#7)),
    bvult ((.var 1596 : BVExpr 7)) ((.const 78#7)),
    bvult ((.var 1597 : BVExpr 7)) ((.const 78#7)),
    bvult ((.var 1598 : BVExpr 7)) ((.const 78#7)),
    bvult ((.var 1599 : BVExpr 7)) ((.const 78#7)),
    bvult ((.var 1600 : BVExpr 7)) ((.const 78#7)) ]

def reducedUnionChunk148 : BVLogicalExpr :=
  bands reducedUnionChunk148Assertions

end Problem97.ATailExactFiveDistinctReducedUnionVerifiedMirror
