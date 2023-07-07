                                                                                              Table "spl.texto_vereador"
      Column      |  Type   | Collation | Nullable |                      Default                       | Storage  | Compression | Stats target |                             Description                              
------------------+---------+-----------+----------+----------------------------------------------------+----------+-------------+--------------+----------------------------------------------------------------------
 par_id           | integer |           | not null |                                                    | plain    |             |              | 
 txt_data         | date    |           | not null |                                                    | plain    |             |              | Data em que o texto foi salvo pela última vez.
 txt_finalizado   | boolean |           | not null | false                                              | plain    |             |              | Informa se o texto do relator/verador com vistas está finalizado.
 txt_id           | integer |           | not null | nextval('spl.texto_vereador_txt_id_seq'::regclass) | plain    |             |              | 
 txt_relator      | boolean |           | not null |                                                    | plain    |             |              | Esse texto é o do relator?
 txt_texto        | text    |           |          |                                                    | extended |             |              | Texto do parecer do relator ou das vistas
 ver_id           | integer |           |          |                                                    | plain    |             |              | Vereador que fez o texto. Pode ser nulo por problemas da importação.
 versao           | integer |           | not null | 0                                                  | plain    |             |              | Nº de versão, para lock otimista
 txt_feito_no_gab | boolean |           | not null | true                                               | plain    |             |              | Se o texto foi produzido no gabinete (true) ou na dac (false)
 txt_adotado      | boolean |           | not null | false                                              | plain    |             |              | Esse foi o texto adotado como parecer da comissão?
 tcp_id           | integer |           |          |                                                    | plain    |             |              | 
 txt_com_emenda   | boolean |           |          |                                                    | plain    |             |              | com emendas da comissão
Indexes:
    "pktexto_vereador" PRIMARY KEY, btree (txt_id), tablespace "index"
    "texto_vereador_par_id_idx" btree (par_id), tablespace "index"
    "texto_vereador_par_id_relator_idx" btree (par_id) WHERE txt_relator, tablespace "index"
Foreign-key constraints:
    "fk_texto_vereador_parecer" FOREIGN KEY (par_id) REFERENCES spl.parecer(par_id) ON DELETE CASCADE
    "fk_texto_vereador_tipo_conclusao_parecer" FOREIGN KEY (tcp_id) REFERENCES spl.tipo_conclusao_parecer(tcp_id)
    "fk_texto_vereador_vereador" FOREIGN KEY (ver_id) REFERENCES spl.vereador(ver_id)
Referenced by:
    TABLE "spl.arquivo" CONSTRAINT "fk_arquivo_texto_vereador" FOREIGN KEY (txt_id) REFERENCES spl.texto_vereador(txt_id) ON DELETE CASCADE
Triggers:
    ti_texto_vereador BEFORE INSERT ON spl.texto_vereador FOR EACH ROW EXECUTE FUNCTION spl.fti_texto_vereador()
    ti_texto_vereador2 AFTER INSERT ON spl.texto_vereador FOR EACH ROW EXECUTE FUNCTION spl.fti_texto_vereador2()
    tiu_0_white_texto_vereador BEFORE INSERT OR UPDATE ON spl.texto_vereador FOR EACH ROW EXECUTE FUNCTION spl.ftiu_0_white_texto_vereador()
    tu_texto_vereador BEFORE UPDATE ON spl.texto_vereador FOR EACH ROW EXECUTE FUNCTION spl.ftu_texto_vereador()
    tu_texto_vereador2 AFTER UPDATE ON spl.texto_vereador FOR EACH ROW EXECUTE FUNCTION spl.ftu_texto_vereador2()
    tz_audit_spl_texto_vereador AFTER INSERT OR DELETE OR UPDATE ON spl.texto_vereador FOR EACH ROW EXECUTE FUNCTION auditoria.f_audit_spl_texto_vereador()
Tablespace: "data"
Access method: heap

