                                 View "spl.proposicoes_pauta_reuniao"
       Column       |          Type          | Collation | Nullable | Default | Storage  | Description 
--------------------+------------------------+-----------+----------+---------+----------+-------------
 pac_id             | integer                |           |          |         | plain    | 
 par_id             | integer                |           |          |         | plain    | 
 link_prop          | text                   |           |          |         | extended | 
 codigo_proposicao  | character varying(23)  |           |          |         | extended | 
 iniciativa         | text                   |           |          |         | extended | 
 sumula             | text                   |           |          |         | extended | 
 relator            | character varying(100) |           |          |         | extended | 
 conclusao_relator  | character varying(40)  |           |          |         | extended | 
 conclusao_comissao | character varying      |           |          |         | extended | 
 recebido           | text                   |           |          |         | extended | 
 link_texto         | text                   |           |          |         | extended | 
 tem_emendas        | boolean                |           |          |         | plain    | 
 prazo_comissao_fim | date                   |           |          |         | plain    | 
View definition:
 SELECT pc.pac_id,
    par.par_id,
    p.pro_link_relativo AS link_prop,
    p.pro_codigo AS codigo_proposicao,
    i.ini_nome AS iniciativa,
    p.pro_sumula_plain AS sumula,
    v.ini_nome AS relator,
        CASE
            WHEN tc.tcp_nome IS NOT NULL THEN tc.tcp_nome
            ELSE ''::character varying(40)
        END AS conclusao_relator,
        CASE
            WHEN par.par_finalizado THEN tcp.tcp_nome
            ELSE ''::character varying
        END AS conclusao_comissao,
        CASE
            WHEN ultimo.tra_data_recebimento IS NOT NULL THEN 'S'::text
            ELSE 'N'::text
        END AS recebido,
        CASE
            WHEN tv.txt_id IS NULL OR NOT spl.pode_ver_texto_relator_pauta(tv.txt_id) THEN ''::text
            ELSE spl.links_textos_pauta(par.*)
        END AS link_texto,
    tv.txt_com_emenda AS tem_emendas,
        CASE
            WHEN par.par_finalizado THEN NULL::date
            ELSE pzc.prz_fim
        END AS prazo_comissao_fim
   FROM spl.pauta_comissao pc
     JOIN spl.pauta_parecer pp USING (pac_id)
     JOIN spl.parecer par USING (par_id)
     JOIN spl.vereador v USING (ver_id)
     JOIN spl.proposicao p USING (pro_id)
     JOIN spl.iniciativa i USING (ini_id)
     LEFT JOIN spl.texto_vereador tv ON tv.par_id = par.par_id AND tv.txt_relator
     LEFT JOIN spl.texto_vereador tv2 ON tv2.par_id = par.par_id AND tv2.txt_relator AND tv2.txt_data >= tv.txt_data AND tv2.txt_id > tv.txt_id
     LEFT JOIN spl.tipo_conclusao_parecer tc ON tc.tcp_id = tv.tcp_id
     LEFT JOIN spl.tipo_conclusao_parecer tcp ON tcp.tcp_id = par.tcp_id
     JOIN spl.tramite ultimo ON p.pro_id = ultimo.pro_id AND p.pro_ultimo_tramite = COALESCE(ultimo.tra_data_recebimento, ultimo.tra_data_envio)
     LEFT JOIN spl.prazo pzc ON pzc.pro_id = p.pro_id AND (pzc.tpz_id = ANY (ARRAY[23, 26]))
  WHERE tv2.txt_id IS NULL;

