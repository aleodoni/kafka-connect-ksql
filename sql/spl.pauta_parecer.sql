                                       Table "spl.pauta_parecer"
 Column |  Type   | Collation | Nullable | Default | Storage | Compression | Stats target | Description 
--------+---------+-----------+----------+---------+---------+-------------+--------------+-------------
 par_id | integer |           | not null |         | plain   |             |              | 
 pac_id | integer |           | not null |         | plain   |             |              | 
Indexes:
    "pkpauta_parecer" PRIMARY KEY, btree (pac_id, par_id), tablespace "index"
    "pauta_parecer_par_id_idx" btree (par_id), tablespace "index"
Foreign-key constraints:
    "fk_pauta_parecer_parecer" FOREIGN KEY (par_id) REFERENCES spl.parecer(par_id)
    "fk_pauta_parecer_pauta_comissao" FOREIGN KEY (pac_id) REFERENCES spl.pauta_comissao(pac_id) ON DELETE CASCADE
Triggers:
    tz_audit_spl_pauta_parecer AFTER INSERT OR DELETE OR UPDATE ON spl.pauta_parecer FOR EACH ROW EXECUTE FUNCTION auditoria.f_audit_spl_pauta_parecer()
Access method: heap

