(set-logic QF_NRA)
(declare-fun c3_two_row_relational_forward__O_x () Real)
(declare-fun c3_two_row_relational_forward__O_y () Real)
(declare-fun c3_two_row_relational_forward__au_x () Real)
(declare-fun c3_two_row_relational_forward__au_y () Real)
(declare-fun c3_two_row_relational_forward__av_x () Real)
(declare-fun c3_two_row_relational_forward__av_y () Real)
(declare-fun c3_two_row_relational_forward__bu_x () Real)
(declare-fun c3_two_row_relational_forward__bu_y () Real)
(declare-fun c3_two_row_relational_forward__bv_x () Real)
(declare-fun c3_two_row_relational_forward__bv_y () Real)
(declare-fun c3_two_row_relational_forward__cv_x () Real)
(declare-fun c3_two_row_relational_forward__cv_y () Real)
(declare-fun c3_two_row_relational_forward__delta_x () Real)
(declare-fun c3_two_row_relational_forward__delta_y () Real)
(declare-fun c3_two_row_relational_forward__ku_radius2 () Real)
(declare-fun c3_two_row_relational_forward__kv_radius2 () Real)
(declare-fun c3_two_row_relational_forward__m1_x () Real)
(declare-fun c3_two_row_relational_forward__m1_y () Real)
(declare-fun c3_two_row_relational_forward__m2_x () Real)
(declare-fun c3_two_row_relational_forward__m2_y () Real)
(declare-fun c3_two_row_relational_forward__physical_radius2 () Real)
(declare-fun c3_two_row_relational_forward__u_x () Real)
(declare-fun c3_two_row_relational_forward__u_y () Real)
(declare-fun c3_two_row_relational_forward__v_x () Real)
(declare-fun c3_two_row_relational_forward__v_y () Real)
(declare-fun c3_two_row_relational_forward__xu_x () Real)
(declare-fun c3_two_row_relational_forward__xu_y () Real)
(declare-fun c3_two_row_relational_forward__xv_x () Real)
(declare-fun c3_two_row_relational_forward__xv_y () Real)
(assert (> c3_two_row_relational_forward__physical_radius2 0.0))
(assert (> c3_two_row_relational_forward__ku_radius2 0.0))
(assert (> c3_two_row_relational_forward__kv_radius2 0.0))
(assert (= 0.0 c3_two_row_relational_forward__O_x))
(assert (= 0.0 c3_two_row_relational_forward__O_y))
(assert (= (/ 8.0 5.0) c3_two_row_relational_forward__m1_x))
(assert (= (- (/ 4.0 5.0)) c3_two_row_relational_forward__m1_y))
(assert (= (/ 8.0 5.0) c3_two_row_relational_forward__m2_x))
(assert (= (/ 4.0 5.0) c3_two_row_relational_forward__m2_y))
(assert (or (distinct c3_two_row_relational_forward__O_x
              c3_two_row_relational_forward__m1_x)
    (distinct c3_two_row_relational_forward__O_y
              c3_two_row_relational_forward__m1_y)))
(assert (or (distinct c3_two_row_relational_forward__O_x
              c3_two_row_relational_forward__m2_x)
    (distinct c3_two_row_relational_forward__O_y
              c3_two_row_relational_forward__m2_y)))
(assert (or (distinct c3_two_row_relational_forward__O_x
              c3_two_row_relational_forward__u_x)
    (distinct c3_two_row_relational_forward__O_y
              c3_two_row_relational_forward__u_y)))
(assert (or (distinct c3_two_row_relational_forward__O_x
              c3_two_row_relational_forward__xu_x)
    (distinct c3_two_row_relational_forward__O_y
              c3_two_row_relational_forward__xu_y)))
(assert (or (distinct c3_two_row_relational_forward__O_x
              c3_two_row_relational_forward__delta_x)
    (distinct c3_two_row_relational_forward__O_y
              c3_two_row_relational_forward__delta_y)))
(assert (or (distinct c3_two_row_relational_forward__O_x
              c3_two_row_relational_forward__v_x)
    (distinct c3_two_row_relational_forward__O_y
              c3_two_row_relational_forward__v_y)))
(assert (or (distinct c3_two_row_relational_forward__O_x
              c3_two_row_relational_forward__xv_x)
    (distinct c3_two_row_relational_forward__O_y
              c3_two_row_relational_forward__xv_y)))
(assert (or (distinct c3_two_row_relational_forward__O_x
              c3_two_row_relational_forward__au_x)
    (distinct c3_two_row_relational_forward__O_y
              c3_two_row_relational_forward__au_y)))
(assert (or (distinct c3_two_row_relational_forward__O_x
              c3_two_row_relational_forward__bu_x)
    (distinct c3_two_row_relational_forward__O_y
              c3_two_row_relational_forward__bu_y)))
(assert (or (distinct c3_two_row_relational_forward__O_x
              c3_two_row_relational_forward__cv_x)
    (distinct c3_two_row_relational_forward__O_y
              c3_two_row_relational_forward__cv_y)))
(assert (or (distinct c3_two_row_relational_forward__O_x
              c3_two_row_relational_forward__av_x)
    (distinct c3_two_row_relational_forward__O_y
              c3_two_row_relational_forward__av_y)))
(assert (or (distinct c3_two_row_relational_forward__O_x
              c3_two_row_relational_forward__bv_x)
    (distinct c3_two_row_relational_forward__O_y
              c3_two_row_relational_forward__bv_y)))
(assert (or (distinct c3_two_row_relational_forward__m1_x
              c3_two_row_relational_forward__m2_x)
    (distinct c3_two_row_relational_forward__m1_y
              c3_two_row_relational_forward__m2_y)))
(assert (or (distinct c3_two_row_relational_forward__m1_x
              c3_two_row_relational_forward__u_x)
    (distinct c3_two_row_relational_forward__m1_y
              c3_two_row_relational_forward__u_y)))
(assert (or (distinct c3_two_row_relational_forward__m1_x
              c3_two_row_relational_forward__xu_x)
    (distinct c3_two_row_relational_forward__m1_y
              c3_two_row_relational_forward__xu_y)))
(assert (or (distinct c3_two_row_relational_forward__m1_x
              c3_two_row_relational_forward__delta_x)
    (distinct c3_two_row_relational_forward__m1_y
              c3_two_row_relational_forward__delta_y)))
