                                                                                      Table "spl.conjunto_vereadores"
        Column         |          Type          | Collation | Nullable |                    Default                     | Storage  | Compression | Stats target |               Description                
-----------------------+------------------------+-----------+----------+------------------------------------------------+----------+-------------+--------------+------------------------------------------
 con_id                | integer                |           | not null | nextval('spl.iniciativa_ini_id_seq'::regclass) | plain    |             |              | 
 con_sigla             | character varying(20)  |           |          |                                                | extended |             |              | 
 con_maximo            | integer                |           |          |                                                | plain    |             |              | 
 ut_id                 | integer                |           |          |                                                | plain    |             |              | 
 ini_nome              | text                   |           |          |                                                | extended |             |              | 
 ini_ativa             | boolean                |           | not null | true                                           | plain    |             |              | 
 tin_id                | integer                |           | not null |                                                | plain    |             |              | 
 versao                | integer                |           | not null | 0                                              | plain    |             |              | Nº de versão, para lock otimista
 ini_codigo_prefeitura | integer                |           |          |                                                | plain    |             |              | Código da iniciativa para o sistema 156
 con_descricao         | text                   |           |          |                                                | extended |             |              | Descrição do conjunto de vereadores.
 con_site_ordem        | integer                |           |          | 1                                              | plain    |             |              | Ordem em que a comissão aparece no site
 con_email             | character varying(120) |           |          |                                                | extended |             |              | e-mail da comissão
Indexes:
    "pkconjunto_vereadores" PRIMARY KEY, btree (con_id), tablespace "index"
    "con_ini_nome_unico_condicional" UNIQUE, btree (ini_nome) WHERE tin_id <> 10 AND ini_ativa
    "conjunto_vereadores_con_sigla" btree (con_sigla) WHERE con_sigla IS NOT NULL, tablespace "index"
    "conjunto_vereadores_ut_id" btree (ut_id) WHERE ut_id IS NOT NULL, tablespace "index"
Foreign-key constraints:
    "fk_conjunto_vereadores_tipo_iniciativa" FOREIGN KEY (tin_id) REFERENCES spl.tipo_iniciativa(tin_id)
    "fk_conjunto_vereadores_unidade_tramitacao" FOREIGN KEY (ut_id) REFERENCES spl.unidade_tramitacao(ut_id) ON DELETE CASCADE
Referenced by:
    TABLE "spl.assinatura" CONSTRAINT "assinatura_con_id_fkey" FOREIGN KEY (con_id) REFERENCES spl.conjunto_vereadores(con_id) ON DELETE CASCADE
    TABLE "spl.comissoes_instrucao" CONSTRAINT "fk_comissoes_instrucao_conjunto_vereadores" FOREIGN KEY (con_id) REFERENCES spl.conjunto_vereadores(con_id)
    TABLE "spl.composicao" CONSTRAINT "fk_composicao_conjunto_vereadores" FOREIGN KEY (con_id) REFERENCES spl.conjunto_vereadores(con_id) ON DELETE CASCADE
    TABLE "spl.hcomposicao" CONSTRAINT "fk_hcomposicao_conjunto_vereadores" FOREIGN KEY (con_id) REFERENCES spl.conjunto_vereadores(con_id)
    TABLE "spl.parecer" CONSTRAINT "fk_parecer_conjunto_vereadores" FOREIGN KEY (con_id) REFERENCES spl.conjunto_vereadores(con_id)
    TABLE "spl.reuniao_comissao" CONSTRAINT "fk_reuniao_comissao_conjunto_vereadores" FOREIGN KEY (con_id) REFERENCES spl.conjunto_vereadores(con_id)
Triggers:
    td_conjunto_vereadores AFTER DELETE ON spl.conjunto_vereadores FOR EACH ROW EXECUTE FUNCTION spl.ftd_conjunto_vereadores()
    ti_conjunto_vereadores BEFORE INSERT ON spl.conjunto_vereadores FOR EACH ROW EXECUTE FUNCTION spl.fti_conjunto_vereadores()
    tu_conjunto_vereadores AFTER UPDATE ON spl.conjunto_vereadores FOR EACH ROW EXECUTE FUNCTION spl.ftu_conjunto_vereadores()
    tz_audit_spl_conjunto_vereadores AFTER INSERT OR DELETE OR UPDATE ON spl.conjunto_vereadores FOR EACH ROW EXECUTE FUNCTION auditoria.f_audit_spl_conjunto_vereadores()
Tablespace: "data"
Access method: heap

