                                                                                                              Table "spl.prazo"
      Column      |  Type   | Collation | Nullable |                  Default                  | Storage  | Compression | Stats target |                                             Description                                              
------------------+---------+-----------+----------+-------------------------------------------+----------+-------------+--------------+------------------------------------------------------------------------------------------------------
 prz_id           | integer |           | not null | nextval('spl.prazo_prz_id_seq'::regclass) | plain    |             |              | 
 prz_inicio       | date    |           | not null |                                           | plain    |             |              | Data de início do prazo
 prz_fim          | date    |           |          |                                           | plain    |             |              | Data de fim do prazo
 tpz_id           | integer |           |          |                                           | plain    |             |              | 
 pro_id           | integer |           |          |                                           | plain    |             |              | 
 versao           | integer |           | not null | 0                                         | plain    |             |              | Versao para lock otimista
 prz_descricao    | text    |           |          |                                           | extended |             |              | Descrição sobre o prazo
 ut_id            | integer |           |          |                                           | plain    |             |              | Unidade de tramitação associada ao prazo (ex: comissão associada ao prazo de emissão de parecer)
 prz_prorrogacoes | integer |           |          | 0                                         | plain    |             |              | Número de prorrogações que esse prazo já teve
Indexes:
    "pkprazo" PRIMARY KEY, btree (prz_id), tablespace "index"
Foreign-key constraints:
    "fk_prazo_proposicao" FOREIGN KEY (pro_id) REFERENCES spl.proposicao(pro_id)
    "fk_prazo_tipo_prazo" FOREIGN KEY (tpz_id) REFERENCES spl.tipo_prazo(tpz_id)
    "fk_prazo_unidade_tramitacao" FOREIGN KEY (ut_id) REFERENCES spl.unidade_tramitacao(ut_id)
Triggers:
    tiu_0_white_prazo BEFORE INSERT OR UPDATE ON spl.prazo FOR EACH ROW EXECUTE FUNCTION spl.ftiu_0_white_prazo()
    tz_audit_spl_prazo AFTER INSERT OR DELETE OR UPDATE ON spl.prazo FOR EACH ROW EXECUTE FUNCTION auditoria.f_audit_spl_prazo()
Tablespace: "data"
Access method: heap