(assert (or (distinct c3_two_row_relational_forward__m1_x
              c3_two_row_relational_forward__v_x)
    (distinct c3_two_row_relational_forward__m1_y
              c3_two_row_relational_forward__v_y)))
(assert (or (distinct c3_two_row_relational_forward__m1_x
              c3_two_row_relational_forward__xv_x)
    (distinct c3_two_row_relational_forward__m1_y
              c3_two_row_relational_forward__xv_y)))
(assert (or (distinct c3_two_row_relational_forward__m1_x
              c3_two_row_relational_forward__au_x)
    (distinct c3_two_row_relational_forward__m1_y
              c3_two_row_relational_forward__au_y)))
(assert (or (distinct c3_two_row_relational_forward__m1_x
              c3_two_row_relational_forward__bu_x)
    (distinct c3_two_row_relational_forward__m1_y
              c3_two_row_relational_forward__bu_y)))
(assert (or (distinct c3_two_row_relational_forward__m1_x
              c3_two_row_relational_forward__cv_x)
    (distinct c3_two_row_relational_forward__m1_y
              c3_two_row_relational_forward__cv_y)))
(assert (or (distinct c3_two_row_relational_forward__m1_x
              c3_two_row_relational_forward__av_x)
    (distinct c3_two_row_relational_forward__m1_y
              c3_two_row_relational_forward__av_y)))
(assert (or (distinct c3_two_row_relational_forward__m1_x
              c3_two_row_relational_forward__bv_x)
    (distinct c3_two_row_relational_forward__m1_y
              c3_two_row_relational_forward__bv_y)))
(assert (or (distinct c3_two_row_relational_forward__m2_x
              c3_two_row_relational_forward__u_x)
    (distinct c3_two_row_relational_forward__m2_y
              c3_two_row_relational_forward__u_y)))
(assert (or (distinct c3_two_row_relational_forward__m2_x
              c3_two_row_relational_forward__xu_x)
    (distinct c3_two_row_relational_forward__m2_y
              c3_two_row_relational_forward__xu_y)))
(assert (or (distinct c3_two_row_relational_forward__m2_x
              c3_two_row_relational_forward__delta_x)
    (distinct c3_two_row_relational_forward__m2_y
              c3_two_row_relational_forward__delta_y)))
(assert (or (distinct c3_two_row_relational_forward__m2_x
              c3_two_row_relational_forward__v_x)
    (distinct c3_two_row_relational_forward__m2_y
              c3_two_row_relational_forward__v_y)))
(assert (or (distinct c3_two_row_relational_forward__m2_x
              c3_two_row_relational_forward__xv_x)
    (distinct c3_two_row_relational_forward__m2_y
              c3_two_row_relational_forward__xv_y)))
(assert (or (distinct c3_two_row_relational_forward__m2_x
              c3_two_row_relational_forward__au_x)
    (distinct c3_two_row_relational_forward__m2_y
              c3_two_row_relational_forward__au_y)))
(assert (or (distinct c3_two_row_relational_forward__m2_x
              c3_two_row_relational_forward__bu_x)
    (distinct c3_two_row_relational_forward__m2_y
              c3_two_row_relational_forward__bu_y)))
(assert (or (distinct c3_two_row_relational_forward__m2_x
              c3_two_row_relational_forward__cv_x)
    (distinct c3_two_row_relational_forward__m2_y
              c3_two_row_relational_forward__cv_y)))
(assert (or (distinct c3_two_row_relational_forward__m2_x
              c3_two_row_relational_forward__av_x)
    (distinct c3_two_row_relational_forward__m2_y
              c3_two_row_relational_forward__av_y)))
(assert (or (distinct c3_two_row_relational_forward__m2_x
              c3_two_row_relational_forward__bv_x)
    (distinct c3_two_row_relational_forward__m2_y
              c3_two_row_relational_forward__bv_y)))
(assert (or (distinct c3_two_row_relational_forward__u_x
              c3_two_row_relational_forward__xu_x)
    (distinct c3_two_row_relational_forward__u_y
              c3_two_row_relational_forward__xu_y)))
(assert (or (distinct c3_two_row_relational_forward__u_x
              c3_two_row_relational_forward__delta_x)
    (distinct c3_two_row_relational_forward__u_y
              c3_two_row_relational_forward__delta_y)))
(assert (or (distinct c3_two_row_relational_forward__u_x
              c3_two_row_relational_forward__v_x)
    (distinct c3_two_row_relational_forward__u_y
              c3_two_row_relational_forward__v_y)))
(assert (or (distinct c3_two_row_relational_forward__u_x
              c3_two_row_relational_forward__xv_x)
    (distinct c3_two_row_relational_forward__u_y
              c3_two_row_relational_forward__xv_y)))
(assert (or (distinct c3_two_row_relational_forward__u_x
              c3_two_row_relational_forward__au_x)
    (distinct c3_two_row_relational_forward__u_y
              c3_two_row_relational_forward__au_y)))
(assert (or (distinct c3_two_row_relational_forward__u_x
              c3_two_row_relational_forward__bu_x)
    (distinct c3_two_row_relational_forward__u_y
              c3_two_row_relational_forward__bu_y)))
(assert (or (distinct c3_two_row_relational_forward__u_x
              c3_two_row_relational_forward__cv_x)
    (distinct c3_two_row_relational_forward__u_y
              c3_two_row_relational_forward__cv_y)))
(assert (or (distinct c3_two_row_relational_forward__u_x
              c3_two_row_relational_forward__av_x)
    (distinct c3_two_row_relational_forward__u_y
              c3_two_row_relational_forward__av_y)))
(assert (or (distinct c3_two_row_relational_forward__u_x
              c3_two_row_relational_forward__bv_x)
    (distinct c3_two_row_relational_forward__u_y
              c3_two_row_relational_forward__bv_y)))
(assert (or (distinct c3_two_row_relational_forward__xu_x
              c3_two_row_relational_forward__delta_x)
    (distinct c3_two_row_relational_forward__xu_y
              c3_two_row_relational_forward__delta_y)))
(assert (or (distinct c3_two_row_relational_forward__xu_x
              c3_two_row_relational_forward__v_x)
    (distinct c3_two_row_relational_forward__xu_y
              c3_two_row_relational_forward__v_y)))
(assert (or (distinct c3_two_row_relational_forward__xu_x
              c3_two_row_relational_forward__xv_x)
    (distinct c3_two_row_relational_forward__xu_y
              c3_two_row_relational_forward__xv_y)))
