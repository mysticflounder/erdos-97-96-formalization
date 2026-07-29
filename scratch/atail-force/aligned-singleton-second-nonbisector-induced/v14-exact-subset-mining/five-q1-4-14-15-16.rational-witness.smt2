(set-logic QF_NRA)
; benchmark generated from python API
(set-info :status unknown)
(declare-fun x_0 () Real)
(declare-fun y_0 () Real)
(declare-fun x_1 () Real)
(declare-fun y_1 () Real)
(declare-fun x_2 () Real)
(declare-fun y_2 () Real)
(declare-fun x_3 () Real)
(declare-fun y_3 () Real)
(declare-fun x_4 () Real)
(declare-fun y_4 () Real)
(assert
 (= x_0 0.0))
(assert
 (= y_0 0.0))
(assert
 (= x_1 1.0))
(assert
 (= y_1 0.0))
(assert
 (let ((?x27 (- (* (- x_1 x_0) (- y_2 y_0)) (* (- y_1 y_0) (- x_2 x_0)))))
 (> ?x27 0.0)))
(assert
 (let ((?x33 (- (* (- x_1 x_0) (- y_3 y_0)) (* (- y_1 y_0) (- x_3 x_0)))))
 (> ?x33 0.0)))
(assert
 (let ((?x39 (- (* (- x_1 x_0) (- y_4 y_0)) (* (- y_1 y_0) (- x_4 x_0)))))
 (> ?x39 0.0)))
(assert
 (let ((?x47 (- (* (- x_2 x_1) (- y_0 y_1)) (* (- y_2 y_1) (- x_0 x_1)))))
 (> ?x47 0.0)))
(assert
 (let ((?x53 (- (* (- x_2 x_1) (- y_3 y_1)) (* (- y_2 y_1) (- x_3 x_1)))))
 (> ?x53 0.0)))
(assert
 (let ((?x59 (- (* (- x_2 x_1) (- y_4 y_1)) (* (- y_2 y_1) (- x_4 x_1)))))
 (> ?x59 0.0)))
(assert
 (let ((?x67 (- (* (- x_3 x_2) (- y_0 y_2)) (* (- y_3 y_2) (- x_0 x_2)))))
 (> ?x67 0.0)))
(assert
 (let ((?x73 (- (* (- x_3 x_2) (- y_1 y_2)) (* (- y_3 y_2) (- x_1 x_2)))))
 (> ?x73 0.0)))
(assert
 (let ((?x79 (- (* (- x_3 x_2) (- y_4 y_2)) (* (- y_3 y_2) (- x_4 x_2)))))
 (> ?x79 0.0)))
(assert
 (let ((?x87 (- (* (- x_4 x_3) (- y_0 y_3)) (* (- y_4 y_3) (- x_0 x_3)))))
 (> ?x87 0.0)))
(assert
 (let ((?x93 (- (* (- x_4 x_3) (- y_1 y_3)) (* (- y_4 y_3) (- x_1 x_3)))))
 (> ?x93 0.0)))
(assert
 (let ((?x99 (- (* (- x_4 x_3) (- y_2 y_3)) (* (- y_4 y_3) (- x_2 x_3)))))
 (> ?x99 0.0)))
(assert
 (let ((?x107 (- (* (- x_0 x_4) (- y_1 y_4)) (* (- y_0 y_4) (- x_1 x_4)))))
 (> ?x107 0.0)))
(assert
 (let ((?x113 (- (* (- x_0 x_4) (- y_2 y_4)) (* (- y_0 y_4) (- x_2 x_4)))))
 (> ?x113 0.0)))
(assert
 (let ((?x119 (- (* (- x_0 x_4) (- y_3 y_4)) (* (- y_0 y_4) (- x_3 x_4)))))
 (> ?x119 0.0)))
(assert
 (let ((?x123 (+ (* (- x_0 x_1) (- x_0 x_1)) (* (- y_0 y_1) (- y_0 y_1)))))
 (> ?x123 0.0)))
(assert
 (let ((?x127 (+ (* (- x_0 x_2) (- x_0 x_2)) (* (- y_0 y_2) (- y_0 y_2)))))
 (> ?x127 0.0)))
(assert
 (let ((?x131 (+ (* (- x_0 x_3) (- x_0 x_3)) (* (- y_0 y_3) (- y_0 y_3)))))
 (> ?x131 0.0)))
(assert
 (let ((?x135 (+ (* (- x_0 x_4) (- x_0 x_4)) (* (- y_0 y_4) (- y_0 y_4)))))
 (> ?x135 0.0)))
(assert
 (let ((?x139 (+ (* (- x_1 x_2) (- x_1 x_2)) (* (- y_1 y_2) (- y_1 y_2)))))
 (> ?x139 0.0)))
(assert
 (let ((?x143 (+ (* (- x_1 x_3) (- x_1 x_3)) (* (- y_1 y_3) (- y_1 y_3)))))
 (> ?x143 0.0)))
(assert
 (let ((?x147 (+ (* (- x_1 x_4) (- x_1 x_4)) (* (- y_1 y_4) (- y_1 y_4)))))
 (> ?x147 0.0)))
(assert
 (let ((?x151 (+ (* (- x_2 x_3) (- x_2 x_3)) (* (- y_2 y_3) (- y_2 y_3)))))
 (> ?x151 0.0)))
(assert
 (let ((?x155 (+ (* (- x_2 x_4) (- x_2 x_4)) (* (- y_2 y_4) (- y_2 y_4)))))
 (> ?x155 0.0)))
(assert
 (let ((?x159 (+ (* (- x_3 x_4) (- x_3 x_4)) (* (- y_3 y_4) (- y_3 y_4)))))
 (> ?x159 0.0)))
(assert
 (let ((?x139 (+ (* (- x_1 x_2) (- x_1 x_2)) (* (- y_1 y_2) (- y_1 y_2)))))
 (let ((?x123 (+ (* (- x_0 x_1) (- x_0 x_1)) (* (- y_0 y_1) (- y_0 y_1)))))
 (= ?x123 ?x139))))
(assert
 (let ((?x135 (+ (* (- x_0 x_4) (- x_0 x_4)) (* (- y_0 y_4) (- y_0 y_4)))))
 (let ((?x131 (+ (* (- x_0 x_3) (- x_0 x_3)) (* (- y_0 y_3) (- y_0 y_3)))))
 (= ?x131 ?x135))))
(assert
 (let ((?x147 (+ (* (- x_1 x_4) (- x_1 x_4)) (* (- y_1 y_4) (- y_1 y_4)))))
(let ((?x139 (+ (* (- x_1 x_2) (- x_1 x_2)) (* (- y_1 y_2) (- y_1 y_2)))))
(= ?x139 ?x147))))

(assert (= x_0 0))
(assert (= y_0 0))
(assert (= x_1 1))
(assert (= y_1 0))
(assert (= x_2 (/ 325318 215333)))
(assert (= y_2 (/ 51832 215333)))
(assert (= x_3 (/ 361 221)))
(assert (= y_3 (/ 171 221)))
(assert (= x_4 (/ 722 617)))
(assert (= y_4 (/ 608 617)))
(check-sat)
