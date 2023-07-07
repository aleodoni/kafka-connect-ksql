                                                                                              Table "spl.composicao"
  Column   |  Type   | Collation | Nullable |                    Default                     | Storage | Compression | Stats target |                                 Description                                 
-----------+---------+-----------+----------+------------------------------------------------+---------+-------------+--------------+-----------------------------------------------------------------------------
 com_id    | integer |           | not null | nextval('spl.composicao_com_id_seq'::regclass) | plain   |             |              | 
 con_id    | integer |           | not null |                                                | plain   |             |              | 
 ver_id    | integer |           | not null |                                                | plain   |             |              | 
 crg_id    | integer |           | not null |                                                | plain   |             |              | 
 versao    | integer |           | not null | 0                                              | plain   |             |              | Nº de versão, para lock otimista
 com_ordem | integer |           |          | 10                                             | plain   |             |              | Ordem do vereador no conjunto, para exibição em alguns pontos do sistema.
Indexes:
    "pkcomposicao" PRIMARY KEY, btree (com_id), tablespace "index"
    "composicao_con_id_idx" btree (con_id), tablespace "index"
    "composicao_ver_id_con_id_idx" UNIQUE, btree (ver_id, con_id), tablespace "index"
Foreign-key constraints:
    "fk_composicao_cargo_vereador" FOREIGN KEY (crg_id) REFERENCES spl.cargo_vereador(crg_id) ON DELETE RESTRICT
    "fk_composicao_conjunto_vereadores" FOREIGN KEY (con_id) REFERENCES spl.conjunto_vereadores(con_id) ON DELETE CASCADE
    "fk_composicao_vereador" FOREIGN KEY (ver_id) REFERENCES spl.vereador(ver_id) ON DELETE RESTRICT
Triggers:
    td_composicao AFTER DELETE ON spl.composicao FOR EACH ROW EXECUTE FUNCTION spl.ftd_composicao()
    ti_composicao_nome AFTER INSERT ON spl.composicao FOR EACH ROW EXECUTE FUNCTION spl.fti_composicao_nome()
    ti_composicao_ordem BEFORE INSERT ON spl.composicao FOR EACH ROW EXECUTE FUNCTION spl.fti_composicao_ordem()
    tu_composicao BEFORE UPDATE ON spl.composicao FOR EACH ROW EXECUTE FUNCTION spl.ftu_composicao_ordem()
    tu_composicao_nome AFTER UPDATE ON spl.composicao FOR EACH ROW EXECUTE FUNCTION spl.ftu_composicao_nome()
    tz_audit_spl_composicao AFTER INSERT OR DELETE OR UPDATE ON spl.composicao FOR EACH ROW EXECUTE FUNCTION auditoria.f_audit_spl_composicao()
Tablespace: "data"
Access method: heap