(assert (or (distinct c3_two_row_relational_forward__xu_x
              c3_two_row_relational_forward__au_x)
    (distinct c3_two_row_relational_forward__xu_y
              c3_two_row_relational_forward__au_y)))
(assert (or (distinct c3_two_row_relational_forward__xu_x
              c3_two_row_relational_forward__bu_x)
    (distinct c3_two_row_relational_forward__xu_y
              c3_two_row_relational_forward__bu_y)))
(assert (or (distinct c3_two_row_relational_forward__xu_x
              c3_two_row_relational_forward__cv_x)
    (distinct c3_two_row_relational_forward__xu_y
              c3_two_row_relational_forward__cv_y)))
(assert (or (distinct c3_two_row_relational_forward__xu_x
              c3_two_row_relational_forward__av_x)
    (distinct c3_two_row_relational_forward__xu_y
              c3_two_row_relational_forward__av_y)))
(assert (or (distinct c3_two_row_relational_forward__xu_x
              c3_two_row_relational_forward__bv_x)
    (distinct c3_two_row_relational_forward__xu_y
              c3_two_row_relational_forward__bv_y)))
(assert (or (distinct c3_two_row_relational_forward__delta_x
              c3_two_row_relational_forward__v_x)
    (distinct c3_two_row_relational_forward__delta_y
              c3_two_row_relational_forward__v_y)))
(assert (or (distinct c3_two_row_relational_forward__delta_x
              c3_two_row_relational_forward__xv_x)
    (distinct c3_two_row_relational_forward__delta_y
              c3_two_row_relational_forward__xv_y)))
(assert (or (distinct c3_two_row_relational_forward__delta_x
              c3_two_row_relational_forward__au_x)
    (distinct c3_two_row_relational_forward__delta_y
              c3_two_row_relational_forward__au_y)))
(assert (or (distinct c3_two_row_relational_forward__delta_x
              c3_two_row_relational_forward__bu_x)
    (distinct c3_two_row_relational_forward__delta_y
              c3_two_row_relational_forward__bu_y)))
(assert (or (distinct c3_two_row_relational_forward__delta_x
              c3_two_row_relational_forward__cv_x)
    (distinct c3_two_row_relational_forward__delta_y
              c3_two_row_relational_forward__cv_y)))
(assert (or (distinct c3_two_row_relational_forward__delta_x
              c3_two_row_relational_forward__av_x)
    (distinct c3_two_row_relational_forward__delta_y
              c3_two_row_relational_forward__av_y)))
(assert (or (distinct c3_two_row_relational_forward__delta_x
              c3_two_row_relational_forward__bv_x)
    (distinct c3_two_row_relational_forward__delta_y
              c3_two_row_relational_forward__bv_y)))
(assert (or (distinct c3_two_row_relational_forward__v_x
              c3_two_row_relational_forward__xv_x)
    (distinct c3_two_row_relational_forward__v_y
              c3_two_row_relational_forward__xv_y)))
(assert (or (distinct c3_two_row_relational_forward__v_x
              c3_two_row_relational_forward__au_x)
    (distinct c3_two_row_relational_forward__v_y
              c3_two_row_relational_forward__au_y)))
(assert (or (distinct c3_two_row_relational_forward__v_x
              c3_two_row_relational_forward__bu_x)
    (distinct c3_two_row_relational_forward__v_y
              c3_two_row_relational_forward__bu_y)))
(assert (or (distinct c3_two_row_relational_forward__v_x
              c3_two_row_relational_forward__cv_x)
    (distinct c3_two_row_relational_forward__v_y
              c3_two_row_relational_forward__cv_y)))
(assert (or (distinct c3_two_row_relational_forward__v_x
              c3_two_row_relational_forward__av_x)
    (distinct c3_two_row_relational_forward__v_y
              c3_two_row_relational_forward__av_y)))
(assert (or (distinct c3_two_row_relational_forward__v_x
              c3_two_row_relational_forward__bv_x)
    (distinct c3_two_row_relational_forward__v_y
              c3_two_row_relational_forward__bv_y)))
(assert (or (distinct c3_two_row_relational_forward__xv_x
              c3_two_row_relational_forward__au_x)
    (distinct c3_two_row_relational_forward__xv_y
              c3_two_row_relational_forward__au_y)))
(assert (or (distinct c3_two_row_relational_forward__xv_x
              c3_two_row_relational_forward__bu_x)
    (distinct c3_two_row_relational_forward__xv_y
              c3_two_row_relational_forward__bu_y)))
(assert (or (distinct c3_two_row_relational_forward__xv_x
              c3_two_row_relational_forward__cv_x)
    (distinct c3_two_row_relational_forward__xv_y
              c3_two_row_relational_forward__cv_y)))
(assert (or (distinct c3_two_row_relational_forward__xv_x
              c3_two_row_relational_forward__av_x)
    (distinct c3_two_row_relational_forward__xv_y
              c3_two_row_relational_forward__av_y)))
(assert (or (distinct c3_two_row_relational_forward__xv_x
              c3_two_row_relational_forward__bv_x)
    (distinct c3_two_row_relational_forward__xv_y
              c3_two_row_relational_forward__bv_y)))
(assert (or (distinct c3_two_row_relational_forward__au_x
              c3_two_row_relational_forward__bu_x)
    (distinct c3_two_row_relational_forward__au_y
              c3_two_row_relational_forward__bu_y)))
(assert (or (distinct c3_two_row_relational_forward__au_x
              c3_two_row_relational_forward__cv_x)
    (distinct c3_two_row_relational_forward__au_y
              c3_two_row_relational_forward__cv_y)))
(assert (or (distinct c3_two_row_relational_forward__au_x
              c3_two_row_relational_forward__av_x)
    (distinct c3_two_row_relational_forward__au_y
              c3_two_row_relational_forward__av_y)))
(assert (or (distinct c3_two_row_relational_forward__au_x
              c3_two_row_relational_forward__bv_x)
    (distinct c3_two_row_relational_forward__au_y
              c3_two_row_relational_forward__bv_y)))
(assert (or (distinct c3_two_row_relational_forward__bu_x
              c3_two_row_relational_forward__cv_x)
    (distinct c3_two_row_relational_forward__bu_y
              c3_two_row_relational_forward__cv_y)))
(assert (or (distinct c3_two_row_relational_forward__bu_x
              c3_two_row_relational_forward__av_x)
    (distinct c3_two_row_relational_forward__bu_y
              c3_two_row_relational_forward__av_y)))
