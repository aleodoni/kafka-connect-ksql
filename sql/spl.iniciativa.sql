                                                               Table "spl.iniciativa"
        Column         |  Type   | Collation | Nullable | Default | Storage  | Compression | Stats target |               Description               
-----------------------+---------+-----------+----------+---------+----------+-------------+--------------+-----------------------------------------
 ini_id                | integer |           | not null |         | plain    |             |              | 
 tin_id                | integer |           | not null |         | plain    |             |              | 
 ini_nome              | text    |           |          |         | extended |             |              | 
 ini_ativa             | boolean |           | not null | true    | plain    |             |              | 
 versao                | integer |           | not null | 0       | plain    |             |              | Nº de versão, para lock otimista
 ini_codigo_prefeitura | integer |           |          |         | plain    |             |              | Código da iniciativa para o sistema 156
Indexes:
    "pkiniciativa" PRIMARY KEY, btree (ini_id), tablespace "index"
    "iniciativa_ini_nome" btree (ini_nome), tablespace "index"
    "iniciativa_tin_id_idx" btree (tin_id), tablespace "index"
    "iniciativa_tin_id_restrito_idx" btree (tin_id) WHERE tin_id <> ALL (ARRAY[3, 5, 10, 13]), tablespace "index"
Foreign-key constraints:
    "fk_iniciativa_tipo_iniciativa" FOREIGN KEY (tin_id) REFERENCES spl.tipo_iniciativa(tin_id) ON DELETE RESTRICT
Referenced by:
    TABLE "spl.manifestacao" CONSTRAINT "fk_iniciativa" FOREIGN KEY (ini_id) REFERENCES spl.iniciativa(ini_id)
    TABLE "spl.iniciativa_ut" CONSTRAINT "fk_iniciativa_ut_iniciativa" FOREIGN KEY (ini_id) REFERENCES spl.iniciativa(ini_id) ON DELETE CASCADE
    TABLE "spl.norma" CONSTRAINT "fk_norma_iniciativa" FOREIGN KEY (ini_id) REFERENCES spl.iniciativa(ini_id)
    TABLE "spl.proposicao" CONSTRAINT "fk_proposicao_iniciativa" FOREIGN KEY (ini_id) REFERENCES spl.iniciativa(ini_id)
Triggers:
    tiu_0_white_iniciativa BEFORE INSERT OR UPDATE ON spl.iniciativa FOR EACH ROW EXECUTE FUNCTION spl.ftiu_0_white_iniciativa()
    tz_audit_spl_iniciativa AFTER INSERT OR DELETE OR UPDATE ON spl.iniciativa FOR EACH ROW EXECUTE FUNCTION auditoria.f_audit_spl_iniciativa()
Tablespace: "data"
Access method: heap

