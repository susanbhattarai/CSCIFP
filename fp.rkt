;Question1
#|
Algorithm:
If the list is empty, return
Else: append the function call with cdr of list
plus the head of list
|#
(define (reverse-general L)
  (cond
    ((null? L) #f) ;Return #f aka empty list
    ((list? (car L)) (append (reverse-general (cdr l)) (list (reverse-general (car L))))) ;If head is list, append the function call on tail with function call on head
)