(assert (or (distinct c3_two_row_relational_forward__bu_x
              c3_two_row_relational_forward__bv_x)
    (distinct c3_two_row_relational_forward__bu_y
              c3_two_row_relational_forward__bv_y)))
(assert (or (distinct c3_two_row_relational_forward__cv_x
              c3_two_row_relational_forward__av_x)
    (distinct c3_two_row_relational_forward__cv_y
              c3_two_row_relational_forward__av_y)))
(assert (or (distinct c3_two_row_relational_forward__cv_x
              c3_two_row_relational_forward__bv_x)
    (distinct c3_two_row_relational_forward__cv_y
              c3_two_row_relational_forward__bv_y)))
(assert (or (distinct c3_two_row_relational_forward__av_x
              c3_two_row_relational_forward__bv_x)
    (distinct c3_two_row_relational_forward__av_y
              c3_two_row_relational_forward__bv_y)))
(assert (let ((a!1 (= (+ (* (- c3_two_row_relational_forward__O_x
                       c3_two_row_relational_forward__O_x)
                    (- c3_two_row_relational_forward__O_x
                       c3_two_row_relational_forward__O_x))
                 (* (- c3_two_row_relational_forward__O_y
                       c3_two_row_relational_forward__O_y)
                    (- c3_two_row_relational_forward__O_y
                       c3_two_row_relational_forward__O_y)))
              c3_two_row_relational_forward__physical_radius2)))
  (not a!1)))
(assert (let ((a!1 (= (+ (* (- c3_two_row_relational_forward__O_x
                       c3_two_row_relational_forward__m1_x)
                    (- c3_two_row_relational_forward__O_x
                       c3_two_row_relational_forward__m1_x))
                 (* (- c3_two_row_relational_forward__O_y
                       c3_two_row_relational_forward__m1_y)
                    (- c3_two_row_relational_forward__O_y
                       c3_two_row_relational_forward__m1_y)))
              c3_two_row_relational_forward__physical_radius2)))
  (not a!1)))
(assert (let ((a!1 (= (+ (* (- c3_two_row_relational_forward__O_x
                       c3_two_row_relational_forward__m2_x)
                    (- c3_two_row_relational_forward__O_x
                       c3_two_row_relational_forward__m2_x))
                 (* (- c3_two_row_relational_forward__O_y
                       c3_two_row_relational_forward__m2_y)
                    (- c3_two_row_relational_forward__O_y
                       c3_two_row_relational_forward__m2_y)))
              c3_two_row_relational_forward__physical_radius2)))
  (not a!1)))
(assert (= (+ (* (- c3_two_row_relational_forward__O_x
            c3_two_row_relational_forward__u_x)
         (- c3_two_row_relational_forward__O_x
            c3_two_row_relational_forward__u_x))
      (* (- c3_two_row_relational_forward__O_y
            c3_two_row_relational_forward__u_y)
         (- c3_two_row_relational_forward__O_y
            c3_two_row_relational_forward__u_y)))
   c3_two_row_relational_forward__physical_radius2))
(assert (= (+ (* (- c3_two_row_relational_forward__O_x
            c3_two_row_relational_forward__xu_x)
         (- c3_two_row_relational_forward__O_x
            c3_two_row_relational_forward__xu_x))
      (* (- c3_two_row_relational_forward__O_y
            c3_two_row_relational_forward__xu_y)
         (- c3_two_row_relational_forward__O_y
            c3_two_row_relational_forward__xu_y)))
   c3_two_row_relational_forward__physical_radius2))
(assert (= (+ (* (- c3_two_row_relational_forward__O_x
            c3_two_row_relational_forward__delta_x)
         (- c3_two_row_relational_forward__O_x
            c3_two_row_relational_forward__delta_x))
      (* (- c3_two_row_relational_forward__O_y
            c3_two_row_relational_forward__delta_y)
         (- c3_two_row_relational_forward__O_y
            c3_two_row_relational_forward__delta_y)))
   c3_two_row_relational_forward__physical_radius2))
(assert (= (+ (* (- c3_two_row_relational_forward__O_x
            c3_two_row_relational_forward__v_x)
         (- c3_two_row_relational_forward__O_x
            c3_two_row_relational_forward__v_x))
      (* (- c3_two_row_relational_forward__O_y
            c3_two_row_relational_forward__v_y)
         (- c3_two_row_relational_forward__O_y
            c3_two_row_relational_forward__v_y)))
   c3_two_row_relational_forward__physical_radius2))
(assert (= (+ (* (- c3_two_row_relational_forward__O_x
            c3_two_row_relational_forward__xv_x)
         (- c3_two_row_relational_forward__O_x
            c3_two_row_relational_forward__xv_x))
      (* (- c3_two_row_relational_forward__O_y
            c3_two_row_relational_forward__xv_y)
         (- c3_two_row_relational_forward__O_y
            c3_two_row_relational_forward__xv_y)))
   c3_two_row_relational_forward__physical_radius2))
(assert (let ((a!1 (= (+ (* (- c3_two_row_relational_forward__O_x
                       c3_two_row_relational_forward__au_x)
                    (- c3_two_row_relational_forward__O_x
                       c3_two_row_relational_forward__au_x))
                 (* (- c3_two_row_relational_forward__O_y
                       c3_two_row_relational_forward__au_y)
                    (- c3_two_row_relational_forward__O_y
                       c3_two_row_relational_forward__au_y)))
              c3_two_row_relational_forward__physical_radius2)))
  (not a!1)))
(assert (let ((a!1 (= (+ (* (- c3_two_row_relational_forward__O_x
                       c3_two_row_relational_forward__bu_x)
                    (- c3_two_row_relational_forward__O_x
                       c3_two_row_relational_forward__bu_x))
                 (* (- c3_two_row_relational_forward__O_y
                       c3_two_row_relational_forward__bu_y)
                    (- c3_two_row_relational_forward__O_y
                       c3_two_row_relational_forward__bu_y)))
              c3_two_row_relational_forward__physical_radius2)))
  (not a!1)))
(assert (let ((a!1 (= (+ (* (- c3_two_row_relational_forward__O_x
                       c3_two_row_relational_forward__cv_x)
                    (- c3_two_row_relational_forward__O_x
                       c3_two_row_relational_forward__cv_x))
                 (* (- c3_two_row_relational_forward__O_y
                       c3_two_row_relational_forward__cv_y)
                    (- c3_two_row_relational_forward__O_y
                       c3_two_row_relational_forward__cv_y)))
              c3_two_row_relational_forward__physical_radius2)))
  (not a!1)))
