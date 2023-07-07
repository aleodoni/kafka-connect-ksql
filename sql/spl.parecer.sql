                                                                                                                             Table "spl.parecer"
       Column       |            Type             | Collation | Nullable |                   Default                   | Storage  | Compression | Stats target |                                                 Description                                                  
--------------------+-----------------------------+-----------+----------+---------------------------------------------+----------+-------------+--------------+--------------------------------------------------------------------------------------------------------------
 par_id             | integer                     |           | not null | nextval('spl.parecer_par_id_seq'::regclass) | plain    |             |              | 
 par_ano            | integer                     |           |          |                                             | plain    |             |              | Ano de emissão do parecer
 par_data           | date                        |           |          |                                             | plain    |             |              | Data de emissão do parecer
 par_finalizado     | boolean                     |           | not null | false                                       | plain    |             |              | Parecer finalizado?
 par_numero         | integer                     |           |          |                                             | plain    |             |              | Número do parecer
 par_observacao     | text                        |           |          |                                             | extended |             |              | Observação sobre o parecer.
 par_texto          | text                        |           |          |                                             | extended |             |              | Texto formatado do parecer.
 par_vencido        | boolean                     |           |          |                                             | plain    |             |              | O parecer é resultado de voto vencido (parecer do relator derrubado)?
 con_id             | integer                     |           |          |                                             | plain    |             |              | 
 par_veto           | boolean                     |           |          |                                             | plain    |             |              | O parecer é sobre veto?
 pro_id             | integer                     |           | not null |                                             | plain    |             |              | 
 ver_id             | integer                     |           |          |                                             | plain    |             |              | Relator original do parecer
 versao             | integer                     |           | not null | 0                                           | plain    |             |              | Nº de versão, para lock otimista
 tcp_id             | integer                     |           |          |                                             | plain    |             |              | 
 pro_id_anexada_por | integer                     |           |          |                                             | plain    |             |              | Se o parecer conclui pela anexação, este campo indica por quem essa proposição deve ser anexada
 par_criacao        | timestamp without time zone |           |          |                                             | plain    |             |              | Data de criação do parecer. Usado para determinar se há redistribuição ou emissão em alguns casos complexos.
Indexes:
    "pkparecer" PRIMARY KEY, btree (par_id), tablespace "index"
    "parecer_con_id_idx" btree (con_id), tablespace "index"
    "parecer_pro_id_finalizado_idx" btree (pro_id, par_finalizado), tablespace "index"
Foreign-key constraints:
    "fk_parecer_conjunto_vereadores" FOREIGN KEY (con_id) REFERENCES spl.conjunto_vereadores(con_id)
    "fk_parecer_proposicao" FOREIGN KEY (pro_id) REFERENCES spl.proposicao(pro_id)
    "fk_parecer_proposicao_anexada_por" FOREIGN KEY (pro_id_anexada_por) REFERENCES spl.proposicao(pro_id)
    "fk_parecer_tipo_conclusao_parecer" FOREIGN KEY (tcp_id) REFERENCES spl.tipo_conclusao_parecer(tcp_id)
    "fk_parecer_vereador" FOREIGN KEY (ver_id) REFERENCES spl.vereador(ver_id)
Referenced by:
    TABLE "spl.anexo_publicado" CONSTRAINT "fk_anexo_publicado_parecer" FOREIGN KEY (par_id) REFERENCES spl.parecer(par_id)
    TABLE "spl.arquivo" CONSTRAINT "fk_arquivo_parecer" FOREIGN KEY (par_id) REFERENCES spl.parecer(par_id) ON DELETE CASCADE
    TABLE "spl.pauta_parecer" CONSTRAINT "fk_pauta_parecer_parecer" FOREIGN KEY (par_id) REFERENCES spl.parecer(par_id)
    TABLE "spl.texto_vereador" CONSTRAINT "fk_texto_vereador_parecer" FOREIGN KEY (par_id) REFERENCES spl.parecer(par_id) ON DELETE CASCADE
    TABLE "spl.voto_parecer" CONSTRAINT "fk_voto_parecer_parecer" FOREIGN KEY (par_id) REFERENCES spl.parecer(par_id)
Triggers:
    ti_parecer BEFORE INSERT ON spl.parecer FOR EACH ROW EXECUTE FUNCTION spl.fti_parecer()
    tiu_0_white_parecer BEFORE INSERT OR UPDATE ON spl.parecer FOR EACH ROW EXECUTE FUNCTION spl.ftiu_0_white_parecer()
    tz_audit_spl_parecer AFTER INSERT OR DELETE OR UPDATE ON spl.parecer FOR EACH ROW EXECUTE FUNCTION auditoria.f_audit_spl_parecer()
Disabled user triggers:
    tu_parecer BEFORE UPDATE ON spl.parecer FOR EACH ROW EXECUTE FUNCTION spl.ftu_parecer()
Tablespace: "data"
Access method: heap

