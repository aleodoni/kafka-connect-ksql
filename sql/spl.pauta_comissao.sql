                                                                                      Table "spl.pauta_comissao"
     Column     |  Type   | Collation | Nullable |                      Default                       | Storage  | Compression | Stats target |                      Description                       
----------------+---------+-----------+----------+----------------------------------------------------+----------+-------------+--------------+--------------------------------------------------------
 pac_id         | integer |           | not null | nextval('spl.pauta_comissao_pac_id_seq'::regclass) | plain    |             |              | 
 rec_id         | integer |           |          |                                                    | plain    |             |              | 
 pac_liberada   | boolean |           | not null | false                                              | plain    |             |              | Pauta da reunião está liberada?
 pac_notificada | boolean |           | not null | false                                              | plain    |             |              | Indica se vereadores já foram notificados da pauta
 versao         | integer |           | not null | 0                                                  | plain    |             |              |  Nº de versão, para lock otimista
 pac_texto      | text    |           |          |                                                    | extended |             |              | Texto para informações adicionais relativa à pauta.
Indexes:
    "pkpauta_comissao" PRIMARY KEY, btree (pac_id), tablespace "index"
    "pauta_comissao_reuniao_idx" UNIQUE, btree (rec_id), tablespace "index"
Foreign-key constraints:
    "fk_pauta_comissao_reuniao_comissao" FOREIGN KEY (rec_id) REFERENCES spl.reuniao_comissao(rec_id)
Referenced by:
    TABLE "spl.pauta_parecer" CONSTRAINT "fk_pauta_parecer_pauta_comissao" FOREIGN KEY (pac_id) REFERENCES spl.pauta_comissao(pac_id) ON DELETE CASCADE
Triggers:
    tiu_0_white_pauta_comissao BEFORE INSERT OR UPDATE ON spl.pauta_comissao FOR EACH ROW EXECUTE FUNCTION spl.ftiu_0_white_pauta_comissao()
    tz_audit_spl_pauta_comissao AFTER INSERT OR DELETE OR UPDATE ON spl.pauta_comissao FOR EACH ROW EXECUTE FUNCTION auditoria.f_audit_spl_pauta_comissao()
Access method: heap