(assert (let ((a!1 (= (+ (* (- c3_two_row_relational_forward__O_x
                       c3_two_row_relational_forward__av_x)
                    (- c3_two_row_relational_forward__O_x
                       c3_two_row_relational_forward__av_x))
                 (* (- c3_two_row_relational_forward__O_y
                       c3_two_row_relational_forward__av_y)
                    (- c3_two_row_relational_forward__O_y
                       c3_two_row_relational_forward__av_y)))
              c3_two_row_relational_forward__physical_radius2)))
  (not a!1)))
(assert (let ((a!1 (= (+ (* (- c3_two_row_relational_forward__O_x
                       c3_two_row_relational_forward__bv_x)
                    (- c3_two_row_relational_forward__O_x
                       c3_two_row_relational_forward__bv_x))
                 (* (- c3_two_row_relational_forward__O_y
                       c3_two_row_relational_forward__bv_y)
                    (- c3_two_row_relational_forward__O_y
                       c3_two_row_relational_forward__bv_y)))
              c3_two_row_relational_forward__physical_radius2)))
  (not a!1)))
(assert (let ((a!1 (= (+ (* (- c3_two_row_relational_forward__v_x
                       c3_two_row_relational_forward__O_x)
                    (- c3_two_row_relational_forward__v_x
                       c3_two_row_relational_forward__O_x))
                 (* (- c3_two_row_relational_forward__v_y
                       c3_two_row_relational_forward__O_y)
                    (- c3_two_row_relational_forward__v_y
                       c3_two_row_relational_forward__O_y)))
              c3_two_row_relational_forward__ku_radius2)))
  (not a!1)))
(assert (let ((a!1 (= (+ (* (- c3_two_row_relational_forward__v_x
                       c3_two_row_relational_forward__m1_x)
                    (- c3_two_row_relational_forward__v_x
                       c3_two_row_relational_forward__m1_x))
                 (* (- c3_two_row_relational_forward__v_y
                       c3_two_row_relational_forward__m1_y)
                    (- c3_two_row_relational_forward__v_y
                       c3_two_row_relational_forward__m1_y)))
              c3_two_row_relational_forward__ku_radius2)))
  (not a!1)))
(assert (let ((a!1 (= (+ (* (- c3_two_row_relational_forward__v_x
                       c3_two_row_relational_forward__m2_x)
                    (- c3_two_row_relational_forward__v_x
                       c3_two_row_relational_forward__m2_x))
                 (* (- c3_two_row_relational_forward__v_y
                       c3_two_row_relational_forward__m2_y)
                    (- c3_two_row_relational_forward__v_y
                       c3_two_row_relational_forward__m2_y)))
              c3_two_row_relational_forward__ku_radius2)))
  (not a!1)))
(assert (= (+ (* (- c3_two_row_relational_forward__v_x
            c3_two_row_relational_forward__u_x)
         (- c3_two_row_relational_forward__v_x
            c3_two_row_relational_forward__u_x))
      (* (- c3_two_row_relational_forward__v_y
            c3_two_row_relational_forward__u_y)
         (- c3_two_row_relational_forward__v_y
            c3_two_row_relational_forward__u_y)))
   c3_two_row_relational_forward__ku_radius2))
(assert (= (+ (* (- c3_two_row_relational_forward__v_x
            c3_two_row_relational_forward__xu_x)
         (- c3_two_row_relational_forward__v_x
            c3_two_row_relational_forward__xu_x))
      (* (- c3_two_row_relational_forward__v_y
            c3_two_row_relational_forward__xu_y)
         (- c3_two_row_relational_forward__v_y
            c3_two_row_relational_forward__xu_y)))
   c3_two_row_relational_forward__ku_radius2))
(assert (let ((a!1 (= (+ (* (- c3_two_row_relational_forward__v_x
                       c3_two_row_relational_forward__delta_x)
                    (- c3_two_row_relational_forward__v_x
                       c3_two_row_relational_forward__delta_x))
                 (* (- c3_two_row_relational_forward__v_y
                       c3_two_row_relational_forward__delta_y)
                    (- c3_two_row_relational_forward__v_y
                       c3_two_row_relational_forward__delta_y)))
              c3_two_row_relational_forward__ku_radius2)))
  (not a!1)))
(assert (let ((a!1 (= (+ (* (- c3_two_row_relational_forward__v_x
                       c3_two_row_relational_forward__v_x)
                    (- c3_two_row_relational_forward__v_x
                       c3_two_row_relational_forward__v_x))
                 (* (- c3_two_row_relational_forward__v_y
                       c3_two_row_relational_forward__v_y)
                    (- c3_two_row_relational_forward__v_y
                       c3_two_row_relational_forward__v_y)))
              c3_two_row_relational_forward__ku_radius2)))
  (not a!1)))
(assert (let ((a!1 (= (+ (* (- c3_two_row_relational_forward__v_x
                       c3_two_row_relational_forward__xv_x)
                    (- c3_two_row_relational_forward__v_x
                       c3_two_row_relational_forward__xv_x))
                 (* (- c3_two_row_relational_forward__v_y
                       c3_two_row_relational_forward__xv_y)
                    (- c3_two_row_relational_forward__v_y
                       c3_two_row_relational_forward__xv_y)))
              c3_two_row_relational_forward__ku_radius2)))
  (not a!1)))
(assert (= (+ (* (- c3_two_row_relational_forward__v_x
            c3_two_row_relational_forward__au_x)
         (- c3_two_row_relational_forward__v_x
            c3_two_row_relational_forward__au_x))
      (* (- c3_two_row_relational_forward__v_y
            c3_two_row_relational_forward__au_y)
         (- c3_two_row_relational_forward__v_y
            c3_two_row_relational_forward__au_y)))
   c3_two_row_relational_forward__ku_radius2))
(assert (= (+ (* (- c3_two_row_relational_forward__v_x
            c3_two_row_relational_forward__bu_x)
         (- c3_two_row_relational_forward__v_x
            c3_two_row_relational_forward__bu_x))
      (* (- c3_two_row_relational_forward__v_y
            c3_two_row_relational_forward__bu_y)
         (- c3_two_row_relational_forward__v_y
            c3_two_row_relational_forward__bu_y)))
   c3_two_row_relational_forward__ku_radius2))
