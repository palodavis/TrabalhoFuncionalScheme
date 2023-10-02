#lang scheme
(define (curry func . args)
  (lambda args2
    (apply func (append args args2))))

(define dados
  '(
    ((titulo . "Exercício de academia") (cargaHoraria . 10) (categoria . "curso"))
    ((titulo . "dasdasdsa academia") (cargaHoraria . 20) (categoria . "curso"))
    ((titulo . "fdsfdsfsd academia") (cargaHoraria . 30) (categoria . "curso"))
    ((titulo . "gfdgfd academia") (cargaHoraria . 40) (categoria . "projeto"))
    ((titulo . "arte sdsa da") (cargaHoraria . 10) (categoria . "curso"))
    ((titulo . "dsasa arte dsadas") (cargaHoraria . 20) (categoria . "projeto"))
    ((titulo . "dsadsa arte dsadas") (cargaHoraria . 20) (categoria . "curso"))
    ((titulo . "dsds arte") (cargaHoraria . 30) (categoria . "projeto"))
  ))

(define (filtro-cargaHoraria categoria min max)
  (for-each
   (lambda (item)
     (display (format "Título: ~a, Carga Horária: ~a, Categoria: ~a~%" 
                      (cdr (assoc 'titulo item))
                      (cdr (assoc 'cargaHoraria item))
                      (cdr (assoc 'categoria item)))))
   (filter
    (curry
     (lambda (categoria min max item)
       (and (string=? (cdr (assoc 'categoria item)) categoria)
            (>= (cdr (assoc 'cargaHoraria item)) min)
            (<= (cdr (assoc 'cargaHoraria item)) max)))
     categoria min max)
    dados)))

(filtro-cargaHoraria "curso" 20 30)
