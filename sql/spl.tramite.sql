                                                                                                                Table "spl.tramite"
        Column        |            Type             | Collation | Nullable |                   Default                   | Storage  | Compression | Stats target |                                   Description                                   
----------------------+-----------------------------+-----------+----------+---------------------------------------------+----------+-------------+--------------+---------------------------------------------------------------------------------
 tra_id               | integer                     |           | not null | nextval('spl.tramite_tra_id_seq'::regclass) | plain    |             |              | 
 pro_id               | integer                     |           | not null |                                             | plain    |             |              | 
 tra_data_envio       | timestamp without time zone |           | not null |                                             | plain    |             |              | 
 usu_id               | integer                     |           | not null |                                             | plain    |             |              | Usuário que enviou
 ut_id_origem         | integer                     |           | not null |                                             | plain    |             |              | 
 ut_id_destino        | integer                     |           | not null |                                             | plain    |             |              | 
 raz_id               | integer                     |           | not null |                                             | plain    |             |              | 
 ttr_id               | integer                     |           | not null |                                             | plain    |             |              | 
 tra_observacao       | text                        |           |          |                                             | extended |             |              | Qualquer observação sobre o trâmite
 versao               | integer                     |           | not null | 0                                           | plain    |             |              | Nº de versão, para lock otimista
 tra_cancelamento     | integer                     |           | not null | 0                                           | plain    |             |              | 0 - não cancelado, nem pedido, 1 - pedido o cancelamento, 2 - trâmite cancelado
 est_id_destino       | integer                     |           |          |                                             | plain    |             |              | Estado da proposição após este trâmite
 est_id_origem        | integer                     |           |          |                                             | plain    |             |              | Estado da proposição antes desse trâmite
 nod_id_destino       | integer                     |           |          |                                             | plain    |             |              | Nodo no fluxo, após este trâmite
 nod_id_origem        | integer                     |           |          |                                             | plain    |             |              | nodo no fluxo antes deste trâmite
 tra_data_recebimento | timestamp without time zone |           |          |                                             | plain    |             |              | 
 usu_id_receptor      | integer                     |           |          |                                             | plain    |             |              | Usuário que recebeu
Indexes:
    "pktramite" PRIMARY KEY, btree (tra_id), tablespace "index"
    "tramite_destino_cancelamento_idx" btree (ut_id_destino, tra_cancelamento) WHERE ttr_id > 1, tablespace "index"
    "tramite_pro_id_idx" btree (pro_id), tablespace "index"
    "tramite_ut_id_origem_cancelamento_idx" btree (ut_id_origem, tra_cancelamento), tablespace "index"
Check constraints:
    "CancelamentoEntre0e2" CHECK (tra_cancelamento >= 0 AND tra_cancelamento <= 2)
    "data_razoavel" CHECK (tra_data_envio > '1990-01-01 00:00:00'::timestamp without time zone)
Foreign-key constraints:
    "fk_tramite_estado_destino" FOREIGN KEY (est_id_destino) REFERENCES spl.estado(est_id)
    "fk_tramite_estado_origem" FOREIGN KEY (est_id_origem) REFERENCES spl.estado(est_id)
    "fk_tramite_nodo_destino" FOREIGN KEY (nod_id_destino) REFERENCES spl.nodo(nod_id)
    "fk_tramite_nodo_origem" FOREIGN KEY (nod_id_origem) REFERENCES spl.nodo(nod_id)
    "fk_tramite_proposicao" FOREIGN KEY (pro_id) REFERENCES spl.proposicao(pro_id) ON DELETE CASCADE
    "fk_tramite_razao_tramite" FOREIGN KEY (raz_id) REFERENCES spl.razao_tramite(raz_id)
    "fk_tramite_tipo_tramite" FOREIGN KEY (ttr_id) REFERENCES spl.tipo_tramite(ttr_id)
    "fk_tramite_usuario" FOREIGN KEY (usu_id) REFERENCES geral.usuario(usu_id)
    "fk_tramite_usuario_receptor" FOREIGN KEY (usu_id_receptor) REFERENCES geral.usuario(usu_id)
    "fk_unidade_tramitacao_destino" FOREIGN KEY (ut_id_destino) REFERENCES spl.unidade_tramitacao(ut_id)
    "fk_unidade_tramitacao_origem" FOREIGN KEY (ut_id_origem) REFERENCES spl.unidade_tramitacao(ut_id)
Triggers:
    ti_tramite BEFORE INSERT ON spl.tramite FOR EACH ROW EXECUTE FUNCTION spl.fti_tramite()
    tiu_0_white_tramite BEFORE INSERT OR UPDATE ON spl.tramite FOR EACH ROW EXECUTE FUNCTION spl.ftiu_0_white_tramite()
    tz_audit_spl_tramite AFTER INSERT OR DELETE OR UPDATE ON spl.tramite FOR EACH ROW EXECUTE FUNCTION auditoria.f_audit_spl_tramite()
Tablespace: "data"
Access method: heap