(assert (let ((a!1 (= (+ (* (- c3_two_row_relational_forward__v_x
                       c3_two_row_relational_forward__cv_x)
                    (- c3_two_row_relational_forward__v_x
                       c3_two_row_relational_forward__cv_x))
                 (* (- c3_two_row_relational_forward__v_y
                       c3_two_row_relational_forward__cv_y)
                    (- c3_two_row_relational_forward__v_y
                       c3_two_row_relational_forward__cv_y)))
              c3_two_row_relational_forward__ku_radius2)))
  (not a!1)))
(assert (let ((a!1 (= (+ (* (- c3_two_row_relational_forward__v_x
                       c3_two_row_relational_forward__av_x)
                    (- c3_two_row_relational_forward__v_x
                       c3_two_row_relational_forward__av_x))
                 (* (- c3_two_row_relational_forward__v_y
                       c3_two_row_relational_forward__av_y)
                    (- c3_two_row_relational_forward__v_y
                       c3_two_row_relational_forward__av_y)))
              c3_two_row_relational_forward__ku_radius2)))
  (not a!1)))
(assert (let ((a!1 (= (+ (* (- c3_two_row_relational_forward__v_x
                       c3_two_row_relational_forward__bv_x)
                    (- c3_two_row_relational_forward__v_x
                       c3_two_row_relational_forward__bv_x))
                 (* (- c3_two_row_relational_forward__v_y
                       c3_two_row_relational_forward__bv_y)
                    (- c3_two_row_relational_forward__v_y
                       c3_two_row_relational_forward__bv_y)))
              c3_two_row_relational_forward__ku_radius2)))
  (not a!1)))
(assert (let ((a!1 (= (+ (* (- c3_two_row_relational_forward__cv_x
                       c3_two_row_relational_forward__O_x)
                    (- c3_two_row_relational_forward__cv_x
                       c3_two_row_relational_forward__O_x))
                 (* (- c3_two_row_relational_forward__cv_y
                       c3_two_row_relational_forward__O_y)
                    (- c3_two_row_relational_forward__cv_y
                       c3_two_row_relational_forward__O_y)))
              c3_two_row_relational_forward__kv_radius2)))
  (not a!1)))
(assert (let ((a!1 (= (+ (* (- c3_two_row_relational_forward__cv_x
                       c3_two_row_relational_forward__m1_x)
                    (- c3_two_row_relational_forward__cv_x
                       c3_two_row_relational_forward__m1_x))
                 (* (- c3_two_row_relational_forward__cv_y
                       c3_two_row_relational_forward__m1_y)
                    (- c3_two_row_relational_forward__cv_y
                       c3_two_row_relational_forward__m1_y)))
              c3_two_row_relational_forward__kv_radius2)))
  (not a!1)))
(assert (let ((a!1 (= (+ (* (- c3_two_row_relational_forward__cv_x
                       c3_two_row_relational_forward__m2_x)
                    (- c3_two_row_relational_forward__cv_x
                       c3_two_row_relational_forward__m2_x))
                 (* (- c3_two_row_relational_forward__cv_y
                       c3_two_row_relational_forward__m2_y)
                    (- c3_two_row_relational_forward__cv_y
                       c3_two_row_relational_forward__m2_y)))
              c3_two_row_relational_forward__kv_radius2)))
  (not a!1)))
(assert (let ((a!1 (= (+ (* (- c3_two_row_relational_forward__cv_x
                       c3_two_row_relational_forward__u_x)
                    (- c3_two_row_relational_forward__cv_x
                       c3_two_row_relational_forward__u_x))
                 (* (- c3_two_row_relational_forward__cv_y
                       c3_two_row_relational_forward__u_y)
                    (- c3_two_row_relational_forward__cv_y
                       c3_two_row_relational_forward__u_y)))
              c3_two_row_relational_forward__kv_radius2)))
  (not a!1)))
(assert (let ((a!1 (= (+ (* (- c3_two_row_relational_forward__cv_x
                       c3_two_row_relational_forward__xu_x)
                    (- c3_two_row_relational_forward__cv_x
                       c3_two_row_relational_forward__xu_x))
                 (* (- c3_two_row_relational_forward__cv_y
                       c3_two_row_relational_forward__xu_y)
                    (- c3_two_row_relational_forward__cv_y
                       c3_two_row_relational_forward__xu_y)))
              c3_two_row_relational_forward__kv_radius2)))
  (not a!1)))
(assert (let ((a!1 (= (+ (* (- c3_two_row_relational_forward__cv_x
                       c3_two_row_relational_forward__delta_x)
                    (- c3_two_row_relational_forward__cv_x
                       c3_two_row_relational_forward__delta_x))
                 (* (- c3_two_row_relational_forward__cv_y
                       c3_two_row_relational_forward__delta_y)
                    (- c3_two_row_relational_forward__cv_y
                       c3_two_row_relational_forward__delta_y)))
              c3_two_row_relational_forward__kv_radius2)))
  (not a!1)))
(assert (= (+ (* (- c3_two_row_relational_forward__cv_x
            c3_two_row_relational_forward__v_x)
         (- c3_two_row_relational_forward__cv_x
            c3_two_row_relational_forward__v_x))
      (* (- c3_two_row_relational_forward__cv_y
            c3_two_row_relational_forward__v_y)
         (- c3_two_row_relational_forward__cv_y
            c3_two_row_relational_forward__v_y)))
   c3_two_row_relational_forward__kv_radius2))
(assert (= (+ (* (- c3_two_row_relational_forward__cv_x
            c3_two_row_relational_forward__xv_x)
         (- c3_two_row_relational_forward__cv_x
            c3_two_row_relational_forward__xv_x))
      (* (- c3_two_row_relational_forward__cv_y
            c3_two_row_relational_forward__xv_y)
         (- c3_two_row_relational_forward__cv_y
            c3_two_row_relational_forward__xv_y)))
   c3_two_row_relational_forward__kv_radius2))
(assert (let ((a!1 (= (+ (* (- c3_two_row_relational_forward__cv_x
                       c3_two_row_relational_forward__au_x)
                    (- c3_two_row_relational_forward__cv_x
                       c3_two_row_relational_forward__au_x))
                 (* (- c3_two_row_relational_forward__cv_y
                       c3_two_row_relational_forward__au_y)
                    (- c3_two_row_relational_forward__cv_y
                       c3_two_row_relational_forward__au_y)))
              c3_two_row_relational_forward__kv_radius2)))
  (not a!1)))
