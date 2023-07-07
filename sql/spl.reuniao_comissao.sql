                                                                                                         Table "spl.reuniao_comissao"
      Column      |         Type          | Collation | Nullable |                       Default                        | Storage  | Compression | Stats target |                                 Description                                  
------------------+-----------------------+-----------+----------+------------------------------------------------------+----------+-------------+--------------+------------------------------------------------------------------------------
 rec_id           | integer               |           | not null | nextval('spl.reuniao_comissao_rec_id_seq'::regclass) | plain    |             |              | 
 con_id           | integer               |           |          |                                                      | plain    |             |              | 
 rec_tipo_reuniao | character varying(30) |           | not null |                                                      | extended |             |              | Tipo da reunião: Ordinária, Extraordinária, Audiência Pública, etc
 rec_numero       | character varying(40) |           | not null |                                                      | extended |             |              | Identificador da reunião da comissão (eg, 1, 2ª ext, 20/03, 3ª Aud. Pub)
 versao           | integer               |           | not null | 0                                                    | plain    |             |              |  Nº de versão, para lock otimista
 rec_data         | date                  |           | not null |                                                      | plain    |             |              | Data da reunião da comissão
 rec_notificada   | boolean               |           | not null | false                                                | plain    |             |              | Indica se vereadores já foram notificados da reunião.
Indexes:
    "pkreuniao_comissao" PRIMARY KEY, btree (rec_id), tablespace "index"
    "reuniao_comissao_con_id_tipo_reuniao_numero_data_idx" UNIQUE, btree (con_id, rec_tipo_reuniao, rec_numero, rec_data), tablespace "index"
    "reuniao_con_id_rec_data_idx" btree (con_id, rec_data), tablespace "index"
    "reuniao_rec_data_idx" btree (rec_data), tablespace "index"
Foreign-key constraints:
    "fk_reuniao_comissao_conjunto_vereadores" FOREIGN KEY (con_id) REFERENCES spl.conjunto_vereadores(con_id)
Referenced by:
    TABLE "spl.ata_comissao" CONSTRAINT "fk_ata_comissao_reuniao_comissao" FOREIGN KEY (rec_id) REFERENCES spl.reuniao_comissao(rec_id)
    TABLE "spl.pauta_comissao" CONSTRAINT "fk_pauta_comissao_reuniao_comissao" FOREIGN KEY (rec_id) REFERENCES spl.reuniao_comissao(rec_id)
Triggers:
    tiu_0_white_reuniao_comissao BEFORE INSERT OR UPDATE ON spl.reuniao_comissao FOR EACH ROW EXECUTE FUNCTION spl.ftiu_0_white_reuniao_comissao()
    tz_audit_spl_reuniao_comissao AFTER INSERT OR DELETE OR UPDATE ON spl.reuniao_comissao FOR EACH ROW EXECUTE FUNCTION auditoria.f_audit_spl_reuniao_comissao()
Access method: heap

