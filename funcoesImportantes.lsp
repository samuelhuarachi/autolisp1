;C:\BF_LISP_CONF\AIR GRID\20140106.12470282



(setq dotipoNivel (vl-string-search "NIVEL" "NIVEL_RONALDO"))

;Essa vari�vel 'selecao', cont�m a sele��o estrutura air grid, gerada pela lisp air_grid.lsp
(setq pontoInsercao (procura_ponto_insercao selecao)) ;Fun��o presente no itemC.lsp
(setq IDDGRID (drig_get_id selecao)) ;Fun��o presente no itemC.lsp
(setq lista_ronnie (gera_lista_ronnies selecao)) ;Fun��o presente no itemC.lsp
(modulo (- yFixo YAtual)) ;n�o esquecer que existe uma fun��o que se chama m�dulo


(setq comprimento (dgrid_retorna_informacoes "COMPRIMENTO" IDDGRID)) ;Fun��o presente no itemC.lsp
;Essa fun��o (dgrid_retorna_informacoes) ir� auxliar na hora de 
;retornar da dados referente ao sistema air grid, contidos em INFORMACOES.txt


;Agrupar os ronnies -  Separa os ronnies que est�o em cima, dos que est�o em baixo
(defun ronnies_de_um_lado_de_outro () ;gera duas listas 'listaDeUmLado', e 'listaDeOutroLado'
	(setq listaDeUmLado nil)
	(setq listaDeOutroLado nil)
	(setq qtd (vl-list-length lista_ronnie))
	(setq difRange 80)
	(setq coordenada1 (nth (- qtd 1) lista_ronnie))
	(setq listaDeUmLado (cons coordenada1 listaDeUmLado))
	(setq yFixo (nth 1 coordenada1))
	(setq qtd (- qtd 1))
	(while (> qtd 0)
		(setq coordenadaAtual (nth (- qtd 1) lista_ronnie))
		(setq YAtual (nth 1 coordenadaAtual))
		(setq diferenca (modulo (- yFixo YAtual)))
		(if (> diferenca 80)
			(progn
				(setq listaDeOutroLado (cons coordenadaAtual listaDeOutroLado))
			)
			(progn
				(setq listaDeUmLado (cons coordenadaAtual listaDeUmLado))
			)
		)
		(setq qtd (- qtd 1))
	)
)

;para espelhar um objeto = (command "mirror")
;para copiar um objeto = (command "copy")