(assert (let ((a!1 (= (+ (* (- c3_two_row_relational_forward__cv_x
                       c3_two_row_relational_forward__bu_x)
                    (- c3_two_row_relational_forward__cv_x
                       c3_two_row_relational_forward__bu_x))
                 (* (- c3_two_row_relational_forward__cv_y
                       c3_two_row_relational_forward__bu_y)
                    (- c3_two_row_relational_forward__cv_y
                       c3_two_row_relational_forward__bu_y)))
              c3_two_row_relational_forward__kv_radius2)))
  (not a!1)))
(assert (let ((a!1 (= (+ (* (- c3_two_row_relational_forward__cv_x
                       c3_two_row_relational_forward__cv_x)
                    (- c3_two_row_relational_forward__cv_x
                       c3_two_row_relational_forward__cv_x))
                 (* (- c3_two_row_relational_forward__cv_y
                       c3_two_row_relational_forward__cv_y)
                    (- c3_two_row_relational_forward__cv_y
                       c3_two_row_relational_forward__cv_y)))
              c3_two_row_relational_forward__kv_radius2)))
  (not a!1)))
(assert (= (+ (* (- c3_two_row_relational_forward__cv_x
            c3_two_row_relational_forward__av_x)
         (- c3_two_row_relational_forward__cv_x
            c3_two_row_relational_forward__av_x))
      (* (- c3_two_row_relational_forward__cv_y
            c3_two_row_relational_forward__av_y)
         (- c3_two_row_relational_forward__cv_y
            c3_two_row_relational_forward__av_y)))
   c3_two_row_relational_forward__kv_radius2))
(assert (= (+ (* (- c3_two_row_relational_forward__cv_x
            c3_two_row_relational_forward__bv_x)
         (- c3_two_row_relational_forward__cv_x
            c3_two_row_relational_forward__bv_x))
      (* (- c3_two_row_relational_forward__cv_y
            c3_two_row_relational_forward__bv_y)
         (- c3_two_row_relational_forward__cv_y
            c3_two_row_relational_forward__bv_y)))
   c3_two_row_relational_forward__kv_radius2))
(assert (>= 1.0
    (+ (* (- 1.0 c3_two_row_relational_forward__O_x)
          (- 1.0 c3_two_row_relational_forward__O_x))
       (* (- 0.0 c3_two_row_relational_forward__O_y)
          (- 0.0 c3_two_row_relational_forward__O_y)))))
(assert (>= 1.0
    (+ (* (- 1.0 c3_two_row_relational_forward__m1_x)
          (- 1.0 c3_two_row_relational_forward__m1_x))
       (* (- 0.0 c3_two_row_relational_forward__m1_y)
          (- 0.0 c3_two_row_relational_forward__m1_y)))))
(assert (>= 1.0
    (+ (* (- 1.0 c3_two_row_relational_forward__m2_x)
          (- 1.0 c3_two_row_relational_forward__m2_x))
       (* (- 0.0 c3_two_row_relational_forward__m2_y)
          (- 0.0 c3_two_row_relational_forward__m2_y)))))
(assert (>= 1.0
    (+ (* (- 1.0 c3_two_row_relational_forward__u_x)
          (- 1.0 c3_two_row_relational_forward__u_x))
       (* (- 0.0 c3_two_row_relational_forward__u_y)
          (- 0.0 c3_two_row_relational_forward__u_y)))))
(assert (>= 1.0
    (+ (* (- 1.0 c3_two_row_relational_forward__xu_x)
          (- 1.0 c3_two_row_relational_forward__xu_x))
       (* (- 0.0 c3_two_row_relational_forward__xu_y)
          (- 0.0 c3_two_row_relational_forward__xu_y)))))
(assert (>= 1.0
    (+ (* (- 1.0 c3_two_row_relational_forward__delta_x)
          (- 1.0 c3_two_row_relational_forward__delta_x))
       (* (- 0.0 c3_two_row_relational_forward__delta_y)
          (- 0.0 c3_two_row_relational_forward__delta_y)))))
(assert (>= 1.0
    (+ (* (- 1.0 c3_two_row_relational_forward__v_x)
          (- 1.0 c3_two_row_relational_forward__v_x))
       (* (- 0.0 c3_two_row_relational_forward__v_y)
          (- 0.0 c3_two_row_relational_forward__v_y)))))
(assert (>= 1.0
    (+ (* (- 1.0 c3_two_row_relational_forward__xv_x)
          (- 1.0 c3_two_row_relational_forward__xv_x))
       (* (- 0.0 c3_two_row_relational_forward__xv_y)
          (- 0.0 c3_two_row_relational_forward__xv_y)))))
(assert (>= 1.0
    (+ (* (- 1.0 c3_two_row_relational_forward__au_x)
          (- 1.0 c3_two_row_relational_forward__au_x))
       (* (- 0.0 c3_two_row_relational_forward__au_y)
          (- 0.0 c3_two_row_relational_forward__au_y)))))
(assert (>= 1.0
    (+ (* (- 1.0 c3_two_row_relational_forward__bu_x)
          (- 1.0 c3_two_row_relational_forward__bu_x))
       (* (- 0.0 c3_two_row_relational_forward__bu_y)
          (- 0.0 c3_two_row_relational_forward__bu_y)))))
(assert (>= 1.0
    (+ (* (- 1.0 c3_two_row_relational_forward__cv_x)
          (- 1.0 c3_two_row_relational_forward__cv_x))
       (* (- 0.0 c3_two_row_relational_forward__cv_y)
          (- 0.0 c3_two_row_relational_forward__cv_y)))))
(assert (>= 1.0
    (+ (* (- 1.0 c3_two_row_relational_forward__av_x)
          (- 1.0 c3_two_row_relational_forward__av_x))
       (* (- 0.0 c3_two_row_relational_forward__av_y)
          (- 0.0 c3_two_row_relational_forward__av_y)))))
(assert (>= 1.0
    (+ (* (- 1.0 c3_two_row_relational_forward__bv_x)
          (- 1.0 c3_two_row_relational_forward__bv_x))
       (* (- 0.0 c3_two_row_relational_forward__bv_y)
          (- 0.0 c3_two_row_relational_forward__bv_y)))))
