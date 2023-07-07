                                                                                   Table "spl.tipo_iniciativa"
    Column    |          Type          | Collation | Nullable |                       Default                       | Storage  | Compression | Stats target |            Description             
--------------+------------------------+-----------+----------+-----------------------------------------------------+----------+-------------+--------------+------------------------------------
 tin_id       | integer                |           | not null | nextval('spl.tipo_iniciativa_tin_id_seq'::regclass) | plain    |             |              | 
 tin_nome     | character varying(100) |           | not null |                                                     | extended |             |              | 
 tin_multipla | boolean                |           | not null |                                                     | plain    |             |              | 
 versao       | integer                |           | not null | 0                                                   | plain    |             |              | Nº de versão, para lock otimista
 tin_adm_leg  | character(1)           |           | not null | 'L'::bpchar                                         | extended |             |              | 
Indexes:
    "pktipo_iniciativa" PRIMARY KEY, btree (tin_id), tablespace "index"
    "tipo_iniciativa_tin_nome_idx" UNIQUE, btree (tin_nome), tablespace "index"
Referenced by:
    TABLE "spl.conjunto_vereadores" CONSTRAINT "fk_conjunto_vereadores_tipo_iniciativa" FOREIGN KEY (tin_id) REFERENCES spl.tipo_iniciativa(tin_id)
    TABLE "spl.iniciativa" CONSTRAINT "fk_iniciativa_tipo_iniciativa" FOREIGN KEY (tin_id) REFERENCES spl.tipo_iniciativa(tin_id) ON DELETE RESTRICT
    TABLE "spl.possibilidade" CONSTRAINT "fk_possibilidade_tipo_iniciativa" FOREIGN KEY (tin_id) REFERENCES spl.tipo_iniciativa(tin_id) ON DELETE CASCADE
    TABLE "spl.tipo_iniciativa_ut" CONSTRAINT "fk_tipo_iniciativa_ut_tipo_iniciativa" FOREIGN KEY (tin_id) REFERENCES spl.tipo_iniciativa(tin_id) ON DELETE CASCADE
Triggers:
    td_tipo_iniciativa BEFORE DELETE ON spl.tipo_iniciativa FOR EACH ROW EXECUTE FUNCTION spl.ftd_tipo_iniciativa()
    tu_tipo_iniciativa BEFORE UPDATE ON spl.tipo_iniciativa FOR EACH ROW EXECUTE FUNCTION spl.ftu_tipo_iniciativa()
    tz_audit_spl_tipo_iniciativa AFTER INSERT OR DELETE OR UPDATE ON spl.tipo_iniciativa FOR EACH ROW EXECUTE FUNCTION auditoria.f_audit_spl_tipo_iniciativa()
Tablespace: "data"
Access method: heap

