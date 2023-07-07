                                 View "spl.texto_conclusao_autor"
     Column     |          Type          | Collation | Nullable | Default | Storage  | Description 
----------------+------------------------+-----------+----------+---------+----------+-------------
 pro_id         | integer                |           |          |         | plain    | 
 pro_codigo     | character varying(23)  |           |          |         | extended | 
 par_id         | integer                |           |          |         | plain    | 
 txt_data       | date                   |           |          |         | plain    | 
 txt_finalizado | boolean                |           |          |         | plain    | 
 txt_relator    | boolean                |           |          |         | plain    | 
 txt_id         | integer                |           |          |         | plain    | 
 ver_id         | integer                |           |          |         | plain    | 
 vereador       | character varying(100) |           |          |         | extended | 
 tcp_id         | integer                |           |          |         | plain    | 
 tcp_nome       | character varying(40)  |           |          |         | extended | 
 par_finalizado | boolean                |           |          |         | plain    | 
 con_id         | integer                |           |          |         | plain    | 
View definition:
 SELECT pro.pro_id,
    pro.pro_codigo,
    txt.par_id,
    txt.txt_data,
    txt.txt_finalizado,
    txt.txt_relator,
    txt.txt_id,
    txt.ver_id,
    ver.ini_nome AS vereador,
    txt.tcp_id,
    con.tcp_nome,
    par.par_finalizado,
    par.con_id
   FROM spl.proposicao pro
     JOIN spl.parecer par ON par.pro_id = pro.pro_id
     JOIN spl.texto_vereador txt ON par.par_id = txt.par_id
     JOIN spl.vereador ver ON ver.ver_id = txt.ver_id
     LEFT JOIN spl.tipo_conclusao_parecer con ON con.tcp_id = txt.tcp_id
     JOIN spl.conjunto_vereadores conj ON conj.con_id = par.con_id
  WHERE txt.txt_finalizado = true AND par.par_finalizado = false;