(assert (let ((a!1 (* (- (* (- c3_two_row_relational_forward__m1_x
                       c3_two_row_relational_forward__u_x)
                    (- c3_two_row_relational_forward__m2_y
                       c3_two_row_relational_forward__u_y))
                 (* (- c3_two_row_relational_forward__m1_y
                       c3_two_row_relational_forward__u_y)
                    (- c3_two_row_relational_forward__m2_x
                       c3_two_row_relational_forward__u_x)))
              (- (* (- c3_two_row_relational_forward__m1_x
                       c3_two_row_relational_forward__O_x)
                    (- c3_two_row_relational_forward__m2_y
                       c3_two_row_relational_forward__O_y))
                 (* (- c3_two_row_relational_forward__m1_y
                       c3_two_row_relational_forward__O_y)
                    (- c3_two_row_relational_forward__m2_x
                       c3_two_row_relational_forward__O_x))))))
  (< a!1 0.0)))
(assert (let ((a!1 (* (- (* (- c3_two_row_relational_forward__m1_x
                       c3_two_row_relational_forward__xu_x)
                    (- c3_two_row_relational_forward__m2_y
                       c3_two_row_relational_forward__xu_y))
                 (* (- c3_two_row_relational_forward__m1_y
                       c3_two_row_relational_forward__xu_y)
                    (- c3_two_row_relational_forward__m2_x
                       c3_two_row_relational_forward__xu_x)))
              (- (* (- c3_two_row_relational_forward__m1_x
                       c3_two_row_relational_forward__O_x)
                    (- c3_two_row_relational_forward__m2_y
                       c3_two_row_relational_forward__O_y))
                 (* (- c3_two_row_relational_forward__m1_y
                       c3_two_row_relational_forward__O_y)
                    (- c3_two_row_relational_forward__m2_x
                       c3_two_row_relational_forward__O_x))))))
  (< a!1 0.0)))
(assert (let ((a!1 (* (- (* (- c3_two_row_relational_forward__m1_x
                       c3_two_row_relational_forward__v_x)
                    (- c3_two_row_relational_forward__m2_y
                       c3_two_row_relational_forward__v_y))
                 (* (- c3_two_row_relational_forward__m1_y
                       c3_two_row_relational_forward__v_y)
                    (- c3_two_row_relational_forward__m2_x
                       c3_two_row_relational_forward__v_x)))
              (- (* (- c3_two_row_relational_forward__m1_x
                       c3_two_row_relational_forward__O_x)
                    (- c3_two_row_relational_forward__m2_y
                       c3_two_row_relational_forward__O_y))
                 (* (- c3_two_row_relational_forward__m1_y
                       c3_two_row_relational_forward__O_y)
                    (- c3_two_row_relational_forward__m2_x
                       c3_two_row_relational_forward__O_x))))))
  (< a!1 0.0)))
(assert (let ((a!1 (* (- (* (- c3_two_row_relational_forward__m1_x
                       c3_two_row_relational_forward__delta_x)
                    (- c3_two_row_relational_forward__m2_y
                       c3_two_row_relational_forward__delta_y))
                 (* (- c3_two_row_relational_forward__m1_y
                       c3_two_row_relational_forward__delta_y)
                    (- c3_two_row_relational_forward__m2_x
                       c3_two_row_relational_forward__delta_x)))
              (- (* (- c3_two_row_relational_forward__m1_x
                       c3_two_row_relational_forward__O_x)
                    (- c3_two_row_relational_forward__m2_y
                       c3_two_row_relational_forward__O_y))
                 (* (- c3_two_row_relational_forward__m1_y
                       c3_two_row_relational_forward__O_y)
                    (- c3_two_row_relational_forward__m2_x
                       c3_two_row_relational_forward__O_x))))))
  (> a!1 0.0)))
(assert (let ((a!1 (* (- (* (- c3_two_row_relational_forward__m1_x
                       c3_two_row_relational_forward__xv_x)
                    (- c3_two_row_relational_forward__m2_y
                       c3_two_row_relational_forward__xv_y))
                 (* (- c3_two_row_relational_forward__m1_y
                       c3_two_row_relational_forward__xv_y)
                    (- c3_two_row_relational_forward__m2_x
                       c3_two_row_relational_forward__xv_x)))
              (- (* (- c3_two_row_relational_forward__m1_x
                       c3_two_row_relational_forward__O_x)
                    (- c3_two_row_relational_forward__m2_y
                       c3_two_row_relational_forward__O_y))
                 (* (- c3_two_row_relational_forward__m1_y
                       c3_two_row_relational_forward__O_y)
                    (- c3_two_row_relational_forward__m2_x
                       c3_two_row_relational_forward__O_x))))))
  (> a!1 0.0)))
(assert (= (+ (* (- c3_two_row_relational_forward__v_x
            c3_two_row_relational_forward__u_x)
         (- c3_two_row_relational_forward__v_x
            c3_two_row_relational_forward__u_x))
      (* (- c3_two_row_relational_forward__v_y
            c3_two_row_relational_forward__u_y)
         (- c3_two_row_relational_forward__v_y
            c3_two_row_relational_forward__u_y)))
   (+ (* (- c3_two_row_relational_forward__v_x
            c3_two_row_relational_forward__xu_x)
         (- c3_two_row_relational_forward__v_x
            c3_two_row_relational_forward__xu_x))
      (* (- c3_two_row_relational_forward__v_y
            c3_two_row_relational_forward__xu_y)
         (- c3_two_row_relational_forward__v_y
            c3_two_row_relational_forward__xu_y)))))
(assert (> (- (* (- c3_two_row_relational_forward__u_x
            c3_two_row_relational_forward__O_x)
         (- c3_two_row_relational_forward__v_y
            c3_two_row_relational_forward__O_y))
      (* (- c3_two_row_relational_forward__u_y
            c3_two_row_relational_forward__O_y)
         (- c3_two_row_relational_forward__v_x
            c3_two_row_relational_forward__O_x)))
   0.0))
(assert (> (- (* (- c3_two_row_relational_forward__v_x
            c3_two_row_relational_forward__O_x)
         (- c3_two_row_relational_forward__xu_y
            c3_two_row_relational_forward__O_y))
      (* (- c3_two_row_relational_forward__v_y
            c3_two_row_relational_forward__O_y)
         (- c3_two_row_relational_forward__xu_x
            c3_two_row_relational_forward__O_x)))
   0.0))
