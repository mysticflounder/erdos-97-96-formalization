(set-logic QF_NRA)
; benchmark generated from python API
(set-info :status unknown)
(declare-fun xy () Real)
(declare-fun way () Real)
(declare-fun xx () Real)
(declare-fun wax () Real)
(declare-fun rho2 () Real)
(declare-fun wby () Real)
(declare-fun wbx () Real)
(declare-fun oy () Real)
(assert
 (let ((?x74 (* (- 1.0) rho2)))
 (let ((?x84 (* xy xy)))
 (let ((?x103 (+ (+ (+ (+ (* wax wax) (* way way)) (* xx xx)) ?x84) ?x74)))
 (= (+ (+ ?x103 (* (* (- 2.0) wax) xx)) (* (* (- 2.0) way) xy)) 0.0)))))
(assert
 (let ((?x74 (* (- 1.0) rho2)))
 (let ((?x84 (* xy xy)))
 (let ((?x93 (+ (+ (+ (+ (* wbx wbx) (* wby wby)) (* xx xx)) ?x84) ?x74)))
 (= (+ (+ ?x93 (* (* (- 2.0) wbx) xx)) (* (* (- 2.0) wby) xy)) 0.0)))))
(assert
 (>= oy 0.0))
(assert
 (let ((?x78 (+ (+ (+ xx (* (- 1.0) (* xx xx))) (* (- 1.0) (* xy xy))) (* (* 2.0 oy) xy))))
 (>= ?x78 0.0)))
(assert
 (let ((?x63 (+ (+ (+ wax (* (- 1.0) (* wax wax))) (* (- 1.0) (* way way))) (* (* 2.0 oy) way))))
 (>= ?x63 0.0)))
(assert
 (let ((?x55 (+ (+ (+ wbx (* (- 1.0) (* wbx wbx))) (* (- 1.0) (* wby wby))) (* (* 2.0 oy) wby))))
 (>= ?x55 0.0)))
(assert
 (> rho2 0.0))
(assert
 (> (* (- 1.0) xy) 0.0))
(assert
 (let ((?x57 (* (- 1.0) way)))
 (> ?x57 0.0)))
(assert
 (let ((?x61 (* (- 1.0) wby)))
 (> ?x61 0.0)))
(assert
 (> (+ (* way xx) (* (* (- 1.0) wax) xy)) 0.0))
(assert
 (> (+ (* wby xx) (* (* (- 1.0) wbx) xy)) 0.0))
(assert
 (> (* (- 1.0) xy) 0.0))
(assert
 (> (+ (* wax wby) (* (* (- 1.0) way) wbx)) 0.0))
(assert
 (let ((?x57 (* (- 1.0) way)))
 (> ?x57 0.0)))
(assert
 (let ((?x61 (* (- 1.0) wby)))
 (> ?x61 0.0)))
(assert
 (let ((?x57 (* (- 1.0) way)))
 (let ((?x40 (* ?x57 wbx)))
 (let ((?x16 (* (* (- 1.0) wax) xy)))
 (let ((?x37 (+ (+ (+ (+ (* wax wby) (* way xx)) (* wbx xy)) ?x16) ?x40)))
 (> (+ ?x37 (* (* (- 1.0) wby) xx)) 0.0))))))
(assert
 (let ((?x16 (* (* (- 1.0) wax) xy)))
 (> (+ (+ (+ xy (* (- 1.0) way)) (* way xx)) ?x16) 0.0)))
(assert
 (let ((?x54 (* (* (- 1.0) wbx) xy)))
 (> (+ (+ (+ xy (* (- 1.0) wby)) (* wby xx)) ?x54) 0.0)))
(assert
 (let ((?x57 (* (- 1.0) way)))
(let ((?x40 (* ?x57 wbx)))
(> (+ (+ (+ way (* (- 1.0) wby)) (* wax wby)) ?x40) 0.0))))
(check-sat)
