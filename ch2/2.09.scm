;;; copied from http://community.schemewiki.org/?sicp-ex-2.9

;;; For addition and subtraction, the width of the result is a function of the widths of the input. For example,

;;;   [aL, aH] + [bL, bH] = [aL + bL, aH + bH].
;;; L = Low = lower bound, H = High = upper bound

;;; The width of this interval is

;;;   width = 1/2 * ((aH + bH) - (aL + bL))
;;;         = 1/2 * ((aH - aL) + (bH - bL))
;;;         = width of interval a + width of interval b
;;; So, the width of the sum (or difference) of two intervals is just a function of the widths of those intervals.

;;; For multiplication and division, the story is different. If the width of the result was a function of the widths of the inputs, then multiplying different intervals with the same widths should give the same answer. For example, multiplying a width 5 interval with a width 1 interval:

;;;   [0, 10] * [0, 2] = [0, 20]   (width = 10)
;;; The following intervals have the same widths as the corresponding ones above, but multiplying gives different results:

;;;   [-5, 5] * [-1, 1] = [-5, 5]   (width = 5)
;;; Thanks to jz for providing this solution.
