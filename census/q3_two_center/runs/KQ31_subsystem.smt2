(set-logic QF_NRA)
; benchmark generated from python API
(set-info :status unknown)
(declare-fun rv2 () Real)
(declare-fun z1y () Real)
(declare-fun z1x () Real)
(declare-fun rw2 () Real)
(declare-fun z2y () Real)
(declare-fun z2x () Real)
(assert
 (= (+ (+ (* z1x z1x) (* z1y z1y)) (* (- 1.0) rv2)) 0.0))
(assert
 (let ((?x22 (* (- 2.0) z1x)))
 (let ((?x26 (+ (+ (+ (+ 1.0 (* z1x z1x)) (* z1y z1y)) (* (- 1.0) rw2)) ?x22)))
 (= ?x26 0.0))))
(assert
 (= (+ (+ (* z2x z2x) (* z2y z2y)) (* (- 1.0) rv2)) 0.0))
(assert
 (let ((?x37 (+ (+ (+ (+ 1.0 (* z2x z2x)) (* z2y z2y)) (* (- 1.0) rw2)) (* (- 2.0) z2x))))
 (= ?x37 0.0)))
(assert
 (> rv2 0.0))
(assert
 (> rw2 0.0))
(assert
 (> z1y 0.0))
(assert
 (> z2y 0.0))
(assert
 (let ((?x29 (* z2y z2y)))
(let ((?x48 (+ (+ (+ (+ (* z1x z1x) (* z1y z1y)) (* z2x z2x)) ?x29) (* (* (- 2.0) z1x) z2x))))
(> (+ ?x48 (* (* (- 2.0) z1y) z2y)) 0.0))))
(check-sat)
