(set-logic QF_NRA)
; benchmark generated from python API
(set-info :status unknown)
(declare-fun x_0 () Real)
(declare-fun y_0 () Real)
(declare-fun x_1 () Real)
(declare-fun y_1 () Real)
(declare-fun x_2 () Real)
(declare-fun y_2 () Real)
(declare-fun y_3 () Real)
(declare-fun x_3 () Real)
(declare-fun y_4 () Real)
(declare-fun x_4 () Real)
(declare-fun y_5 () Real)
(declare-fun x_5 () Real)
(assert
 (= x_0 0.0))
(assert
 (= y_0 0.0))
(assert
 (= x_1 1.0))
(assert
 (= y_1 0.0))
(assert
 (let ((?x53 (- (* (- x_3 x_2) (- y_0 y_2)) (* (- y_3 y_2) (- x_0 x_2)))))
 (> ?x53 0.0)))
(assert
 (let ((?x59 (- (* (- x_3 x_2) (- y_1 y_2)) (* (- y_3 y_2) (- x_1 x_2)))))
 (> ?x59 0.0)))
(assert
 (let ((?x363 (- (* (- x_4 x_3) (- y_1 y_3)) (* (- y_4 y_3) (- x_1 x_3)))))
 (> ?x363 0.0)))
(assert
 (let ((?x870 (- (* (- x_5 x_4) (- y_3 y_4)) (* (- y_5 y_4) (- x_3 x_4)))))
 (> ?x870 0.0)))
(assert
 (let ((?x290 (- (* (- x_0 x_5) (- y_1 y_5)) (* (- y_0 y_5) (- x_1 x_5)))))
 (> ?x290 0.0)))
(assert
 (let ((?x181 (- (* (- x_0 x_5) (- y_2 y_5)) (* (- y_0 y_5) (- x_2 x_5)))))
 (> ?x181 0.0)))
(assert
 (let ((?x1043 (- (* (- x_0 x_5) (- y_3 y_5)) (* (- y_0 y_5) (- x_3 x_5)))))
 (> ?x1043 0.0)))
(assert
 (let ((?x951 (+ (* (- x_0 x_5) (- x_0 x_5)) (* (- y_0 y_5) (- y_0 y_5)))))
 (let ((?x77 (+ (* (- x_0 x_1) (- x_0 x_1)) (* (- y_0 y_1) (- y_0 y_1)))))
 (= ?x77 ?x951))))
(assert
 (let ((?x951 (+ (* (- x_0 x_5) (- x_0 x_5)) (* (- y_0 y_5) (- y_0 y_5)))))
 (let ((?x85 (+ (* (- x_0 x_3) (- x_0 x_3)) (* (- y_0 y_3) (- y_0 y_3)))))
 (= ?x85 ?x951))))
(assert
 (let ((?x93 (+ (* (- x_1 x_3) (- x_1 x_3)) (* (- y_1 y_3) (- y_1 y_3)))))
 (let ((?x85 (+ (* (- x_0 x_3) (- x_0 x_3)) (* (- y_0 y_3) (- y_0 y_3)))))
 (= ?x85 ?x93))))
(assert
 (let ((?x481 (+ (* (- x_2 x_4) (- x_2 x_4)) (* (- y_2 y_4) (- y_2 y_4)))))
 (let ((?x89 (+ (* (- x_1 x_2) (- x_1 x_2)) (* (- y_1 y_2) (- y_1 y_2)))))
 (= ?x89 ?x481))))
(assert
 (let ((?x481 (+ (* (- x_2 x_4) (- x_2 x_4)) (* (- y_2 y_4) (- y_2 y_4)))))
(let ((?x97 (+ (* (- x_2 x_3) (- x_2 x_3)) (* (- y_2 y_3) (- y_2 y_3)))))
(= ?x97 ?x481))))
(check-sat)
